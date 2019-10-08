Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE2CFE2C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F30289FF7;
	Tue,  8 Oct 2019 15:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3079A89FF7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:55:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98FtP35043066;
 Tue, 8 Oct 2019 10:55:25 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98FtPlv016504
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 10:55:25 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 10:55:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 10:55:25 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98FtNvY053468;
 Tue, 8 Oct 2019 10:55:24 -0500
Subject: Re: [v3,3/8] drm/omap: accept NULL for dma_addr in omap_gem_pin
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20191007112555.25278-4-jjhiblot@ti.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <527dcc91-fc42-9dc5-6006-85734d7292d0@ti.com>
Date: Tue, 8 Oct 2019 17:55:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007112555.25278-4-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570550125;
 bh=W3qH0z0PCBybGs4ghHtpLZkTPU2rQn1SkNhcY8IG+eY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QbJ0/d8sgaPvFU3YPGzw6Xt4v+ex0/P5dCBA8gxQFG0f40qEJnKIGd9oS6wDc7IxN
 f3Gxqqep7S+slAU2XH1L5Wjx7uewkDGSwJm099yy6yCDyqgi79GQnQXAC6qi1OwnlR
 dnngMgGMSr936pngoqDE0ocm6/b7q6wvKudk4puE=
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
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPgo+IEFsbG93IE5VTEwgdG8g
YmUgcGFzc2VkIGluICdkbWFfYWRkcicgZm9yIG9tYXBfZ2VtX3BpbigpLCBpbiBjYXNlIHRoZQo+
IGNhbGxlciBkb2VzIG5vdCBuZWVkIHRoZSBkbWFfYWRkci4KPgo+IFNpZ25lZC1vZmYtYnk6IFRv
bWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIHwgNiArKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBf
Z2VtLmMKPiBpbmRleCA5MjAxYzIxZTIwNmYuLmE2NTYyZDIzZDMxNCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vb21hcF9nZW0uYwo+IEBAIC04MTksOSArODE5LDExIEBAIGludCBvbWFwX2dlbV9w
aW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIGRtYV9hZGRyX3QgKmRtYV9hZGRyKQo+ICAg
CQkJcmVmY291bnRfaW5jKCZvbWFwX29iai0+ZG1hX2FkZHJfY250KTsKPiAgIAkJfQo+ICAgCj4g
LQkJKmRtYV9hZGRyID0gb21hcF9vYmotPmRtYV9hZGRyOwo+ICsJCWlmIChkbWFfYWRkcikKPiAr
CQkJKmRtYV9hZGRyID0gb21hcF9vYmotPmRtYV9hZGRyOwo+ICAgCX0gZWxzZSBpZiAob21hcF9n
ZW1faXNfY29udGlndW91cyhvbWFwX29iaikpIHsKPiAtCQkqZG1hX2FkZHIgPSBvbWFwX29iai0+
ZG1hX2FkZHI7Cj4gKwkJaWYgKGRtYV9hZGRyKQo+ICsJCQkqZG1hX2FkZHIgPSBvbWFwX29iai0+
ZG1hX2FkZHI7Cj4gICAJfSBlbHNlIHsKPiAgIAkJcmV0ID0gLUVJTlZBTDsKPiAgIAkJZ290byBm
YWlsOwpSZXZpZXdlZC1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
