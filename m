Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE040EC99
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EADA6EA6F;
	Thu, 16 Sep 2021 21:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6397D6E93F;
 Thu, 16 Sep 2021 21:25:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 0F7A92B011F0;
 Thu, 16 Sep 2021 17:16:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Sep 2021 17:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=84fUwuxauQEIo
 8ROgvUlA+lf+FW+ZYdcIkY6uUfv0b0=; b=RJoWj4tOk7NvnP6UUKgjFp2R3+q1S
 IwaYzA2yoX10b5n0g4N0CYgqvHQE44TpcuCoWXQrkoOiQifEaDg7wOFKY+7EONY2
 x2ZQOf2qUimvSr2tGJyTZUtBZiC/ls1Gp1QQVqvcf970R+dhVbQX+ClA7qZYWkGi
 gqQboaOIfCwmp4ozv+XFYFN4eH2ZzZiCB+jx+oATf/2ROynIUp6iIg0kszq9ebA1
 y682ne16HENIHTG46loiH/sZBD3KG3jRQvFSxw1qo+mzQmKaPqkJwrkxafFl2MBD
 z8dvQYxvgowPcIAdICLP1L7OYk++KYRe90K7uDU8ZRR+czklZ7i5d6N8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=84fUwuxauQEIo8ROgvUlA+lf+FW+ZYdcIkY6uUfv0b0=; b=R2ZpAS4J
 9bUrGuRl+8fnRWhsKXJnBKi1APHUsk9RFz/edk4qZ4mY2NzivnZXxl2HlhvoYtzZ
 vvhyrDZrYzFzJnw8AriKJPRMaT4Rz7zoDTPcfUvrnNaOTqwNnDpE6/h2dOwrh2tA
 guyvEguhyEk3pSarr0uG2xg7puy+9U0rNCR5zipsdJu7m0XRsNuTWnjkByDxsdC1
 T5l3sXyzUVXmcX4k+185I9ax7KX1W9QvrhsDDv77ao3mcgarpuI4JIIedkCs6n3M
 I7BGSnEVux8j2aBwhGUy/isb6IpEzLjlKsWn4/ybb7etgLHP7wRx33zmPuzMm3R+
 IC4m4ZPViRo0Rg==
X-ME-Sender: <xms:NLRDYSMz0niIQ2RtDAwKSvB3FBceHSas7doJNvM9Y5m_-CORq9LIJQ>
 <xme:NLRDYQ9UqxF0dmjMkcc5plJ63D34WgvO40Cq0-j1f-YdNSk5pcM-Aq_6DSO-fGvAn
 ThnlDXWmmsNkor4Ig>
X-ME-Received: <xmr:NLRDYZScrOoiXX7WuEObDTdPk7blp-s3DIDmSRTAg53lEHQVHdDyJ_72uNT89BaNW9Iv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeegnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:NLRDYSsPf_W-19_8XwvUgkRa0oufhXWXU1DIMZc0jIDhnguHRWxi6A>
 <xmx:NLRDYafboTCADGtSGsc2oDXTqYZJQJLyfo6xI8F7CuYb1fCHLJ2w9Q>
 <xmx:NLRDYW0sHfFJEphzpcltPvMAddUnHM6V2Ju5qQceaNR65A5RsYYwlg>
 <xmx:NLRDYa5Q8m-Mi-Xaxv6b4fsj0yqDkJJehYjXvmlt_pPIrfKS5gkbgsWKG-0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:34 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 09/15] drm/omapdrm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:46 +0200
Message-Id: <20210916211552.33490-10-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
References: <20210916211552.33490-1-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/omapdrm/omap_fb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 190afc564914..56013c3ef701 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -62,13 +62,15 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
 				  unsigned num_clips)
 {
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(fb->dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, 0, ret);
 
 	drm_for_each_crtc(crtc, fb->dev)
 		omap_crtc_flush(crtc);
 
-	drm_modeset_unlock_all(fb->dev);
+	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
 
 	return 0;
 }
-- 
2.33.0

