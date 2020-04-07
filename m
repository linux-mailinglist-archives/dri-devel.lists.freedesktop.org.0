Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E01A1654
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 21:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29DA6E154;
	Tue,  7 Apr 2020 19:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716766E154
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id A6DCF3F423;
 Tue,  7 Apr 2020 21:57:42 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=ADF7+uVu; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juSonQZZkhfi; Tue,  7 Apr 2020 21:57:41 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id CBCE53F3F1;
 Tue,  7 Apr 2020 21:57:32 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8FBC3360153;
 Tue,  7 Apr 2020 21:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1586289452; bh=n8v3kP19wHdlpasfsqLzlqOfhDoVJzv2qXSEHg2XIUw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ADF7+uVugZlqdmK5afrGpG3q5imNSOSM3I40tdQMKpNd14xTelmYZ5CMsLyPXrfjN
 +XMf3b9C+ML4rnbmUkQ1nhVWV7VdVyHblKCmHYuUSFCagT/uOB+wwSM1N+yrpoCcQL
 wuCcY4doZST4CAMHbIY+PSnC6wwUdMVLMkIrRL/U=
Subject: Re: Bad rss-counter state from drm/ttm, drm/vmwgfx: Support huge TTM
 pagefaults
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <1586138158.v5u7myprlp.none.ref@localhost>
 <1586138158.v5u7myprlp.none@localhost>
 <0b12b28c-5f42-b56b-ea79-6e3d1052b332@shipmail.org>
 <1586219716.1a3fyi6lh5.none@localhost>
 <37624a1f-8e6b-fe9c-8e0e-a9139e1bbe18@shipmail.org>
 <1586273767.0q72rozj3x.none@localhost>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <d6d9b4e6-3f73-a4df-68da-60ec9c0a3873@shipmail.org>
Date: Tue, 7 Apr 2020 21:57:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1586273767.0q72rozj3x.none@localhost>
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

T24gNC83LzIwIDU6MzYgUE0sIEFsZXggWHUgKEhlbGxvNzEpIHdyb3RlOgo+IEV4Y2VycHRzIGZy
b20gVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkncyBtZXNzYWdlIG9mIEFwcmlsIDcsIDIwMjAg
NzoyNiBhbToKPj4gT24gNC83LzIwIDI6MzggQU0sIEFsZXggWHUgKEhlbGxvNzEpIHdyb3RlOgo+
Pj4gRXhjZXJwdHMgZnJvbSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSdzIG1lc3NhZ2Ugb2Yg
QXByaWwgNiwgMjAyMCA1OjA0IHBtOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gT24gNC82LzIwIDk6NTEg
UE0sIEFsZXggWHUgKEhlbGxvNzEpIHdyb3RlOgo+Pj4+PiBVc2luZyAzMTRiNjU4IHdpdGggYW1k
Z3B1LCBzdGFydGluZyBzd2F5IGFuZCBmaXJlZm94IGNhdXNlcyAiQlVHOiBCYWQKPj4+Pj4gcnNz
LWNvdW50ZXIgc3RhdGUiIGFuZCAiQlVHOiBub24temVybyBwZ3RhYmxlc19ieXRlcyBvbiBmcmVl
aW5nIG1tIiB0bwo+Pj4+PiBzdGFydCBmaWxsaW5nIGRtZXNnLCBhbmQgdGhlbiBjbG9zaW5nIHBy
b2dyYW1zIGNhdXNlcyBtb3JlIEJVR3MgYW5kCj4+Pj4+IGhhbmdzLCBhbmQgdGhlbiBldmVyeXRo
aW5nIGdyaW5kcyB0byBhIGhhbHQgKGNhbid0IHN0YXJ0IG1vcmUgcHJvZ3JhbXMsCj4+Pj4+IGNh
bid0IGV2ZW4gcmVib290IHRocm91Z2ggc3lzdGVtZCkuCj4+Pj4+Cj4+Pj4+IFVzaW5nIG1hc3Rl
ciBhbmQgcmV2ZXJ0aW5nIHRoYXQgYnJhbmNoIHVwIHRvIHRoYXQgcG9pbnQgZml4ZXMgdGhlCj4+
Pj4+IHByb2JsZW0uCj4+Pj4+Cj4+Pj4+IEknbSB1c2luZyBhIFJ5emVuIDE2MDAgYW5kIEFNRCBS
YWRlb24gUlggNDgwIG9uIGFuIEFTUm9jayBCNDUwIFBybzQKPj4+Pj4gYm9hcmQgd2l0aCBJT01N
VSBlbmFibGVkLgo+Pj4+IElmIHlvdSBjb3VsZCB0cnkgdGhlIGF0dGFjaGVkIHBhdGNoLCB0aGF0
J2QgYmUgZ3JlYXQhCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+PiBUaG9tYXMKPj4+Pgo+Pj4g
WWVhaCwgdGhhdCB3b3JrcyB0b28uIEtlcm5lbCBjb25maWcgc2VudCBvZmYtbGlzdC4KPj4+Cj4+
PiBSZWdhcmRzLAo+Pj4gQWxleC4KPj4gVGhhbmtzLiBEbyB5b3Ugd2FudCBtZSB0byBhZGQgeW91
cgo+Pgo+PiBSZXBvcnRlZC1ieTogYW5kIFRlc3RlZC1ieTogVG8gdGhpcyBwYXRjaD8KPj4KPj4g
L1Rob21hcwo+Pgo+Pgo+IFN1cmUuIFNob3VsZG4ndCB3ZSBmaXggaXQgcHJvcGVybHkgdGhvdWdo
PwoKSXQncyBzdGlsbCBlbmFibGVkIGZvciB2bXdnZnggZm9yIHdoaWNoIGl0IGlzIHJlYXNvbmFi
bHkgd2VsbCB0ZXN0ZWQgYW5kIAp3aGVyZSBJIGNhbid0IHNlZSBhbnkgc3VjaCBlcnJvcnMuCgpU
aGUgY29kZSB3ZSByZW1vdmUgd2l0aCB0aGlzIHBhdGNoIGVuYWJsZXMgaHVnZSBwYWdlLXRhYmxl
IGVudHJpZXMgaW4gCnNvbWUgY2lyY3Vtc3RhbmNlcyBmb3Igb3RoZXIgZHJpdmVycywgYnV0IGdp
dmVuIHRoZSBwcm9ibGVtcyB5b3UncmUgCnNlZWluZyBmb3IgYW1kZ3B1LCBpdCdzIGJldHRlciB0
byBlbmFibGUgdGhpcyBvbiBhIHBlci1kcml2ZXIgYmFzaXMgCmFmdGVyIHRob3JvdWdoIHRlc3Rp
bmcuIFNpbmNlIEkgZG9uJ3QgaGF2ZSBhbWRncHUgaGFyZHdhcmUgSSdtIG5vdCBzdXJlIAp3aGF0
IGl0J3MgZG9pbmcgZGlmZmVyZW50bHksIGFuZCBjYW4ndCBkZWJ1ZyB0aGUgaXNzdWUgcHJvcGVy
bHkuCgovVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
