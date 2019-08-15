Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E59116E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571B26E9FB;
	Sat, 17 Aug 2019 15:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E19A16E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:05:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,389,1559487600"; d="scan'208";a="23867492"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 15 Aug 2019 20:05:28 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 07C40417763E;
 Thu, 15 Aug 2019 20:05:23 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 8/9] drm/panel: lvds: Add support for the IDK-2121WR
Date: Thu, 15 Aug 2019 12:04:32 +0100
Message-Id: <1565867073-24746-9-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIElESy0yMTIxV1IgZnJvbSBBZHZhbnRlY2ggaXMgYSBkdWFsLUxWRFMgZGlzcGxheS4KClNp
Z25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMu
Y29tPgoKLS0tCnYxLT52MjoKKiBuZXcgcGF0Y2gKCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtbHZkcy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jCmluZGV4IDFlYzU3ZDAuLjJjZDQxNzU3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKQEAgLTIyLDYgKzIyLDcgQEAKIAogI2luY2x1ZGUg
PGRybS9kcm1fY3J0Yy5oPgogI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4KKyNpbmNsdWRlIDxk
cm0vZHJtX3RpbWluZ3MuaD4KIAogc3RydWN0IHBhbmVsX2x2ZHMgewogCXN0cnVjdCBkcm1fcGFu
ZWwgcGFuZWw7CkBAIC0yNTksNiArMjYwLDcgQEAgc3RhdGljIGludCBwYW5lbF9sdmRzX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJLyogUmVnaXN0ZXIgdGhlIHBhbmVsLiAq
LwogCWRybV9wYW5lbF9pbml0KCZsdmRzLT5wYW5lbCk7CiAJbHZkcy0+cGFuZWwuZGV2ID0gbHZk
cy0+ZGV2OworCWx2ZHMtPnBhbmVsLnRpbWluZ3MgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEo
bHZkcy0+ZGV2KTsKIAlsdmRzLT5wYW5lbC5mdW5jcyA9ICZwYW5lbF9sdmRzX2Z1bmNzOwogCiAJ
cmV0ID0gZHJtX3BhbmVsX2FkZCgmbHZkcy0+cGFuZWwpOwpAQCAtMjg3LDcgKzI4OSwxMyBAQCBz
dGF0aWMgaW50IHBhbmVsX2x2ZHNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3RpbWluZ3MgYWR2YW50
ZWNoX2lka18yMTIxd3IgPSB7CisJLmR1YWxfbGluayA9IHRydWUsCisJLmxpbmtfZmxhZ3MgPSBE
Uk1fTElOS19EVUFMX0xWRFNfT0REX0VWRU4sCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBwYW5lbF9sdmRzX29mX3RhYmxlW10gPSB7CisJeyAuY29tcGF0aWJsZSA9ICJh
ZHZhbnRlY2gsaWRrLTIxMjF3ciIsIC5kYXRhID0gJmFkdmFudGVjaF9pZGtfMjEyMXdyfSwKIAl7
IC5jb21wYXRpYmxlID0gInBhbmVsLWx2ZHMiLCB9LAogCXsgLyogU2VudGluZWwgKi8gfSwKIH07
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
