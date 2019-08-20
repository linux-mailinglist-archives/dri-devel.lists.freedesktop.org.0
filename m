Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8001295314
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0261E6E512;
	Tue, 20 Aug 2019 01:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8020D6E513
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:17:47 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74CC4E23;
 Tue, 20 Aug 2019 03:17:42 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/50] drm/bridge: tfp410: Allow operation without
 drm_connector
Date: Tue, 20 Aug 2019 04:16:47 +0300
Message-Id: <20190820011721.30136-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263862;
 bh=/VP8xJhDj/aGc0jm9eAoi16+RcWySuk4G99brDjd8rk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G3gFQ4cwcTQ6IlLRJ0dclAGNWJiBO2e5pK+8kHw2A0uVwMNYZjLjNZthfaEPjueYW
 YYuR7Ey8GioCRTbhl024m3zvJGfIq4itpRUVk3bsv3SqCoKcnL7oxsflYnMNnWQi7j
 YVnW7rmPu1sno/uBJBXaMDzow2IbwWGOsDgQhU+Y=
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

VGhlIHRmcDQxMCBkcml2ZXIgY2FuIG9wZXJhdGUgYXMgcGFydCBvZiBhIHBpcGVsaW5lIHdoZXJl
IHRoZQpkcm1fY29ubmVjdG9yIGlzIGNyZWF0ZWQgYnkgdGhlIGRpc3BsYXkgY29udHJvbGxlci4g
RW5hYmxlIHRoaXMgbW9kZSBvZgpvcGVyYXRpb24gYnkgc2tpcHBpbmcgY3JlYXRpb24gb2YgYSBk
cm1fY29ubmVjdG9yIGludGVybmFsbHkuCgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90aS10ZnA0MTAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
dGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCmluZGV4IDY1NjUx
YWU2YzU1My4uMTZjYzhhYmUzMjYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RpLXRmcDQxMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKQEAg
LTEzMyw3ICsxMzMsNyBAQCBzdGF0aWMgaW50IHRmcDQxMF9hdHRhY2goc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSwKIAkJcmV0dXJuIHJldDsKIAogCWlmIChmbGFncyAmIERSTV9CUklER0VfQVRU
QUNIX05PX0NPTk5FQ1RPUikKLQkJcmV0dXJuIC1FSU5WQUw7CisJCXJldHVybiAwOwogCiAJaWYg
KCFicmlkZ2UtPmVuY29kZXIpIHsKIAkJZGV2X2VycihkdmktPmRldiwgIk1pc3NpbmcgZW5jb2Rl
clxuIik7Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
