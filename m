Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76638E6E05
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8366E444;
	Mon, 28 Oct 2019 08:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7266E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 11:13:47 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by laurent.telenet-ops.be with bizsmtp
 id HnDj210095USYZQ01nDj2M; Fri, 25 Oct 2019 13:13:45 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNxSN-0003rD-Ob; Fri, 25 Oct 2019 13:08:35 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNvpi-0006IC-KD; Fri, 25 Oct 2019 11:24:34 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/bridge: ti-tfp410: Update
 drm_connector_init_with_ddc() error message
Date: Fri, 25 Oct 2019 11:24:33 +0200
Message-Id: <20191025092433.24138-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvZGUgd2FzIGNoYW5nZWQgdG8gY2FsbCBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMo
KSBpbnN0ZWFkIG9mCmRybV9jb25uZWN0b3JfaW5pdCgpLCBidXQgdGhlIGNvcnJlc3BvbmRpbmcg
ZXJyb3IgbWVzc2FnZSB3YXMgbm90CnVwZGF0ZWQuCgpGaXhlczogY2ZiNDQ0NTUyOTI2OTg5ZiAo
ImRybS9icmlkZ2U6IHRpLXRmcDQxMDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Ig
c3lzZnMgZGlyZWN0b3J5IikKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4KUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ry
b25nQGJheWxpYnJlLmNvbT4KLS0tCnYyOgogIC0gQWRkIFJldmlld2VkLWJ5LgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGktdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5j
CmluZGV4IGFhMzE5OGRjOTkwM2NlZmIuLjVjYTRjMDQxN2MxODZlNmUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS10ZnA0MTAuYwpAQCAtMTQwLDcgKzE0MCw4IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2F0
dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCQkJCQkgIGR2aS0+Y29ubmVjdG9yX3R5
cGUsCiAJCQkJCSAgZHZpLT5kZGMpOwogCWlmIChyZXQpIHsKLQkJZGV2X2VycihkdmktPmRldiwg
ImRybV9jb25uZWN0b3JfaW5pdCgpIGZhaWxlZDogJWRcbiIsIHJldCk7CisJCWRldl9lcnIoZHZp
LT5kZXYsICJkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoKSBmYWlsZWQ6ICVkXG4iLAorCQkJ
cmV0KTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
