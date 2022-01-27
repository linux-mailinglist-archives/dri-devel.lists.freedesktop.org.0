Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C946F49E064
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9BF10EC4C;
	Thu, 27 Jan 2022 11:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F195210E868
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:15:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E89F5C0139;
 Thu, 27 Jan 2022 06:15:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 Jan 2022 06:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=ZOmqn5AySwwvlqQWzXbZZMQyntWvYGD5VgDeAYX7nwQ=; b=M6Qr2
 7JXtk5xgXne5aLraOOMJ6mBfN0ot/kER6a/7/wX5wPv2bcCi3NaGbHdc1/AO3Ck4
 NlqiEtQzxLsRIRme5yh3vAg3mtrpCqgagkQD1b54NY8jZQGQ75b7FfmZl6FCHMrH
 h8c9gETbBQihACWClAw39gNguLv34zfnfeVceNl82nY6eAH8/pHuHytErjMdFCZS
 cJRi35Pk/TpRC9i2CzG8yDubRv32U4uo4KCqCoEdUoMJEXJoIVbE1+GtuPHP5cIz
 RZxCo6s3zAJqnm6ULq8nZ5ISVLT9zJXLgj4yI87PHZFifQfwtMsb/RcbeKYfrpUW
 JSDq7mpfpi+mRlqjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=ZOmqn5AySwwvlqQWzXbZZMQyntWvY
 GD5VgDeAYX7nwQ=; b=E3Z10LmNwWS9++Kw76GJ3Fef7oQLt6yFjCrwV+9mDpOOx
 TEyGd0OIBdbFeVNylCfUZcRoUF1+Ui7klQMhjB69hSbUHO2fE/FpAQhtOZmK74oK
 +jBOeHu2sTVnt4SYuIFKPe3ngudHgmDlCM+Yajxy2HPFR/kInn/cjttuBgueR6E2
 +kUeOzenkPRPnz7PT9P1ziTCe0zbQkT80EwhuJTr7HHrIARqE4ksULlyPhbR2hbl
 YHEEhFvgC2Uq3CosoKkqR/IPAhALmbMjKF1U4h7kuHjo5CQ9rUOsogCYIeMw+vR5
 PbcS21LQbbjh7Ve7aPDicxTcTP5eby4llqI4pz09w==
X-ME-Sender: <xms:tn7yYT4DAt1vNOaNfxQwIPbQqAWUizPvUVkdaGDxM7OjgckNOThd1w>
 <xme:tn7yYY4x4_FZOT3vuG0IUnN7K0apApxRBwlTJxov9SpMAwG1N0o_--vcJQ1wGcyaT
 EyBXQI7jeQBdVhbH3I>
X-ME-Received: <xmr:tn7yYacFiuYcCAEfkeU4Ndbtou5GACTU9Hkjorw_70LM9FLm47Jg2a47Job6r2s-fh7GOhuwYj2XfuWYZ7BtJnd0D8PZ-7XvPDI2_7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tn7yYULer3YdpwGLx_1ORfnsWYJp1ZsoZKMXVXXyT2bf2k7axKR53w>
 <xmx:tn7yYXKyrOcV3RElJ-gF1cK4PrjGzAMM39CZznkC_bycip0jTH_IrA>
 <xmx:tn7yYdwC2aq1uYkHnIJfPopZrv_5H3msec23relEPBhMV5apLHSpZw>
 <xmx:tn7yYe-lcQSW27XiU4dflibb-Q_L5rPfUY3jQbjDHfaAcLcSTAcFvQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 06:15:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: hdmi: Unregister codec device on unbind
Date: Thu, 27 Jan 2022 12:14:52 +0100
Message-Id: <20220127111452.222002-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On bind we will register the HDMI codec device but we don't unregister
it on unbind, leading to a device leakage. Unregister our device at
unbind.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 8 ++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 502d5bea5f61..395a9e9c1e5a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1746,6 +1746,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		dev_err(dev, "Couldn't register the HDMI codec: %ld\n", PTR_ERR(codec_pdev));
 		return PTR_ERR(codec_pdev);
 	}
+	vc4_hdmi->audio.codec_pdev = codec_pdev;
 
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
@@ -1785,6 +1786,12 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 
 }
 
+static void vc4_hdmi_audio_exit(struct vc4_hdmi *vc4_hdmi)
+{
+	platform_device_unregister(vc4_hdmi->audio.codec_pdev);
+	vc4_hdmi->audio.codec_pdev = NULL;
+}
+
 static irqreturn_t vc4_hdmi_hpd_irq_thread(int irq, void *priv)
 {
 	struct vc4_hdmi *vc4_hdmi = priv;
@@ -2689,6 +2696,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
+	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index db53500a8435..275c4674d50f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -113,6 +113,7 @@ struct vc4_hdmi_audio {
 	struct snd_soc_dai_link_component platform;
 	struct snd_dmaengine_dai_dma_data dma_data;
 	struct hdmi_audio_infoframe infoframe;
+	struct platform_device *codec_pdev;
 	bool streaming;
 };
 
-- 
2.34.1

