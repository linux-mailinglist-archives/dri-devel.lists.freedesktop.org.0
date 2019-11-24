Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CA01089B1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD82F89227;
	Mon, 25 Nov 2019 08:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2728B6E103
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 11:40:43 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAOBeVwEW
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 24 Nov 2019 12:40:31 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v3 5/8] ARM: DTS: omap36xx: add sgx gpu child node
Date: Sun, 24 Nov 2019 12:40:25 +0100
Message-Id: <8469ff540cd03ab5d94d26a28ba2ef51617242ef.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574595642; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=V/olKegmrCAC7GOTukiQ4j+2l5AjTWcogVSnbAhVyfw=;
 b=QoexPZuORGZs4IW70FFzgt00DcsUIF1BNULDARWJt5HHc9XjjHwJnK3bjhvOxj7ffp
 QnNeF4YQoegO5UFabz+4yStujJepMXbUHlVka6tJBO1Duo0OiUbHQXudEa44zvbXOEaM
 BVFBbJ/5eFlGyCL0GLEhacV/yfXIM4pqj3eUTJI4O6o1gZ5pI+5moxWzBmlK9oLz7AL4
 O57qTYsFaDIMEr+kTz9W6RA5wvu2tGjeWzvOTvnHCSg6zg8cU0A4+fjsGmKsCxVHV5Xe
 D+WxVtF3xMv4PjTgedx5X8a6dDRvZaJKYqFcA6X8MVpIp0DhbZ1I9j4xlwismPbozUhi
 iyXQ==
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

YW5kIGFkZCBpbnRlcnJ1cHQuCgpUZXN0ZWQtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNA
Z29sZGVsaWNvLmNvbT4gIyBHVEEwNCwgQmVhZ2xlQm9hcmQgWE0KU2lnbmVkLW9mZi1ieTogSC4g
Tmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgotLS0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL29tYXAzNnh4LmR0c2kgfCAxMSArKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9vbWFwMzZ4eC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvb21hcDM2eHguZHRzaQppbmRleCAx
ZTU1MmYwOGYxMjAuLjg1MWQ0YWJiOTQzYiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
b21hcDM2eHguZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9vbWFwMzZ4eC5kdHNpCkBAIC0x
NDUsNyArMTQ1LDcgQEAKIAkJICogInRpLHN5c2Mtb21hcDQiIHR5cGUgcmVnaXN0ZXIgd2l0aCBq
dXN0IHNpZGxlIGFuZCBtaWRsZSBiaXRzCiAJCSAqIGF2YWlsYWJsZSB3aGlsZSBvbWFwMzR4eCBo
YXMgInRpLHN5c2Mtb21hcDIiIHR5cGUgc3lzY29uZmlnLgogCQkgKi8KLQkJc2d4X21vZHVsZTog
dGFyZ2V0LW1vZHVsZUA1MDAwMDAwMCB7CisJCXRhcmdldC1tb2R1bGVANTAwMDAwMDAgewogCQkJ
Y29tcGF0aWJsZSA9ICJ0aSxzeXNjLW9tYXA0IiwgInRpLHN5c2MiOwogCQkJcmVnID0gPDB4NTAw
MGZlMDAgMHg0PiwKIAkJCSAgICAgIDwweDUwMDBmZTEwIDB4ND47CkBAIC0xNjIsMTAgKzE2Miwx
MSBAQAogCQkJI3NpemUtY2VsbHMgPSA8MT47CiAJCQlyYW5nZXMgPSA8MCAweDUwMDAwMDAwIDB4
MjAwMDAwMD47CiAKLQkJCS8qCi0JCQkgKiBDbG9zZWQgc291cmNlIFBvd2VyVlIgZHJpdmVyLCBu
byBjaGlsZCBkZXZpY2UKLQkJCSAqIGJpbmRpbmcgb3IgZHJpdmVyIGluIG1haW5saW5lCi0JCQkg
Ki8KKwkJCXNneDogZ3B1QDAgeworCQkJCWNvbXBhdGlibGUgPSAidGksb21hcDMtc2d4NTMwLTEy
NSIsICJpbWcsc2d4NTMwLTEyNSIsICJpbWcsc2d4NTMwIjsKKwkJCQlyZWcgPSA8MHgwIDB4MTAw
MDA+OwkvKiA2NGtCICovCisJCQkJaW50ZXJydXB0cyA9IDwyMT47CisJCQl9OwogCQl9OwogCX07
CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
