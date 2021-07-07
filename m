Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7AA3BE583
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C126E067;
	Wed,  7 Jul 2021 09:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2596E067
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:23:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 5480C2B0091E;
 Wed,  7 Jul 2021 05:23:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 07 Jul 2021 05:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=yPHveBCmazss3
 HiqhL18dQubSdoqqYUXa13P7zvEQzM=; b=1p8PkATyxYJNVHFZ1auOw2oIpeJSh
 7YMyPO1L3uNzu9k0k0/EgqEYNs6mxUcsMUYwEsVq9POiNYa/VaiAKfMAZyNPWV7Q
 bLvWdj4dtnb1vIj8gCsk3oRAgPlzsZHS5TaLaqpCVSQtprtpTRZ6Q1L/ho58rxHt
 CiWVWsJb9ecUsHgHpd2Z1SVN1Y5jmgylBsrTqMMHik2tLLDg+YJUJ/UE4gv7yP9l
 4uW3cBgeNZ2guaMN/TBTQ5kLBCHf5Xr4+z7AHDGaILKHhFYtKYisekw/JN51aUS9
 CQebNBym1Nx890I8xz3CtSYQKgJ8QAJ+nOB5Bj/qp6vzHQcW31vlOMyeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yPHveBCmazss3HiqhL18dQubSdoqqYUXa13P7zvEQzM=; b=wWQnZPtJ
 4P+rhqosIPoGwD47tBa3JR77NnZvI9/Ruc8R+5wvZ1X0Pc843fukPPMg0QG3NkeN
 6+WLIoTlIp/pOauP1FuySBG5HwIwJgMememClk0RYlwfI8RaWScnGGeWAyyovLt8
 sPXXxCM3AY0Ciozqz3tydQqddcxNNZGEc3NKSf6/Hf1sACm82fxk9umn9dj0kM4N
 IEp8XvVe/ElY7MG8KB7lamx076dHJSfW9+/uAP/DXcMG6604h1zphcPDKhzPe8H2
 kDmPiFUi4/HF3/JulsbhjfNf+EpSEN8bIu0BVRrysIMMD5JYwm7b1Sem1NHN3jI4
 AWOi8ajnuY/gIw==
X-ME-Sender: <xms:eXLlYFuMnuCrtQV9kByDtGP0x5hULC0gvOfJ6XCV5xwUwtYK_h-uOw>
 <xme:eXLlYOegdavTpJFLewzJ9Cc5nYxh3fC2MedVrrNx9LWgVVo7NFwrePTXb0JJNmMHM
 gPS9jcGcZvUN7yMBHA>
X-ME-Received: <xmr:eXLlYIxk-U3j1BbMNUQjsFX6UZ9D9DqSX0ldkFucuyDlt2qSSKFKVl51cvEK0EkDgManwoI5hUPv3s9B5kvTuvjdxa0jQuXGOkTG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eXLlYMMDeaEo56HoYhHX6d_RmsHZ7QDjAKKifBMh0RO33H2letfY2Q>
 <xmx:eXLlYF-Q70d_VpDMueSd0wqGkpjUZ-IXSneA2R4y4gqffaLKORGGLQ>
 <xmx:eXLlYMVuMNdycGFs6JFzuTh8uc19Cu0E8iLK4GxyZ8gSmOQ1KOJ61g>
 <xmx:enLlYNNgmqA4yYeYT6iK8MgxICJJKKdhw3_qG-19sehH-Cw_JNNu4dp556A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:23:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 1/5] drm/vc4: hdmi: Make sure the controller is powered up
 during bind
Date: Wed,  7 Jul 2021 11:22:53 +0200
Message-Id: <20210707092257.1465109-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707092257.1465109-1-maxime@cerno.tech>
References: <20210707092257.1465109-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Tim Gover <tim.gover@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the bind hook, we actually need the device to have the HSM clock
running during the final part of the display initialisation where we
reset the controller and initialise the CEC component.

Failing to do so will result in a complete, silent, hang of the CPU.

Fixes: 411efa18e4b0 ("drm/vc4: hdmi: Move the HSM clock enable to runtime_pm")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index aab1b36ceb3c..dac47b100b8b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2176,6 +2176,18 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
+	/*
+	 * We need to have the device powered up at this point to call
+	 * our reset hook and for the CEC init.
+	 */
+	ret = vc4_hdmi_runtime_resume(dev);
+	if (ret)
+		goto err_put_ddc;
+
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
@@ -2187,8 +2199,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	}
 
-	pm_runtime_enable(dev);
-
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
@@ -2208,6 +2218,8 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			     vc4_hdmi_debugfs_regs,
 			     vc4_hdmi);
 
+	pm_runtime_put_sync(dev);
+
 	return 0;
 
 err_free_cec:
@@ -2216,6 +2228,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
+	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 err_put_ddc:
 	put_device(&vc4_hdmi->ddc->dev);
-- 
2.31.1

