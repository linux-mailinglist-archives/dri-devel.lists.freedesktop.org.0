Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B7F73D15D
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 16:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1115510E16F;
	Sun, 25 Jun 2023 14:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E8D10E177
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 14:17:45 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 37B576607143;
 Sun, 25 Jun 2023 15:17:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687702663;
 bh=dFpupq7O24/dJi0HaCEYyiNgtin8JPm9F0yIqnWaVk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0+OzzxSGvVgVt8sVefh7H4+EXSXyTwwKrVbWw6zGU3Q28JXabTCiCl9Ly2PzBAxo
 /gopWwltD2vCBojMYpWUdn5BxO6uxetDwmWJP+wWEbh3+K/zU304y9nJ8wrc1CppjY
 EWhaqa3d6eWhrZdJVzl2wh34LhOPBNheTdlX96/R0AsxAnos/d4GyFkaCgtAIg378h
 WtCgiX7Vpd2JtXjGALxIWrSPi2hJ20AkN33HurUiN2uXwib6B4tHKdR/eHfae+zsKN
 TInsAdk+Xv3JE2gnLR/3nQYMQSpDq4GiRwwPHk+B9CHLLIiRrtoRh0N/R8fFq/oGuL
 X7QGK7C869L4A==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 3/3] drm/bridge: dw-hdmi: remove dead code and fix
 indentation
Date: Sun, 25 Jun 2023 15:17:17 +0100
Message-Id: <ca42985814e9be33b7f8e3a33cea9e18505299e3.1687702042.git.adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1687702042.git.adrian.larumbe@collabora.com>
References: <cover.1687702042.git.adrian.larumbe@collabora.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hdmi_datamap enum is no longer in use. Also reindent enable_audio's
call params.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
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

