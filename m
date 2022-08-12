Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B6D59168B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 23:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D9118B4D1;
	Fri, 12 Aug 2022 20:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F20014B512
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 20:58:43 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4M4GHQ42MNz9s2H;
 Fri, 12 Aug 2022 20:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660337922; bh=YOSyDteCND3ndEMO86/nMvrstN4s/JMsBfnofZVgVAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BALkIqQaiZYXrIeHgtiGpfaBeTlXeWWyt4oxfTuEyQ/zSbf0BI74Kg9u2mii+gFKH
 NZooC5yEs/JF3bEjJ1hIL+tca2L0b+D3+QeArqjGjrKH/xDrzFobvYx8odxTidCjA5
 /oF5ET0c5Xh1c0Om5L8twfKnckTyLy1o2iOb0eWQ=
X-Riseup-User-ID: F6D98B7A89F4D59F7332F4EEFE6090DFB94B7A174B3A4C1F90ADC9E4F4AE482D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4M4GHM57VBz5vTk;
 Fri, 12 Aug 2022 20:58:39 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/5] drm/msm: Drop of_gpio header
Date: Fri, 12 Aug 2022 17:57:44 -0300
Message-Id: <20220812205746.609107-4-mairacanal@riseup.net>
In-Reply-To: <20220812205746.609107-1-mairacanal@riseup.net>
References: <20220812205746.609107-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These drivers include the deprecated OF GPIO header <linux/of_gpio.h>
yet fail to use symbols from it, so drop the include.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index f6ab3b5586ce..9a1bd92dcdc5 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
  */
 
-#include <linux/of_gpio.h>
+#include <linux/of.h>
 #include <linux/phy/phy.h>
 
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 93fe61b86967..f178c424257b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/of_irq.h>
-#include <linux/of_gpio.h>
 
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
-- 
2.37.1

