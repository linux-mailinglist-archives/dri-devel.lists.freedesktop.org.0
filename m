Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501842CBEC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E0C6EB5C;
	Wed, 13 Oct 2021 20:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A456EB57;
 Wed, 13 Oct 2021 20:49:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 848C558117C;
 Wed, 13 Oct 2021 16:49:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 13 Oct 2021 16:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=JGdyj4Z1k00E3
 EhPZP8xNXDzAW/iLqk7RYYsaxdxC2o=; b=KPyTnTKaEsZhOEudKbTkuUljaIWgO
 O0Oa7fj8+ywr6UaGaemCQ2WG+4qvmID+see8zbU7B+DpPIp1JYueUaY/G3u4Oxw/
 XC2t3RxCoEyCggNXgTy0dJaWOSyVlrfViTwIcP+KewBAVQTTxOTdZZ2FTMFrShEn
 8HjtO43NRDxq63+Z9Fp2Aw1DQrVEytvKWuAAZ28XoxRTPXuPHsn98TPkA565E1JY
 s/d+B3XRMrrd68IMM4fy5ZztTGyqs+9SYvyWKfJeWS6tehFJIA6WPIjillwi27UM
 3tl8I/lPjXZCOI1pn3vVgzuVGNLtSV2sXyGZqphaNprcf0ixkWxXzySzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JGdyj4Z1k00E3EhPZP8xNXDzAW/iLqk7RYYsaxdxC2o=; b=YRfILJKC
 LDWnMXe/4TWYmCm9/M0y22ljaVUTMTiCiNUvQyjK8JIPRKnNsaoSHTC++1N1uVCL
 qwrCA/Lz+TML+vY3LrkPSVfSnE6RxAPSkW9xZSHgoKxX1r6bCvnYvbpulct6xLWz
 RRkzNO8TYZtbrBbdsb9HqfDK0hU7+61U2/I2kvfDajXo043XJhSBIkgbHwmqEGVT
 GOikMq+d9/sdYQhdQVnMduASmTvDuZtYpAsx/NwRz55MuxaE3mm4CrbHedK8Uo08
 iWsaJTqcCzhEvcm1NhQTbsYpT2PtfjlT+xmCPmI1Ix0s6wJDflB6fKCumENhPgy/
 cAbVPSUNtlyTDQ==
X-ME-Sender: <xms:cEZnYR166C4MQSmAee2PA1YjygVvJjL6d_aN_obPV62asFyx17i2Eg>
 <xme:cEZnYYEoZNe8M_sdSedOrNENN-BIH5UuWKuvRZg76En-4WUWRkyScA5ukZon5ZvFa
 2psQp114SzdQq7ueQ>
X-ME-Received: <xmr:cEZnYR59Vd6hWXOlt9NoJvlACJ0gXvHyoiOF4gW8QHCQSwbLTOcqcfMi60MJEY-njYtW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeefnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:cEZnYe2lWhmq3IeFM27MzHEdXmJtPLMuakjjxCQL-YEJRjIjv1G-3A>
 <xmx:cEZnYUFYa_V__LJt_aN0kmR2ugY7hNnq1pnKAIcTG6rcxsrPf2bOHA>
 <xmx:cEZnYf-V0SrtyQvuJknidImeO97gMyRQianffFDYJIsbtXPtZ3eKyg>
 <xmx:cEZnYfAbyVH5EYiFEXKlBHx7-qqCUzIykJXZDiQg46iJ6vXLPRX6Qw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:49 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 20/20] drm: cleanup: remove acquire_ctx from drm_mode_config
Date: Wed, 13 Oct 2021 22:48:46 +0200
Message-Id: <20211013204846.90026-21-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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

The previous patch removed drm_modeset_{lock,unlock}_all, which were the
only users of this field inside the drm_mode_config structure.

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 include/drm/drm_mode_config.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 48b7de80daf5..b214b07157f2 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -383,16 +383,6 @@ struct drm_mode_config {
 	 */
 	struct drm_modeset_lock connection_mutex;
 
-	/**
-	 * @acquire_ctx:
-	 *
-	 * Global implicit acquire context used by atomic drivers for legacy
-	 * IOCTLs. Deprecated, since implicit locking contexts make it
-	 * impossible to use driver-private &struct drm_modeset_lock. Users of
-	 * this must hold @mutex.
-	 */
-	struct drm_modeset_acquire_ctx *acquire_ctx;
-
 	/**
 	 * @idr_mutex:
 	 *
-- 
2.33.0

