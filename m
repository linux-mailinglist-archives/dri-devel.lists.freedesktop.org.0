Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1F3A5D50F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 05:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DD510E6BF;
	Wed, 12 Mar 2025 04:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MVU8lvmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC76310E6BD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 04:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741753199;
 bh=Op82FnMA6ZPl41SuqG45nSPyrCAYqZpLWkb4fvJiVFY=;
 h=From:To:Cc:Subject:Date:From;
 b=MVU8lvmuywj2g9NPj5JTqM7VeNcV/IjOzcy3gM6He9cqODaXdC4BGprosVhZV50UO
 JEOMFzVUR5IxM/LOqMKt1ymBPzV3ew/f6cDr+lsqI4EerKruGY7mBSIah5xHcb1A30
 Hzv6xcGW0zOxT8KGznUx8qASyCwA14KfoK1gZ941IYqmaQs2f0Xw5cAoVprXYw3gU0
 inIjvAGOSByxaEm7b5i4+aNBJsMa6lNlOsGXaP+p1iBylh7Ia4KnHb4PBPso+YYdlo
 htSmeAZqTLcC6zbIuKQjW9+kylkFG8SepQ+Fro3GDASUlNebF3nq+yq38Gi0bFtypI
 jJ3qtdwGZXOaw==
Received: from localhost.localdomain (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CE33717E0CA6;
 Wed, 12 Mar 2025 05:19:56 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, nfraprado@collabora.com,
 angelogioacchino.delregno@collabora.com, krzk@kernel.org,
 daniels@collabora.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: defconfig: mediatek: enable PHY drivers
Date: Wed, 12 Mar 2025 09:49:26 +0530
Message-ID: <20250312041943.25676-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
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

The mediatek display driver fails to probe on mt8173-elm-hana and
mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
configurations.

Enable the following PHY drivers for MediaTek platforms:
- CONFIG_PHY_MTK_HDMI=m for HDMI display
- CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
- CONFIG_PHY_MTK_XSPHY=m for USB

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Include board details in the commit message.  
  - Sort newly added PHY configs in defconfig.

---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..87e8cbd3fd26 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1572,7 +1572,10 @@ CONFIG_PHY_HI6220_USB=y
 CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
+CONFIG_PHY_MTK_HDMI=m
+CONFIG_PHY_MTK_MIPI_DSI=m
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_XSPHY=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
-- 
2.47.2

