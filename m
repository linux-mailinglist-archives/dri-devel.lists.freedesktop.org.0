Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091521276F4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 09:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F6B6EBE3;
	Fri, 20 Dec 2019 08:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B8D6EBE3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 08:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id E18D23F39C;
 Fri, 20 Dec 2019 09:06:16 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=p3sd2f8Z; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X975R5nw9Zgj; Fri, 20 Dec 2019 09:06:15 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E5BAC3F5AD;
 Fri, 20 Dec 2019 09:06:09 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E6E6B36215B;
 Fri, 20 Dec 2019 09:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1576829169; bh=Q2+zsn1qCmWl8yYgXnf252a2g92KszZb+cwwyH5RgCo=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=p3sd2f8ZZmX+4iXnUTLPMIFKc6tKabjE4bXiMCS3K45uQ3jcgbSyOI8kT3MYfBZA2
 oBJDjhM2bPK/1aJ+6OKK0E17wXlaSX84YE7OmGpNfyt8MVMeDfaah0vTz9W5XAW+I9
 nTsjpKTa4R5PZhmxaiwEK0cbgeBb51SqgAF8Zt6o=
Subject: Ack to merge through DRM tree? WAS [PATCH v4 0/2] mm, drm/ttm: Fix
 pte insertion with customized protection
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>
References: <20191212084741.9251-1-thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <cc7e153d-84ff-d1f8-484f-614eafac1864@shipmail.org>
Date: Fri, 20 Dec 2019 09:06:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191212084741.9251-1-thomas_os@shipmail.org>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, pv-drivers@vmware.com,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmV3LAoKT24gMTIvMTIvMTkgOTo0NyBBTSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkg
d3JvdGU6Cj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+
Cj4gVGhlIGRybS90dG0gbW9kdWxlIGlzIHVzaW5nIGEgbW9kaWZpZWQgb24tc3RhY2sgY29weSBv
ZiB0aGUKPiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgdG8gYmUgYWJsZSB0byBzZXQgYSBwYWdlIHBy
b3RlY3Rpb24gd2l0aCBjdXN0b21pemVkCj4gY2FjaGluZy4gRml4IHRoYXQgYnkgYWRkaW5nIGEg
dm1mX2luc2VydF9taXhlZF9wcm90KCkgZnVuY3Rpb24gc2ltaWxhcgo+IHRvIHRoZSBleGlzdGlu
ZyB2bWZfaW5zZXJ0X3Bmbl9wcm90KCkgZm9yIHVzZSB3aXRoIGRybS90dG0uCj4KPiBJJ2QgbGlr
ZSB0byBtZXJnZSB0aGlzIHRocm91Z2ggYSBkcm0gdHJlZS4KPgo+IENoYW5nZXMgc2luY2UgdjE6
Cj4gKikgRm9ybWF0dGluZyBmaXhlcyBpbiBwYXRjaCAxCj4gKikgVXBkYXRlZCBjb21taXQgbWVz
c2FnZSBvZiBwYXRjaCAyLgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gKikgTW92ZWQgdm1mX2luc2Vy
dF9taXhlZF9wcm90KCkgZXhwb3J0IHRvIHBhdGNoIDIgKE1pY2hhbCBIb2NrbykKPiAqKSBEb2N1
bWVudGVkIHVuZGVyIHdoaWNoIGNvbmRpdGlvbnMgaXQncyBzYWZlIHRvIHVzZSBhIHBhZ2UgcHJv
dGVjdGlvbgo+ICAgICBkaWZmZXJlbnQgZnJvbSBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q6OnZtX3Bh
Z2VfcHJvdC4gKE1pY2hhbCBIb2NrbykKPiBDaGFuZ2VzIHNpbmNlIHYzOgo+ICopIE1vcmUgZG9j
dW1lbnRhdGlvbiByZWdhcmRpbmcgdW5kZXIgd2hpY2ggY29uZGl0aW9ucyBpdCdzIHNhZmUgdG8g
dXNlIGEKPiAgICAgcGFnZSBwcm90ZWN0aW9uIGRpZmZlcmVudCBmcm9tIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdDo6dm1fcGFnZV9wcm90LiBUaGlzCj4gICAgIHRpbWUgYWxzbyBpbiBjb3JlIHZtLiAo
TWljaGFsIEhvY2tvKQo+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+Cj4gQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+IENjOiAiTWF0dGhl
dyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgo+IENjOiAiS2lyaWxsIEEu
IFNodXRlbW92IiA8a2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVsLmNvbT4KPiBDYzogUmFscGgg
Q2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgo+IENjOiAiSsOpcsO0bWUgR2xpc3NlIiA8
amdsaXNzZUByZWRoYXQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPgpTZWVtcyBhbGwgY29uY2VybnMgd2l0aCB0aGlzIHNlcmllcyBoYXZl
IGJlZW4gYWRkcmVzc2VkLiBDb3VsZCBJIGhhdmUgYW4gCmFjayB0byBtZXJnZSB0aGlzIHRocm91
Z2ggYSBEUk0gdHJlZT8KClRoYW5rcywKClRob21hcwoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
