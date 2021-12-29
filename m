Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C54481618
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 19:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C281210E27D;
	Wed, 29 Dec 2021 18:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30F310E27D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 18:44:23 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id b85so20691576qkc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 10:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Shoj+Q3yMEhM9mNXjLtdxgk5LZJhKA/O7LXTWfiwLQM=;
 b=jgyyqpkTqrJBnuET9DIU54lJy4W8PO4nKpAL8mj0vtTNJ7L2teQmhIXYbq7PXu/bIP
 aF0tOBxel+clKcr1H23Y8mUqiVHiNuA3XeSKaES7ORtpX9JVc3Cz1vKhgW0vsIL0s3N1
 DfXRXFbSgYCEUFCzF5IigkowIGyEPx9Ac7RdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Shoj+Q3yMEhM9mNXjLtdxgk5LZJhKA/O7LXTWfiwLQM=;
 b=eW+FYvYwjR7B/tKkK6nqa1T+KEsf+aD7fxU/vIjFdT8kSJ2pFNbCR2amAUmIjEgynm
 11DtLpLE3iEHcijQpd/h57ONB6NBNzhMS2jTjWlSURAYA8/GCGO3JTIDSXih+lRNNEim
 6uo+/CspGReoxaOE3/Ur0xrBo5wTp6djJvX2j79Z6wE7o6vu1jm+YKdRjmYPD2bsQkuH
 LMBD/JgQDCe5HQJmCEWw7PZX9dVz4kBk6yUhIF0ISSwvf6653zFIgBnX5bNmYke+VRGD
 ONMH+ZKjA55ZhY6PNfV2nax+aT6vdA+jkt2E6iqNpWmnPYQQW89HoAja+CHHD1cBMPWS
 RV/A==
X-Gm-Message-State: AOAM532doAF7VFslV/3Xiie3BfwPnL5G8EwwMlGR3ojNhabUtSU6WXsH
 11f55cGd0xT2MtHCkXFxe9AHjw==
X-Google-Smtp-Source: ABdhPJwiO+gX4HKdmMuEU6gcsV2DoE2Pu4VLhKUqPMTz+1itpbMofq19YOFiXpnHdZkSZhR/1fu46w==
X-Received: by 2002:a37:755:: with SMTP id 82mr19397299qkh.89.1640803463092;
 Wed, 29 Dec 2021 10:44:23 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:2258:17ef:b383:8855])
 by smtp.gmail.com with ESMTPSA id e7sm19130365qtx.72.2021.12.29.10.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 10:44:22 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: Set default value for Panel Orientation
 connector prop.
Date: Wed, 29 Dec 2021 13:44:18 -0500
Message-Id: <20211229184420.793234-1-markyacoub@chromium.org>
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
index 0ad7157660afa..9d33dd93118e0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1040,6 +1040,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		goto err_cleanup_encoder;
 	}
 
+	/* A drm_panel can have its own orientation. If there is no panel, set the
+	 * orientation to NORMAL. */
+	if (!dsi->panel) {
+		drm_connector_set_panel_orientation(
+			dsi->connector, DRM_MODE_PANEL_ORIENTATION_NORMAL);
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.34.1.448.ga2b2bfdf31-goog

