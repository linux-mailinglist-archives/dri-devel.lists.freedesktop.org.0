Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FEF437BD5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 19:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD4F6E804;
	Fri, 22 Oct 2021 17:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B31C6E804
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 17:24:20 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id j12so5333054qkk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 10:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bhRqLM6yW3BElMhr6p8JxBlLhkjCyrvm/fO8BA6PxAc=;
 b=n0REBVugNN6h/yPp0kthsRhifZEkvICP1H0DNb4lHJcDlVhDv7nMaKJ2Vhs+3mG8wb
 P+9hayC3ZcaTRQbQ6Yg/emEujycTI0bGB0+E/8Au1iQ2EaTxB9N8pARvjQsu5l7fjzyx
 LXthrCGguKWkBeGh5u6EqjmXuYKmprV7mEMPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bhRqLM6yW3BElMhr6p8JxBlLhkjCyrvm/fO8BA6PxAc=;
 b=s1ef4ZMJ3fzcYGhIpDqTCvSiKhkcR2w6BoIGmo0svTF/chgiOmz4nKJ705I7LIGKHM
 XCaN5BOdfRNevaLxEwBQIrzpKJfKEYw70EjcStdDsSE9JUihAV9TCgR9f4HZMHjpLHge
 w/V9snjKyG4QvhI/k0rKvnAihmJixhnL9Xv+p2yBOoaVqVwkfjTQpkx8SKf0ZQkFvT0v
 ck5dG0y+a73s1af4VCExvHYE8gQtKs2FIayFx6yekuGi6fhTwIDOZxt+8didiNwOJqjV
 o5nFhbIDNkxjZOGYVTwS6ZcWppz4uxGYDEx1tZQ3yNmHrhDVafFZu7Yw4oXJkjX9dvvw
 9BEA==
X-Gm-Message-State: AOAM532WTM6PgpheX+ZnLSJdKQ2sAQUN6LaTynwTUKP8YUF9zSvpZvgo
 B7QpI2qmeOh4LmPrvlA3J260Cg==
X-Google-Smtp-Source: ABdhPJw5+Z3gbQpB89P9MYXrYchvZhhA7n6NVaZf4RXniPOT8qvw6+uopCRuEw1xS7/oSzdg0o1iFw==
X-Received: by 2002:a37:a2c1:: with SMTP id l184mr1122332qke.71.1634923459566; 
 Fri, 22 Oct 2021 10:24:19 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:6c36:8d9f:c50a:b0f0])
 by smtp.gmail.com with ESMTPSA id m17sm4607611qtx.62.2021.10.22.10.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 10:24:18 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mediatek: Set default value for Panel Orientation connector
 prop.
Date: Fri, 22 Oct 2021 13:24:03 -0400
Message-Id: <20211022172413.195559-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
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

From: Mark Yacoub <markyacoub@google.com>

[Why]
Creating the prop uses UNKNOWN as the initial value, which is not a
supported value if the props is to be supported.

[How]
Set the panel orientation default value to NORMAL right after creating
the prop.

Tested on Jacuzzi(MTK)
Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0ad7157660afa..b7c2528a8f41c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1039,6 +1039,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		DRM_ERROR("Unable to init panel orientation\n");
 		goto err_cleanup_encoder;
 	}
+	drm_connector_set_panel_orientation(dsi->connector,
+					    DRM_MODE_PANEL_ORIENTATION_NORMAL);
 
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
-- 
2.33.0.1079.g6e70778dc9-goog

