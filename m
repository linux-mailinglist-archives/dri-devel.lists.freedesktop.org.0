Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40E2DF520
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16486E14D;
	Sun, 20 Dec 2020 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Fri, 18 Dec 2020 14:17:27 UTC
Received: from 17.mo5.mail-out.ovh.net (17.mo5.mail-out.ovh.net
 [46.105.56.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD20F6E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:17:27 +0000 (UTC)
Received: from player716.ha.ovh.net (unknown [10.109.146.76])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 56D112A5B2B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 15:11:03 +0100 (CET)
Received: from armadeus.com (lfbn-str-1-215-46.w86-243.abo.wanadoo.fr
 [86.243.176.46])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id D9C2119403322;
 Fri, 18 Dec 2020 14:10:46 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001af125cce-d46d-4306-a7ed-f76bb11df2ae,
 F4E34FAEFBBC2F77A8F65A75F5C3271EDA163614)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 86.243.176.46
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm: mxsfb: add i.MX6UL/i.MX6ULL to the list of supported
 SoCs in Kconfig
Date: Fri, 18 Dec 2020 15:10:33 +0100
Message-Id: <20201218141035.28038-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13291811352116679749
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepgfdtffdvfeetfedttdfgkeegkeekgfefueegffekvddvuddtfeeuheehhfeiteejnecuffhomhgrihhnpehmgiekmhdrihhfmhenucfkpheptddrtddrtddrtddpkeeirddvgeefrddujeeirdegieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGVMQ0RJRiBjb250cm9sbGVyIGlzIGFsc28gcHJlc2VudCBvbiBpLk1YNlVML2kuTVg2VUxM
IFNvQ3Mgc28gYWRkCnRoZW0gaW4gdGhlIEtjb25maWcgb3B0aW9uIGRlc2NyaXB0aW9uLgoKU2ln
bmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJt
YWRldXMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9LY29uZmlnIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL214c2ZiL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvS2Nv
bmZpZwppbmRleCAwMTQzZDUzOWY4ZjguLmEzNzMwZjUyZTZmYSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL214c2ZiL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL0tjb25m
aWcKQEAgLTE3LDYgKzE3LDYgQEAgY29uZmlnIERSTV9NWFNGQgogCWhlbHAKIAkgIENob29zZSB0
aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhbiBMQ0RJRiBvciBlTENESUYgTENEIGNvbnRyb2xsZXIu
CiAJICBUaG9zZSBkZXZpY2VzIGFyZSBmb3VuZCBpbiB2YXJpb3VzIGkuTVggU29DIChpbmNsdWRp
bmcgaS5NWDIzLAotCSAgaS5NWDI4LCBpLk1YNlNYLCBpLk1YNyBhbmQgaS5NWDhNKS4KKwkgIGku
TVgyOCwgaS5NWDZVTC9pLk1YNlVMTCwgaS5NWDZTWCwgaS5NWDcgYW5kIGkuTVg4TSkuCiAKIAkg
IElmIE0gaXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCBteHNmYi4KLS0gCjIu
MjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
