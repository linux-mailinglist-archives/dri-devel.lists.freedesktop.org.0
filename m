Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A37FC115
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651B66E1C0;
	Thu, 14 Nov 2019 08:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 702736ED79
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:57:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; d="scan'208";a="31593928"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:16 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id C040E400EE7D;
 Thu, 14 Nov 2019 00:52:11 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 07/13] drm/bridge: lvds-codec: Simplify panel DT node
 localisation
Date: Wed, 13 Nov 2019 15:51:26 +0000
Message-Id: <1573660292-10629-8-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHByb2JlIGZ1bmN0aW9uIG5lZWRzIHRvIGdldCBhaG9sZCBvZiB0aGUgcGFuZWwgZGV2aWNl
IHRyZWUKbm9kZSwgYW5kIGl0IGFjaGlldmVzIHRoYXQgYnkgdXNpbmcgYSBjb21iaW5hdGlvbiBv
ZgpvZl9ncmFwaF9nZXRfcG9ydF9ieV9pZCwgb2ZfZ2V0X2NoaWxkX2J5X25hbWUsIGFuZApvZl9n
cmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50LiBXZSBjYW4gYWNoaWV2ZSB0aGUgc2FtZSBnb2Fs
CmJ5IHJlcGxhY2luZyB0aG9zZSBjYWxscyB3aXRoIGEgY2FsbCB0byBvZl9ncmFwaF9nZXRfcmVt
b3RlX25vZGUKdGhlc2UgZGF5cy4KClNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFi
cml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgoKLS0tCnYzLT52NDoKKiBOZXcgcGF0Y2gKLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYyB8IDIwICsrLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCmluZGV4IGMzMmUxMjUuLjc4NGJiZDMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCkBAIC01Nyw4ICs1Nyw2IEBAIHN0YXRpYyBz
dHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBmdW5jcyA9IHsKIHN0YXRpYyBpbnQgbHZkc19jb2RlY19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBkZXZpY2UgKmRl
diA9ICZwZGV2LT5kZXY7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpwb3J0OwotCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqZW5kcG9pbnQ7CiAJc3RydWN0IGRldmljZV9ub2RlICpwYW5lbF9ub2RlOwogCXN0
cnVjdCBkcm1fcGFuZWwgKnBhbmVsOwogCXN0cnVjdCBsdmRzX2NvZGVjICpsdmRzX2NvZGVjOwpA
QCAtNzksMjMgKzc3LDkgQEAgc3RhdGljIGludCBsdmRzX2NvZGVjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQogCiAJLyogTG9jYXRlIHRoZSBwYW5lbCBEVCBub2RlLiAq
LwotCXBvcnQgPSBvZl9ncmFwaF9nZXRfcG9ydF9ieV9pZChkZXYtPm9mX25vZGUsIDEpOwotCWlm
ICghcG9ydCkgewotCQlkZXZfZGJnKGRldiwgInBvcnQgMSBub3QgZm91bmRcbiIpOwotCQlyZXR1
cm4gLUVOWElPOwotCX0KLQotCWVuZHBvaW50ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUocG9ydCwg
ImVuZHBvaW50Iik7Ci0Jb2Zfbm9kZV9wdXQocG9ydCk7Ci0JaWYgKCFlbmRwb2ludCkgewotCQlk
ZXZfZGJnKGRldiwgIm5vIGVuZHBvaW50IGZvciBwb3J0IDFcbiIpOwotCQlyZXR1cm4gLUVOWElP
OwotCX0KLQotCXBhbmVsX25vZGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KGVu
ZHBvaW50KTsKLQlvZl9ub2RlX3B1dChlbmRwb2ludCk7CisJcGFuZWxfbm9kZSA9IG9mX2dyYXBo
X2dldF9yZW1vdGVfbm9kZShkZXYtPm9mX25vZGUsIDEsIDApOwogCWlmICghcGFuZWxfbm9kZSkg
ewotCQlkZXZfZGJnKGRldiwgIm5vIHJlbW90ZSBlbmRwb2ludCBmb3IgcG9ydCAxXG4iKTsKKwkJ
ZGV2X2RiZyhkZXYsICJwYW5lbCBEVCBub2RlIG5vdCBmb3VuZFxuIik7CiAJCXJldHVybiAtRU5Y
SU87CiAJfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
