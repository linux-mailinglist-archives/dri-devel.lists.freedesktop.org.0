Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C0CFE30
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033D46E141;
	Tue,  8 Oct 2019 15:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC3D6E141
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:56:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98Fu9sX017926;
 Tue, 8 Oct 2019 10:56:09 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98Fu9ar003717
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 10:56:09 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 10:56:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 10:56:08 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98Fu7bB107674;
 Tue, 8 Oct 2019 10:56:07 -0500
Subject: Re: [v3,4/8] drm/omap: cleanup OMAP_BO flags
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20191007112555.25278-5-jjhiblot@ti.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <4a0119f8-7507-9bfe-3b83-c341fb02927c@ti.com>
Date: Tue, 8 Oct 2019 17:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007112555.25278-5-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570550169;
 bh=Nrcl6Au2pk/H7qFYXtobUceZUrNxakuinusEI28Wcgk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MzXouyc+jFJDd9HVQDGs4nBu0B7lvsSgf1KY0DN0K9MwOK8GvKDhlo2ahakvGmzX+
 XybrC0vfrAwajvfytnXeuSvohgFykcRAgGYV95Utc3W0cWRGKAijk+qECVSlsbbW2S
 0NKsr44GheuuKfOrekuz/W5XibQenCV0r8qQkvd0=
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
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPgo+IFJlb3JkZXIgT01BUF9C
TyBmbGFncyBhbmQgaW1wcm92ZSB0aGUgY29tbWVudHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IC0tLQo+ICAgaW5jbHVkZS91YXBp
L2RybS9vbWFwX2RybS5oIHwgMTcgKysrKysrKysrLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2RybS9vbWFwX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9vbWFwX2RybS5oCj4gaW5k
ZXggMWZjY2ZmZWY5ZTI3Li5kOGVlMmY4NDA2OTcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBp
L2RybS9vbWFwX2RybS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9vbWFwX2RybS5oCj4gQEAg
LTM4LDE5ICszOCwyMCBAQCBzdHJ1Y3QgZHJtX29tYXBfcGFyYW0gewo+ICAgCV9fdTY0IHZhbHVl
OwkJCS8qIGluIChzZXRfcGFyYW0pLCBvdXQgKGdldF9wYXJhbSkgKi8KPiAgIH07Cj4gICAKPiAt
I2RlZmluZSBPTUFQX0JPX1NDQU5PVVQJCTB4MDAwMDAwMDEJLyogc2Nhbm91dCBjYXBhYmxlIChw
aHlzIGNvbnRpZ3VvdXMpICovCj4gLSNkZWZpbmUgT01BUF9CT19DQUNIRV9NQVNLCTB4MDAwMDAw
MDYJLyogY2FjaGUgdHlwZSBtYXNrLCBzZWUgY2FjaGUgbW9kZXMgKi8KPiAtI2RlZmluZSBPTUFQ
X0JPX1RJTEVEX01BU0sJMHgwMDAwMGYwMAkvKiB0aWxlZCBtYXBwaW5nIG1hc2ssIHNlZSB0aWxl
ZCBtb2RlcyAqLwo+ICsvKiBTY2Fub3V0IGJ1ZmZlciwgY29uc3VtYWJsZSBieSBEU1MgKi8KPiAr
I2RlZmluZSBPTUFQX0JPX1NDQU5PVVQJCTB4MDAwMDAwMDEKPiAgIAo+IC0vKiBjYWNoZSBtb2Rl
cyAqLwo+IC0jZGVmaW5lIE9NQVBfQk9fQ0FDSEVECQkweDAwMDAwMDAwCS8qIGRlZmF1bHQgKi8K
PiAtI2RlZmluZSBPTUFQX0JPX1dDCQkweDAwMDAwMDAyCS8qIHdyaXRlLWNvbWJpbmUgKi8KPiAt
I2RlZmluZSBPTUFQX0JPX1VOQ0FDSEVECTB4MDAwMDAwMDQJLyogc3Ryb25nbHktb3JkZXJlZCAo
dW5jYWNoZWQpICovCj4gKy8qIEJ1ZmZlciBDUFUgY2FjaGluZyBtb2RlOiBjYWNoZWQsIHdyaXRl
LWNvbWJpbmluZyBvciB1bmNhY2hlZC4gKi8KPiArI2RlZmluZSBPTUFQX0JPX0NBQ0hFRAkJMHgw
MDAwMDAwMAo+ICsjZGVmaW5lIE9NQVBfQk9fV0MJCTB4MDAwMDAwMDIKPiArI2RlZmluZSBPTUFQ
X0JPX1VOQ0FDSEVECTB4MDAwMDAwMDQKPiArI2RlZmluZSBPTUFQX0JPX0NBQ0hFX01BU0sJMHgw
MDAwMDAwNgo+ICAgCj4gLS8qIHRpbGVkIG1vZGVzICovCj4gKy8qIFVzZSBUSUxFUiBmb3IgdGhl
IGJ1ZmZlci4gVGhlIFRJTEVSIGNvbnRhaW5lciB1bml0IGNhbiBiZSA4LCAxNiBvciAzMiBiaXRz
LiAqLwo+ICAgI2RlZmluZSBPTUFQX0JPX1RJTEVEXzgJCTB4MDAwMDAxMDAKPiAgICNkZWZpbmUg
T01BUF9CT19USUxFRF8xNgkweDAwMDAwMjAwCj4gICAjZGVmaW5lIE9NQVBfQk9fVElMRURfMzIJ
MHgwMDAwMDMwMAo+ICsjZGVmaW5lIE9NQVBfQk9fVElMRURfTUFTSwkweDAwMDAwZjAwCj4gICAj
ZGVmaW5lIE9NQVBfQk9fVElMRUQJCShPTUFQX0JPX1RJTEVEXzggfCBPTUFQX0JPX1RJTEVEXzE2
IHwgT01BUF9CT19USUxFRF8zMikKPiAgIAo+ICAgdW5pb24gb21hcF9nZW1fc2l6ZSB7ClJldmll
d2VkLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
