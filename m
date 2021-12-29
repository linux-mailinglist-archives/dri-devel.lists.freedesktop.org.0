Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B148160F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 19:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7125910E255;
	Wed, 29 Dec 2021 18:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FBD10E255
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 18:40:00 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id kd9so19930328qvb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 10:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBrfMQBHSFL3SwPa7Nc8DH1A9jwH7Mgo9sxeYlvNd9Y=;
 b=BEv/5Y4SVKKX3QEEMCdR7CZ+MjTuAUdiJRaJg3TbEd2GDZ8pTaYPIBHtnuSPAAYQUK
 PjRBTTBzf3I0XyjNx+hZTAGpbrpf9JcUYPdLbDmblPljuYiARBKd+2/XCUXcWBk/nVz+
 8dLbBNd6iZZiBLPKPrQS2LIIXbiqIEmrCCVHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBrfMQBHSFL3SwPa7Nc8DH1A9jwH7Mgo9sxeYlvNd9Y=;
 b=OP4FWzDio0zw58lx4RswIYXzxe7krdX+olxpKS8ZVwWBP/NRdwtxUCGexWINaLBZuj
 U/+uzSjsca3W1KJbsZX3iaVma7WBAFAo49xLZWumYyogRGV6AzjYWdd2nYi5ZZfBXeaX
 Ko7pn61DXIViCLWYH8+DIUPq2dVoPLV+nauzNzpc8Gy/JFAUSGXIHSXQJvaYsPkde9tn
 18/QWysUcRIEXguFFisEUG6VmrwY8ANcV8ax6NifnXlYKlq7strGFrg73umH8/qlnlhu
 qNzLf1eXCQAxDle3ftYQkGiL02W/C4yxNABU2RhR2qnykRRFMMPCwk2+2zl1vne+2zME
 nmAA==
X-Gm-Message-State: AOAM530Plg3KnA+AR6cZ7S9taERXgPmuLF0G2yadX+deIIV/8dScsOtZ
 rPFAPkjbSDEejFHgVg4pWllsRw==
X-Google-Smtp-Source: ABdhPJwLJKiEU6WeYBu00grxag0IJalt5yCfThPEhv3NPi0FDfPo6yK8gzVJZDdRCvmSz4Ae7gLLcA==
X-Received: by 2002:ad4:4752:: with SMTP id c18mr24170961qvx.96.1640803199453; 
 Wed, 29 Dec 2021 10:39:59 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:2258:17ef:b383:8855])
 by smtp.gmail.com with ESMTPSA id u11sm19256334qtw.29.2021.12.29.10.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 10:39:59 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: Set default value for Panel Orientation
 connector prop.
Date: Wed, 29 Dec 2021 13:39:50 -0500
Message-Id: <20211229183955.791957-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20211022172413.195559-1-markyacoub@chromium.org>
References: <20211022172413.195559-1-markyacoub@chromium.org>
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
Cc: chunkuang.hu@kernel.org, David Airlie <airlied@linux.ie>,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzungbi@google.com, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@chromium.org>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Creating the prop uses UNKNOWN as the initial value, which is not a
supported value if the prop is to be supported.

[How]
Set the panel orientation default value to NORMAL right after creating
the prop if no DSI panel exists.
Panels have their own orientations, and panel orientation can't be
overriden once initialized to a value.

v1:
Set panel orientation only if DSI panel does not exist.

Tested on Jacuzzi(MTK)
Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0ad7157660afa..7cf71705775f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1040,6 +1040,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		goto err_cleanup_encoder;
 	}
 
+	// A drm_panel can have its own orientation. If there is no panel, set the
+	// orientation to NORMAL.
+	if (!dsi->panel) {
+		drm_connector_set_panel_orientation(
+			dsi->connector, DRM_MODE_PANEL_ORIENTATION_NORMAL);
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.34.1.448.ga2b2bfdf31-goog

