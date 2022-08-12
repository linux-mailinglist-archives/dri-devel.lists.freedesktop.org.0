Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CE590CB7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926BB18B0EA;
	Fri, 12 Aug 2022 07:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EE618A89C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:42:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 84FE75C0162;
 Fri, 12 Aug 2022 03:42:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 12 Aug 2022 03:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1660290178; x=1660376578; bh=sEqATm0wVZd4GFSPGrPKNfMfo
 m+92qSRyi/XXJHwM1s=; b=aeBVoIsHbD45G6B2CSXU/+fJbfPj6LzUteE+SGT3r
 urv+m1IDsRbX9YJJDBkkg9qfT/fKl8h4/Nw0c7RI9waZavC2Zcr3bS7PKMPBet5q
 Lc6ENhGbDyZjgilTRxYsTmsZsR1UROCiARJuuNLHcAMjtBjMshtv7mMJMoTWi+5h
 Xq+KgG1BDfzdtbcVMcd6El9EBfVrAPkO0dSev0HDxeUSr2rROHEGSF9V6lDNjYhT
 UIPHo8iO3OvaBS4oDbpKannB3q9aPFSHEQffek9wNQRSTQn8jiSD0xGrkbuI6PBp
 332uFSbEt+eLEL6qNvGat3Xk9CREPQQNjCO830tYjiIdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1660290178; x=1660376578; bh=sEqATm0wVZd4GFSPGrPKNfMfom+92qSRyi/
 XXJHwM1s=; b=GY1vSeir5ajF1syvZuLHsaWDIyXnjG2u+a5LHIy+0ICG5rpB3tP
 Ku2pKsrtfIXv9XjXezMfRVLrgNAyO5h2iQGW8Td7z09qd/93rQ+rDM3Hr8uWmXCX
 N5WdXeaBkQ5iEUuZvJu/5D8DngGzFstcvKEnP7+cxSMMOLR2ralBv+IEApKCQis0
 V1a2tF4SzCm2fYlvAz9iKmCvcY5rTHRksnkGPhIkXXPTEBp03Cdk4b5rlPXyqYmr
 /UhlOxN2zDVFh5qDHFexe2f3iyvMLXOcK87MY/XhO+VPXOuRjjHnOuhS8FG4q44M
 nI6jMCSu8LSNK5owaFyy/qXgoO8jM0fLVig==
X-ME-Sender: <xms:ggT2YrVxdsxffic8WE0sF0HJGB__LdGX1uw1CrVRQ4_bJzF98WFUTQ>
 <xme:ggT2YjkkaYmjVCF865taabHe-2QPUNifwFrIto563OBDxeJZcQV0-pyiNf18YC5ig
 BdKkjC6PwYvHoaoNw>
X-ME-Received: <xmr:ggT2Ynb6O8IGrf2Nilr_3ivTSYyBCJvXL8IfPWs2PIhLH9KgqB6lpMBNlS7fBi7bsNgwO3_yem6DSflVNCFyLw0IDURcQG8WlhqISVH_spKbVeUz7tdJQb7PhavhsSXHkALUGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeghedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeeh
 hffhkeekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ggT2YmUUOxSk46kfSLU_DMCI7xFLyIIuvxmHc75RmQEHFU_RNtU6Kw>
 <xmx:ggT2Ylkx2lCDoBnG_EvzaDqavatBbiT1o4wVdoqHp-XHqRXIcAFs_A>
 <xmx:ggT2YjeVL6IvleKt4_apCQm4DA2tSXw6crTDh5gkfFPcaIwViOu3tA>
 <xmx:ggT2Yo9ibAE-IQeu7C5tStgXJgXoDeEIt_Jwj4a1rWIe67msC_caCQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 03:42:57 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/4] drm/sun4i: dsi: Support the A100/D1 controller variant
Date: Fri, 12 Aug 2022 02:42:52 -0500
Message-Id: <20220812074257.58254-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for the digital part of the DSI controller
found in the A100 and D1 SoCs (plus T7, which is not supported by
mainline Linux). There are two changes to the hardware integration:
  1) the module clock routes through the TCON TOP, and
  2) the separate I/O domain is removed.

The actual register interface appears to be the same as before. The
register definitions in the D1 BSP exactly match the A64 BSP.

The BSP describes this as the "40nm" DSI controller variant. There is
also a "28nm" variant with a different register interface; that one is
found in a different subset of SoCs (V5 and A50).

A100/D1 also come with an updated DPHY, described by the BSP as a
"combo" PHY, which is now also used for LVDS channel 0. (LVDS and DSI
share the same pins on Port D.) Since that is a different subsystem,
I am sending that as a separate series.


Samuel Holland (4):
  dt-bindings: display: sun6i-dsi: Fix clock conditional
  dt-bindings: display: sun6i-dsi: Add the A100 variant
  drm/sun4i: dsi: Add a variant structure
  drm/sun4i: dsi: Add the A100 variant

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 30 +++++++---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 58 +++++++++++++------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h        |  7 +++
 3 files changed, 69 insertions(+), 26 deletions(-)

-- 
2.35.1

