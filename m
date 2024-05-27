Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B488D0364
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C726C10F452;
	Mon, 27 May 2024 14:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EHlTA4fc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C837D10F452
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 14:23:52 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6f6bddf57f6so6539551b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716819832; x=1717424632; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O7X6X7Xg0a7P3rLwok0YLujXGrmUyMxWDQ/9AezaVG8=;
 b=EHlTA4fcI7EKupPQnlZzL84q5NzsqcF3TgqHj6HDS61JK6TqxAHN+1Ud7LrErVgL9l
 P2BLX+wvmUz6FLwpFMQwSrmhtczszsyZlCeBMmMMhPcNiywt2HLcMHGdX84AmLrEU4Oc
 dHHgqKGvSFreSnJdWr9v5VwWuEMJosU80etNEazuuJAoON9FRWBHrLAjej4Ni1Fz0Jqz
 Qz7MxnjzQR4m2S2gS0u/IhZ89RiOOOlrHigT4P3Kftid4tmCHhV122eNUmN8/AmlaAJM
 sDaJg+2tfl4EI/gyOW0pURVYSAWFF0LaNY784JnPHxp81UqocvMuMdC626L+lGEVHHjo
 4pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716819832; x=1717424632;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O7X6X7Xg0a7P3rLwok0YLujXGrmUyMxWDQ/9AezaVG8=;
 b=OiOABI/zlHQOuDxs24teP1FiYPG6m/3JVE/Dp8ch4O68/IHpPtHUNpYmGTcaGwRI0O
 smQCIDPQZ0mp/NeJuz1YBndljvPRVjeAMwLitZag9fLLZh14u6WBDrxWuXb/n/7qO/OK
 epZ1hQmq2un7r/AgrhD+23xx7QGTEbO8y1VKtF3XWYiw5tEA8QX0hkKLMt6qAwd7XGrp
 8QbpKJE9SKkTV+EAcH39aoSmHH1byNNsqQNiJvJbF7Shx2WcOi1jdoYqjDmNYSF0lpkv
 NZYnakvODcAW9Z0Hi1TR+m47ovDYjfSq+DefnAEl5f9JLRyF/gmAHDKKUl1kA7AV4+lf
 jT7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwNRuKwA+AVcTNyH04GUHTVH9g31RSnuj3C+58dJ4B4yvBuXWNwUK4i1Bz9HcqI/tke4OthP3ytOFNqAyHSOV9jBz7gRfCJmS+Me9SqcB0
X-Gm-Message-State: AOJu0YwIRe+qRC9dcsI9ZIhuA5g5002PXXm9ea8+iJ2K1ZiPSXWr/QLp
 nnTI3o3oLVgvy1wZTdNj8JKwxcOAvfjpv3OPivuHfqkyYZetBJa6muqYyEXYxjY=
X-Google-Smtp-Source: AGHT+IG27XneYYlxfnsTtGUnnHHJLVJw3XpHBmvzPjELzZgM4IPaUCPSYuo23gRJ69ondE1sRJxjlg==
X-Received: by 2002:a05:6a00:2c94:b0:6ec:ebf4:3e8a with SMTP id
 d2e1a72fcca58-6f8f34ca63dmr10771339b3a.15.1716819832148; 
 Mon, 27 May 2024 07:23:52 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 07:23:51 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:50 +0800
Subject: [PATCH v5 4/6] drm/msm/dsi: set video mode widebus enable bit when
 widebus is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-4-f797ffba4682@linaro.org>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=1644;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=myYBVxgRS2I/E3QUdyhnLOjWSeM7jzrWqz2ABozlocE=;
 b=KGkFKxznrl2L4qx7rg8Wv+F+s40+BieN1hHXytdmrRqouAatjjpJr4uDP8ac42S540r7BBQDB
 GPbVAfPkobRDtEz1BKE+9Ztglw7OwGo5V0hA5R+RnlgrZDYLNb5gAbT
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

From: Jonathan Marek <jonathan@marek.ca>

The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
driver is doing in video mode. Fix that by actually enabling widebus for
video mode.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a50f4dda5941..47f5858334f6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -754,6 +754,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
 		data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
 		data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
+		if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
+			data |= DSI_VID_CFG0_DATABUS_WIDEN;
 		dsi_write(msm_host, REG_DSI_VID_CFG0, data);
 
 		/* Do not swap RGB colors */
@@ -778,7 +780,6 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 			if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
 				data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
 
-			/* TODO: Allow for video-mode support once tested/fixed */
 			if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
 				data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
 

-- 
2.34.1

