Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FCCEE8C4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945A76E845;
	Mon,  4 Nov 2019 19:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 223856E626
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:58:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,267,1569250800"; d="scan'208";a="30794847"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 05 Nov 2019 01:58:32 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id B7B9240083D6;
 Tue,  5 Nov 2019 01:58:27 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 4/4] ARM: shmobile_defconfig: Enable support for panels
 from EDT
Date: Mon,  4 Nov 2019 16:58:03 +0000
Message-Id: <1572886683-4919-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:09 +0000
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

VGhlIGl3ZzIwZCBjb21lcyB3aXRoIGFuIExDRCBwYW5lbCBmcm9tIEVtZXJnaW5nIERpc3BsYXkK
VGVjaG5vbG9naWVzIENvcnBvcmF0aW9uIChFRFQpLCB0aGVyZWZvcmUgZW5hYmxlIHdoYXQncwpy
ZXF1aXJlZCB0byBzdXBwb3J0IGl0LgoKU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxm
YWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjEtPnYyOgoqIE5vIGNoYW5nZQot
LS0KIGFyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL3No
bW9iaWxlX2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnCmlu
ZGV4IGM2YzcwMzUuLmFiNDE2YTUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZpZ3Mvc2htb2Jp
bGVfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnCkBA
IC02Niw2ICs2Niw3IEBAIENPTkZJR19JTlBVVF9FVkRFVj15CiBDT05GSUdfS0VZQk9BUkRfR1BJ
Tz15CiAjIENPTkZJR19JTlBVVF9NT1VTRSBpcyBub3Qgc2V0CiBDT05GSUdfSU5QVVRfVE9VQ0hT
Q1JFRU49eQorQ09ORklHX1RPVUNIU0NSRUVOX0VEVF9GVDVYMDY9eQogQ09ORklHX1RPVUNIU0NS
RUVOX1NUMTIzMj15CiBDT05GSUdfSU5QVVRfTUlTQz15CiBDT05GSUdfSU5QVVRfQURYTDM0WD15
CkBAIC0xMjUsNyArMTI2LDkgQEAgQ09ORklHX1ZJREVPX0FEVjc2MDQ9eQogQ09ORklHX1ZJREVP
X01MODZWNzY2Nz15CiBDT05GSUdfRFJNPXkKIENPTkZJR19EUk1fUkNBUl9EVT15CitDT05GSUdf
RFJNX1BBTkVMX1NJTVBMRT15CiBDT05GSUdfRFJNX0RVTUJfVkdBX0RBQz15CitDT05GSUdfRFJN
X0xWRFNfQ09ERUM9eQogQ09ORklHX0RSTV9TSUk5MDJYPXkKIENPTkZJR19EUk1fSTJDX0FEVjc1
MTE9eQogQ09ORklHX0RSTV9JMkNfQURWNzUxMV9BVURJTz15Ci0tIAoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
