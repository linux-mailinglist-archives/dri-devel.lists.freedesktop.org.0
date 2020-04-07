Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7F01A0CCB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 13:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED7289193;
	Tue,  7 Apr 2020 11:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F9A89193
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 11:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 643853F368;
 Tue,  7 Apr 2020 13:26:42 +0200 (CEST)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="piIxwkkk";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vt4K3mBNS09h; Tue,  7 Apr 2020 13:26:41 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 221013F332;
 Tue,  7 Apr 2020 13:26:36 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 3941D360153;
 Tue,  7 Apr 2020 13:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1586258796; bh=+12Mq5JWJsxkinHtNYSI6cx13fzoS7KcCMTCX6BhLGU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=piIxwkkkLZtVXLkSsBihv4EBeAbqPIMXEHGRNcwFHpIHptwXbmT412OMcik/NkAMb
 9hVLdnvGQzBVm/tYKlT9OG+0bNW/WV+IoNBYlHyZyFvXMVz6Cx2INk93o1baclh8fH
 5nVo5XXLMOGPE3PglGBTdep+S8d8VUpf2HKORMTA=
Subject: Re: Bad rss-counter state from drm/ttm, drm/vmwgfx: Support huge TTM
 pagefaults
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <1586138158.v5u7myprlp.none.ref@localhost>
 <1586138158.v5u7myprlp.none@localhost>
 <0b12b28c-5f42-b56b-ea79-6e3d1052b332@shipmail.org>
 <1586219716.1a3fyi6lh5.none@localhost>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <37624a1f-8e6b-fe9c-8e0e-a9139e1bbe18@shipmail.org>
Date: Tue, 7 Apr 2020 13:26:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1586219716.1a3fyi6lh5.none@localhost>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC83LzIwIDI6MzggQU0sIEFsZXggWHUgKEhlbGxvNzEpIHdyb3RlOgo+IEV4Y2VycHRzIGZy
b20gVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkncyBtZXNzYWdlIG9mIEFwcmlsIDYsIDIwMjAg
NTowNCBwbToKPj4gSGksCj4+Cj4+IE9uIDQvNi8yMCA5OjUxIFBNLCBBbGV4IFh1IChIZWxsbzcx
KSB3cm90ZToKPj4+IFVzaW5nIDMxNGI2NTggd2l0aCBhbWRncHUsIHN0YXJ0aW5nIHN3YXkgYW5k
IGZpcmVmb3ggY2F1c2VzICJCVUc6IEJhZAo+Pj4gcnNzLWNvdW50ZXIgc3RhdGUiIGFuZCAiQlVH
OiBub24temVybyBwZ3RhYmxlc19ieXRlcyBvbiBmcmVlaW5nIG1tIiB0bwo+Pj4gc3RhcnQgZmls
bGluZyBkbWVzZywgYW5kIHRoZW4gY2xvc2luZyBwcm9ncmFtcyBjYXVzZXMgbW9yZSBCVUdzIGFu
ZAo+Pj4gaGFuZ3MsIGFuZCB0aGVuIGV2ZXJ5dGhpbmcgZ3JpbmRzIHRvIGEgaGFsdCAoY2FuJ3Qg
c3RhcnQgbW9yZSBwcm9ncmFtcywKPj4+IGNhbid0IGV2ZW4gcmVib290IHRocm91Z2ggc3lzdGVt
ZCkuCj4+Pgo+Pj4gVXNpbmcgbWFzdGVyIGFuZCByZXZlcnRpbmcgdGhhdCBicmFuY2ggdXAgdG8g
dGhhdCBwb2ludCBmaXhlcyB0aGUKPj4+IHByb2JsZW0uCj4+Pgo+Pj4gSSdtIHVzaW5nIGEgUnl6
ZW4gMTYwMCBhbmQgQU1EIFJhZGVvbiBSWCA0ODAgb24gYW4gQVNSb2NrIEI0NTAgUHJvNAo+Pj4g
Ym9hcmQgd2l0aCBJT01NVSBlbmFibGVkLgo+PiBJZiB5b3UgY291bGQgdHJ5IHRoZSBhdHRhY2hl
ZCBwYXRjaCwgdGhhdCdkIGJlIGdyZWF0IQo+Pgo+PiBUaGFua3MsCj4+Cj4+IFRob21hcwo+Pgo+
IFllYWgsIHRoYXQgd29ya3MgdG9vLiBLZXJuZWwgY29uZmlnIHNlbnQgb2ZmLWxpc3QuCj4KPiBS
ZWdhcmRzLAo+IEFsZXguCgpUaGFua3MuIERvIHlvdSB3YW50IG1lIHRvIGFkZCB5b3VyCgpSZXBv
cnRlZC1ieTogYW5kIFRlc3RlZC1ieTogVG8gdGhpcyBwYXRjaD8KCi9UaG9tYXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
