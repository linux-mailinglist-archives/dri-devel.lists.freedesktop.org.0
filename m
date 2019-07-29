Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929E679CD7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCD76E2CA;
	Mon, 29 Jul 2019 23:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94A16E2C8;
 Mon, 29 Jul 2019 23:31:27 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3f81d70000>; Mon, 29 Jul 2019 16:31:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 29 Jul 2019 16:31:27 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 29 Jul 2019 16:31:27 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jul
 2019 23:31:21 +0000
Subject: Re: [PATCH 8/9] mm: remove the unused MIGRATE_PFN_DEVICE flag
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-9-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <ef44f3bf-0f99-c76b-bf4b-6770545b5e38@nvidia.com>
Date: Mon, 29 Jul 2019 16:31:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190729142843.22320-9-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564443096; bh=O8zN+ilqdowg6XJWOKGWaqeRnGFJG/18lWzHA9AhwWg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=onH0Tpj1Tz3LEQ90f+LIBghEm0gRUDd+Vt87PqxKB618Q0OokxWCSs8MxUdMV5LSP
 b719XO9KM55zHTVJPYoDk1UsbLx4CDp3kdspYDVfwMrPaFt/iD6r7FbutPS5BLwg3J
 sVHhSm1j2W2dxpTRykhla9vsi74jyLnk0WjB9aX6PxeOYUaucitEBb7mtcNyPKSapK
 eOtIks+EkSzuuOta5qJoq6WmFGw8k/rD+rx7KknJ0vmrmLhWLr95OoMD1rJLdgwZQ1
 UPnXFtZ6RDuh9Gh7rs44NDWNib8nJqMTHnahSnZJzsQJQoJ7xmYb9uPbMLSqzzgVBd
 aSd53XeIopcIg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjkvMTkgNzoyOCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTm8gb25lIGV2
ZXIgY2hlY2tzIHRoaXMgZmxhZywgYW5kIHdlIGNvdWxkIGVhc2lseSBnZXQgdGhhdCBpbmZvcm1h
dGlvbgo+IGZyb20gdGhlIHBhZ2UgaWYgbmVlZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxy
Y2FtcGJlbGxAbnZpZGlhLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2RtZW0uYyB8IDMgKy0tCj4gICBpbmNsdWRlL2xpbnV4L21pZ3JhdGUuaCAgICAgICAg
ICAgICAgICB8IDEgLQo+ICAgbW0vbWlncmF0ZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA0ICsrLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rt
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCj4gaW5kZXggNmNi
OTMwNzU1OTcwLi5mMDQ2ODZhMmMyMWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kbWVtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2RtZW0uYwo+IEBAIC01ODIsOCArNTgyLDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbm91
dmVhdV9kbWVtX21pZ3JhdGVfY29weV9vbmUoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gICAJ
CQkqZG1hX2FkZHIpKQo+ICAgCQlnb3RvIG91dF9kbWFfdW5tYXA7Cj4gICAKPiAtCXJldHVybiBt
aWdyYXRlX3BmbihwYWdlX3RvX3BmbihkcGFnZSkpIHwKPiAtCQlNSUdSQVRFX1BGTl9MT0NLRUQg
fCBNSUdSQVRFX1BGTl9ERVZJQ0U7Cj4gKwlyZXR1cm4gbWlncmF0ZV9wZm4ocGFnZV90b19wZm4o
ZHBhZ2UpKSB8IE1JR1JBVEVfUEZOX0xPQ0tFRDsKPiAgIAo+ICAgb3V0X2RtYV91bm1hcDoKPiAg
IAlkbWFfdW5tYXBfcGFnZShkZXYsICpkbWFfYWRkciwgUEFHRV9TSVpFLCBETUFfQklESVJFQ1RJ
T05BTCk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oIGIvaW5jbHVkZS9s
aW51eC9taWdyYXRlLmgKPiBpbmRleCAyMjkxNTNjMmM0OTYuLjhiNDZjZmRiMWEwZSAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWln
cmF0ZS5oCj4gQEAgLTE2Niw3ICsxNjYsNiBAQCBzdGF0aWMgaW5saW5lIGludCBtaWdyYXRlX21p
c3BsYWNlZF90cmFuc2h1Z2VfcGFnZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiAgICNkZWZpbmUg
TUlHUkFURV9QRk5fTUlHUkFURQkoMVVMIDw8IDEpCj4gICAjZGVmaW5lIE1JR1JBVEVfUEZOX0xP
Q0tFRAkoMVVMIDw8IDIpCj4gICAjZGVmaW5lIE1JR1JBVEVfUEZOX1dSSVRFCSgxVUwgPDwgMykK
PiAtI2RlZmluZSBNSUdSQVRFX1BGTl9ERVZJQ0UJKDFVTCA8PCA0KQo+ICAgI2RlZmluZSBNSUdS
QVRFX1BGTl9TSElGVAk2Cj4gICAKPiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKm1pZ3Jh
dGVfcGZuX3RvX3BhZ2UodW5zaWduZWQgbG9uZyBtcGZuKQo+IGRpZmYgLS1naXQgYS9tbS9taWdy
YXRlLmMgYi9tbS9taWdyYXRlLmMKPiBpbmRleCBkYzRlNjBhNDk2ZjIuLjc0NzM1MjU2ZTI2MCAx
MDA2NDQKPiAtLS0gYS9tbS9taWdyYXRlLmMKPiArKysgYi9tbS9taWdyYXRlLmMKPiBAQCAtMjIz
Nyw4ICsyMjM3LDggQEAgc3RhdGljIGludCBtaWdyYXRlX3ZtYV9jb2xsZWN0X3BtZChwbWRfdCAq
cG1kcCwKPiAgIAkJCQlnb3RvIG5leHQ7Cj4gICAKPiAgIAkJCXBhZ2UgPSBkZXZpY2VfcHJpdmF0
ZV9lbnRyeV90b19wYWdlKGVudHJ5KTsKPiAtCQkJbXBmbiA9IG1pZ3JhdGVfcGZuKHBhZ2VfdG9f
cGZuKHBhZ2UpKXwKPiAtCQkJCU1JR1JBVEVfUEZOX0RFVklDRSB8IE1JR1JBVEVfUEZOX01JR1JB
VEU7Cj4gKwkJCW1wZm4gPSBtaWdyYXRlX3BmbihwYWdlX3RvX3BmbihwYWdlKSkgfAo+ICsJCQkJ
CU1JR1JBVEVfUEZOX01JR1JBVEU7Cj4gICAJCQlpZiAoaXNfd3JpdGVfZGV2aWNlX3ByaXZhdGVf
ZW50cnkoZW50cnkpKQo+ICAgCQkJCW1wZm4gfD0gTUlHUkFURV9QRk5fV1JJVEU7Cj4gICAJCX0g
ZWxzZSB7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
