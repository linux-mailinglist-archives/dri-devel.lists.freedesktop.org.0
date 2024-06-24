Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F1E914092
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 04:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDC610E19E;
	Mon, 24 Jun 2024 02:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QOZAyQex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F9810E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1719196884; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=/xgdevl4TYnHfGR8fctsT0v4UfOOmmnya9bKIxDS7gw=;
 b=QOZAyQexw+fRX+OQOj255xEP45jcEEntFqAxUYKlt3+oL2cBy7o0ItcvjNc04HV3ery9me2ydgtSSWEU5zfhGjNfV+HrXAxXk+hwgnkmNqauNiir03oQ0usz/jbK7mgh9mQtpO7VRGt5P88TDo9eSSff9Ewocu+1MKavKAoYy1Y=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067113;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0W90yZxq_1719196874; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W90yZxq_1719196874) by smtp.aliyun-inc.com;
 Mon, 24 Jun 2024 10:41:23 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: yannick.fertre@foss.st.com
Cc: raphael.gallais-pou@foss.st.com, philippe.cornu@foss.st.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/stm: ltdc: Remove unused function plane_to_ltdc
Date: Mon, 24 Jun 2024 10:41:13 +0800
Message-Id: <20240624024113.54850-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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

The function are defined in the ltdc.c file, but not called
anywhere, so delete the unused function.

drivers/gpu/drm/stm/ltdc.c:494:35: warning: unused function 'encoder_to_ltdc'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9403
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/stm/ltdc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5576fdae4962..3f280155e25c 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -491,11 +491,6 @@ static inline struct ltdc_device *plane_to_ltdc(struct drm_plane *plane)
 	return (struct ltdc_device *)plane->dev->dev_private;
 }
 
-static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
-{
-	return (struct ltdc_device *)enc->dev->dev_private;
-}
-
 static inline enum ltdc_pix_fmt to_ltdc_pixelformat(u32 drm_fmt)
 {
 	enum ltdc_pix_fmt pf;
-- 
2.20.1.7.g153144c

