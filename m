Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8556B61613
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7478489C1C;
	Sun,  7 Jul 2019 18:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB4589C1B
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:41:35 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6072D334;
 Sun,  7 Jul 2019 20:41:18 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 60/60] drm/omap: dss: Remove unused
 omapdss_of_find_connected_device() function
Date: Sun,  7 Jul 2019 21:19:37 +0300
Message-Id: <20190707181937.6250-57-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562524894;
 bh=wJQn9i1ccLQFznv55WqRsEuedYi9iqp+Zlue0A3DJwA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MCkDngBLDWcaevGXgoLQKQYHHmB6VUemBILvzfsWIdpFUPGyYXLsX5Um2vQQX+ptK
 lFYOBj/49fPPWVhoWiEfctLKzOb9sP4AsaKtk7pXr3mVmEYkjNapV1/ojxxZNclEtv
 /bYCVMUVJiA7VrYou0LpzKXDRN7CzoVX6XFeApNQ=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9tYXBkc3Nfb2ZfZmluZF9jb25uZWN0ZWRfZGV2aWNlKCkgZnVuY3Rpb24gaXNuJ3QgdXNl
ZCBhbnltb3JlLApyZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vZHNzL01ha2VmaWxlICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
ZHNzLW9mLmMgIHwgMjggLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3Mvb21hcGRzcy5oIHwgIDMgLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAzMiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9kc3MvZHNzLW9mLmMKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3MvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvTWFrZWZp
bGUKaW5kZXggOTA0MTAxYzVlNzlkLi4zOWU4M2Q2ZmNiMDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvTWFrZWZpbGUKQEAgLTIsNyArMiw3IEBACiBvYmotJChDT05GSUdfT01BUDJfRFNTX0lO
SVQpICs9IG9tYXBkc3MtYm9vdC1pbml0Lm8KIAogb2JqLSQoQ09ORklHX09NQVBfRFNTX0JBU0Up
ICs9IG9tYXBkc3MtYmFzZS5vCi1vbWFwZHNzLWJhc2UteSA6PSBiYXNlLm8gZGlzcGxheS5vIGRz
cy1vZi5vIG91dHB1dC5vCitvbWFwZHNzLWJhc2UteSA6PSBiYXNlLm8gZGlzcGxheS5vIG91dHB1
dC5vCiAKIG9iai0kKENPTkZJR19PTUFQMl9EU1MpICs9IG9tYXBkc3MubwogIyBDb3JlIERTUyBm
aWxlcwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy1vZi5jIGIv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy1vZi5jCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCBiNzk4MWYzYjgwYWQuLjAwMDAwMDAwMDAwMAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3MvZHNzLW9mLmMKKysrIC9kZXYvbnVsbApAQCAtMSwyOCArMCwwIEBACi0v
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Ci0vKgotICogQ29weXJpZ2h0
IChDKSAyMDEzIFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZCAtIGh0dHA6Ly93d3cudGku
Y29tLwotICogQXV0aG9yOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgot
ICovCi0KLSNpbmNsdWRlIDxsaW51eC9lcnIuaD4KLSNpbmNsdWRlIDxsaW51eC9vZi5oPgotI2lu
Y2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Ci0KLSNpbmNsdWRlICJvbWFwZHNzLmgiCi0KLXN0cnVj
dCBvbWFwX2Rzc19kZXZpY2UgKgotb21hcGRzc19vZl9maW5kX2Nvbm5lY3RlZF9kZXZpY2Uoc3Ry
dWN0IGRldmljZV9ub2RlICpub2RlLCB1bnNpZ25lZCBpbnQgcG9ydCkKLXsKLQlzdHJ1Y3QgZGV2
aWNlX25vZGUgKnJlbW90ZV9ub2RlOwotCXN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldjsK
LQotCXJlbW90ZV9ub2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9ub2RlKG5vZGUsIHBvcnQsIDAp
OwotCWlmICghcmVtb3RlX25vZGUpCi0JCXJldHVybiBOVUxMOwotCi0JZHNzZGV2ID0gb21hcGRz
c19maW5kX2RldmljZV9ieV9ub2RlKHJlbW90ZV9ub2RlKTsKLQlvZl9ub2RlX3B1dChyZW1vdGVf
bm9kZSk7Ci0KLQlyZXR1cm4gZHNzZGV2ID8gZHNzZGV2IDogRVJSX1BUUigtRVBST0JFX0RFRkVS
KTsKLX0KLUVYUE9SVF9TWU1CT0xfR1BMKG9tYXBkc3Nfb2ZfZmluZF9jb25uZWN0ZWRfZGV2aWNl
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmggYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy5oCmluZGV4IDc0NjY5NTNkZTQ2ZC4u
NjI2NDJmYmMyY2U5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21h
cGRzcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgKQEAgLTQ4
Myw5ICs0ODMsNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgb21hcGRzc19kZXZpY2VfaXNfZW5hYmxl
ZChzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYpCiAJcmV0dXJuIGRzc2Rldi0+c3RhdGUg
PT0gT01BUF9EU1NfRElTUExBWV9BQ1RJVkU7CiB9CiAKLXN0cnVjdCBvbWFwX2Rzc19kZXZpY2Ug
Kgotb21hcGRzc19vZl9maW5kX2Nvbm5lY3RlZF9kZXZpY2Uoc3RydWN0IGRldmljZV9ub2RlICpu
b2RlLCB1bnNpZ25lZCBpbnQgcG9ydCk7Ci0KIGVudW0gZHNzX3dyaXRlYmFja19jaGFubmVsIHsK
IAlEU1NfV0JfTENEMV9NR1IgPQkwLAogCURTU19XQl9MQ0QyX01HUiA9CTEsCi0tIApSZWdhcmRz
LAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
