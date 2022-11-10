Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE796249EC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6938D10E7C6;
	Thu, 10 Nov 2022 18:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A093A10E7C6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:49:32 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id ml12so2083777qvb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1dMcFnsO3/YNvguv8K4wmN+bBUS1cmjeX1f+ePDQnY=;
 b=YTL+q7WSt6nqvA0+Gp+LLeUaPOJy6UUN0Ck3Dai7VW6Jmk8S1pQKvUsDdLV/6d+2GG
 SZGybQPB8/BGZU3nZnQ8tPXcMW0sNuIbT0qZwZO2PN9uB8SUl1pSEnqi4cW+LE6XE6HE
 V/ylQrAj91MhnoAdFiHRFqwPErVzUA2yvjEgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C1dMcFnsO3/YNvguv8K4wmN+bBUS1cmjeX1f+ePDQnY=;
 b=p3eOu/UtKe4gr1/JEWAeQVahMjTM9+XRd7WypjnlqJbNCU6FoXyRZmOOByfJeHQofe
 hwJUJ7qYUHjr99nb0WEsGKlMaLMkf5JwCO+3IuIs/HlPEdQd4ElC0rRkNsgD9cG2YJRM
 D0/XbsaznLdTrBji7HJUjUnHjPuJG+y9dloyvsZ9Z6rJG5y3dUxH4dd21xZY+ikGBt85
 WkWM+AdHjqcAXUOEXhashVQn3J1eUodFCh8rOeYxiuZokjGKRUaSmuPNT5x9M0rNcpaU
 /JuvpMnWd3vzEbnwYu44ieL37p8gDLKO30iXEE5LihPqfhgvRtWcy3v8LaeAvFMdsdnN
 yZPA==
X-Gm-Message-State: ACrzQf1FCHZHFdD6EQROnhkEoLQwx893tRGIyXK74RH+r2Jc5V0Wpz2f
 F4yPpBX1qWdoneCwdWOCzryuJA==
X-Google-Smtp-Source: AMsMyM7Ht/yJHP8jgmDrIOgGAzPU+eq4rXXl9wfQm3tvWINhdjq7vkkTROKX15zc8waTOz9MhJclJA==
X-Received: by 2002:ad4:5cca:0:b0:4bc:5c9:30b2 with SMTP id
 iu10-20020ad45cca000000b004bc05c930b2mr50504559qvb.121.1668106171754; 
 Thu, 10 Nov 2022 10:49:31 -0800 (PST)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:4101:1159:30f8:2e7d])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a05622a00c400b0039cb59f00fcsm36271qtw.30.2022.11.10.10.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:49:31 -0800 (PST)
From: Gil Dekel <gildekel@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/mediatek: make eDP panel as the first connected
 connector
Date: Thu, 10 Nov 2022 13:48:52 -0500
Message-Id: <20221110184852.1848917-1-gildekel@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
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
Cc: chunkuang.hu@kernel.org, Gil Dekel <gildekel@chromium.org>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 seanpaul@chromium.org, wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Some userspaces assume that the first connected connector is the "main"
display, which supposed to display, for example, the login screen.
For laptops, this should be the internal connector.

[How]
This patch calls drm_helper_move_panel_connectors_to_head() right before
crtc creation to ensure internal connectors are at the top of the
connector list.

Tested by ensuring the internal panels are at the top of the connector
list via modetest -c.

This patch does to mediatek what the following patch
https://www.spinics.net/lists/stable/msg590605.html
did for qualcomm.

Signed-off-by: Gil Dekel <gildekel@chromium.org>
Tested-by: Gil Dekel <gildekel@chromium.org>
---
v2: Fix copy-paste errors in commit message so it's relevant for this
    patch and the mediatek driver.
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 91f58db5915f..76daaf6a0945 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -386,6 +386,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	if (ret)
 		goto put_mutex_dev;

+	/*
+	 * Ensure internal panels are at the top of the connector list before
+	 * crtc creation.
+	 */
+	drm_helper_move_panel_connectors_to_head(drm);
+
 	/*
 	 * We currently support two fixed data streams, each optional,
 	 * and each statically assigned to a crtc:
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
