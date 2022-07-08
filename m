Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C0956B6CD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5CA1138CD;
	Fri,  8 Jul 2022 10:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991D81138CB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6F0FD32009E1;
 Fri,  8 Jul 2022 06:00:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 06:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274401; x=1657360801; bh=3Q
 s37bYZ6eR+ve910boEUq7N/RZ+c47LJR6JvZc1H3Y=; b=dX7TXz9VEcIiDw235F
 0KwrOp/7f60AO7S+tFuxJ5ZiJLS1RG16SSkNLPyKMVZiNmjxV7vsXp7Qaq3vIYd0
 /0muFKSY4MuiAMUoWtF1ClyNqZZlNy47VDqNOGUOwZtmt5xo4B+busdeYRee5jml
 I/EOkTtqRzK6iZBbwj3upjPexeML/nRdVs21tWsr/JpBR0ZsUQwGWeJHZgtjDGLK
 USCgH/zCvxdHNHsPpiZsMsZnmYBzG88Oal/Y2XhyC0A2kwyVNT5tvtu4EC1x0YFD
 PJXEKnEUeRS98L7rS7/MqovD+fYkZvMML8bEwN/kAM24M8z+9lZrl/UuUoSLUlo4
 2FUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274401; x=1657360801; bh=3Qs37bYZ6eR+v
 e910boEUq7N/RZ+c47LJR6JvZc1H3Y=; b=S7qtk9BZHvLtK9tQZ+YVEw86fvn3Z
 svSLBQ3dRMt6fIwXf6ApKqz4HM5SgNtHfqueE+qSFEg6l7CMnBKWL2bO3JmV5it8
 2uT888H9ATnW6Nw2qgTnuT+yqi/n25gQy+JtbcLuTZRH46kJQ9Ti1zshuc1J8rwY
 req8karm+Cm1sNxj8x5qhwcwFjNjWAeCDXBRzbmi/fX/4n9e8LEvGMAd03DIDxu1
 c2EQPsG5s4B8/96TNHrq+LuNUWlrPLGW40YaFjQE+Ddn1JwiV5z8MEGhFVTtUsJi
 Qbvgjk8jcOojPXzFiUrf9K3OOj1vLdNMKjOju2k6yy5w2PcTZ6FmnphOw==
X-ME-Sender: <xms:IQDIYjQSmRBvX5MERFK6yKPWEtT0yJUp7Qj1wyBTjkbE6yTbRoZTlg>
 <xme:IQDIYkyUbb_iXNt4StpuDDDZZ3n2cCHrvTMX0mLTH3xyIz1qfVk6lliC2Luugc932
 F-S5C3trj32xHYdYI4>
X-ME-Received: <xmr:IQDIYo3EVIomNVYJeclv0ocBBwMEogMnzJ2Vs4Twb6D9SI2OGZQXw0BvcEbOsJKBwYDod3zjumRJUE84IV77rEWJef64eSdJRgog5tY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IQDIYjDKjcttBnNT6VQarXv6Ynqj-EMURLnktD0kBcIroGty9bvEMw>
 <xmx:IQDIYsj6iU9tFapBZ7XMG8e7eK2H_gPVw7WtluFUjkWpu8IoI-F2lg>
 <xmx:IQDIYnoTVvY-rOg6Femkbe9j12cW9287r3C5clPHUbI--PIxUWggpg>
 <xmx:IQDIYkeexgjmHtWnYDKQLgRWjRTd0CjqWW0Qt7hs08R71lddDLnLeA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 58/69] drm/vc4: vec: Switch to DRM-managed encoder
 initialization
Date: Fri,  8 Jul 2022 11:56:56 +0200
Message-Id: <20220708095707.257937-59-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 2e9dc09fc6f0..518b66bcc0b5 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -528,12 +528,18 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
-	drm_simple_encoder_init(drm, &vec->encoder.base, DRM_MODE_ENCODER_TVDAC);
+	ret = drmm_encoder_init(drm, &vec->encoder.base,
+				NULL,
+				DRM_MODE_ENCODER_TVDAC,
+				NULL);
+	if (ret)
+		goto err_put_runtime_pm;
+
 	drm_encoder_helper_add(&vec->encoder.base, &vc4_vec_encoder_helper_funcs);
 
 	ret = vc4_vec_connector_init(drm, vec);
 	if (ret)
-		goto err_destroy_encoder;
+		goto err_put_runtime_pm;
 
 	dev_set_drvdata(dev, vec);
 
@@ -541,8 +547,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_destroy_encoder:
-	drm_encoder_cleanup(&vec->encoder.base);
+err_put_runtime_pm:
 	pm_runtime_disable(dev);
 
 	return ret;
@@ -554,7 +559,6 @@ static void vc4_vec_unbind(struct device *dev, struct device *master,
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	drm_connector_cleanup(&vec->connector);
-	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

