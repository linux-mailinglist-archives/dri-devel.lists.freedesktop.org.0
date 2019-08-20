Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA095338
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED946E581;
	Tue, 20 Aug 2019 01:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4743B6E583
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:18:12 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B74A7E23;
 Tue, 20 Aug 2019 03:18:04 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 45/50] drm/omap: sdi: Sort includes alphabetically
Date: Tue, 20 Aug 2019 04:17:16 +0300
Message-Id: <20190820011721.30136-46-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263885;
 bh=Rr/GOow2nHIO0DjwsBBuOUd0ovKiM8Nt04CBgVs+cfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nl3rOVPLn8YM9zRaY5rBvKHbuZuY55crD/pGk5jfCH8a40/5xEIIVzAXnRT+eauI9
 zsCkbvAXPMIFd+W/8h3DXSpcyDvHB4bwT6Uwduu6XecbwsrTdOlargtukCEuLrJ7w8
 1MHYF7N3W/Na73OM+CmBaoBWR31YPxb1Av1KJqQ8=
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
c29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9zZGkuYyB8IDgg
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL3NkaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL3NkaS5jCmluZGV4IDExYWEyZjcxMmZmNC4uN2RlZGZjYzg2
OTIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvc2RpLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL3NkaS5jCkBAIC02LDE3ICs2LDE3IEBACiAKICNk
ZWZpbmUgRFNTX1NVQlNZU19OQU1FICJTREkiCiAKLSNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4K
ICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgotI2luY2x1
ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5o
PgorI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgorI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9y
L2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+Ci0jaW5jbHVkZSA8bGludXgv
b2YuaD4KIAotI2luY2x1ZGUgIm9tYXBkc3MuaCIKICNpbmNsdWRlICJkc3MuaCIKKyNpbmNsdWRl
ICJvbWFwZHNzLmgiCiAKIHN0cnVjdCBzZGlfZGV2aWNlIHsKIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2OwotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
