Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D208F28474C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C106E428;
	Tue,  6 Oct 2020 07:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A49189D7B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:15:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9FA80580168;
 Mon,  5 Oct 2020 11:15:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 11:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=jhIHshhXU/XQiBzYzWAWXfs8v6
 DPWe98K8qTnZwq800=; b=mXXEOjdNv/NNJX0Dh+25N5anEVlKR2GbZJv6P372Eb
 jkyt9HwlL3gOtBiakOeoBZ7aeeZaagYcMbirTB5ZI1LyUYgtS6QP/m3bwA6yHGyW
 UjDQN4OkhR1nUAQq4N7aUn70TyZJUA3z1fXKbR6aCfrWW8OFz2lNoIRzxS5M7hAr
 1wCeevvtRFIh9qF/0MgO81+TcyC9sKtO4EvKqJEnMAJUdXHC0LqoI+sn7XjiIx6A
 6GnVtAuUV0b7lEjPPGeOHrcwwHmfDfhUvBysZspwMin/Y39AjiOeZKAosXTVYreG
 mLmFfpEYuhAGrmFE8G9p9yaUwTEDDlA1vjUOtwbfmfCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jhIHshhXU/XQiBzYz
 WAWXfs8v6DPWe98K8qTnZwq800=; b=ogNLBFwD/t25Lhjn/m1/CoxY/rwfFYOst
 H2UKPtPxbfd6VJjy6g8MUmKb1Le3pwKrFA+9dWKaw6W/WT/oTXKNxcJ3UMjXLKme
 HH0sZh9KzNh+lWfDDer9saVgrotmvGntvgPe9SsM27hU1SBKa2gPJhMuOGsn7nAK
 Ac5BCXcRIVmhNQjA9xvaajeS3bXswR9HExw+kcaa/HeiOUbE+TDwsBsn9utQpfJ/
 aVYAaN7fvuXjPD0Pkq6Vg6zb/cZrJwwqib8R57gB6EuDoagO/bk+uPcfr11jRzUs
 YsY1xtYJhAO9n31cP3gjZhnDdiS0qIpdT1nDCGlK8IHMs2dbN3dEQ==
X-ME-Sender: <xms:ozh7XwbBiFtpWSQsuQbj5s48qr2ug6QyWtgsXXUaPNFdetTwiq6a9A>
 <xme:ozh7X7avI0T6noCRrn1eu_SRy87LGny3aMJmnVPg2ptXSAYOr3jLCjxqNuOzWIaIo
 bicvJJ1gqtypxyCHuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ozh7X6-sN9qunkiiwkz7uvRvyK6KEE-0akFqYVWFFHTC6ATcNdb1aw>
 <xmx:ozh7X6osESftVJ2a1rnc1qP5b33dhaXMCG6vOOUBW4UDSynKeAEpbg>
 <xmx:ozh7X7qEbOUCUX3OyqJZe9cFvyhU4R_2ccOUy2cfWV3nFAo3lvJvzg>
 <xmx:pjh7X4i5RY511NLU7WNUMupTRM-nXxDhwvR60v0J_yhDgu1RW2rdhQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDD813280064;
 Mon,  5 Oct 2020 11:15:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v3 0/6] drm/sun4i: Add support for dual-link LVDS on
 the A20
Date: Mon,  5 Oct 2020 17:15:38 +0200
Message-Id: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is a second attempt at supporting the LVDS dual-link output on the
Allwinner A20.

Let me know what you think,
Maxime

Changes from v2:
  - Added the DT binding description
  - Split the patch to enable the A20
  - Reworked a bit the error messages

Changes from v1:
  - Reworked the DT bindings
  - Refactored a bit the panel registration in the tcon code.

Maxime Ripard (6):
  drm/of: Change the prototype of drm_of_lvds_get_dual_link_pixel_order
  dt-bindings: display: sun4i: Add LVDS Dual-Link property
  drm/sun4i: tcon: Refactor the LVDS and panel probing
  drm/sun4i: tcon: Support the LVDS Dual-Link
  drm/sun4i: tcon: Enable the A20 dual-link output
  [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link on the Cubieboard

 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml |   6 +++-
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts                             |  69 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_of.c                                                |  98 +++++++++++++++++++++----------------------
 drivers/gpu/drm/rcar-du/rcar_lvds.c                                     |   8 +---
 drivers/gpu/drm/sun4i/sun4i_tcon.c                                      | 163 +++++++++++++++++++++++++++++++++++++++++-------------------------------
 drivers/gpu/drm/sun4i/sun4i_tcon.h                                      |   4 ++-
 include/drm/drm_of.h                                                    |  16 +++++--
 7 files changed, 236 insertions(+), 128 deletions(-)

base-commit: d113dbba9a18f9ac71edb1a66ae552c9407355f4
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
