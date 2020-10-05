Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABC284728
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A476E332;
	Tue,  6 Oct 2020 07:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5534C8982F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 13:43:12 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C4hcr6mlbz1s5CX;
 Mon,  5 Oct 2020 15:43:08 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C4hcr5fV9z1qqkg;
 Mon,  5 Oct 2020 15:43:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id mMRxvtm3VSYf; Mon,  5 Oct 2020 15:43:05 +0200 (CEST)
X-Auth-Info: gvl2Zt7G+C6HudS7ak0NaK2YB+Ed7vBwmgM/rMOlJKw=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  5 Oct 2020 15:43:05 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/exynos: Init the DSIM PHY in samsung_dsim_enable()
Date: Mon,  5 Oct 2020 15:42:48 +0200
Message-Id: <20201005134250.527153-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY2FzZSB0aGUgUEhZIGlzIG5vdCBpbml0aWFsaXplZCwgZG8gaXQgaW4gc2Ftc3VuZ19kc2lt
X2VuYWJsZSgpLApvdGhlcndpc2UgdGhlIGxpbmsgY29uZmlndXJhdGlvbiByZWdpc3RlcnMgYXJl
IG5vdCBwcm9ncmFtbWVkIGF0IGFsbC4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJl
eEBkZW54LmRlPgpDYzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgpDYzogR3Vp
ZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KQ2M6IEphZWhvb24gQ2h1bmcgPGpoODAuY2h1
bmdAc2Ftc3VuZy5jb20+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4K
Q2M6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KQ2M6IE1pY2hh
ZWwgVHJldHRlciA8bS50cmV0dGVyQHBlbmd1dHJvbml4LmRlPgpDYzogTlhQIExpbnV4IFRlYW0g
PGxpbnV4LWlteEBueHAuY29tPgpDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgpD
YzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5n
LXNvY0B2Z2VyLmtlcm5lbC5vcmcKVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
LS0KTk9URTogVGhpcyBkZXBlbmRzIG9uIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9kcmktZGV2ZWwvbGlzdC8/c2VyaWVzPTM0NzQzOQotLS0KIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc2Ftc3VuZy1kc2ltLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NhbXN1bmctZHNp
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zYW1zdW5nLWRzaW0uYwppbmRleCA2ZDJkOGRj
MDI3ZGUuLmZiZDg3YTc0ZWI5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
YW1zdW5nLWRzaW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NhbXN1bmctZHNpbS5j
CkBAIC0xMjQ0LDYgKzEyNDQsMTMgQEAgc3RhdGljIHZvaWQgc2Ftc3VuZ19kc2ltX2VuYWJsZShz
dHJ1Y3Qgc2Ftc3VuZ19kc2ltICpkc2kpCiAJcG1fcnVudGltZV9nZXRfc3luYyhkc2ktPmRldik7
CiAJZHNpLT5zdGF0ZSB8PSBEU0lNX1NUQVRFX0VOQUJMRUQ7CiAKKwlpZiAoIShkc2ktPnN0YXRl
ICYgRFNJTV9TVEFURV9JTklUSUFMSVpFRCkpIHsKKwkJcmV0ID0gc2Ftc3VuZ19kc2ltX2luaXQo
ZHNpKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybjsKKwkJZHNpLT5zdGF0ZSB8PSBEU0lNX1NUQVRF
X0lOSVRJQUxJWkVEOworCX0KKwogCWlmIChkc2ktPnBhbmVsKSB7CiAJCXJldCA9IGRybV9wYW5l
bF9wcmVwYXJlKGRzaS0+cGFuZWwpOwogCQlpZiAocmV0IDwgMCkKLS0gCjIuMjguMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
