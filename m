Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA0439A86
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45766E118;
	Mon, 25 Oct 2021 15:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E266E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:29:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7A4515806D7;
 Mon, 25 Oct 2021 11:29:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 25 Oct 2021 11:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=gYhQ9oCsB05pl
 FUpCTREx74kNatGeb6G22laLivtnjs=; b=cdl26uo8nbfTq7/wLvp7aL2+rn5DT
 uYmBHRRjHNzB1LXLW9Y7dJxmxpRrjfYn6zScW4FKLwoASuHUEY6oKSWhpD9G5Fcy
 Yr+MZsIwE4ZeyXmE4A1X2wcrxG8u2OQZsOlDlYZ12cTvam56vokSKWK4+5DtdbM9
 LuRPeOz5s292RGOJmXKE63OQ0v75ybKlH1Hc0Pywdz+XzdESChZX/Zv61mIz9Nz+
 7y/4r01h2hyJNGzXwJRPy0OQQnweA6vh1kQvv4tNvQa009yPd8CHKaYGdFiKtmcG
 +SCB9iRktAnLQQJ/NcUpT35TG8mFaVgUgDZiQWJ8N1Tee3/CeMaZWJgbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=gYhQ9oCsB05plFUpCTREx74kNatGeb6G22laLivtnjs=; b=loxIZyBy
 pwg+citTbPBq61isf7XMj/OcBsEBRKPZ45i8CIqGDrDKyeRP7JiWFou/1P2E0SSO
 t3gV+ZuZRZnsRy/Xu6sPmVuSod0ETadIxcAmFbCLPO19j/tEsJcYBc0r+qZHqUUL
 mjap40VxLDf+0o6qzgjtUAgng8d+B2IQPYFo7V8x4EveghMf6p+PxtGDvI7Y9NDg
 jK9V61TsonNhqK3Fh0ZcOFUBFGRwwX/HbOAFzp9fksm9KCvdjcHNiNY/zvXo5MGr
 n94zC6vc0I6UosFfRSfwxCllblrFSF4HZ+It76oEOTs3gFwmT0+h65vFYEsDvA+8
 5GqQL9/J68tUBw==
X-ME-Sender: <xms:Vs12YZnjrY6XghSqMcOZX7OEIO5odGW02U70LNo8t21ddt0XH6G5cg>
 <xme:Vs12YU16h8Hyags_LBanKruDExpCWZ2mRx8FnBXG9GWEUrh1ZUNOVWPlYZpwc3iGZ
 D0JguVD-sATLjlUzQs>
X-ME-Received: <xmr:Vs12YfqY7JozPwPCw97CYFGWsEhfMYa9PzPyrOAHDAjx2g646FSHNSFm3jBDvJL5oeULDGIQOMd5U_ZWmeP7n_BLWVzH47xSMhz6OgQ5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Vs12YZkqiZ8T2LErbLJiag4pkw0fJjmGgwgOjRFYSpuSH7VyJJTgkw>
 <xmx:Vs12YX1d_FgjRfawnvwD8RMB8Jieittl7K2UuP8yfW_T0tAwkoub9Q>
 <xmx:Vs12YYu4lLUMf9kP-adcXb3an7OgemjUSLkPpzB8JaNT4QeouJuyjw>
 <xmx:Vs12YROSn2Lx4La6-huDifaWE7L2uQX9S18-YispGsiemolBdPfQOg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:29:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v8 09/10] drm/vc4: hdmi: Enable the scrambler on reconnection
Date: Mon, 25 Oct 2021 17:29:02 +0200
Message-Id: <20211025152903.1088803-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025152903.1088803-1-maxime@cerno.tech>
References: <20211025152903.1088803-1-maxime@cerno.tech>
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

If we have a state already and disconnect/reconnect the display, the
SCDC messages won't be sent again since we didn't go through a disable /
enable cycle.

In order to fix this, let's call the vc4_hdmi_enable_scrambling function
in the detect callback if there is a mode and it needs the scrambler to
be enabled.

Fixes: c85695a2016e ("drm/vc4: hdmi: Enable the scrambler")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d36b3b6ebed1..fab9b93e1b84 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -180,6 +180,8 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
+static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -216,6 +218,7 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 			}
 		}
 
+		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
 		pm_runtime_put(&vc4_hdmi->pdev->dev);
 		mutex_unlock(&vc4_hdmi->mutex);
 		return connector_status_connected;
-- 
2.31.1

