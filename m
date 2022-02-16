Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF24B9AD0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BCF10E95A;
	Thu, 17 Feb 2022 08:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6083510E61E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 21:23:37 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id u16so3198253pfg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 13:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bhyx85Ca7umL5T1Nrqz7zYLAww0aRrYBOsgYjkr5azs=;
 b=ZW83r9mM7J8/oeItG+y2jfxuOY268F8XJh+BZ/RgY1WtiSP4Ij78sxH/K66N+JjFx5
 EiDVRl41mAerXMb+6xRLJCgkxQkIGXwl6uTcqz3fqdwF0wngzAbW5kSWi9ZvBmSf+f9k
 w/dohA9ZNU/iod9vrv1nVhDWGLT0OCK9Gnc6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bhyx85Ca7umL5T1Nrqz7zYLAww0aRrYBOsgYjkr5azs=;
 b=ndmtPLM3BPuGv5C9T0ugY/tS5c09C6dNLPRFTVq4hLYfHdrLyySw3pIhC+imb/ynNi
 ufx/lVwACxZBXUHrTPOFxKSbBN3ScSTfqyuZJ3eSlz+JE/n66hDL7QC368Ci6Fhfj54S
 A3H2lUKUizoreZl5IJsH0H1NVH2nYsOT8GVGUQ2217OGbUXLo8Ok1IRejwfBpp7Tla93
 XAdgsGNyCn8oIEbTfKb8/+e6/QbW7gLV5N4sjBk7tVx7IDUv1RhKVyJw1yoqbznWCnsA
 bKrnNl7Xz1zApGBTXiNt3C2+CTfWMxjlN+3ALa1EKkldm+pWjnXiqYMFrvEab2FROG5e
 0JXg==
X-Gm-Message-State: AOAM531zgcOSd5i/vPyMbMiQiFuoj7m08bQCxFKD6OpvWnOYLnSOmhbu
 DZikwsFsvOZMysHiRieGnCRxgw==
X-Google-Smtp-Source: ABdhPJyErMSSPQ88stDwh/VDox08HE1ZOSRQ6VLWUYZgYHX+FcRZ/cGbahCxHj7lhUyYpKMGGM/34w==
X-Received: by 2002:a05:6a00:a8f:b0:4e1:2619:11a2 with SMTP id
 b15-20020a056a000a8f00b004e1261911a2mr852154pfl.53.1645046616730; 
 Wed, 16 Feb 2022 13:23:36 -0800 (PST)
Received: from f76f9da41d2d.heitbaum.com ([203.221.136.13])
 by smtp.googlemail.com with ESMTPSA id s9sm9091624pjk.1.2022.02.16.13.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 13:23:35 -0800 (PST)
From: Rudi Heitbaum <rudi@heitbaum.com>
To: 
Subject: [PATCH] drm/imx/dcss: i.MX8MQ DCSS select DRM_GEM_CMA_HELPER
Date: Wed, 16 Feb 2022 21:22:28 +0000
Message-Id: <20220216212228.1217831-1-rudi@heitbaum.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Feb 2022 08:24:32 +0000
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
Cc: David Airlie <airlied@linux.ie>, Rudi Heitbaum <rudi@heitbaum.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without DRM_GEM_CMA_HELPER i.MX8MQ DCSS won't build. This needs to be
there.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 drivers/gpu/drm/imx/dcss/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 7374f1952762..5c2b2277afbf 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -2,6 +2,7 @@ config DRM_IMX_DCSS
 	tristate "i.MX8MQ DCSS"
 	select IMX_IRQSTEER
 	select DRM_KMS_HELPER
+	select DRM_GEM_CMA_HELPER
 	select VIDEOMODE_HELPERS
 	depends on DRM && ARCH_MXC && ARM64
 	help
-- 
2.25.1

