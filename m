Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAA8CFE3D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9566E841;
	Tue,  8 Oct 2019 15:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00316E841
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:57:35 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98FvYEJ043540;
 Tue, 8 Oct 2019 10:57:34 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98FvYfD019583
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 10:57:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 10:57:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 10:57:31 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98FvW6o104933;
 Tue, 8 Oct 2019 10:57:32 -0500
Subject: Re: [v3,6/8] drm/omap: cleanup OMAP_BO_SCANOUT use
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20191007112555.25278-7-jjhiblot@ti.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <6c35e84d-36a9-bc74-c6fe-231cbed8a383@ti.com>
Date: Tue, 8 Oct 2019 17:57:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007112555.25278-7-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570550254;
 bh=bS9E8L3rG27OMJnJ/BRUyM8x/RYeNL8N1FWdenR0LkI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uBTkH+jRZzksHLD6Q95K/5g5xqNnbWemGtxOOL7wYtnsF/rjC930XIDk0xOOFYqbM
 JdU0WqlxBa7REnj6nlkTJFjs82oticyO+08q6Lt5ZGrmg4DJdsRcZqcIURXypJQE/S
 Vb+drfqt5NXEX7lLsvdBg6Uv2x8R3oZJguBp2aWo=
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
Cc: dri-devel@lists.freedesktop.org, jsarha@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA3LzEwLzIwMTkgMTM6MjUsIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4gRnJvbTog
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPgo+IG9tYXBfZ2VtX25ldygp
IGhhcyBhIGNvbW1lbnQgYWJvdXQgT01BUF9CT19TQ0FOT1VUIHdoaWNoIGRvZXMgbm90IG1ha2UK
PiBzZW5zZS4gQWxzbywgZm9yIHRoZSBUSUxFUiBjYXNlLCB3ZSBkcm9wIE9NQVBfQk9fU0NBTk9V
VCBmbGFnIGZvciBzb21lCj4gcmVhc29uLgo+Cj4gSXQncyBub3QgY2xlYXIgd2hhdCB0aGUgb3Jp
Z2luYWwgcHVycG9zZSBvZiBPTUFQX0JPX1NDQU5PVVQgaXMsIGJ1dAo+IHByZXN1bWluZyBpdCBt
ZWFucyAic2Nhbm91dCBidWZmZXIsIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBjb25zdW1lZCBieQo+
IERTUyIsIHRoaXMgcGF0Y2ggY2xlYW5zIHVwIHRoZSBhYm92ZSBpc3N1ZXMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyB8IDYgKystLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2dlbS5jCj4gaW5kZXggNGU4ZmNmZGZmM2EwLi4yN2UwYTJmODUwOGEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKPiBAQCAtMTE1NSw3ICsxMTU1LDYgQEAgc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
PiAgIAkJICogVGlsZWQgYnVmZmVycyBhcmUgYWx3YXlzIHNobWVtIHBhZ2VkIGJhY2tlZC4gV2hl
biB0aGV5IGFyZQo+ICAgCQkgKiBzY2FubmVkIG91dCwgdGhleSBhcmUgcmVtYXBwZWQgaW50byBE
TU0vVElMRVIuCj4gICAJCSAqLwo+IC0JCWZsYWdzICY9IH5PTUFQX0JPX1NDQU5PVVQ7Cj4gICAJ
CWZsYWdzIHw9IE9NQVBfQk9fTUVNX1NITUVNOwo+ICAgCj4gICAJCS8qCj4gQEAgLTExNjYsOSAr
MTE2NSw4IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb21hcF9nZW1fbmV3KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCj4gICAJCWZsYWdzIHw9IHRpbGVyX2dldF9jcHVfY2FjaGVfZmxhZ3MoKTsK
PiAgIAl9IGVsc2UgaWYgKChmbGFncyAmIE9NQVBfQk9fU0NBTk9VVCkgJiYgIXByaXYtPmhhc19k
bW0pIHsKPiAgIAkJLyoKPiAtCQkgKiBPTUFQX0JPX1NDQU5PVVQgaGludHMgdGhhdCB0aGUgYnVm
ZmVyIGRvZXNuJ3QgbmVlZCB0byBiZQo+IC0JCSAqIHRpbGVkLiBIb3dldmVyLCB0byBsb3dlciB0
aGUgcHJlc3N1cmUgb24gbWVtb3J5IGFsbG9jYXRpb24sCj4gLQkJICogdXNlIGNvbnRpZ3VvdXMg
bWVtb3J5IG9ubHkgaWYgbm8gVElMRVIgaXMgYXZhaWxhYmxlLgo+ICsJCSAqIElmIHdlIGRvbid0
IGhhdmUgRE1NLCB3ZSBtdXN0IGFsbG9jYXRlIHNjYW5vdXQgYnVmZmVycwo+ICsJCSAqIGZyb20g
Y29udGlndW91cyBETUEgbWVtb3J5Lgo+ICAgCQkgKi8KPiAgIAkJZmxhZ3MgfD0gT01BUF9CT19N
RU1fRE1BX0FQSTsKPiAgIAl9IGVsc2UgaWYgKCEoZmxhZ3MgJiBPTUFQX0JPX01FTV9ETUFCVUYp
KSB7ClJldmlld2VkLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
