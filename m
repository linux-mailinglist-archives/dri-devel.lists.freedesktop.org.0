Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1086F41C6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B336F879;
	Fri,  8 Nov 2019 08:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC5E6F65A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:06:33 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vA7B6Gdh2
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 7 Nov 2019 12:06:16 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v2 6/8] ARM: DTS: omap4: add sgx gpu child node
Date: Thu,  7 Nov 2019 12:06:09 +0100
Message-Id: <011fcf5317cc57bd3af4715374a99db131e6e588.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573124770.git.hns@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1573124792; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=qGPJFeRp1eB4AfwyXs5VJSlMXRQUTzAbitlIJh64goY=;
 b=epANHgcpRMDqogvJc8pLEFddGU/VGykKozHQAkpXr2Js0SmFMyK3J4Ucye6yyIgNz9
 z4TUFzvFQmMGgNAAIOeCDBKU367gEHU0cKjDfRCKIeBZ4+USlWPlrp09hX2G4P1fNAbW
 SEIEhQdehcYVdAjhWqzZ/33ZW2stJjWSbRERTMUF8aPU5n7qzAfiIIp7URMGSqPpBMWt
 8jJUvw573a31HaiIOqVNtWePfjMPH2btNAj1kN/463KpRhhuZ+bbhMDfIZuhzO8/WLE0
 S9Hc661QTcm2RqYgcGBW3/0prHRkfQzERQZw+1KoCDclnRFjUOYGpXEe/gC6390oUA99
 4ahg==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCBpbnRlcnJ1cHQuCgpTaW5jZSBvbWFwNDQyMC8zMC82MCBhbmQgb21hcDQ0NzAgY29t
ZSB3aXRoIGRpZmZlcmVudCBTR1ggdmFyaWFudHMKd2UgbmVlZCB0byBpbnRyb2R1Y2UgYSBuZXcg
b21hcDQ0NzAuZHRzaS4gSWYgYW4gb21hcDQ0NzAgYm9hcmQKZG9lcyBub3Qgd2FudCB0byB1c2Ug
U0dYIGl0IGlzIG5vIHByb2JsZW0gdG8gc3RpbGwgaW5jbHVkZQpvbWFwNDQ2MC5kdHNpLgoKVGVz
dGVkIG9uIFBhbmRhQm9hcmQgRVMuCgpTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxl
ciA8aG5zQGdvbGRlbGljby5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvb21hcDQuZHRzaSAg
IHwgIDkgKysrKystLS0tCiBhcmNoL2FybS9ib290L2R0cy9vbWFwNDQ3MC5kdHMgfCAxNSArKysr
KysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9vbWFwNDQ3MC5kdHMK
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9vbWFwNC5kdHNpIGIvYXJjaC9hcm0vYm9v
dC9kdHMvb21hcDQuZHRzaQppbmRleCA3Y2M5NWJjMTU5OGIuLjRkNTk1OGZiZTFlZiAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvb21hcDQuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0
cy9vbWFwNC5kdHNpCkBAIC0zNDcsMTAgKzM0NywxMSBAQAogCQkJI3NpemUtY2VsbHMgPSA8MT47
CiAJCQlyYW5nZXMgPSA8MCAweDU2MDAwMDAwIDB4MjAwMDAwMD47CiAKLQkJCS8qCi0JCQkgKiBD
bG9zZWQgc291cmNlIFBvd2VyVlIgZHJpdmVyLCBubyBjaGlsZCBkZXZpY2UKLQkJCSAqIGJpbmRp
bmcgb3IgZHJpdmVyIGluIG1haW5saW5lCi0JCQkgKi8KKwkJCXNneDogaW1nQDAgeworCQkJCWNv
bXBhdGlibGUgPSAidGksb21hcDQtc2d4NTQwLTEyMCIsICJpbWcsc2d4NTQwLTEyMCIsICJpbWcs
c2d4NTQwIjsKKwkJCQlyZWcgPSA8MHgwIDB4MjAwMDAwMD47CS8qIDMyTUIgKi8KKwkJCQlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMjEgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQl9OwogCQl9Owog
CiAJCWRzczogZHNzQDU4MDAwMDAwIHsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL29t
YXA0NDcwLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA0NDcwLmR0cwpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjE5YjU1NDYxMjQwMQotLS0gL2Rldi9udWxsCisr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA0NDcwLmR0cwpAQCAtMCwwICsxLDE1IEBACisvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisvKgorICogRGV2aWNlIFRyZWUg
U291cmNlIGZvciBPTUFQNDQ3MCBTb0MKKyAqCisgKiBDb3B5cmlnaHQgKEMpIDIwMTIgVGV4YXMg
SW5zdHJ1bWVudHMgSW5jb3Jwb3JhdGVkIC0gaHR0cDovL3d3dy50aS5jb20vCisgKgorICogVGhp
cyBmaWxlIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UKKyAqIHZlcnNpb24gMi4gIFRoaXMgcHJvZ3JhbSBpcyBsaWNlbnNlZCAiYXMg
aXMiIHdpdGhvdXQgYW55IHdhcnJhbnR5IG9mIGFueQorICoga2luZCwgd2hldGhlciBleHByZXNz
IG9yIGltcGxpZWQuCisgKi8KKyNpbmNsdWRlICJvbWFwNDQ2MC5kdHNpIgorCismc2d4IHsKKwlj
b21wYXRpYmxlID0gImltZyxzZ3g1NDQtMTEyIiwgImltZyxzZ3g1NDQiLCAidGksb21hcC1vbWFw
NC1zZ3g1NDQtMTEyIjsKK307Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
