Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9A1B802E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A616EB9A;
	Fri, 24 Apr 2020 20:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDCD89E41
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 80C7A1338;
 Fri, 24 Apr 2020 11:36:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=uucV+As7ogGw9
 YUEVrtmYr03Dg9rcZtBL91xE2/BjR8=; b=N1XoLXG9Bndy9PbuUXNFA1pEbGDBw
 Js3gtMW5guD1bXCetxLG5TTazwZ9jdK9dl5wNSarNQxLUsfOHWT/a4HUpr5Kx90K
 oapv2k2k3iBMcchFpU4gNQTlBG1ju1iuDHXG47jaNF5XANRMy3siLd7r00xnApkR
 CFkTyFMgklSytNQYlBTjJTOVy3eN7B+ZwEBJEvDejZ2l8rjsOVmgfUqTaJDgePaD
 3xvCChaUZE6UOCg8PKQvoRubfLaphuf7JkzpKUWcRrQcEzea/y1vNrkVtjBEx9Ps
 2tkitcMxCTtlnzpihzGJhM+W+fH8iSdPrko4+qZ/jh0cVE987sIUnfbeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uucV+As7ogGw9YUEVrtmYr03Dg9rcZtBL91xE2/BjR8=; b=bnH9dvIP
 NxgjfgdfqZiP8kx5Vl509fzB/S+GKRQkcDnQM26Pl04sN11kAgYXMJDif3UFmayX
 f/8CNqPTc7LAP4vkALmOzerxHJN4A84HG0Y0bljWfQkGFOg6F8pROCKbpefrvVvK
 t5yDCdPBUTGplohHj3m9MH817cDfCL3E/dxvniF+RgPnbKGh89Ihqxq2TzLg30oj
 ccQ28gCHsvmnkiK1wjwyNrsXNK897Z6uOCuBGQx3nW4SEzBK/OQA3xX2/AYpKlPi
 kT6LkAnOx6xGH4HuFNw28tmX1ceYo2oyBWyCcfhZ2XTAQ7TL86nPqYdOxarMV10n
 dzYO7/23b428cw==
X-ME-Sender: <xms:mAejXsAvqIGZPnahZ_anjFiMRYzfie9Bu8KCLzjHiD_N3Mu_6ebJ3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehleenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mAejXjZk9YfWv8nxmXPbEG--NPUGWW4G-isMbsL7hqLfMCJCOUHmkw>
 <xmx:mAejXlfF9RC_aH_JGZrN8W3P4PVWB9dh1pgu0zrzPRqjXWpz7QCrgw>
 <xmx:mAejXlP2wSlP5oWEoyk7aN7oSrgwKn-q2gp26ZDHOf_93rPXAdsS0Q>
 <xmx:mAejXosX9YFMoD8cG91qoMH_Xr9PLDSLr785Z-s22F3mUt_9ZJe2B6iBTxQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF72D3065CDA;
 Fri, 24 Apr 2020 11:36:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 67/91] drm/vc4: hdmi: Use local vc4_hdmi directly
Date: Fri, 24 Apr 2020 17:34:48 +0200
Message-Id: <40376b3861789147031ff914a0927c05ce6a2101.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function vc4_hdmi_connector_detect access its vc4_hdmi struct by
dereferencing the pointer in the structure vc4_dev. This will cause some
issues when we will have multiple HDMI controllers, so let's just use the
local variable for now instead of dereferencing that pointer all the time,
and we'll fix the local variable later.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7a98520665e3..9a89541f7d64 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -124,20 +124,20 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 
-	if (vc4->hdmi->hpd_gpio) {
-		if (gpio_get_value_cansleep(vc4->hdmi->hpd_gpio) ^
-		    vc4->hdmi->hpd_active_low)
+	if (vc4_hdmi->hpd_gpio) {
+		if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
+		    vc4_hdmi->hpd_active_low)
 			return connector_status_connected;
-		cec_phys_addr_invalidate(vc4->hdmi->cec_adap);
+		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 		return connector_status_disconnected;
 	}
 
-	if (drm_probe_ddc(vc4->hdmi->ddc))
+	if (drm_probe_ddc(vc4_hdmi->ddc))
 		return connector_status_connected;
 
 	if (HDMI_READ(VC4_HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)
 		return connector_status_connected;
-	cec_phys_addr_invalidate(vc4->hdmi->cec_adap);
+	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 	return connector_status_disconnected;
 }
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
