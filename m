Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462321089C2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3733A89F5F;
	Mon, 25 Nov 2019 08:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7570889EA3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 11:40:44 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAOBeWwEX
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 24 Nov 2019 12:40:32 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v3 6/8] ARM: DTS: omap4: add sgx gpu child node
Date: Sun, 24 Nov 2019 12:40:26 +0100
Message-Id: <920e425c2dbded7656625f762d5a66b439e9c631.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574595643; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=+5b8fIkpFsaLwodZ+mcz7Io6ehHFiXtGp4PSRsaWoow=;
 b=lpNVX3ecF2W3t1dd86gZkWFy5ZgcbDjSOnT+wl8xGWUa2y5nOCeJy8E83asuyV2BiF
 YxWILDK9xIMhAm6sucCp+21pi824d84YiJLPFj1E5Sg85+qd/mUpclHu8lXuwu5jdZjV
 FOXeiTvv3/azB41YpdkXiAsIx/OT1/VgCRgDTqMrwdoo0gXXsQTRALnW3d+Jd9MpT3hK
 YeQHo+ALkJHI9kIbNi3/A8Mi1hG1pFBPHZZM30WSIXenVZlAk7LFhhm+Y8j+NAfsW+fu
 hfz2zrx8N/FnrUWMHIwabQe3XpaKPiDK17c2qU8uX6GD2DM99yyBWkXiQjLmVj3X9wz3
 QjTg==
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
dGVkLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+ICMgUGFuZGFC
b2FyZCBFUwpTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGlj
by5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvb21hcDQuZHRzaSAgIHwgIDkgKysrKystLS0t
CiBhcmNoL2FybS9ib290L2R0cy9vbWFwNDQ3MC5kdHMgfCAxNSArKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9vbWFwNDQ3MC5kdHMKCmRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9vbWFwNC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvb21hcDQuZHRz
aQppbmRleCA3Y2M5NWJjMTU5OGIuLjRkNTk1OGZiZTFlZiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvb21hcDQuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9vbWFwNC5kdHNpCkBA
IC0zNDcsMTAgKzM0NywxMSBAQAogCQkJI3NpemUtY2VsbHMgPSA8MT47CiAJCQlyYW5nZXMgPSA8
MCAweDU2MDAwMDAwIDB4MjAwMDAwMD47CiAKLQkJCS8qCi0JCQkgKiBDbG9zZWQgc291cmNlIFBv
d2VyVlIgZHJpdmVyLCBubyBjaGlsZCBkZXZpY2UKLQkJCSAqIGJpbmRpbmcgb3IgZHJpdmVyIGlu
IG1haW5saW5lCi0JCQkgKi8KKwkJCXNneDogaW1nQDAgeworCQkJCWNvbXBhdGlibGUgPSAidGks
b21hcDQtc2d4NTQwLTEyMCIsICJpbWcsc2d4NTQwLTEyMCIsICJpbWcsc2d4NTQwIjsKKwkJCQly
ZWcgPSA8MHgwIDB4MjAwMDAwMD47CS8qIDMyTUIgKi8KKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMjEgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQl9OwogCQl9OwogCiAJCWRzczogZHNzQDU4
MDAwMDAwIHsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA0NDcwLmR0cyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL29tYXA0NDcwLmR0cwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLjE5YjU1NDYxMjQwMQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL29tYXA0NDcwLmR0cwpAQCAtMCwwICsxLDE1IEBACisvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vbmx5CisvKgorICogRGV2aWNlIFRyZWUgU291cmNlIGZvciBPTUFQ
NDQ3MCBTb0MKKyAqCisgKiBDb3B5cmlnaHQgKEMpIDIwMTIgVGV4YXMgSW5zdHJ1bWVudHMgSW5j
b3Jwb3JhdGVkIC0gaHR0cDovL3d3dy50aS5jb20vCisgKgorICogVGhpcyBmaWxlIGlzIGxpY2Vu
c2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyAq
IHZlcnNpb24gMi4gIFRoaXMgcHJvZ3JhbSBpcyBsaWNlbnNlZCAiYXMgaXMiIHdpdGhvdXQgYW55
IHdhcnJhbnR5IG9mIGFueQorICoga2luZCwgd2hldGhlciBleHByZXNzIG9yIGltcGxpZWQuCisg
Ki8KKyNpbmNsdWRlICJvbWFwNDQ2MC5kdHNpIgorCismc2d4IHsKKwljb21wYXRpYmxlID0gImlt
ZyxzZ3g1NDQtMTEyIiwgImltZyxzZ3g1NDQiLCAidGksb21hcC1vbWFwNC1zZ3g1NDQtMTEyIjsK
K307Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
