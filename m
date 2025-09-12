Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987E7B5462E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5748A10EBCF;
	Fri, 12 Sep 2025 08:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="dTr7OnW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49224.qiye.163.com (mail-m49224.qiye.163.com
 [45.254.49.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5821D10EBCD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:59:04 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 229880963;
 Fri, 12 Sep 2025 16:59:00 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 01/17] drm/bridge: analogix_dp: Formalize the struct
 analogix_dp_device
Date: Fri, 12 Sep 2025 16:58:30 +0800
Message-Id: <20250912085846.7349-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d263d8403a3kunm813a8c8ea45aea
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxkfGFYYHUMfHUlJSB9OTB5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=dTr7OnW9UPNO6GBtYxpuvQGv6n0ISzicdDZjQVAn/SKrJMNSVHzFFl+VfYebTvBNHEzKmtKMUnE5VD+5F9Ywrg8DzTlvi67r0jCsQ3+1na+CK1WYgoiIaPeyCDrKJ8W3qxBbxn1QWEVPQ9jO0grovEm9twb75bFm4fYC3PrxiYc=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=p8Q9no+T4MDXxyIkiNkZJti3sEtvUKV9beBUeeO4aS0=;
 h=date:mime-version:subject:message-id:from;
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

Use the tap instead of the space for &analogix_dp_device.aux and
&analogix_dp_device.force_hpd.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index b86e93f30ed6..91b215c6a0cf 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -156,7 +156,7 @@ struct analogix_dp_device {
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
 	struct drm_bridge	bridge;
-	struct drm_dp_aux       aux;
+	struct drm_dp_aux	aux;
 	struct clk		*clock;
 	unsigned int		irq;
 	void __iomem		*reg_base;
@@ -166,7 +166,7 @@ struct analogix_dp_device {
 	struct phy		*phy;
 	int			dpms_mode;
 	struct gpio_desc	*hpd_gpiod;
-	bool                    force_hpd;
+	bool			force_hpd;
 	bool			fast_train_enable;
 	bool			psr_supported;
 
-- 
2.34.1

