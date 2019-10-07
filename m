Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C974ACE20B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 14:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7896E5CF;
	Mon,  7 Oct 2019 12:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FA36E5CF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 12:45:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97Cixfb096464;
 Mon, 7 Oct 2019 07:44:59 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97Cixfo094012
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Oct 2019 07:44:59 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:44:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:44:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97Ciw6Q040914;
 Mon, 7 Oct 2019 07:44:59 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
Date: Mon, 7 Oct 2019 14:44:36 +0200
Message-ID: <20191007124437.20367-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007124437.20367-1-jjhiblot@ti.com>
References: <20191007124437.20367-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570452299;
 bh=WOXsRi42fsiW/9LejeZWBZwvFwuBBeTHB7PUwCNT7tk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=RBq4vwAAlAkmawzMPuk9ToEFCgQ5X3n6Lca5Rgyvail+Fozj807EMJ9Ajc2zMksZD
 WP9sU0ZQB3DyibgvneayOH3o1fxMOrIe6ECNRm9IDKmdd8cdVtjc1VBbQjIumXQ7Ar
 c4kDAbY6uovoNz7C+IjvXHoKwihr9jrElwJOvVBI=
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
Y3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogU2ViYXN0aWFuIFJl
aWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+Ci0tLQogLi4uL2JpbmRpbmdz
L2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgMjggKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2ts
aWdodC50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi40YzdkZmJlN2Y2N2EKLS0tIC9kZXYvbnVsbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVk
LWJhY2tsaWdodC50eHQKQEAgLTAsMCArMSwyOCBAQAorbGVkLWJhY2tsaWdodCBiaW5kaW5ncwor
CitUaGlzIGJpbmRpbmcgaXMgdXNlZCB0byBkZXNjcmliZSBhIGJhc2ljIGJhY2tsaWdodCBkZXZp
Y2UgbWFkZSBvZiBMRURzLgorSXQgY2FuIGFsc28gYmUgdXNlZCB0byBkZXNjcmliZSBhIGJhY2ts
aWdodCBkZXZpY2UgY29udHJvbGxlZCBieSB0aGUgb3V0cHV0IG9mCithIExFRCBkcml2ZXIuCisK
K1JlcXVpcmVkIHByb3BlcnRpZXM6CisgIC0gY29tcGF0aWJsZTogImxlZC1iYWNrbGlnaHQiCisg
IC0gbGVkczogYSBsaXN0IG9mIExFRHMKKworT3B0aW9uYWwgcHJvcGVydGllczoKKyAgLSBicmln
aHRuZXNzLWxldmVsczogQXJyYXkgb2YgZGlzdGluY3QgYnJpZ2h0bmVzcyBsZXZlbHMuIFRoZSBs
ZXZlbHMgbXVzdCBiZQorICAgICAgICAgICAgICAgICAgICAgICBpbiB0aGUgcmFuZ2UgYWNjZXB0
ZWQgYnkgdGhlIHVuZGVybHlpbmcgTEVEIGRldmljZXMuCisgICAgICAgICAgICAgICAgICAgICAg
IFRoaXMgaXMgdXNlZCB0byB0cmFuc2xhdGUgYSBiYWNrbGlnaHQgYnJpZ2h0bmVzcyBsZXZlbAor
ICAgICAgICAgICAgICAgICAgICAgICBpbnRvIGEgTEVEIGJyaWdodG5lc3MgbGV2ZWwuIElmIGl0
IGlzIG5vdCBwcm92aWRlZCwgdGhlCisgICAgICAgICAgICAgICAgICAgICAgIGlkZW50aXR5IG1h
cHBpbmcgaXMgdXNlZC4KKworICAtIGRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbDogVGhlIGRlZmF1
bHQgYnJpZ2h0bmVzcyBsZXZlbC4KKworRXhhbXBsZToKKworCWJhY2tsaWdodCB7CisJCWNvbXBh
dGlibGUgPSAibGVkLWJhY2tsaWdodCI7CisKKwkJbGVkcyA9IDwmbGVkMT4sIDwmbGVkMj47CisJ
CWJyaWdodG5lc3MtbGV2ZWxzID0gPDAgNCA4IDE2IDMyIDY0IDEyOCAyNTU+OworCQlkZWZhdWx0
LWJyaWdodG5lc3MtbGV2ZWwgPSA8Nj47CisJfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
