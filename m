Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7B11463
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 09:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D274F8926E;
	Thu,  2 May 2019 07:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4A88932A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 12:18:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x41CInFW030028;
 Wed, 1 May 2019 07:18:49 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x41CIngO040408
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 May 2019 07:18:49 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 1 May
 2019 07:18:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 1 May 2019 07:18:48 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x41CImd7003631;
 Wed, 1 May 2019 07:18:48 -0500
Subject: Re: [PATCH v3 3/3] backlight: lm3630a: add firmware node support
To: Pavel Machek <pavel@ucw.cz>
References: <20190415072905.2861-1-masneyb@onstation.org>
 <20190415072905.2861-4-masneyb@onstation.org>
 <0e5e26ba-cf98-913e-8e76-e988a86dc0d1@ti.com> <20190501082627.GA2971@amd>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <fbf41c1b-21c7-a997-f88c-3d29ccd1b42a@ti.com>
Date: Wed, 1 May 2019 07:18:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501082627.GA2971@amd>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 02 May 2019 07:42:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556713129;
 bh=9aQOi45c/EGVag76udV6doM0PRwWmZo9EP9zOsTY0/k=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=eLlCOI2gErzAP1SeQMBk3RLC8bHUw3IqTNbW7qY1aCEy6pK/EspZStjcFEV/8hlTj
 9MmJn6ftIpzYuNa6jhRILkZRkVrg5phmQwqRYCZyyWRtcmOMkcUYiX4r58Uv+T37Qr
 XOVNJracOfkqDKbYB/ZNLiQplBY6IzhY389B1/XY=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, jonathan@marek.ca, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, linux-fbdev@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF2ZWwKCk9uIDUvMS8xOSAzOjI2IEFNLCBQYXZlbCBNYWNoZWsgd3JvdGU6Cj4gSGkhCj4gCj4+
PiBAQCAtMzk2LDEzICs1MDYsMjAgQEAgc3RhdGljIGludCBsbTM2MzBhX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQsCj4+PiAgCQkJCSAgICAgR0ZQX0tFUk5FTCk7Cj4+PiAgCQlpZiAo
cGRhdGEgPT0gTlVMTCkKPj4+ICAJCQlyZXR1cm4gLUVOT01FTTsKPj4+ICsKPj4+ICAJCS8qIGRl
ZmF1bHQgdmFsdWVzICovCj4+PiAtCQlwZGF0YS0+bGVkYV9jdHJsID0gTE0zNjMwQV9MRURBX0VO
QUJMRTsKPj4+IC0JCXBkYXRhLT5sZWRiX2N0cmwgPSBMTTM2MzBBX0xFREJfRU5BQkxFOwo+Pj4g
KwkJcGRhdGEtPmxlZGFfY3RybCA9IExNMzYzMEFfTEVEQV9ESVNBQkxFOwo+Pj4gKwkJcGRhdGEt
PmxlZGJfY3RybCA9IExNMzYzMEFfTEVEQl9ESVNBQkxFOwo+Pgo+PiBUaGlzIGlzIG5vdCBuZWVk
ZWQgc2luY2UgZGVmYXVsdCBpcyBkaXNhYmxlZCBhbmQga3phbGxvYyB3aWxsIHNldCB0aGVzZSB0
byAwCj4gCj4gTGV0IGNvbXBpbGVyIGRvIHRoaXMga2luZCBvZiBvcHRpbWFsaXphdGlvbnMuIENv
ZGUgbWFrZXMgc2Vuc2UgYXMtaXMuCj4gCgpZZXMgdGhlIGNvZGUgbWFrZXMgc2Vuc2UgYnV0IGl0
IGlzIHVubmVjZXNzYXJ5LgoKRGFuCgo+IAkJCQkJCQkJCVBhdmVsCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
