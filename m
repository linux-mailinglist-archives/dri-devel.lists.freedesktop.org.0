Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F56A56AD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F9010E67F;
	Tue, 28 Feb 2023 10:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E3B10E677
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:27:17 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 753246602FDC;
 Tue, 28 Feb 2023 10:27:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677580036;
 bh=X9j7xcxPWqqju4SwMykvvaoqD5cIUMh5cTk3zCzxcjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LC9MFIZ8VU3/L0enAm8U1kUxOFCW2IuiudOg7BO1K8C3vbjEaj4wXgWLJUrg/0Zis
 rRNDKijyS67V2kqNFuIeV1gigUbFS2vZFh080XLzKRp5r8P/mQ7D4m0SDtNDhYy6kF
 qnK+KmXVyYQRsm77z9kv1xVRYblldxk29wFAjMFE9esezF1X6Tp+rDcUHT8z5aMsaw
 pk9P9xRXcHewK5FR+l64yqlG4XXWsyPEFPyR9buKrEnejvQtY8E4HzobfY/KZIkpGx
 MUrNbXuhXjYHV1mLedFP9+mrMDqUtNQTrBiJUCLcmJ5LoyBeLQGvk2l0A8tOL2loiG
 jDlydoESAtpgg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v4 08/12] drm/panfrost: Increase MAX_PM_DOMAINS to 5
Date: Tue, 28 Feb 2023 11:27:00 +0100
Message-Id: <20230228102704.708150-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
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

