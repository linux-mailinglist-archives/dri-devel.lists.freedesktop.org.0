Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A70AB087B7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 10:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF8C10E7EC;
	Thu, 17 Jul 2025 08:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="dOC1rXOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id E48F210E2F2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3F
 ZEPCuqg+j4PT7ny21iPN/qrpZr3fDoK5twCI5iDpE=; b=dOC1rXOu1U0D9+7e+e
 lzeBQSrZJq++NdbuV21sILbGHtcJNc5sQpNSokou6Gak95PKGE4SxIultwM/N646
 du53zl3+WZ3uEY1BjRWO2wzegiZDpcK3N6yf+eA+NGmyNznjimozulMhAKF3LP3Q
 MPevJqYUUvsNOzWFTSIjXS6Uc=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id
 _____wCHFbq9sHhoLS7XFQ--.22249S4; 
 Thu, 17 Jul 2025 16:13:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v6 2/2] MAINTAINERS: Add entry for Innosilicon hdmi bridge
 library
Date: Thu, 17 Jul 2025 16:13:37 +0800
Message-ID: <20250717081344.1355613-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717081344.1355613-1-andyshrk@163.com>
References: <20250717081344.1355613-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHFbq9sHhoLS7XFQ--.22249S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy8CryxZF1DZryfKr43trb_yoWfCrg_GF
 1xA3y8Zr4UKFWjy397Ca1fX39Ikay8JFyfXFs5tws7tas8Aryqqw1vgryIgw15CF1rGa9r
 Zay5Xa4akry3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnkWrtUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEhqNXmh4qEf5MQAAss
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

From: Andy Yan <andy.yan@rock-chips.com>

Add entry for Innosilicon hdmi bridge library

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v5)

Changes in v5:
- First included in this version

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d97e091b1742f..f944acf7923a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11945,6 +11945,14 @@ M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
 F:	drivers/power/supply/ip5xxx_power.c
 
+INNOSILICON HDMI BRIDGE DRIVER
+M:	Andy Yan <andy.yan@rock-chips.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/bridge/inno-hdmi.c
+F:	include/drm/bridge/inno_hdmi.h
+
 INOTIFY
 M:	Jan Kara <jack@suse.cz>
 R:	Amir Goldstein <amir73il@gmail.com>
-- 
2.43.0

