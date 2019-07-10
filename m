Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C497A64660
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F7E898C4;
	Wed, 10 Jul 2019 12:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0315489745
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:39:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdfWG104822;
 Wed, 10 Jul 2019 07:39:41 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6ACdf9l113538
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Jul 2019 07:39:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 10
 Jul 2019 07:39:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 10 Jul 2019 07:39:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdeT5113704;
 Wed, 10 Jul 2019 07:39:41 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH v3 3/4] dt-bindings: backlight: Add led-backlight binding
Date: Wed, 10 Jul 2019 14:39:31 +0200
Message-ID: <20190710123932.28244-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710123932.28244-1-jjhiblot@ti.com>
References: <20190710123932.28244-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562762381;
 bh=Pk7hnsVKcJGKKe6elo6dBDjGU2lxh03iSzrLZOy1kgU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=VNrBWkNPOCnHiOPV7FKvFAJC3hRSnSsiiBRZKutIoS9cvXgXbbdi+cpRSKvrTGlq+
 r9yYUT52z8IQN2pNlG3DlEWOAvxxJqo8QqciUqw6A8rrqL2f5ym+GArIwA8oyB9jof
 akzodC8O4/4uNgf2yaVG50nOgb/d+v0bVr/JyGas=
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
aW5kZXggMDAwMDAwMDAwMDAwLi4wNDQ0ZWVjOGVmZTEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
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
ICAgICAgICAgICAgICBpbnRvIGEgTEVEIGJyaWdodG5lc3MgbGV2ZWwuIGlmIG5vdCBwcm92aWRl
ZCwgdGhlCisgICAgICAgICAgICAgICAgICAgICAgIGlkZW50aXR5IG1hcHBpbmcgaXMgdXNlZC4K
KworICAtIGRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbDogVGhlIGRlZmF1bHQgYnJpZ2h0bmVzcyBs
ZXZlbC4KKworRXhhbXBsZToKKworCWJhY2tsaWdodCB7CisJCWNvbXBhdGlibGUgPSAibGVkLWJh
Y2tsaWdodCI7CisKKwkJbGVkcyA9IDwmbGVkMT4sIDwmbGVkMj47CisJCWJyaWdodG5lc3MtbGV2
ZWxzID0gPDAgNCA4IDE2IDMyIDY0IDEyOCAyNTU+OworCQlkZWZhdWx0LWJyaWdodG5lc3MtbGV2
ZWwgPSA8Nj47CisJfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
