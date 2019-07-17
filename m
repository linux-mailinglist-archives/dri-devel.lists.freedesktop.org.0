Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557F96BDFB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 16:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098AB6E1BE;
	Wed, 17 Jul 2019 14:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB416E193
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 14:15:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HEFNhm046067;
 Wed, 17 Jul 2019 09:15:23 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HEFNjE028740
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Jul 2019 09:15:23 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Jul 2019 09:15:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Jul 2019 09:15:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HEFLpC077724;
 Wed, 17 Jul 2019 09:15:22 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH v4 3/4] dt-bindings: backlight: Add led-backlight binding
Date: Wed, 17 Jul 2019 16:15:13 +0200
Message-ID: <20190717141514.21171-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717141514.21171-1-jjhiblot@ti.com>
References: <20190717141514.21171-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1563372923;
 bh=J37WOYhcIEKzEnO3t8q5TtofJfu6T7iSB8tR2Bkh500=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=nBjkZxKjE4g1zLAGMGNxzv5PaNcDjiIWwqRPntDwk306NjvVZkMtZGjmS00KXilSS
 /mveP61PdTEJgEUtETWIvbgxJAV22k0uIpE6cs8bB4U9xgJl/X3nroHSCMxBw3x8gd
 eCzIPzXmgXVMmdFe/k0WzO8r7YM4/jfROmE8iN3c=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, dmurphy@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERUIGJpbmRpbmcgZm9yIGxlZC1iYWNrbGlnaHQuCgpTaWduZWQtb2ZmLWJ5OiBKZWFuLUph
Y3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgMjggKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvbGVkLWJhY2tsaWdodC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi40YzdkZmJlN2Y2N2EKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdo
dC50eHQKQEAgLTAsMCArMSwyOCBAQAorbGVkLWJhY2tsaWdodCBiaW5kaW5ncworCitUaGlzIGJp
bmRpbmcgaXMgdXNlZCB0byBkZXNjcmliZSBhIGJhc2ljIGJhY2tsaWdodCBkZXZpY2UgbWFkZSBv
ZiBMRURzLgorSXQgY2FuIGFsc28gYmUgdXNlZCB0byBkZXNjcmliZSBhIGJhY2tsaWdodCBkZXZp
Y2UgY29udHJvbGxlZCBieSB0aGUgb3V0cHV0IG9mCithIExFRCBkcml2ZXIuCisKK1JlcXVpcmVk
IHByb3BlcnRpZXM6CisgIC0gY29tcGF0aWJsZTogImxlZC1iYWNrbGlnaHQiCisgIC0gbGVkczog
YSBsaXN0IG9mIExFRHMKKworT3B0aW9uYWwgcHJvcGVydGllczoKKyAgLSBicmlnaHRuZXNzLWxl
dmVsczogQXJyYXkgb2YgZGlzdGluY3QgYnJpZ2h0bmVzcyBsZXZlbHMuIFRoZSBsZXZlbHMgbXVz
dCBiZQorICAgICAgICAgICAgICAgICAgICAgICBpbiB0aGUgcmFuZ2UgYWNjZXB0ZWQgYnkgdGhl
IHVuZGVybHlpbmcgTEVEIGRldmljZXMuCisgICAgICAgICAgICAgICAgICAgICAgIFRoaXMgaXMg
dXNlZCB0byB0cmFuc2xhdGUgYSBiYWNrbGlnaHQgYnJpZ2h0bmVzcyBsZXZlbAorICAgICAgICAg
ICAgICAgICAgICAgICBpbnRvIGEgTEVEIGJyaWdodG5lc3MgbGV2ZWwuIElmIGl0IGlzIG5vdCBw
cm92aWRlZCwgdGhlCisgICAgICAgICAgICAgICAgICAgICAgIGlkZW50aXR5IG1hcHBpbmcgaXMg
dXNlZC4KKworICAtIGRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbDogVGhlIGRlZmF1bHQgYnJpZ2h0
bmVzcyBsZXZlbC4KKworRXhhbXBsZToKKworCWJhY2tsaWdodCB7CisJCWNvbXBhdGlibGUgPSAi
bGVkLWJhY2tsaWdodCI7CisKKwkJbGVkcyA9IDwmbGVkMT4sIDwmbGVkMj47CisJCWJyaWdodG5l
c3MtbGV2ZWxzID0gPDAgNCA4IDE2IDMyIDY0IDEyOCAyNTU+OworCQlkZWZhdWx0LWJyaWdodG5l
c3MtbGV2ZWwgPSA8Nj47CisJfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
