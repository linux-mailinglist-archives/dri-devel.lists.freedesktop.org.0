Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D12BA284747
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7A66E434;
	Tue,  6 Oct 2020 07:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D213A6E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:03:47 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 25D4F580397;
 Mon,  5 Oct 2020 11:03:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 11:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=jhIHshhXU/XQiBzYzWAWXfs8v6
 DPWe98K8qTnZwq800=; b=jmyLbVkhtAfMsmlIKpsf07dxdOjZXPofqPY7oZElwk
 aGCUcqvb3a8k25Zdnzz9gLgxpG3j6vcy8OjB86bvwGbD/QQyNhcmTj+JsZzkTlwU
 YCmNHfLgctb1UUPduS37K6BrtNjfbfPpAAFTcfTja5Zo0Tn6PW3ZR+56W0ApqrqZ
 7bBqWRphrfWQsQW/JtgH11sG6JokqI4OjkCbqFXuV/hlfc7HzLKjMJ9Zh7Kwt+ML
 9R5EFkUqqf1jxka7UoruKp5f5+VZIg2D0g1dxlfPbnFkxCoPWZz9O1Ipu/ouqL/t
 AHviiydyGhYcSF+KetW7wxvVdCQy7cuNdvqZewMLnJJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jhIHshhXU/XQiBzYz
 WAWXfs8v6DPWe98K8qTnZwq800=; b=amKNVjjxUnB1LdRNfrlch/R1Tl/W6cj3v
 AWd5RWNf/QOlF1dGjI/cXAoyvUZHKGeAigpPy10/TIayWZBSLqDG/8x4v01rNPw2
 KUgjbWj+fLUM/AzUbwlDCk4md5Qp337rVnj9HSMirYHXtC8j/FEb9gCC4kuSAHNy
 n8i8IYjLvHXfOxluAsMHIJ2k177gfD8aSwOOxc0adwSYF5CdIH0EviJbCp40sQNC
 /mx8F7IFlTIKJMhiPcUcZxShEz2etazOLe3zdD1biLtm1mYfHOD2AVIFiLjhIUJS
 43ZD9MJFnZhwSRv1h8nz0FSL2fc506SqrjkOB0/H2Mn6BON8BOHfA==
X-ME-Sender: <xms:0jV7X5V7G9TNEyXV-mIYIpr7xxS91BU3u3zK-KW7cmyrRndfvGbeIA>
 <xme:0jV7X5mYDWzwTZGt6Xc75RlH-NGosYXgh4_By152baGjZYfhNwpjaCZ0MfwwD_5iX
 RoT-zaB6yOuEIO1klE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0jV7X1bHT4tayZ0RDUmIv3rMPxrxUmvos0eyRssMRZNCV074fE4fBw>
 <xmx:0jV7X8WPOpr7_fxms2DE73aREeEeaWxyjETmu9tuaWGHSrm_bhcHvQ>
 <xmx:0jV7Xzn5-eOuWEm8qpI-wwI3gC03Ch-cwHOm9o5EqnhvK0BIRfBD4A>
 <xmx:0zV7X8dLpbRP7ava5gUglaftuoNk8Pu3jbAkA3PgcTWXKbCRbZVUuQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94AFF3064684;
 Mon,  5 Oct 2020 11:03:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] drm/sun4i: Add support for dual-link LVDS on the A20
Date: Mon,  5 Oct 2020 17:03:38 +0200
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
