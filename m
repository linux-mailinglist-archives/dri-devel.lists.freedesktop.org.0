Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15110F41CF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31966F876;
	Fri,  8 Nov 2019 08:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A41A06F790
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:11:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; d="scan'208";a="30895677"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:44 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 281E24008C62;
 Fri,  8 Nov 2019 05:11:39 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 7/7] ARM: shmobile_defconfig: Enable support for panels
 from EDT
Date: Thu,  7 Nov 2019 20:11:03 +0000
Message-Id: <1573157463-14070-8-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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
YWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjItPnYzOgoqIE5vIGNoYW5nZQp2
MS0+djI6CiogTm8gY2hhbmdlCi0tLQogYXJjaC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZjb25m
aWcgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9z
aG1vYmlsZV9kZWZjb25maWcKaW5kZXggYzZjNzAzNS4uYWI0MTZhNSAxMDA2NDQKLS0tIGEvYXJj
aC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZjb25maWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9z
aG1vYmlsZV9kZWZjb25maWcKQEAgLTY2LDYgKzY2LDcgQEAgQ09ORklHX0lOUFVUX0VWREVWPXkK
IENPTkZJR19LRVlCT0FSRF9HUElPPXkKICMgQ09ORklHX0lOUFVUX01PVVNFIGlzIG5vdCBzZXQK
IENPTkZJR19JTlBVVF9UT1VDSFNDUkVFTj15CitDT05GSUdfVE9VQ0hTQ1JFRU5fRURUX0ZUNVgw
Nj15CiBDT05GSUdfVE9VQ0hTQ1JFRU5fU1QxMjMyPXkKIENPTkZJR19JTlBVVF9NSVNDPXkKIENP
TkZJR19JTlBVVF9BRFhMMzRYPXkKQEAgLTEyNSw3ICsxMjYsOSBAQCBDT05GSUdfVklERU9fQURW
NzYwND15CiBDT05GSUdfVklERU9fTUw4NlY3NjY3PXkKIENPTkZJR19EUk09eQogQ09ORklHX0RS
TV9SQ0FSX0RVPXkKK0NPTkZJR19EUk1fUEFORUxfU0lNUExFPXkKIENPTkZJR19EUk1fRFVNQl9W
R0FfREFDPXkKK0NPTkZJR19EUk1fTFZEU19DT0RFQz15CiBDT05GSUdfRFJNX1NJSTkwMlg9eQog
Q09ORklHX0RSTV9JMkNfQURWNzUxMT15CiBDT05GSUdfRFJNX0kyQ19BRFY3NTExX0FVRElPPXkK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
