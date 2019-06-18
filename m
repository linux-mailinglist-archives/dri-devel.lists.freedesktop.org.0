Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B78ED4B2BA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817786E2D8;
	Wed, 19 Jun 2019 07:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 841E46E174
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:24:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.62,389,1554735600"; d="scan'208";a="18772444"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 19 Jun 2019 00:19:25 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3AD974006A86;
 Wed, 19 Jun 2019 00:19:22 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/3] dt-bindings: display: renesas: Add r8a774a1 support
Date: Tue, 18 Jun 2019 16:18:37 +0100
Message-Id: <1560871119-16570-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
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
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgUlovRzJNIChSOEE3NzRBMSkgU29DIGJpbmRpbmdzLgoKU2lnbmVkLW9mZi1ieTog
RmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3
LWhkbWkudHh0IHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxkdy1oZG1pLnR4dAppbmRleCBh
NDFkMjgwLi5kYjY4MDQxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxkdy1oZG1pLnR4dAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxkdy1oZG1pLnR4
dApAQCAtMTIsMTAgKzEyLDEyIEBAIGZvbGxvd2luZyBkZXZpY2Utc3BlY2lmaWMgcHJvcGVydGll
cy4KIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAKIC0gY29tcGF0aWJsZSA6IFNoYWxsIGNvbnRhaW4g
b25lIG9yIG1vcmUgb2YKKyAgLSAicmVuZXNhcyxyOGE3NzRhMS1oZG1pIiBmb3IgUjhBNzc0QTEg
KFJaL0cyTSkgY29tcGF0aWJsZSBIRE1JIFRYCiAgIC0gInJlbmVzYXMscjhhNzc5NS1oZG1pIiBm
b3IgUjhBNzc5NSAoUi1DYXIgSDMpIGNvbXBhdGlibGUgSERNSSBUWAogICAtICJyZW5lc2FzLHI4
YTc3OTYtaGRtaSIgZm9yIFI4QTc3OTYgKFItQ2FyIE0zLVcpIGNvbXBhdGlibGUgSERNSSBUWAog
ICAtICJyZW5lc2FzLHI4YTc3OTY1LWhkbWkiIGZvciBSOEE3Nzk2NSAoUi1DYXIgTTMtTikgY29t
cGF0aWJsZSBIRE1JIFRYCi0gIC0gInJlbmVzYXMscmNhci1nZW4zLWhkbWkiIGZvciB0aGUgZ2Vu
ZXJpYyBSLUNhciBHZW4zIGNvbXBhdGlibGUgSERNSSBUWAorICAtICJyZW5lc2FzLHJjYXItZ2Vu
My1oZG1pIiBmb3IgdGhlIGdlbmVyaWMgUi1DYXIgR2VuMyBhbmQgUlovRzIgY29tcGF0aWJsZQor
CQkJICAgICBIRE1JIFRYCiAKICAgICBXaGVuIGNvbXBhdGlibGUgd2l0aCBnZW5lcmljIHZlcnNp
b25zLCBub2RlcyBtdXN0IGxpc3QgdGhlIFNvQy1zcGVjaWZpYwogICAgIHZlcnNpb24gY29ycmVz
cG9uZGluZyB0byB0aGUgcGxhdGZvcm0gZmlyc3QsIGZvbGxvd2VkIGJ5IHRoZQotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
