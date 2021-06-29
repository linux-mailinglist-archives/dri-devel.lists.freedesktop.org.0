Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDB3B72C2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 14:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDA86E899;
	Tue, 29 Jun 2021 12:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600D789C83
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 12:57:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BBB4858042E;
 Tue, 29 Jun 2021 08:57:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 29 Jun 2021 08:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=8b4rI7H3LEGAz
 Zdj8qtTTwwQEqbOukcatoXp5Tb/9DA=; b=V2mTBl4+o1b4ZeIJN1hBzJVG5D6UA
 VUyVqjxYC6xW2BEXagamq0HgRrhO/lrr/qKET12D1KrXG93UQw+L/BeiKF8B90xR
 wLNB9Turo+j+VWjPpYNQVoI6XxaOcLdENk1Gl1kpDS90q138RoouYgShW1+1GYDg
 SOXTdyu9Gyx9at7ErCt/ZBkHSGNQMvY5ya0WNlLYsWkLhPftweb25paHNFt4ulp/
 DuiwwwjCNmdt2jHj3TiU64jx5na/gDW+8LXHSZfWPL+TfMxnC1eTFyPwHPMKdquf
 MdQKa1mZTWTIGqgRQnEENxQXHSC1USlZvIyHwToWeSRD9y3qQ3cRTv4GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=8b4rI7H3LEGAzZdj8qtTTwwQEqbOukcatoXp5Tb/9DA=; b=aAQ7Yf83
 aDu1zNNYD7RT99hvah3eGsw8I8/7R9qYEiGK3jDU5XIj6lSRg8DQHxmz3yH1hit4
 GDIZ6ck7rUeqzs+dXZz+CNAr8SKyn6HJGs1dyKoIv8LgaQAqL9GPV42vJw8N/6Jl
 X2tnzigtuEKVLe83ywQe4vA+vskG/0opV4avo08mqIAu9qnvY1BpOY6sGkybNmcP
 ZPDGOhAmjxgEXsqK0uVoUCw53Pai2QwRfz/Xog10VbNEc4fKO7AsOrIUspLdwk6v
 57yGsYuXaxZHwOLA7udcPIf9cSVwB6MiOyR1iCb+h6k6SI6XwRguPxq7yAMgsNZi
 5lNkukWd4O1DbQ==
X-ME-Sender: <xms:xxjbYFr5JkRMbvtmtyJobyakgOb0wqwHCYavqLEMNOVqqRNeDpMwiA>
 <xme:xxjbYHojjTuzrBm_zGLpl2gSLPlwMPVOBMCDlu1pPNDs35KeN4taLjEPfNF-S377W
 AoL6q2fdyDb9uPnCFE>
X-ME-Received: <xmr:xxjbYCMP0KBFi1lDJwR3E0Vx412QyVC-Wiu0YUF-XK5AQG_UDZCt9nfeG-oTf-n_r800kRj9jLMHAsZaRxDjfbFQPF0Z1tF8qv2B>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xxjbYA5QV_mTfj_NidqobPWdQ3HV9UhJ3Q3yFIAaKBnWTcS_QmcwSQ>
 <xmx:xxjbYE5uRclylD-UE_b4GWcZ_9CQHWzExruYsndF_uwu06LXpFasvQ>
 <xmx:xxjbYIineOj6udaovyDuzrJ3PHQNuI2b-zAToxCnXzP_R_Itl3bsIw>
 <xmx:xxjbYAqzNyNt3V4ornUo1btPESZvdLljwkKsZRewAtKF8SxxQuMeqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 08:57:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/4] drm/vc4: hdmi: Mark the device as active if running
Date: Tue, 29 Jun 2021 14:57:33 +0200
Message-Id: <20210629125736.414467-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629125736.414467-1-maxime@cerno.tech>
References: <20210629125736.414467-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we detect the device as running we make sure we get the reference
count right for clocks, but we don't do as such for the runtime PM
count, let's call pm_runtime_enable to make sure it's accurate.

Fixes: 5b0060004236 ("drm/vc4: hdmi: Prevent clock unbalance")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index aab1b36ceb3c..707fe43ffeea 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2182,6 +2182,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
 	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&
 	    HDMI_READ(HDMI_VID_CTL) & VC4_HD_VID_CTL_ENABLE) {
+		pm_runtime_set_active(dev);
 		clk_prepare_enable(vc4_hdmi->pixel_clock);
 		clk_prepare_enable(vc4_hdmi->hsm_clock);
 		clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
-- 
2.31.1

