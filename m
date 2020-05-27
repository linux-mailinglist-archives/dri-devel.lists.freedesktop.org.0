Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB84D1E59C2
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DA36E4B1;
	Thu, 28 May 2020 07:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491556E32C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B22DF5820A9;
 Wed, 27 May 2020 11:50:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=wpVt7MhIxZsbZ
 JMkpP4mIlyTyjudls9LyuYdKN3Ljp4=; b=pnj2XnLV96vUGilZPa4JnZ59m5qvs
 vfEmbfg53mUOazvOm7q8TT8HKUeOIACR7CUp86wOuSUWvmS5hWn9xPdmKSk2f5Lz
 zheK/SZpKXrDNThMXn4v0MPYxpnrKQtPFJbmSFMWzEj5juNz8YCqMHmuYD4KhUEq
 1tIGAeGo2Sn3uNIv8tULGuRs93MPiMry34jrrhCfQAJRJzJc0VHg7eADkAGS3dHr
 vadOW6LmH8Z5uK7Q92ZzEgMt+l44uHNrb4MzCFRwJpWmjQ3dwUVPOPyyPqiSxpEN
 mfNiN3MFQTsLFXixOrFqEe3h8j8Z6yl+rZtTXRJJuMGgkY7tlmUWT8BTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wpVt7MhIxZsbZJMkpP4mIlyTyjudls9LyuYdKN3Ljp4=; b=WyG1EDus
 g6P+LEd/6ZqvkOfmoS1+tf42JZdYw4c/9iYCaCfcbqMMGxZYHFHp8bker3VN+uqy
 kgA2bR25bUPwGisCcnbvkZG0EucZ2i75TjS25SJ2o+3ppbdb63796omM3Cn8HL8u
 Ms4nsZ+oybj5o9g+8VeHRISHyLWRceUHLbh8pi52vxRdg+84CRqWpMBVrA6j+PsQ
 GLQR0LdXb5fUuR7AxEgXqhn38zdo1jgCweXBmgLEA9rU3oxbodtXBV81cCRf2gKM
 PaXma7LvVrC+IKv7GsX+aHofu/BYC0py2YnVh+lI/FPp+eNnl6eq1JqxZjnnHmrV
 8PYZufwO9PVqlw==
X-ME-Sender: <xms:T4zOXjv6_gfKCs-FHi_8abZfC8vEhx5VPPxT2s4q7X8cEbCGM66fhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T4zOXkepu5zGh28UOokfTghtI9Ii2sHm3Riyb1S4rJVNxZQeo54sVg>
 <xmx:T4zOXmw10ewjiPpBds_kNOxDvJsQz3IKyYS9wcoguGMkeDo-7-_M5A>
 <xmx:T4zOXiMzhvfSmIaQjgDuPmXv1aFApUwLaQJZEdm6zG9_jm9OzqnSCg>
 <xmx:T4zOXkMTjolr2Wl7PXWFBOJfGlS_JqTjQVZVf0zFMPjcPy5lPwkglg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54DC93280059;
 Wed, 27 May 2020 11:50:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 052/105] drm/vc4: crtc: Clear the PixelValve FIFO on disable
Date: Wed, 27 May 2020 17:48:22 +0200
Message-Id: <9153ce3f0281d57de817a3c8ea0f12530212808b.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to avoid a stale pixel getting stuck on mode change or a disable
/ enable cycle, we need to make sure to flush the PV FIFO on disable.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index dee8dc7b9409..61e0945a8697 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -406,8 +406,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (vc4_encoder->post_crtc_disable)
 		vc4_encoder->post_crtc_disable(encoder);
 
-	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
-
+	vc4_crtc_pixelvalve_reset(crtc);
 	vc4_hvs_atomic_disable(crtc, old_state);
 
 	if (vc4_encoder->post_crtc_powerdown)
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
