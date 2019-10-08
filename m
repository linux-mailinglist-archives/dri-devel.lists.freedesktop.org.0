Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53EFCFE2B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8ED6E839;
	Tue,  8 Oct 2019 15:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60ECF6E839
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:54:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98FsiD0017451;
 Tue, 8 Oct 2019 10:54:44 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98FsiHH015618
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 10:54:44 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 10:54:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 10:54:43 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98Fsg7M100165;
 Tue, 8 Oct 2019 10:54:42 -0500
Subject: Re: [v3,2/8] drm/omap: add omap_gem_unpin_locked()
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20191007112555.25278-3-jjhiblot@ti.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <0d67e3ae-89f6-f910-79bd-046f4cf5f12d@ti.com>
Date: Tue, 8 Oct 2019 17:54:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007112555.25278-3-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570550084;
 bh=2qxsmEPj9serPQmeMLQSNhodZqPNOCzg4fzhOmS4VEc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=l65cJxCuJLhC/I9K+io5hCL7rz0EL0f4OnNNYaWbzcuwcOETsXDRPABLF+Ywya0WX
 9FP5FCcxqC0k37vlCZCp05LsoFKFzpw88hOvDxSby+s4APXIn96X9pj4SoDedbOeor
 c/1ul740m1hjPB+fID37yzP0gOwHtFLQay2+U8J4=
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
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPgo+IEFkZCBvbWFwX2dlbV91
bnBpbl9sb2NrZWQoKSB3aGljaCBpcyBhIHZlcnNpb24gb2Ygb21hcF9nZW1fdW5waW4oKSB0aGF0
Cj4gZXhwZWN0cyB0aGUgY2FsbGVyIHRvIGhvbGQgdGhlIG9tYXBfb2JqIGxvY2suCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IC0tLQo+
ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyB8IDI0ICsrKysrKysrKysrKysr
KysrLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKPiBpbmRleCA1MWVkZTc3Nzcw
ODMuLjkyMDFjMjFlMjA2ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9v
bWFwX2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwo+IEBA
IC04MzQsMjAgKzgzNCwxNiBAQCBpbnQgb21hcF9nZW1fcGluKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqLCBkbWFfYWRkcl90ICpkbWFfYWRkcikKPiAgIH0KPiAgIAo+ICAgLyoqCj4gLSAqIG9t
YXBfZ2VtX3VucGluKCkgLSBVbnBpbiBhIEdFTSBvYmplY3QgZnJvbSBtZW1vcnkKPiArICogb21h
cF9nZW1fdW5waW5fbG9ja2VkKCkgLSBVbnBpbiBhIEdFTSBvYmplY3QgZnJvbSBtZW1vcnkKPiAg
ICAqIEBvYmo6IHRoZSBHRU0gb2JqZWN0Cj4gICAgKgo+IC0gKiBVbnBpbiB0aGUgZ2l2ZW4gR0VN
IG9iamVjdCBwcmV2aW91c2x5IHBpbm5lZCB3aXRoIG9tYXBfZ2VtX3BpbigpLiBQaW5zIGFyZQo+
IC0gKiByZWZlcmVuY2UtY291bnRlZCwgdGhlIGFjdHVhbHkgdW5waW4gd2lsbCBvbmx5IGJlIHBl
cmZvcm1lZCB3aGVuIHRoZSBudW1iZXIKPiAtICogb2YgY2FsbHMgdG8gdGhpcyBmdW5jdGlvbiBt
YXRjaGVzIHRoZSBudW1iZXIgb2YgY2FsbHMgdG8gb21hcF9nZW1fcGluKCkuCj4gKyAqIG9tYXBf
Z2VtX3VucGluKCkgd2l0aG91dCBsb2NraW5nLgo+ICAgICovCj4gLXZvaWQgb21hcF9nZW1fdW5w
aW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4gK3N0YXRpYyB2b2lkIG9tYXBfZ2VtX3Vu
cGluX2xvY2tlZChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAgIHsKPiAgIAlzdHJ1Y3Qg
b21hcF9nZW1fb2JqZWN0ICpvbWFwX29iaiA9IHRvX29tYXBfYm8ob2JqKTsKPiAgIAlpbnQgcmV0
Owo+ICAgCj4gLQltdXRleF9sb2NrKCZvbWFwX29iai0+bG9jayk7Cj4gLQo+ICAgCWlmIChyZWZj
b3VudF9kZWNfYW5kX3Rlc3QoJm9tYXBfb2JqLT5kbWFfYWRkcl9jbnQpKSB7Cj4gICAJCXJldCA9
IHRpbGVyX3VucGluKG9tYXBfb2JqLT5ibG9jayk7Cj4gICAJCWlmIChyZXQpIHsKPiBAQCAtODY0
LDYgKzg2MCwyMCBAQCB2b2lkIG9tYXBfZ2VtX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqKQo+ICAgCX0KPiAgIH0KPiAgIAo+ICsvKioKPiArICogb21hcF9nZW1fdW5waW4oKSAtIFVu
cGluIGEgR0VNIG9iamVjdCBmcm9tIG1lbW9yeQo+ICsgKiBAb2JqOiB0aGUgR0VNIG9iamVjdAo+
ICsgKgo+ICsgKiBVbnBpbiB0aGUgZ2l2ZW4gR0VNIG9iamVjdCBwcmV2aW91c2x5IHBpbm5lZCB3
aXRoIG9tYXBfZ2VtX3BpbigpLiBQaW5zIGFyZQo+ICsgKiByZWZlcmVuY2UtY291bnRlZCwgdGhl
IGFjdHVhbCB1bnBpbiB3aWxsIG9ubHkgYmUgcGVyZm9ybWVkIHdoZW4gdGhlIG51bWJlcgo+ICsg
KiBvZiBjYWxscyB0byB0aGlzIGZ1bmN0aW9uIG1hdGNoZXMgdGhlIG51bWJlciBvZiBjYWxscyB0
byBvbWFwX2dlbV9waW4oKS4KPiArICovCj4gK3ZvaWQgb21hcF9nZW1fdW5waW4oc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmopCj4gK3sKPiArCXN0cnVjdCBvbWFwX2dlbV9vYmplY3QgKm9tYXBf
b2JqID0gdG9fb21hcF9ibyhvYmopOwo+ICsKPiArCW11dGV4X2xvY2soJm9tYXBfb2JqLT5sb2Nr
KTsKPiArCW9tYXBfZ2VtX3VucGluX2xvY2tlZChvYmopOwo+ICAgCW11dGV4X3VubG9jaygmb21h
cF9vYmotPmxvY2spOwo+ICAgfQo+ICAgCgpSZXZpZXdlZC1ieTogSmVhbi1KYWNxdWVzIEhpYmxv
dCA8ampoaWJsb3RAdGkuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
