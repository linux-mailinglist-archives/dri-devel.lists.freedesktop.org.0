Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079263ABBD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B3510E21A;
	Mon, 28 Nov 2022 14:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4414A10E212
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:58:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 95C772B05E77;
 Mon, 28 Nov 2022 09:57:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Nov 2022 09:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647479; x=
 1669654679; bh=kCi4h++2OktpFKfkD3x9KAijsoO3R0kc8j58jJM3F4Y=; b=f
 gubKwxHblt45zDHJz+Lh4lcE4E8xMxjSUZrJzV48hfykSJaLxIcSdqyYyL5iNBnB
 G8McUGP1keZABP1KhwYoL5h+K9FY/SQvanI28cOJmbUt1TKS/+6wJ91YSNtLtcMN
 Rur3gAsBNwBRR6W+A6qyZF+Djly9x6gPGoqshI81hdjXTlTb36e377XHCjJgAS+c
 neq23rWZ0pEpzE2FFjVQTwUjI2SXylxFtJgJLOm0gHOUgXv56Sto4Q7EF6iVsQ5Y
 lS3HePS+FnVrdHxe5B2g9n0I9+ufW3Fhy5PgfpdPCh+I9/phF5OkAl4CjWPenR1P
 RDY6AEVyW3IVqJLLChKpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647479; x=
 1669654679; bh=kCi4h++2OktpFKfkD3x9KAijsoO3R0kc8j58jJM3F4Y=; b=T
 UkuyTCXk+KSxAtUhMfePxFy9h9QZm2820fpeAZtowXi0HZBXJNA1RW4uROTU1gw5
 fqSqOXdbBUMq8P6RjzaySGTkICEy1LGPvezi/rmv21Zx01SADOIp/zc13xeteBUW
 ET5OPFVR3VQmRliwL815waQ+w+HNMlMd838AOqBN95gQVxJShrup8R7dx1HnwfCE
 IBlc4Q/VOJXsK0/JJp2bIkZicIGHM/MwjzEXVBkQxeolsemev7ky9vbUpIJnixfM
 wE/ne4sGMUaCzdzXutVga0/OUjic+zFxdb2/yin9+IQi3bFPAirz6FUvq53HMVN1
 qayUWp4waEvvWL1K9U/Ww==
X-ME-Sender: <xms:dsyEY5PHR00CyLzJQWqvRRdHv-qQnKnjOUXbg2E2WfxiwvqTymPj8w>
 <xme:dsyEY78nWCIgBKzlxi-wU0LcVqbks51pljUSfGuB4seinkfWAFCM7KQtOOLk6CKPM
 8SBj2gqhQMmlh0_Zow>
X-ME-Received: <xmr:dsyEY4TeshAcdiuMeGbhmL0axBradWXKl67tjGaCpOxd29HI-EL5M6p_8O-iVE4Uuz-wdwHRbdCgXcJbHwmVlt58MB8XgsZVrl9wlwnNPVzK_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dsyEY1vCpq7qcxs8RWSN1gfm-rr8BUbBnPp7An4kc8Kwb77wEs2tmA>
 <xmx:dsyEYxdHxoEBsZsh7PW3w21TouR2sasPkLhCjsj-viirS7ISr3RFCQ>
 <xmx:dsyEYx2LZWESeQcT8lb4MU6gNHMTSebw3aoSpHwNYNnFubMBE8u4LQ>
 <xmx:d8yEY__yBTcsfei_mWOa7Qvvtcv7u5JrFatIGqv6pK-PE5EBexIzjfK_fH4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:57:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:43 +0100
Subject: [PATCH v2 14/17] drm/vc4: hvs: Provide a function to initialize the
 HVS structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-14-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4882; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=K3fPT2Wx30DSyf7JggJ/P79AlwfAolsjp39FdXf/CRY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp8ueX9F78FPi45Fsj7kigc9vv3H1erGM7cH/Qx/ZJ5x7
 MjVlcUcpC4MYF4OsmCJLjLD5krhTs153svHNg5nDygQyhIGLUwAmct6PkWGJ8n9GwwWTfPkWXFwol/
 d3knRGj+n8OQG1p2+5Mq9bMZ+b4b+zrbZ08lU9460fWaeoBbYdse64uPbHzIstNZmzpkz/YMQIAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Maíra Canal <mairacanal@riseup.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to initialize the HVS structure without a backing device to
create a mock we'll use for testing.

Split the structure initialization part into a separate function.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 drivers/gpu/drm/vc4/vc4_hvs.c | 81 +++++++++++++++++++++++++------------------
 2 files changed, 48 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 54352db48476..e0be7a81a24a 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -1009,6 +1009,7 @@ void vc4_irq_reset(struct drm_device *dev);
 
 /* vc4_hvs.c */
 extern struct platform_driver vc4_hvs_driver;
+struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pdev);
 void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output);
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c4453a5ae163..94c29f8547bb 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -768,22 +768,60 @@ int vc4_hvs_debugfs_init(struct drm_minor *minor)
 	return 0;
 }
 
-static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
+struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pdev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
-	struct vc4_hvs *hvs = NULL;
-	int ret;
-	u32 dispctrl;
-	u32 reg;
+	struct drm_device *drm = &vc4->base;
+	struct vc4_hvs *hvs;
 
 	hvs = drmm_kzalloc(drm, sizeof(*hvs), GFP_KERNEL);
 	if (!hvs)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
+
 	hvs->vc4 = vc4;
 	hvs->pdev = pdev;
 
+	spin_lock_init(&hvs->mm_lock);
+
+	/* Set up the HVS display list memory manager.  We never
+	 * overwrite the setup from the bootloader (just 128b out of
+	 * our 16K), since we don't want to scramble the screen when
+	 * transitioning from the firmware's boot setup to runtime.
+	 */
+	drm_mm_init(&hvs->dlist_mm,
+		    HVS_BOOTLOADER_DLIST_END,
+		    (SCALER_DLIST_SIZE >> 2) - HVS_BOOTLOADER_DLIST_END);
+
+	/* Set up the HVS LBM memory manager.  We could have some more
+	 * complicated data structure that allowed reuse of LBM areas
+	 * between planes when they don't overlap on the screen, but
+	 * for now we just allocate globally.
+	 */
+	if (!vc4->is_vc5)
+		/* 48k words of 2x12-bit pixels */
+		drm_mm_init(&hvs->lbm_mm, 0, 48 * 1024);
+	else
+		/* 60k words of 4x12-bit pixels */
+		drm_mm_init(&hvs->lbm_mm, 0, 60 * 1024);
+
+	vc4->hvs = hvs;
+
+	return hvs;
+}
+
+static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = dev_get_drvdata(master);
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_hvs *hvs = NULL;
+	int ret;
+	u32 dispctrl;
+	u32 reg;
+
+	hvs = __vc4_hvs_alloc(vc4, NULL);
+	if (IS_ERR(hvs))
+		return PTR_ERR(hvs);
+
 	hvs->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(hvs->regs))
 		return PTR_ERR(hvs->regs);
@@ -835,29 +873,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	else
 		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
 
-	spin_lock_init(&hvs->mm_lock);
-
-	/* Set up the HVS display list memory manager.  We never
-	 * overwrite the setup from the bootloader (just 128b out of
-	 * our 16K), since we don't want to scramble the screen when
-	 * transitioning from the firmware's boot setup to runtime.
-	 */
-	drm_mm_init(&hvs->dlist_mm,
-		    HVS_BOOTLOADER_DLIST_END,
-		    (SCALER_DLIST_SIZE >> 2) - HVS_BOOTLOADER_DLIST_END);
-
-	/* Set up the HVS LBM memory manager.  We could have some more
-	 * complicated data structure that allowed reuse of LBM areas
-	 * between planes when they don't overlap on the screen, but
-	 * for now we just allocate globally.
-	 */
-	if (!vc4->is_vc5)
-		/* 48k words of 2x12-bit pixels */
-		drm_mm_init(&hvs->lbm_mm, 0, 48 * 1024);
-	else
-		/* 60k words of 4x12-bit pixels */
-		drm_mm_init(&hvs->lbm_mm, 0, 60 * 1024);
-
 	/* Upload filter kernels.  We only have the one for now, so we
 	 * keep it around for the lifetime of the driver.
 	 */
@@ -867,8 +882,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	vc4->hvs = hvs;
-
 	reg = HVS_READ(SCALER_DISPECTRL);
 	reg &= ~SCALER_DISPECTRL_DSP2_MUX_MASK;
 	HVS_WRITE(SCALER_DISPECTRL,

-- 
2.38.1-b4-0.11.0-dev-d416f
