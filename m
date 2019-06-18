Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322744B29D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258066E2BC;
	Wed, 19 Jun 2019 07:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA206E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:30:48 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 49941200DD0;
 Tue, 18 Jun 2019 15:30:47 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C5A62003D7;
 Tue, 18 Jun 2019 15:30:47 +0200 (CEST)
Received: from fsr-ub1664-046.ea.freescale.net
 (fsr-ub1664-046.ea.freescale.net [10.171.96.34])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 27FCB20631;
 Tue, 18 Jun 2019 15:30:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id E955255B1;
 Tue, 18 Jun 2019 16:30:46 +0300 (EEST)
Received: from fsr-ub1664-046.ea.freescale.net ([127.0.0.1])
 by localhost (fsr-ub1664-046.ea.freescale.net [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id WyWO7bCRI6C1; Tue, 18 Jun 2019 16:30:46 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id 81B0C55B3;
 Tue, 18 Jun 2019 16:30:46 +0300 (EEST)
X-Virus-Scanned: amavisd-new at ea.freescale.net
Received: from fsr-ub1664-046.ea.freescale.net ([127.0.0.1])
 by localhost (fsr-ub1664-046.ea.freescale.net [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id PfxNs3qU2e-H; Tue, 18 Jun 2019 16:30:46 +0300 (EEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id 3F8594D1D;
 Tue, 18 Jun 2019 16:30:46 +0300 (EEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 0/2] Add DSI panel driver for Raydium RM67191
Date: Tue, 18 Jun 2019 16:30:44 +0300
Message-Id: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaC1zZXQgY29udGFpbnMgdGhlIERSTSBwYW5lbCBkcml2ZXIgYW5kIGR0LWJpbmRp
bmdzIGRvY3VtZW50YXRpb24KZm9yIHRoZSBEU0kgZHJpdmVuIHBhbmVsOiBSYXlkaXVtIFJNNjcx
OTEuCgpDaGFuZ2VzIHNpbmNlIHYxOgotIEZpeGVkICdyZXNldC1ncGlvJyB0byAncmVzZXQtZ3Bp
b3MnIHByb3BlcnR5IG5hbWluZwotIENoYW5nZWQgdGhlIHN0YXRlIG9mIHRoZSByZXNldCBncGlv
IHRvIGFjdGl2ZSBsb3cgYW5kIGZpeGVkIGhvdyBpdCBpcwogIGhhbmRsZWQgaW4gZHJpdmVyCi0g
Rml4ZWQgY29weXJpZ2h0IHN0YXRlbWVudAotIFJlb3JkZXJlZCBpbmNsdWRlcwotIEFkZGVkIGRl
ZmluZXMgZm9yIHBhbmVsIHNwZWNpZmljIGNvbG9yIGZvcm1hdHMKLSBSZW1vdmVkIHVubmVjZXNz
YXJ5IHRlc3RzIGluIGVuYWJsZSBhbmQgdW5wcmVwYXJlCi0gUmVtb3ZlZCB0aGUgdW5uZWNlc3Nh
cnkgYmFja2xpZ2h0IHdyaXRlIGluIGVuYWJsZQoKUm9iZXJ0IENoaXJhcyAoMik6CiAgZHQtYmlu
ZGluZ3M6IGRpc3BsYXk6IHBhbmVsOiBBZGQgc3VwcG9ydCBmb3IgUmF5ZGl1bSBSTTY3MTkxIHBh
bmVsCiAgZHJtL3BhbmVsOiBBZGQgc3VwcG9ydCBmb3IgUmF5ZGl1bSBSTTY3MTkxIHBhbmVsIGRy
aXZlcgoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02NzE5MS50eHQgICAg
IHwgIDQzICsrCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICB8ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmF5ZGl1bS1ybTY3
MTkxLmMgICAgICB8IDcwOSArKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwg
NzYyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEudHh0CiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJheWRpdW0tcm02NzE5MS5j
CgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
