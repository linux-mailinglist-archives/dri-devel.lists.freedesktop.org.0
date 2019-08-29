Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E3A325A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663726E287;
	Fri, 30 Aug 2019 08:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D83D6E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:38:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; d="scan'208";a="25249611"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 20:38:40 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2C7A94002C30;
 Thu, 29 Aug 2019 20:38:35 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 0/2] Add LVDS panel support to HiHope RZ/G2M
Date: Thu, 29 Aug 2019 12:38:31 +0100
Message-Id: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
 ebiharaml@si-linux.co.jp, xu_shunji@hoperun.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBBbGwsCgp0aGUgSGlIb3BlIFJaL0cyTSBpcyBhZHZlcnRpc2VkIGFzIHN1cHBvcnRpbmcg
cGFuZWwgaWRrLTExMTB3ciBmcm9tCkFkdmFudGVjaCwgYnV0IHRoZSBwYW5lbCBkb2Vzbid0IGNv
bWUgd2l0aCB0aGUgYm9hcmQsIGl0IGhhcyB0byBwdXJjaGFzZWQKc2VwYXJhdGV5LCB0aGVyZWZv
cmUgdGhpcyBzZXJpZXMgYWRkcyBwYW5lbCBzdXBwb3J0IHRvIGEgbmV3IERULgoKdjEtPnYyCiog
Zml4ZWQgYSBzcGFjZSBhY2NvcmRpbmcgdG8gR2VlcnQncyBmZWVkYmFjay4KClRoYW5rcywKRmFi
CgpGYWJyaXppbyBDYXN0cm8gKDIpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQgaWRrLTEx
MTB3ciBiaW5kaW5nCiAgYXJtNjQ6IGR0czogcmVuZXNhczogQWRkIEhpSG9wZSBSWi9HMk0gYm9h
cmQgd2l0aCBpZGstMTExMHdyIGRpc3BsYXkKCiAuLi4vZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gs
aWRrLTExMTB3ci55YW1sICAgICAgICB8IDY5ICsrKysrKysrKysrKysrKysrCiBhcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAxICsKIC4uLi9yOGE3
NzRhMS1oaWhvcGUtcnpnMm0tZXgtaWRrLTExMTB3ci5kdHMgICAgICAgIHwgODYgKysrKysrKysr
KysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNTYgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL2FkdmFudGVjaCxpZGstMTExMHdyLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEtaGlob3BlLXJ6ZzJtLWV4LWlkay0xMTEwd3Iu
ZHRzCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
