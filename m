Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A4163639C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E01510E57C;
	Wed, 23 Nov 2022 15:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E652610E57B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:29:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id C401A2B069B4;
 Wed, 23 Nov 2022 10:28:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 23 Nov 2022 10:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217339; x=
 1669224539; bh=+2Rcq6shDw4+F3L7RyHppUKT4AFnzRt7PqZubG15HaY=; b=P
 8xf7Pj0TXoHCiZrm6ljV0EwUr+NvQr7Su+kpwbtQW1LVaBbdwZiQGe7ulPZSrvL/
 vLbit40aCFdLC17x2DwOO2iBFaKj346BhblCq0gj3KJxwJ0+doGDmIDXhfjMHfPn
 NFc8ujqlAWdb2oANTqYiOQhfdqwrVnrRLeNALZA3xYBPf9cLBkGGsvu1ZxhkZmE5
 Io23FoW+AaSY4LiA2YNDfIOUwaiWiAShuX774TkKz1wQ0E3RfLP1duSTLecUQIOP
 XbS75uXcNHGsHelKwQPFxH2RDUbPrvX6Ii2Gq3TB2MmMXOOOP9sLcGIQDhzLgede
 1P2NRBvVZj1HFBmS4l/0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217339; x=
 1669224539; bh=+2Rcq6shDw4+F3L7RyHppUKT4AFnzRt7PqZubG15HaY=; b=m
 JkL2IYrvcArHn3FMWtWS56Hmsu7JoobDeZmCO9dhJBhwQTyIimJqrf6ObG9yt3FH
 IBC4xl3tlFd+q+j2rWp5kauUYuRdBBBhlylLLzfkCzj8rb5Mlqx+lHDqTi/1Xi0p
 xYfgaUZYup1wUc5VQnSi23b4QTi3y29z7WsnCV5yco2B/TLZEWNdyoysf3DjSHwO
 zRgjACb/K0Cm4IsjZI871oi1ULUnzX6WE1v0N/Z9iBbdR1/90g5hB5SlIfLOE5Rr
 j8dVHYfxxHO2m0B0HU9P8rDxGmjzDOScVZ0E4mtP/z6Jw/pCMmEqKbGpjOw0al3D
 J0m2P3Nl6eJd9AAhEjgGA==
X-ME-Sender: <xms:Ozx-Yy2cuOKZsPin6JRFlotFoa6sYyZ8UdSqb18JPqPgR2ThUdq__g>
 <xme:Ozx-Y1EJXayK432NuOgSQIbUuZsUiQzLmI0-SRxTE0fVr7ZrB_Y9i3KLmCYfbQTw4
 otKOaCMwED2IYXIUFs>
X-ME-Received: <xmr:Ozx-Y64VCMZjQ5g_FHw-3sVvfr2LYijy-GPLGdbQ7EBwS8sPpckBDG6zn5XazqH-9vfSrcbM2f-6HP0RcjgyFWM84T-5GOL75KyZERu5ahzb0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ozx-Yz37NrqEObM2ZFaGlXlzWfTayoFyJG7ZG7AJtJkITHRvP8Lgww>
 <xmx:Ozx-Y1GLoW0e6IOgUrISjpsvSedpyON1fE1a_-00O3kOa4ShyDPcTw>
 <xmx:Ozx-Y8-zhf6WZW_sDe2j9mmK1q5KmqSy4oiGU0UFNdh4c7g-iJvueg>
 <xmx:Ozx-Y3kJRNn2mYPSVveh4Ih6OGuMGel3hc7pMk4LJE29gR33pPaCRmEDwKs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:28:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:47 +0100
Subject: [PATCH 05/24] drm/tests: helpers: Make sure the device is bound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-5-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3248; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wNsajvjIqON3q7bJw3WkW9PEweo110bk3BoBv6W6qko=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tVN7wSOvbo4PeMdy5agR6GWgd23Q+QEVTWP7HA/+X7N
 5e2XOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjAR5RyG/7GqU2dyR0VuLfr69EBSTF
 TjGif5syeTLNdm3XMQ+3yadRMjw0GBtL0z2FM+vlTz8Tmp+JRndU36g6ByPcOn2z45LFywmQkA
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device managed resources are freed when the device is detached, so
it has to be bound in the first place.

Let's create a fake driver that we will bind to our fake device to
benefit from the device managed cleanups in our tests.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 60 +++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 651aa93a98a8..8bd7c40d0e1a 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -10,6 +10,7 @@
 
 #include "drm_kunit_helpers.h"
 
+#define WQ_TIMEOUT_MS		100
 #define FAKE_DEVICE_NAME	"drm-kunit-fake-device"
 
 struct kunit_dev {
@@ -19,28 +20,87 @@ struct kunit_dev {
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
 };
 
+struct fake_pdev_sync_point {
+	bool done;
+	wait_queue_head_t wq;
+};
+
+struct fake_pdev_priv {
+	struct fake_pdev_sync_point probe;
+	struct fake_pdev_sync_point remove;
+};
+
+static int fake_probe(struct platform_device *pdev)
+{
+	struct fake_pdev_priv *priv = *(struct fake_pdev_priv **)dev_get_platdata(&pdev->dev);
+
+	priv->probe.done = true;
+	wake_up_interruptible(&priv->probe.wq);
+
+	return 0;
+}
+
+static int fake_remove(struct platform_device *pdev)
+{
+	struct fake_pdev_priv *priv = *(struct fake_pdev_priv **)dev_get_platdata(&pdev->dev);
+
+	priv->remove.done = true;
+	wake_up_interruptible(&priv->remove.wq);
+
+	return 0;
+}
+
+static struct platform_driver fake_platform_driver = {
+	.probe	= fake_probe,
+	.remove	= fake_remove,
+	.driver = {
+		.name	= FAKE_DEVICE_NAME,
+	},
+};
+
 struct device *drm_kunit_helper_alloc_device(struct kunit *test)
 {
+	struct fake_pdev_priv *priv;
 	struct platform_device *pdev;
 	int ret;
 
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+	init_waitqueue_head(&priv->probe.wq);
+	init_waitqueue_head(&priv->remove.wq);
+
 	ret = platform_driver_register(&fake_platform_driver);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	pdev = platform_device_alloc(FAKE_DEVICE_NAME, PLATFORM_DEVID_NONE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
+	ret = platform_device_add_data(pdev, &priv, sizeof(priv));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	ret = platform_device_add(pdev);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+	ret = wait_event_interruptible_timeout(priv->probe.wq, priv->probe.done,
+					       msecs_to_jiffies(WQ_TIMEOUT_MS));
+	KUNIT_ASSERT_GT(test, ret, 0);
+
 	return &pdev->dev;
 }
 
 void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 {
+	struct fake_pdev_priv *priv = *(struct fake_pdev_priv **)dev_get_platdata(dev);
 	struct platform_device *pdev = to_platform_device(dev);
+	int ret;
 
 	platform_device_unregister(pdev);
+
+	ret = wait_event_interruptible_timeout(priv->probe.wq, priv->remove.done,
+					       msecs_to_jiffies(WQ_TIMEOUT_MS));
+	KUNIT_ASSERT_GT(test, ret, 0);
+
+	platform_driver_unregister(&fake_platform_driver);
 }
 
 struct drm_device *

-- 
2.38.1-b4-0.11.0-dev-d416f
