Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B064EFFEC
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 11:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D122210E55C;
	Sat,  2 Apr 2022 09:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEBA610E55C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 09:04:41 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:50516.2041797902
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 0C0AC100220;
 Sat,  2 Apr 2022 17:04:20 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 c6af562be1e942a488da19a4a438c4b6 for mripard@kernel.org; 
 Sat, 02 Apr 2022 17:04:41 CST
X-Transaction-ID: c6af562be1e942a488da19a4a438c4b6
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v15 4/6] MIPS: Loongson64: defconfig: enable display bridge
 drivers
Date: Sat,  2 Apr 2022 17:02:50 +0800
Message-Id: <20220402090252.1700974-5-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402090252.1700974-1-15330273260@189.cn>
References: <20220402090252.1700974-1-15330273260@189.cn>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ls3A4000 evb board ship with adv7123 and tfp410 while ls2k1000 PI board
use a DPI panel from FORLINX company and a sii9022 HDMI transmitter.

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 arch/mips/configs/loongson2k_defconfig | 5 +++++
 arch/mips/configs/loongson3_defconfig  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/mips/configs/loongson2k_defconfig b/arch/mips/configs/loongson2k_defconfig
index e948ca487e2d..0a97c332a5c3 100644
--- a/arch/mips/configs/loongson2k_defconfig
+++ b/arch/mips/configs/loongson2k_defconfig
@@ -243,6 +243,11 @@ CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
+CONFIG_DRM_DISPLAY_CONNECTOR=m
+CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_SII902X=m
+CONFIG_DRM_SIMPLE_BRIDGE=m
+CONFIG_DRM_TI_TFP410=m
 CONFIG_FB_RADEON=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 25ecd15bc952..35e2fc998768 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -280,6 +280,11 @@ CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
+CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_SII902X=m
+CONFIG_DRM_SIMPLE_BRIDGE=m
+CONFIG_DRM_TI_TFP410=m
 CONFIG_DRM_QXL=y
 CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_FB=y
-- 
2.25.1

