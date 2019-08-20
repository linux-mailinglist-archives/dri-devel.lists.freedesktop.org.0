Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7395336
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245A6E586;
	Tue, 20 Aug 2019 01:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349FC6E57B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:18:09 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42A18510;
 Tue, 20 Aug 2019 03:18:02 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 41/50] drm/omap: dpi: Sort includes alphabetically
Date: Tue, 20 Aug 2019 04:17:12 +0300
Message-Id: <20190820011721.30136-42-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263882;
 bh=+nnFo0I1BnAQTHnq3nX3lyB+OL9ImjEGEytnnaO4KT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G7ybGAOeNBGJi4VdrlJ0u36VD1OW+HWWzuDLTwntGE0pSz3pR17J4qfPeWByKkiN+
 mNO0mxuiLcaVKFLXOYuNHpoLBKz0hvi8YBYFh3hb49qY5D1wArIRJ3rLyCDu915i25
 LoTmX0b/JhPTohKwxvhmJkGD3dUrvLvLLzTobPA8=
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyBpdCBlYXNpZXIgdG8gcXVpY2tseSBsb2NhdGUgZHVwbGljYXRlIGluY2x1ZGVz
LgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kcGkuYyB8IDEw
ICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RwaS5jIGIvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RwaS5jCmluZGV4IDJkMGViNWZjYmI1Yi4uZjgzNTQy
NzFjZTZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHBpLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RwaS5jCkBAIC05LDIwICs5LDIwIEBACiAK
ICNkZWZpbmUgRFNTX1NVQlNZU19OQU1FICJEUEkiCiAKLSNpbmNsdWRlIDxsaW51eC9rZXJuZWwu
aD4KKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgotI2lu
Y2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgogI2luY2x1ZGUg
PGxpbnV4L2Vycm5vLmg+CisjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+CisjaW5jbHVkZSA8bGlu
dXgva2VybmVsLmg+CisjaW5jbHVkZSA8bGludXgvb2YuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KICNp
bmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KLSNpbmNsdWRlIDxsaW51eC9vZi5oPgotI2luY2x1ZGUg
PGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxpbnV4L3N5c19zb2MuaD4KIAotI2luY2x1ZGUgIm9t
YXBkc3MuaCIKICNpbmNsdWRlICJkc3MuaCIKKyNpbmNsdWRlICJvbWFwZHNzLmgiCiAKIHN0cnVj
dCBkcGlfZGF0YSB7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldjsKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
