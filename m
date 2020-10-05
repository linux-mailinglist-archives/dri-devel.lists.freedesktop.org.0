Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAEA284740
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593BE6E3FE;
	Tue,  6 Oct 2020 07:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E638982F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 13:43:13 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C4hcv37VRz1qwH0;
 Mon,  5 Oct 2020 15:43:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C4hcv1yB8z1sM8b;
 Mon,  5 Oct 2020 15:43:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id PG0PrIoyy2gB; Mon,  5 Oct 2020 15:43:09 +0200 (CEST)
X-Auth-Info: BsZ4AqTfggJeQpoXk5zZ5LXVL4o2PxktgvP200i8NSE=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  5 Oct 2020 15:43:09 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/exynos: Scale the DSIM PHY HFP/HBP/HSA to lanes and
 bpp
Date: Mon,  5 Oct 2020 15:42:49 +0200
Message-Id: <20201005134250.527153-2-marex@denx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005134250.527153-1-marex@denx.de>
References: <20201005134250.527153-1-marex@denx.de>
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

VGhlIHZhbHVlIHByb2dyYW1tZWQgaW50byBob3Jpem9udGFsIHBvcmNoIGFuZCBzeW5jIHJlZ2lz
dGVycyBtdXN0IGJlCnNjYWxlZCB0byB0aGUgY29ycmVjdCBudW1iZXIgb2YgRFNJIGxhbmVzIGFu
ZCBicHAsIG1ha2UgaXQgc28uCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4KQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KQ2M6IEd1aWRvIEfD
vG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CkNjOiBKYWVob29uIENodW5nIDxqaDgwLmNodW5nQHNh
bXN1bmcuY29tPgpDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CkNjOiBN
YXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CkNjOiBNaWNoYWVsIFRy
ZXR0ZXIgPG0udHJldHRlckBwZW5ndXRyb25peC5kZT4KQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51
eC1pbXhAbnhwLmNvbT4KQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KQ2M6IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtc2Ftc3VuZy1zb2NA
dmdlci5rZXJuZWwub3JnClRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tCk5P
VEU6IFRoaXMgZGVwZW5kcyBvbiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
ZHJpLWRldmVsL2xpc3QvP3Nlcmllcz0zNDc0MzkKLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NhbXN1bmctZHNpbS5jIHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zYW1zdW5nLWRzaW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMK
aW5kZXggZmJkODdhNzRlYjlmLi40MmI0OTU0NmRkMDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
YW1zdW5nLWRzaW0uYwpAQCAtNzQwLDIwICs3NDAsMjMgQEAgc3RhdGljIHZvaWQgc2Ftc3VuZ19k
c2ltX3NldF9kaXNwbGF5X21vZGUoc3RydWN0IHNhbXN1bmdfZHNpbSAqZHNpKQogewogCXN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlICptID0gJmRzaS0+bW9kZTsKIAl1bnNpZ25lZCBpbnQgbnVtX2Jp
dHNfcmVzb2wgPSBkc2ktPmRyaXZlcl9kYXRhLT5udW1fYml0c19yZXNvbDsKKwlpbnQgYnBwOwog
CXUzMiByZWc7CiAKIAlpZiAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFTykg
eworCQlicHAgPSBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBwKGRzaS0+Zm9ybWF0KSAvIDg7
CisKIAkJcmVnID0gRFNJTV9DTURfQUxMT1coMHhmKQogCQkJfCBEU0lNX1NUQUJMRV9WRlAobS0+
dnN5bmNfc3RhcnQgLSBtLT52ZGlzcGxheSkKIAkJCXwgRFNJTV9NQUlOX1ZCUChtLT52dG90YWwg
LSBtLT52c3luY19lbmQpOwogCQlzYW1zdW5nX2RzaW1fd3JpdGUoZHNpLCBEU0lNX01WUE9SQ0hf
UkVHLCByZWcpOwogCi0JCXJlZyA9IERTSU1fTUFJTl9IRlAobS0+aHN5bmNfc3RhcnQgLSBtLT5o
ZGlzcGxheSkKLQkJCXwgRFNJTV9NQUlOX0hCUChtLT5odG90YWwgLSBtLT5oc3luY19lbmQpOwor
CQlyZWcgPSBEU0lNX01BSU5fSEZQKChtLT5oc3luY19zdGFydCAtIG0tPmhkaXNwbGF5KSAqIGJw
cCAvIGRzaS0+bGFuZXMpCisJCQl8IERTSU1fTUFJTl9IQlAoKG0tPmh0b3RhbCAtIG0tPmhzeW5j
X2VuZCkgKiBicHAgLyBkc2ktPmxhbmVzKTsKIAkJc2Ftc3VuZ19kc2ltX3dyaXRlKGRzaSwgRFNJ
TV9NSFBPUkNIX1JFRywgcmVnKTsKIAogCQlyZWcgPSBEU0lNX01BSU5fVlNBKG0tPnZzeW5jX2Vu
ZCAtIG0tPnZzeW5jX3N0YXJ0KQotCQkJfCBEU0lNX01BSU5fSFNBKG0tPmhzeW5jX2VuZCAtIG0t
PmhzeW5jX3N0YXJ0KTsKKwkJCXwgRFNJTV9NQUlOX0hTQSgobS0+aHN5bmNfZW5kIC0gbS0+aHN5
bmNfc3RhcnQpICogYnBwIC8gZHNpLT5sYW5lcyk7CiAJCXNhbXN1bmdfZHNpbV93cml0ZShkc2ks
IERTSU1fTVNZTkNfUkVHLCByZWcpOwogCX0KIAlyZWcgPSAgRFNJTV9NQUlOX0hSRVNPTChtLT5o
ZGlzcGxheSwgbnVtX2JpdHNfcmVzb2wpIHwKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
