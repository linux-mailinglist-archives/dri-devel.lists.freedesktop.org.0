Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E7872C2C0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 13:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FE410E20D;
	Mon, 12 Jun 2023 11:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F7710E210
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:24:03 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B2146606EAD;
 Mon, 12 Jun 2023 12:24:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686569041;
 bh=yqMqNpyHVkgq4WKh8+eF7oS6FS05FaX9Qi/K1pSkMuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OZHBoW7A24+wIOKow0V9M960YH+OEywS/jyGMDkYZY+j+VK16dDREqWGBp29SHtJn
 44g56TQBAfs7qppulTdDUxbsrLjZPAC4+EBoUUDKaamzuTKGeorWLbfz1jE5EtKZRD
 hcCo2YG4UgfFGGBTxR/7YKD8lcSeGcp6IUcex381o8sPqtqNycQFCKupOch3+tczdv
 dYG8EB0mPGFvJ6RxGmN7P1f+LZT++iYxAkVccluj1bNo5r4y+raoqa6DJQBv4tVaJi
 KwQdDl/tK6QX/s0JQcfv7k4rtkv7Xc1giI9MD9AHybRbzYGKc88VPrZ/5n2leqVN+M
 3SwQt8tw7lh8Q==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Subject: [PATCH v2 3/3] dw-hdmi: remove dead code and fix indentation
Date: Mon, 12 Jun 2023 12:23:54 +0100
Message-Id: <20230612112354.4034489-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
References: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
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

The hdmi_datamap enum is no longer in use. Also reindent enable_audio's
call params.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 3a788316e2e5..69c0e80b8525 100644
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

