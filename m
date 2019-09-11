Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCACBB0942
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCDB6EBD6;
	Thu, 12 Sep 2019 07:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DF86E0D9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 18:44:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BIi2Jl011385;
 Wed, 11 Sep 2019 13:44:02 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8BIi2uo096292
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Sep 2019 13:44:02 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 13:44:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 13:44:02 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BIi15j122843;
 Wed, 11 Sep 2019 13:44:01 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
To: Daniel Thompson <daniel.thompson@linaro.org>, Andreas Kemnade
 <andreas@kemnade.info>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-2-andreas@kemnade.info>
 <20190911100851.f4rnldghtmly26oo@holly.lan>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <3d8237d0-4e36-3787-6050-b0e75f2fa8c3@ti.com>
Date: Wed, 11 Sep 2019 13:44:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911100851.f4rnldghtmly26oo@holly.lan>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568227442;
 bh=BOqEWOsrdu0X1JsJVt3OgXpcdPXFlSvGPSUfjNqw9dQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Wi/twvAL12qufysWGszW8BVjS4jU82o51dv3hlho8PnLShrKplFUNbYT/EXiAW50k
 a1Q0Yt7t2W+AjUk18Prrg9uauG41/3RuiVXzWUkDbB/Yc97d74rbeh7n1j63COuFrG
 H7Fcc6i61XTuU7SMyMK9YqtOu8Ba/FO/X3HFlfQ8=
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
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmVhcwoKT24gOS8xMS8xOSA1OjA4IEFNLCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4gT24g
VHVlLCBTZXAgMTAsIDIwMTkgYXQgMTE6Mjk6MDhQTSArMDIwMCwgQW5kcmVhcyBLZW1uYWRlIHdy
b3RlOgo+PiBhZGQgZW5hYmxlLWdwaW9zIHRvIGRlc2NyaWJlIEhXRU4gcGluCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJlYXMgS2VtbmFkZSA8YW5kcmVhc0BrZW1uYWRlLmluZm8+Cj4gQWNrZWQt
Ynk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4KPj4gLS0t
Cj4+IGNoYW5nZXMgaW4gdjI6IGFkZCBleGFtcGxlCj4+ICAgLi4uL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwgICAgICAgICAgIHwgNSArKysrKwo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdo
dC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKPj4gaW5kZXggZGMxMjlkOWEzMjllLi4xZmE4M2ZlZmZl
MTYgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRz
L2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1s
Cj4+IEBAIC0yOSw2ICsyOSwxMCBAQCBwcm9wZXJ0aWVzOgo+PiAgICAgJyNzaXplLWNlbGxzJzoK
Pj4gICAgICAgY29uc3Q6IDAKPj4gICAKPj4gKyAgZW5hYmxlLWdwaW9zOgo+PiArICAgIGRlc2Ny
aXB0aW9uOiBHUElPIHRvIHVzZSB0byBlbmFibGUvZGlzYWJsZSB0aGUgYmFja2xpZ2h0IChIV0VO
IHBpbikuCj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiAgIHJlcXVpcmVkOgo+PiAgICAgLSBj
b21wYXRpYmxlCj4+ICAgICAtIHJlZwo+PiBAQCAtOTIsNiArOTYsNyBAQCBleGFtcGxlczoKPj4g
ICAgICAgaTJjIHsKPj4gICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47Cj4+ICsgICAgICAgIGVuYWJsZS1ncGlvcyA9IDwmZ3BpbzIg
NSBHUElPX0FDVElWRV9ISUdIPjsKClRoaXMgaXMgaW4gdGhlIHdyb25nIHBsYWNlLsKgIFRoaXMg
aXMgaW1wbHlpbmcgdGhhdCB0aGUgZ3BpbyBpcyBmb3IgdGhlIAppMmMgcGFyZW50CgpUaGlzIG5l
ZWRzIHRvIGdvIHVuZGVyIHRoZSBsZWQtY29udHJvbGxlciBub2RlIGJlbG93CgpEYW4KCj4+ICAg
Cj4+ICAgICAgICAgICBsZWQtY29udHJvbGxlckAzOCB7Cj4+ICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAidGksbG0zNjMwYSI7Cj4+IC0tIAo+PiAyLjIwLjEKPj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
