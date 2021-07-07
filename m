Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3D3BE5F2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52EC6E07D;
	Wed,  7 Jul 2021 09:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FD46E083
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:51:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 3761E2B007A7;
 Wed,  7 Jul 2021 05:51:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 05:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=WSJ1elncdkKB2
 GBmNc1T6E2h3Za7yGocjy6KSumGTP0=; b=efJGcFmzfYygmNAM2kqwTx/9GfdHF
 J72RLIIeJ4vGeloz+k2nZriDw6EZ/DZraKjYYe26zo501Nh4D3+6ifgj76CjF+VF
 ZVPXOXsHXYegi7MA4vW1Q0W+QQdfIt3d4P1qFZJogvOm20Z9QmhJ+pU1yziy6NBv
 ZfvFHh6qQHkZ3Nn7XtDsksYJtKonwAySs1OnFieNH63aF8qpYljatH6zC1Y2oDGW
 3n2tmFkQ+BqLO8BiPk1HpulqgqQQYUqrJCf7AQBKmFB4YfyIrLwIjbZOI4yN+Unt
 rVgMKc0luA5HZVl5z5A9KiJWyK+4eMcdMT0JlVJbn/a6gxT5F/60PDuLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WSJ1elncdkKB2GBmNc1T6E2h3Za7yGocjy6KSumGTP0=; b=lJP04q6A
 +CmAFBgm2kHOeYttMEB9NCarU460yg5ha8jK7Q70egtMQPlVvq+czSZA10mlD9pg
 AKiZn7zP2T5VHPHsI8tox0XjnFuT4XnviO7+41ZoKGHLacjynLCg+4sORYv2QXql
 RX3P62JJaWMgyyPgToZzojR+T+2hJuj7FWGo8ppX9Z660B28lN9FXy0GtXWhIGpn
 zaahWjvMo+2W7Y9taRo+I0T5Hi7+Q14rEHzQqX8Nbj+RMyz6rq9wClAHK8BRQChF
 9ZYmjW2ClIcD4GaxGj3LT/qfqf8gp09ULy7vdAA46lympZSiQ6q7Mn3WFVKHR2WD
 rSaXyfaWAeoQnQ==
X-ME-Sender: <xms:IXnlYK9imcCzMzfKEw8mqFvGOcB0keMm-fuh_-785aQOIE46mRQxyA>
 <xme:IXnlYKtaQtM59F-1v-icuQXpU2EFXVOdLLKt0iHRhCZ_4OE3pqJ4SYDxIMe1QViW-
 Ll7oOljm7UVZgvPyoc>
X-ME-Received: <xmr:IXnlYACVumf2Vx-glZ0mCZts0UpkB-pgwHItFzFrp64BEPAWCuxvtAULtB7RYejgV7IiOh1pHE6sTYjiYvIKOW4U8KCtNwkZGKrq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IXnlYCfdMm1WL6S6WuKxnksoQ4lFHlLWWtGHjJJVUq2hBGho4yCung>
 <xmx:IXnlYPP3kB-y2Lpr-CRn8DBQ-DSYDgq43zhfaTZBaKYCud6iTzHxcQ>
 <xmx:IXnlYMmAaH7s_DzqPYeVTLs_7rFzEXqo12pwmTinwb42xwMYIzhu7A>
 <xmx:IXnlYMdQVupziuaTq1P7DGngWPVIxZGOf_-K55kJRGIGGBCJFfH5z2M8mKk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:51:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/3] drm/vc4: hdmi: Only call into DRM framework if registered
Date: Wed,  7 Jul 2021 11:51:12 +0200
Message-Id: <20210707095112.1469670-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707095112.1469670-1-maxime@cerno.tech>
References: <20210707095112.1469670-1-maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hans.verkuil@cisco.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our hotplug handler will currently call the drm_kms_helper_hotplug_event
every time a hotplug interrupt is called.

However, since the device is registered after all the drivers have
finished their bind callback, we have a window between when we install
our interrupt handler and when drm_dev_register() is eventually called
where our handler can run and call drm_kms_helper_hotplug_event but the
device hasn't been registered yet, causing a null pointer dereference.

Fix this by making sure we only call drm_kms_helper_hotplug_event if our
device has been properly registered.

Fixes: f4790083c7c2 ("drm/vc4: hdmi: Rely on interrupts to handle hotplug")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 50393a8a42b3..31c28252c5f5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1580,7 +1580,7 @@ static irqreturn_t vc4_hdmi_hpd_irq_thread(int irq, void *priv)
 	struct vc4_hdmi *vc4_hdmi = priv;
 	struct drm_device *dev = vc4_hdmi->connector.dev;
 
-	if (dev)
+	if (dev && dev->registered)
 		drm_kms_helper_hotplug_event(dev);
 
 	return IRQ_HANDLED;
-- 
2.31.1

