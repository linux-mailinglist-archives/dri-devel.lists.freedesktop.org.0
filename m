Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235DF3F16AC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FCE6E4AF;
	Thu, 19 Aug 2021 09:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B366E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:51:40 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1CE30580B72;
 Thu, 19 Aug 2021 05:51:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 19 Aug 2021 05:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=QYwjYbERT0K9u
 SYo01fONKt0VxIOtLUAbN9O7B83ar8=; b=MIYvQtJYVw4WSTYWZ6NtmWSffAogC
 LNniF4Rxmq/V4PybAABjxn+9BiFYL3H9T0tEc9uY1+jaS+AOO8/NnIw1USc6vgJZ
 fNzqUocdML5a/eHEkQB8+tSF0ADKeSWDgP3qtll5VgIJaFgkCi3QG3AhdAtxZVEB
 szH7WazQACD1njbQecST+uKJf63cbWeYyb833USCXJAdX7LdB9P22f2z0wIs2pkG
 tpzo95PzyOOwZJu7CfzDT1QKrPHXzHFSSrPhyvoKYIdPfsLlLItDadEM9iCN5z/0
 X5SUxgEnEr1f856fmgaZlr1I2auJgnZACRUQtyIzCoA+bu1oPU7HoIRJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=QYwjYbERT0K9uSYo01fONKt0VxIOtLUAbN9O7B83ar8=; b=nMD8u7eF
 80FaYysXCHBAwiigstwCkowBHazgui/AOUnvC3XkGyyCgdwMaOvE0SuB1wOmOIXU
 QsGL01K89bJhZjR/ElereAiwL4UefRrfy4EPEkNZ3ZmvoWGeJP7j/3sBzljnzE+s
 igrBmF0rpIjNiXUQ7idPErm/14zoPw/HajzNN3vrWDHlCKRdcBhqBB7ciomFhOEO
 axKSeW3w4cBEPyIeY0nKQiRHKv0w22yCTXORkHQ6j5oxOBwKYfYoI9MuwrptE3SZ
 9KVxgaAN1UeeQqexGyZ+IWBMrt+IfexCYO+erN1X88r0w5skE6IDZxRWfmwPO1ER
 LuPVMOQzHfSSEA==
X-ME-Sender: <xms:qykeYdcLOL2Pf5-_SteOp2_yOIZ3UmoabU2h0biqdojmKoJrDXetdw>
 <xme:qykeYbNQqo_5O2jnBOmikILdPlQq4LkZ1ZE92aZrU85i6vywbFTjBzjxRtK1hM3ph
 pLkoai01BayCHaVTIU>
X-ME-Received: <xmr:qykeYWiGacZThWDezprKaRCagpOm5byjkz7YnPKrSi2W5Awg1VBzQWq8HwZfs6d0kQesNBwaZY3K7ixYY60uW-HN3wYNRBLPo6v2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rCkeYW8Wc6Y_LNPGrCkYw0Rt1HU7iSY3OIgSNXanTlUHzTtdQNHkGg>
 <xmx:rCkeYZsLwHHBPLy2DZ7cDAHwvoDqHw40WdlNrwxX00suXIXuycVErg>
 <xmx:rCkeYVHP_JZ2EfdMeaFrwJkWjN4GykINGPECfP89ZRHYxuRio90T9w>
 <xmx:rCkeYZG_y2N99EyPdB6aAKcJ_n-scioCKDdO-fl7tvHaiy80YKfJQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 05:51:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v7 06/10] drm/vc4: crtc: Add some logging
Date: Thu, 19 Aug 2021 11:51:15 +0200
Message-Id: <20210819095119.689945-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819095119.689945-1-maxime@cerno.tech>
References: <20210819095119.689945-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The encoder retrieval code has been a source of bugs and glitches in the
past and the crtc <-> encoder association been wrong in a number of
different ways.

Add some logging to quickly spot issues if they occur.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index c88ce31ec90f..073b7e528175 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -524,6 +524,9 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
 	struct drm_device *dev = crtc->dev;
 
+	drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)",
+		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
+
 	require_hvs_enabled(dev);
 
 	/* Disable vblank irq handling before crtc is disabled. */
@@ -555,6 +558,9 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, new_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 
+	drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)",
+		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
+
 	require_hvs_enabled(dev);
 
 	/* Enable vblank irq handling before crtc is started otherwise
-- 
2.31.1

