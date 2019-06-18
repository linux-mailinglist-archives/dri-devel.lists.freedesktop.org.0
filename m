Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA494B2E0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D746E2E0;
	Wed, 19 Jun 2019 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2019 15:24:24 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C91C6E174
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:24:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.62,389,1554735600"; d="scan'208";a="18981207"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 19 Jun 2019 00:19:20 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 89C474006C69;
 Wed, 19 Jun 2019 00:19:16 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/3] Add HDMI support to HiHope RZ/G2M
Date: Tue, 18 Jun 2019 16:18:36 +0100
Message-Id: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
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
 xu_shunji@hoperun.com, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBBbGwsCgp0aGlzIHNlcmllcyBhZGRzIEhETUkgc3VwcG9ydCB0byB0aGUgSGlIb3BlIFJa
L0cyTSBib2FyZC4KClRoYW5rcywKRmFiCgpGYWJyaXppbyBDYXN0cm8gKDMpOgogIGR0LWJpbmRp
bmdzOiBkaXNwbGF5OiByZW5lc2FzOiBBZGQgcjhhNzc0YTEgc3VwcG9ydAogIGFybTY0OiBkdHM6
IHJlbmVzYXM6IHI4YTc3NGExOiBBZGQgSERNSSBlbmNvZGVyIGluc3RhbmNlCiAgYXJtNjQ6IGR0
czogcmVuZXNhczogaGlob3BlLWNvbW1vbjogQWRkIEhETUkgc3VwcG9ydAoKIC4uLi9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3LWhkbWkudHh0ICAgIHwgIDQgKy0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kgICAgIHwgNjIgKysrKysrKysr
KysrKysrKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2kg
ICAgICAgICAgfCAzMiArKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
