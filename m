Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B399531E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066416E52C;
	Tue, 20 Aug 2019 01:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EA36E4DD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:17:42 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A91449C5;
 Tue, 20 Aug 2019 03:17:38 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/50] drm/bridge: simple-bridge: Add support for the TI
 OP362
Date: Tue, 20 Aug 2019 04:16:41 +0300
Message-Id: <20190820011721.30136-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263859;
 bh=mOOGfP8oZRKCyM6B4iceZUXsgJ1BDCcODLkbcUDNj8U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HAbuQw5AlcAuaDJMW34FbsliEt2s8lunf6UKe5VMgOpMR264DE9s+YPI90vsQnFKX
 8F0+aK8BWUf++MD8jTbfmmyToXFUjHg0AOTTeLUtHKhej8KluoWhXvxSnNskDYa9lF
 g+Ro1Q9hnh4OjZCKDk3rM3FCvse7o0cb2IdE8UKo=
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

VGhlIFRJIE9QMzYyIGlzIGFuIGFuYWxvZyB2aWRlbyBhbXBsaWZpZXIgY29udHJvbGxlZCB0aHJv
dWdoIGEgR1BJTy4gQWRkCnN1cHBvcnQgZm9yIGl0IHRvIHRoZSBzaW1wbGUtYnJpZGdlIGRyaXZl
ci4KClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMgfCA1ICsr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NpbXBsZS1icmlkZ2UuYwppbmRleCAzZTUwMzE4MzMzNjguLjUyNjI2ZTJkZTkwZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMKQEAgLTMwMiw2ICszMDIsMTEgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc2ltcGxlX2JyaWRnZV9tYXRjaFtdID0gewog
CQkJLnRpbWluZ3MgPSAmZGVmYXVsdF9icmlkZ2VfdGltaW5ncywKIAkJCS5jb25uZWN0b3JfdHlw
ZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9WR0EsCiAJCX0sCisJfSwgeworCQkuY29tcGF0aWJsZSA9
ICJ0aSxvcGEzNjIiLAorCQkuZGF0YSA9ICYoY29uc3Qgc3RydWN0IHNpbXBsZV9icmlkZ2VfaW5m
bykgeworCQkJLmNvbm5lY3Rvcl90eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0NvbXBvc2l0ZSwK
KwkJfSwKIAl9LCB7CiAJCS5jb21wYXRpYmxlID0gInRpLHRoczgxMzUiLAogCQkuZGF0YSA9ICYo
Y29uc3Qgc3RydWN0IHNpbXBsZV9icmlkZ2VfaW5mbykgewotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
