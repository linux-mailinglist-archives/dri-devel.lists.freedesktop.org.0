Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE054660E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D3510EBF0;
	Fri, 10 Jun 2022 11:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978DF10EB2C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F1D055C0066;
 Fri, 10 Jun 2022 07:52:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 07:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861922; x=1654948322; bh=3y
 JYQ//Wp0CnbFJZ+5y+Pssvy7ePKGZ5L9npe5Dvsyw=; b=V3ijhIU2zag6l9l4RU
 pyCnky6HyMSBTiCn7FJCYCXfOnVAY//Uyx19HEoTybRgKNO1j1B9PbIpkbBPlper
 TNr8Jyu1Wl6kUSS+3KBbNe8c2AWepZrS+DQWP5d3NNwfvIm7/gufTCEak65dBjDS
 uAe0ccZezzPvllkh6xEOIIXjiNoYlvu4chTOvKHGvK/Wbuu9ZcA/cRG9NV89GzPw
 /XBrQehPM6tYvUOk69Z17uMmARUhkFDUNcQwZTV8Tv7uY/xShHeXIt7TkAzJYAZd
 AqpniBYnR7OGo8ZECu/lmtmxX0Z7MzzV4b9wWtK0JijqHBZY81rKvUqThFNd+Dgl
 u79w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861922; x=1654948322; bh=3yJYQ//Wp0Cnb
 FJZ+5y+Pssvy7ePKGZ5L9npe5Dvsyw=; b=x4nanVmhUht94hp9diyblP7TEEjQA
 cxLYWJ8x8y+ZocVThoUaAFcJgAZC0LT6ZkKPIBQHugvOGOwCBUyx5Fo3NcqYEKMx
 Rfz8I+1HF1mxGcaibj3ZZpEDadApz8JFnqm19yC8NsHKM5oXRk++hUsgptBksof7
 3PHLOmVOU3ZgUO46+X6n6tJAKKnCgQeZwCykWgxv37ubeQw4oFQOioUjJ++4dLsf
 CCy6+ssarMTS3Ok0F77iYC9w0jgSdTFMyLsZCggPbaksBBUzDPMDA+2iIOXFFCVB
 t39VxIO8XmMT2p1I8QDOcZNNEmIpKc6SbflMdTxEI8bAQJGIDMz15KmiQ==
X-ME-Sender: <xms:YjCjYsNdNfR_4WvLoLrp6Y06x0w46DWTaQN1e-G-qH6iDWBsf4DADg>
 <xme:YjCjYi86sL48sMEVo8WR-8pQpEaRDN0eo9GI2Lk-51_xXiKUFBppxcxlo3StfC4ZH
 ZbefX4i4ap0K7sq9r8>
X-ME-Received: <xmr:YjCjYjRYA-I8BMQ2qdBYbqx3X2KX_m0Cs9eAwdy6WDiYm7PsYlD39F79as2MnMnGdeHeCjC0XL7qV1JM59nU59N3IitNVNxnT1B9uac>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YjCjYkuyfumQJmP3SyCXBYDna3vayofPeyyyLR62T1aLLXnaAsGskw>
 <xmx:YjCjYkcQieJHOrZX2bDBRu4X4cJyenksZXi0N0gG8o7DxloSubeaVg>
 <xmx:YjCjYo1UVq3Ee9HtPrTLpSIo1oGi2kQuGYVs_p2Qj_ET_Nowy_6Czg>
 <xmx:YjCjYpGBHAR5QmHGkRTrXM_R2WoWEEUxHYtUfyCmysLwadic68DPEQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 05/14] drm/vc4: drv: Register a different driver on BCM2711
Date: Fri, 10 Jun 2022 13:51:40 +0200
Message-Id: <20220610115149.964394-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prior to the BCM2711/RaspberryPi4, the GPU was a part of the display
components of the SoC. It was thus a part of the vc4 driver.

However, with the BCM2711, it got split out and thus the v3d driver was
created. The vc4 driver now only handles the display part.

We didn't properly split out the code when doing the BCM2711 support
though, and most of the code around buffer allocations is still
involved, even though it doesn't have the backing hardware anymore.

Let's start the split out by creating a new drm_driver that only reports
and uses what we support on the BCM2711. The ioctl were properly
filtered already, but we were still exposing a .gem_create_object hook,
as well as having an .open and .postclose hooks which are only relevant
on older generations.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 51 ++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index eb08940028d3..528a1e2761f1 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -76,6 +76,19 @@ int vc4_dumb_fixup_args(struct drm_mode_create_dumb *args)
 	return 0;
 }
 
+static int vc5_dumb_create(struct drm_file *file_priv,
+			   struct drm_device *dev,
+			   struct drm_mode_create_dumb *args)
+{
+	int ret;
+
+	ret = vc4_dumb_fixup_args(args);
+	if (ret)
+		return ret;
+
+	return drm_gem_cma_dumb_create_internal(file_priv, dev, args);
+}
+
 static int vc4_get_param_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv)
 {
@@ -173,7 +186,7 @@ static const struct drm_ioctl_desc vc4_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(VC4_PERFMON_GET_VALUES, vc4_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
 };
 
-static struct drm_driver vc4_drm_driver = {
+static const struct drm_driver vc4_drm_driver = {
 	.driver_features = (DRIVER_MODESET |
 			    DRIVER_ATOMIC |
 			    DRIVER_GEM |
@@ -202,6 +215,27 @@ static struct drm_driver vc4_drm_driver = {
 	.patchlevel = DRIVER_PATCHLEVEL,
 };
 
+static const struct drm_driver vc5_drm_driver = {
+	.driver_features = (DRIVER_MODESET |
+			    DRIVER_ATOMIC |
+			    DRIVER_GEM),
+
+#if defined(CONFIG_DEBUG_FS)
+	.debugfs_init = vc4_debugfs_init,
+#endif
+
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(vc5_dumb_create),
+
+	.fops = &vc4_drm_fops,
+
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+};
+
 static void vc4_match_add_drivers(struct device *dev,
 				  struct component_match **match,
 				  struct platform_driver *const *drivers,
@@ -225,6 +259,7 @@ static void vc4_match_add_drivers(struct device *dev,
 static int vc4_drm_bind(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	const struct drm_driver *driver;
 	struct rpi_firmware *firmware = NULL;
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
@@ -236,14 +271,12 @@ static int vc4_drm_bind(struct device *dev)
 	dev->coherent_dma_mask = DMA_BIT_MASK(32);
 
 	is_vc5 = of_device_is_compatible(dev->of_node, "brcm,bcm2711-vc5");
+	if (is_vc5)
+		driver = &vc5_drm_driver;
+	else
+		driver = &vc4_drm_driver;
 
-	/* If VC4 V3D is missing, don't advertise render nodes. */
-	node = of_find_matching_node_and_match(NULL, vc4_v3d_dt_match, NULL);
-	if (!node || !of_device_is_available(node))
-		vc4_drm_driver.driver_features &= ~DRIVER_RENDER;
-	of_node_put(node);
-
-	vc4 = devm_drm_dev_alloc(dev, &vc4_drm_driver, struct vc4_dev, base);
+	vc4 = devm_drm_dev_alloc(dev, driver, struct vc4_dev, base);
 	if (IS_ERR(vc4))
 		return PTR_ERR(vc4);
 	vc4->is_vc5 = is_vc5;
@@ -275,7 +308,7 @@ static int vc4_drm_bind(struct device *dev)
 			return -EPROBE_DEFER;
 	}
 
-	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
+	ret = drm_aperture_remove_framebuffers(false, driver);
 	if (ret)
 		return ret;
 
-- 
2.36.1

