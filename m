Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4971234014
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D22E6E9F4;
	Fri, 31 Jul 2020 07:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793C56E169
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:35:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8E2845803D1;
 Thu, 30 Jul 2020 05:35:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 30 Jul 2020 05:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=JhmDU/H53yjm/GLpBmlQQFXIqh
 S4PzEIc+njySpKR2M=; b=DQ1hbYVep/s2sBYcbcNr35ycMeb40Oi4niM1Aih3vv
 Z5CdzN05Zd6xT0UOFL4bEGDrTpht25WoXX6Bsq7QNw4KyIwRFY2yoMnt7ALsUeA6
 LpUNQBY7HFoFV3NDF/Y00MlARftwf26Gds8nBwxVWiscmMQ3hqc1d6x2dvZt6TbW
 XT6VfdQ1dSpVH9X2sCXWg3u5PyFvNyUWd9QV1oXgv5LU+WsVlACKMG/fU8GTEG7q
 /VRCzjWaxFwZQBVeU+SEvWU8Mt6ABg2+LV3usNOUXjnDDKK2XBwpBw8AA8RCVvGn
 tbdCFLwQHxBWbDo8ZNSEpULs5s53+IK24mtc6Y01WMvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JhmDU/H53yjm/GLpB
 mlQQFXIqhS4PzEIc+njySpKR2M=; b=fBRVXkDeOVu2FeIDe4JgEBJ87V8T3ZdmE
 GFBHB70IHYu7D6T4aTtdQXHohNb8cAI6XaoEK4495NPWUcYR5/669/LyAMtkioqC
 mmldtTvV9RutAHiG21BMkbJFxDVkStDSRI2gn7xEp4iLd6kkVDh/oGeaP0d1sdAf
 Sngj0/tAoh9msiQDdUFaeBSI3wBBydpiMmTuKwO7em1Ll8HbyQHgTT+iZtRYq1d5
 24WMSnF1DDHGSUWRLOMkXxrk6vKGg/SPe/APD+qStSDeWvJqD7eBcZYBwfNQDpiU
 Ydno7XH/VbLCLzRthWRJQqQIy+CH4dpIM0RvuQ0h3/xLnwJHMo2HQ==
X-ME-Sender: <xms:W5QiX4NRs2eRVWq5FgWMjZJd1SzQ1EkTePFLfUTxwUB1hZrNq5lTrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieeigddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:W5QiX--CT0lohwpjLcZt8Z6QPf2oDZA3SUnInO-2efdD8U6j9po_Vg>
 <xmx:W5QiX_TRMZSxXszij0XFDD1mEPB9KJM4VXc2SVgtYZvQ1NeD6rq5Eg>
 <xmx:W5QiXwsJq0Ws8uXcNfNVVQrutXQbG5PoO-vla-r6hs0OGbFN3cZRiw>
 <xmx:XJQiX46CkFwZ9M3wJhaHWuIJT7Dy5ZBPTvtkizT9YT7c2idk77usGQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id ED99B3280059;
 Thu, 30 Jul 2020 05:35:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/sun4i: Add support for dual-link LVDS on the A20
Date: Thu, 30 Jul 2020 11:35:00 +0200
Message-Id: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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

Changes from v1:
  - Reworked the DT bindings
  - Refactored a bit the panel registration in the tcon code.

Maxime Ripard (4):
  drm/of: Change the prototype of drm_of_lvds_get_dual_link_pixel_order
  drm/sun4i: tcon: Refactor the LVDS and panel probing
  drm/sun4i: tcon: Support the LVDS Dual-Link on the A20
  [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link on the Cubieboard

 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts |  69 ++++++++-
 drivers/gpu/drm/drm_of.c                    |  98 ++++++------
 drivers/gpu/drm/rcar-du/rcar_lvds.c         |   8 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c          | 175 ++++++++++++---------
 drivers/gpu/drm/sun4i/sun4i_tcon.h          |   4 +-
 include/drm/drm_of.h                        |  16 +-
 6 files changed, 242 insertions(+), 128 deletions(-)

base-commit: d113dbba9a18f9ac71edb1a66ae552c9407355f4
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
