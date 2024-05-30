Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7588D451E
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 07:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36FA11B3FF;
	Thu, 30 May 2024 05:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ap7rit7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7BA11B3FD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 05:57:26 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-6bce380eb9cso442937a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 22:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717048646; x=1717653446; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pxS9ek92+KO+qEWEmGFZ/YwqXrV35uXXPCm3VPv7hfQ=;
 b=Ap7rit7eDbfQ4AWe30L948QL0f/Zk+kNBxWOxyAJ1QbseJDGWQr1TsGGUQryGt55KB
 ilCnIEi3rj3a1zKCYJ1fyEtkymGqTPv1W1EmfJ7mJVc/ZEY95WqjkgRYugcjoGmjBC2I
 30mgFOqGmkM5iYy6RkcxUlamhjPUH5xRTf4X9Cp9eKqfAZ68PtQ1s/PgjvjvNcZEbxxw
 RS+bQhK8mwAXCVxO/wFLdn+vXv8L7OkC5lIMf3tLfdvc5OxYy5w7Px4MN727FY0Six8n
 l4Z05YIQr/gOTFlWHPLw4tVQ+UzPuPi7LH+IeRefRUG0gCZb36Qmd9wAKzLJb756UkO0
 8Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717048646; x=1717653446;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxS9ek92+KO+qEWEmGFZ/YwqXrV35uXXPCm3VPv7hfQ=;
 b=MSKHjbVYU4OBt/7tyax831l2ZO95014m9kGwpEdwity7Erqpi2CVH0/rRsZwaQmwbf
 Zeu3KvgRQTe+s33WavuaMmgZHxBwF3wjuE8Cb7l7YvSpez/59cjqSVRKTWsNJXnMGnj5
 dU9PK5Qwb7BK2VdGUfIOVPJmvZvfSLQZGB7bp6pbWZSpAcNor7o9pCXiPiIn00UWjD/M
 l3yuaFabD37UXzRyq5br42jtr3LTAQVj961hh2CB65HEu/DztVrkt3VXPB7pbVg5+4xf
 OtQlIKb1Y5yWgEZpaDIDEmuqfLtqqlamlVhz0lMVuj5iULdUBsRM/2PtCkrrUG5SLb2u
 QHrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1AJQ0TIbg/y7ShoUbh/Mdv0VBwIQXml84px8/NI6r9jtNuvqPLyb+FM4LRqVMt0K3Vz8XMQGm+UqecKklvEDjXBdDxDjTKHIU50vmMx0b
X-Gm-Message-State: AOJu0YzeWK7i2fxBnwT4KPZooTeZ5miEonqXR3UwozvqPZwEf57RcwJ6
 qNFUZS/yNnWVOwmzB9HRzUFCkKPGWXeBneCuAYcTg+YmU7FyApPY4axez5rUvJU=
X-Google-Smtp-Source: AGHT+IFufGvvP62MCAdjZ2K0L1xe/kz4yKxYfx73uVVqFuErqy87bIy2B4aFq+uHFwpqST5ep/1qOw==
X-Received: by 2002:a05:6a20:7293:b0:1b2:c64:7b3c with SMTP id
 adf61e73a8af0-1b26451647bmr1370632637.7.1717048646289; 
 Wed, 29 May 2024 22:57:26 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c75ffc6sm110006705ad.9.2024.05.29.22.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 22:57:25 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 May 2024 13:56:48 +0800
Subject: [PATCH v6 4/6] drm/msm/dsi: set video mode widebus enable bit when
 widebus is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-4-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717048617; l=1857;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=eBWvrCJe+PE1pKdk//cdtjIjLgQlT+4h+UpZHIX1w78=;
 b=0YTnx58R0AaK23OPv7vnpJGxBdEo6QluOSapKQTN6Ffufhsa6eDy3jbKLRAgwvoQupXLNKimb
 HbZtLiak/hNBAwpnA8l0pboHc0ma5rXkuax+ifOKbNoDqRwS5MAX/7o
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
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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

