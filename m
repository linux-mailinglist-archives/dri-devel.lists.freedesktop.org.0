Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87028472C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8316E3AA;
	Tue,  6 Oct 2020 07:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9886E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:03:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id F17BB580397;
 Mon,  5 Oct 2020 11:03:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 11:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=jhIHshhXU/XQiBzYzWAWXfs8v6
 DPWe98K8qTnZwq800=; b=jh5y4OjB7mxRl1wWPW2xMo7obebXf8Gc8o3q4t0cvt
 9bDRwlF2L69gHShwK7cvLaX3fkToWN8j3eSLn+eS2qlNA5wdkzyNEnl0TLyL3OlI
 BrNfmhqQ3ZG0pogmUQj718qggfSrBjNXRg1y2wnDCpajuAf+63qsUfewDuF7ovIt
 rc3EtuJAMOcbajuWO+KzsGUyhMLXT21O5rkLModKn2Uf2BSPgMqLYSCFUjIC0oSd
 CxscobAuU/9Oid2QmT8gmXcs2AjgSUyg3sVQHKzGStsv3OArw3SuMZc/hRQrVcNc
 89apOJFmao7KloCDWaMM/w8ryBZnKGXdN9r0kRYxOY2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jhIHshhXU/XQiBzYz
 WAWXfs8v6DPWe98K8qTnZwq800=; b=oBxT95o4G+XX3mi4YKrESmtahNFxbntjS
 pBGkjvejdfAlKKuo3k4QNofz8dXEIUAggw5iymqDWsjjD5Ooq9TKn4p9E3DZI536
 vmmW7f+oZOlboH+rYZXNSj1xACV17Ny60g1JrhiTGoEq8efsoX2vbb6fObQsisud
 pk7Z74BK0BKfenGxkGmoMCUjlSj0z3br+61S0B9oG/bpIWw1DWnrI1xmm2W33vYg
 xQtGbNEnaudW1I8ZkRv3VkkzBmlfpJbenzC76+tvSTvAynczrwCNnFhfZm2ya+J9
 t/RnOf/kSO/iv/qXBF4IO0Iy1pc1alnMQ2z2+Nntwm2K450CQZbsQ==
X-ME-Sender: <xms:uDV7X0tLAEqtJM_bJE0TSF-vzBafFuGje7ZvXayMpylNe3q5Dmdjtw>
 <xme:uDV7XxeN34AbuzHGqG6TavWB8iGPZTo3AqivF8kJw5OSnZFmI1MbkiVFqFgXSWh_2
 I8NP7nDj3NwRmv7V2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uDV7X_wUhrJm8nXGGBywoPRyZ5HKPncagxKaXMnCrxf__3CEG36KJQ>
 <xmx:uDV7X3PDJJ-fHp0i_vg_EpHrXEkFPaqibGibWLgwxMij_5UcEOwT6w>
 <xmx:uDV7X09OiO4EXKWn9jHgOQUHqSTHCkyPPeqdTwif0KavY9_DqBsFGw>
 <xmx:ujV7X10Sa01Z9YIKPKcpU8hKf2y0dlxkMTtquAFoyPEOmSj6F16pww>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 77B44328005A;
 Mon,  5 Oct 2020 11:03:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] drm/sun4i: Add support for dual-link LVDS on the A20
Date: Mon,  5 Oct 2020 17:03:11 +0200
Message-Id: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910147.git-series.maxime@cerno.tech>
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
