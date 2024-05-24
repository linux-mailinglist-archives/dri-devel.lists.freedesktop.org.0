Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B88CE602
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C709510F2BE;
	Fri, 24 May 2024 13:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ElKFV9Ar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A5D10EEFD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 13:20:20 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6f8f34cb0beso628800b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 06:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716556820; x=1717161620; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y7t4uYmRqlJLrpJDiHKBdOulRnB5HHZ6HHejKDBAJ1A=;
 b=ElKFV9ArqvrS2Hy8DW+9xvSfRk7jtRO3kMNPCdt6y06hBLvxSKZLPfDsJSLWvegW34
 HzgTfuFDe/pdq06FmJH0z56AvCCYKAkduC1XjjpivY3bzD+AQYlbgQ9yOpR1d3YaVN/Q
 8p7ebAfpqkOPP6iTSMoqUOfHTCuVAiu1v6y5ivhLPw5rPhC1k17MYbgyJNdr9VH4EcNe
 1IOcdKVsqtVjE0rhXGqkHLFB1venS5d2BM8HGJOWXpDByN5hML6eNDNkWUqLFgmWHV4M
 twy9+8woX77n7LK3v7yr0Plb6BD6dVmmonu7wyGkezsbZmX1BybUeajJUFVGz+v1MuUw
 o07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716556820; x=1717161620;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7t4uYmRqlJLrpJDiHKBdOulRnB5HHZ6HHejKDBAJ1A=;
 b=uMNlZXP33RjC5OiOibHLZfaed9ylNFDMALKfOT55z6kGFDbBfGyY1Mkclg74sf0Svq
 06eF1kBOlj49XLkIbDcphRyp7aKAT+2SatZodkWiD3xyVPtjEsjUQ5dWgUW9FG4Z4T4F
 TrFsYMdl+YQSfG15XiTBsQ8GYfyjUIiGzlBVwfEgxUBK1bsMfHEOmEX39OWRt24I6H2B
 It2NxBaMFzEx9L3XiqDwAnuGjjSqJYLpKPb+17EUmZdNZ3TGyylqgr0Rb1dcPgQtsvo3
 exGMuHM3jrQiGGkLOZSp36rNo6jC0l9aGSm9SHn3yWA34JVk0JzH1jCoHL8JdFKdWaVt
 kOQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd7l2CRd4Dm6Z8Mji+3UWgcPwR4ZBN7MCeBJh3CtfBX5XxQ9N2aIO/Vus1tZ1Sb77owsjksazb9SrcoA9h6DtZL1a5uD8T9fDC27+JJJJ/
X-Gm-Message-State: AOJu0YzbDs0IHFkaqhBpt8y+HcgrT3zRXCcDP+5Pd5s74jatQcYV7VXf
 o7DAsuCZd2Js0LT44J74lHjgEgxj8U2tjSCjMiQYBwbUOLwNgf0Uc/hjlgN82xg=
X-Google-Smtp-Source: AGHT+IHKqrriJSvWlSL2AXQz2HqI+Yiz7gfhITS8Gwwie2F6zWm4wV2V3P9tfoiHsWR5eUyC4vIFvQ==
X-Received: by 2002:a05:6a21:3d86:b0:1af:8cc6:abc7 with SMTP id
 adf61e73a8af0-1b212d28770mr3034833637.15.1716556819791; 
 Fri, 24 May 2024 06:20:19 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 06:20:19 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 May 2024 21:18:25 +0800
Subject: [PATCH v4 5/5] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-5-e61c05b403df@linaro.org>
References: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
In-Reply-To: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=1190;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=hsA6cTh9A+abQ7dtFiITzQof1AHhT8P4eUkFfENrPaA=;
 b=rda5R/WGjjaZFeTS5BHxnspwaWD3dcdhQZQeU5xyj00vWyacOIsN9uG3MPOVi/pV68aZ9Wj2n
 NWcHKDGTT4NCuaISuJLgNbItYGSL8mEmt1TuqxUTZkwhEHUl9RABCqe
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

Make it clear why the pkt_per_line value is being "divided by 2".

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7252d36687e6..4768cff08381 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -885,7 +885,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
+	if (pkt_per_line > 4)
+		drm_warn_once(msm_host->dev, "pkt_per_line too big");
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EN;

-- 
2.34.1

