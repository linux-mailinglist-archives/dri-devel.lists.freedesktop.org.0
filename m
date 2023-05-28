Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048497139CE
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA99A10E16B;
	Sun, 28 May 2023 14:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D041A10E0A7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:00:12 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CB0DE6605703;
 Sun, 28 May 2023 15:00:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685282409;
 bh=WAUfQLx2Jieo3ZVT9QyOs1XdimqsQfzrhTGzzHuNnqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UsaflhS5AUD3IUDGG6mJOWvSWM0RdyCm9XK+eqwZkw9l/nH4lpxycPGbEg9/MeXXG
 ZhGm1aTOxrXsJmtyOqzR8ryyu9rm7Ffyg2ojaXsWTmW3S7+GIQhZd5aLZhhrYeSyup
 QbrL9PRvSt9mTXrPanRbAoMa/5mEpFqdZA7Rcz+iCu1RYZpMc4nkb4ye9olrJO9HQI
 TOWDh7RVXQCzrGf6+wGRfc2CNJQ69oSjCh4NLhTnHOocDLc1Wrtcd6Xn94AI4WZuQt
 vNdeTydpq+nBvYtasHTIYBf11AxAFFh3D9g2OMPjhTShg570rvsAKLDBsOvBPh+isy
 MiQWbMOR/KVow==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Subject: [PATCH 3/3] dw-hdmi: remove dead code and fix indentation
Date: Sun, 28 May 2023 15:00:01 +0100
Message-Id: <20230528140001.1057084-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
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
Cc: adrian.larumbe@collabora.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 1afb8f2603a0..0accfb51509c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -49,20 +49,6 @@
 
 #define HDMI14_MAX_TMDSCLK	340000000
 
-enum hdmi_datamap {
-	RGB444_8B = 0x01,
-	RGB444_10B = 0x03,
-	RGB444_12B = 0x05,
-	RGB444_16B = 0x07,
-	YCbCr444_8B = 0x09,
-	YCbCr444_10B = 0x0B,
-	YCbCr444_12B = 0x0D,
-	YCbCr444_16B = 0x0F,
-	YCbCr422_8B = 0x16,
-	YCbCr422_10B = 0x14,
-	YCbCr422_12B = 0x12,
-};
-
 static const u16 csc_coeff_default[3][4] = {
 	{ 0x2000, 0x0000, 0x0000, 0x0000 },
 	{ 0x0000, 0x2000, 0x0000, 0x0000 },
@@ -856,10 +842,10 @@ static void dw_hdmi_gp_audio_enable(struct dw_hdmi *hdmi)
 
 	if (pdata->enable_audio)
 		pdata->enable_audio(hdmi,
-					    hdmi->channels,
-					    hdmi->sample_width,
-					    hdmi->sample_rate,
-					    hdmi->sample_non_pcm);
+				    hdmi->channels,
+				    hdmi->sample_width,
+				    hdmi->sample_rate,
+				    hdmi->sample_non_pcm);
 }
 
 static void dw_hdmi_gp_audio_disable(struct dw_hdmi *hdmi)
-- 
2.40.0

