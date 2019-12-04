Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F921112A15
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803406E8AE;
	Wed,  4 Dec 2019 11:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690BE6E8AE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:26:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4BQ1C9015599;
 Wed, 4 Dec 2019 05:26:02 -0600
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4BQ1GJ064727;
 Wed, 4 Dec 2019 05:26:01 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 05:26:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 05:26:00 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4BPvwt123659;
 Wed, 4 Dec 2019 05:25:58 -0600
Subject: Re: [PATCH] ARM: dts: am335x-evmsk: Use drm simple-panel instead of
 tilcdc-panel
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>,
 <tony@atomide.com>, <bcousson@baylibre.com>,
 <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
References: <20191204105554.14212-1-jsarha@ti.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <1aa8c476-031a-e156-7648-c9740a98e3ee@ti.com>
Date: Wed, 4 Dec 2019 13:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191204105554.14212-1-jsarha@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575458762;
 bh=U9KwFUmtbhKcE0R5rk3qW4+wg7hHP+RvMDN9b8akF6E=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=B6v1uXZ2Bb5TkY2O/LztY2GiaAuKpkAVGfEmgcvVXZi6MrWybpCcjQglivQdRovGy
 ZdZmIPn0DmHW5RfWQRkjnoQqqOSBmVcN1tJ3ELz+NF2/fksYeN5cKDIu5StthrcW/C
 nKS0Yzgq+gk5VOnh0YW6WTYoMMT2Y+/i4XBivmME=
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
Cc: tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAwNC8xMi8yMDE5IDEyLjU1LCBKeXJpIFNhcmhhIHdyb3RlOgo+IE1vdmUgdG8gdXNlIHRo
ZSBuZXcgZHJtIHBhbmVsIHN1cHBvcnQgaW4gdGlsY2RjIHRvZ2V0aGVyIHdpdGggYWRkZWQKPiAi
bmV3aGF2ZW4sbmhkLTQuMy00ODAyNzJlZi1hdHhsIi1wYW5lbCBzdXBwb3J0IGluIGRybSBwYW5l
bC1zaW1wbGUuCgpUZXN0ZWQtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5j
b20+Cgo+IFNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4gLS0tCj4g
IGFyY2gvYXJtL2Jvb3QvZHRzL2FtMzM1eC1ldm1zay5kdHMgfCAzOCArKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI2IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hbTMzNXgtZXZt
c2suZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWV2bXNrLmR0cwo+IGluZGV4IGUyOGE1
YjgyZmRmMy4uYjE0OWU0ODUyMGI0IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2Ft
MzM1eC1ldm1zay5kdHMKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9hbTMzNXgtZXZtc2suZHRz
Cj4gQEAgLTE4MywzNiArMTgzLDE2IEBACj4gIAl9Owo+ICAKPiAgCXBhbmVsIHsKPiAtCQljb21w
YXRpYmxlID0gInRpLHRpbGNkYyxwYW5lbCI7Cj4gKwkJY29tcGF0aWJsZSA9ICJuZXdoYXZlbixu
aGQtNC4zLTQ4MDI3MmVmLWF0eGwiOwo+ICsKPiAgCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
LCAic2xlZXAiOwo+ICAJCXBpbmN0cmwtMCA9IDwmbGNkX3BpbnNfZGVmYXVsdD47Cj4gIAkJcGlu
Y3RybC0xID0gPCZsY2RfcGluc19zbGVlcD47Cj4gIAkJYmFja2xpZ2h0ID0gPCZsY2RfYmw+Owo+
IC0JCXN0YXR1cyA9ICJva2F5IjsKPiAtCQlwYW5lbC1pbmZvIHsKPiAtCQkJYWMtYmlhcwkJPSA8
MjU1PjsKPiAtCQkJYWMtYmlhcy1pbnRycHQJPSA8MD47Cj4gLQkJCWRtYS1idXJzdC1zegk9IDwx
Nj47Cj4gLQkJCWJwcAkJPSA8MzI+Owo+IC0JCQlmZGQJCT0gPDB4ODA+Owo+IC0JCQlzeW5jLWVk
Z2UJPSA8MD47Cj4gLQkJCXN5bmMtY3RybAk9IDwxPjsKPiAtCQkJcmFzdGVyLW9yZGVyCT0gPDA+
Owo+IC0JCQlmaWZvLXRoCQk9IDwwPjsKPiAtCQl9Owo+IC0JCWRpc3BsYXktdGltaW5ncyB7Cj4g
LQkJCTQ4MHgyNzIgewo+IC0JCQkJaGFjdGl2ZQkJPSA8NDgwPjsKPiAtCQkJCXZhY3RpdmUJCT0g
PDI3Mj47Cj4gLQkJCQloYmFjay1wb3JjaAk9IDw0Mz47Cj4gLQkJCQloZnJvbnQtcG9yY2gJPSA8
OD47Cj4gLQkJCQloc3luYy1sZW4JPSA8ND47Cj4gLQkJCQl2YmFjay1wb3JjaAk9IDwxMj47Cj4g
LQkJCQl2ZnJvbnQtcG9yY2gJPSA8ND47Cj4gLQkJCQl2c3luYy1sZW4JPSA8MTA+Owo+IC0JCQkJ
Y2xvY2stZnJlcXVlbmN5ID0gPDkwMDAwMDA+Owo+IC0JCQkJaHN5bmMtYWN0aXZlCT0gPDA+Owo+
IC0JCQkJdnN5bmMtYWN0aXZlCT0gPDA+Owo+ICsKPiArCQlwb3J0IHsKPiArCQkJcGFuZWxfMDog
ZW5kcG9pbnRAMCB7Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmxjZGNfMD47Cj4gIAkJCX07
Cj4gIAkJfTsKPiAgCX07Cj4gQEAgLTc1MCw2ICs3MzAsMTIgQEAKPiAgCXN0YXR1cyA9ICJva2F5
IjsKPiAgCj4gIAlibHVlLWFuZC1yZWQtd2lyaW5nID0gImNyb3NzZWQiOwo+ICsKPiArCXBvcnQg
ewo+ICsJCWxjZGNfMDogZW5kcG9pbnRAMCB7Cj4gKwkJCXJlbW90ZS1lbmRwb2ludCA9IDwmcGFu
ZWxfMD47Cj4gKwkJfTsKPiArCX07Cj4gIH07Cj4gIAo+ICAmcnRjIHsKPiAKCi0gUMOpdGVyCgpU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
