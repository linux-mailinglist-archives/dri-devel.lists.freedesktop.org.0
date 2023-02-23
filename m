Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3EF6A0AA7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79AE10EB7A;
	Thu, 23 Feb 2023 13:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCC810E4E7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:35:00 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 08D39660220D;
 Thu, 23 Feb 2023 13:34:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677159299;
 bh=X9j7xcxPWqqju4SwMykvvaoqD5cIUMh5cTk3zCzxcjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ct53OBIozlhWIY3U/hyAhuOh03mRrpYYSm5EBI9k2O1t+NmARG3qpK6MZq7Usp1a7
 e3Fk357GSQz7mhlI3a0J/hSn5f7MgDOuWhdNIUsV3Z+CYohayKPPJRRHaPxL5PYWRG
 9t60KGEUMw9N+JwvU7WsJBKwBzAMyF9Sh3ADLSseFNb0hduGBvGL/FFJrt1nZ2nVPD
 S+OqEa/NcM5b3j8sfa56GsBACsyTpHarPuCc/4k/2x7uFgdlIaixZrqrnSWNQr5+rq
 s7IWJoofM/siC9v0IpFNbNlczNwXdmns2AGOm17TdgEDm5ybSdeschCbrp8VeszaZj
 3oMABsiIUQRAw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v3 07/11] drm/panfrost: Increase MAX_PM_DOMAINS to 5
Date: Thu, 23 Feb 2023 14:34:36 +0100
Message-Id: <20230223133440.80941-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Increase the MAX_PM_DOMAINS constant from 3 to 5, to support the
extra power domains required by the Mali-G57 on the MT8192.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index d9ba68cffb77..b0126b9fbadc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -23,7 +23,7 @@ struct panfrost_job;
 struct panfrost_perfcnt;
 
 #define NUM_JOB_SLOTS 3
-#define MAX_PM_DOMAINS 3
+#define MAX_PM_DOMAINS 5
 
 struct panfrost_features {
 	u16 id;
-- 
2.39.2

