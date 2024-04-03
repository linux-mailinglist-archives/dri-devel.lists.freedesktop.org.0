Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CE1896A19
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019E911290D;
	Wed,  3 Apr 2024 09:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bCiuiwDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B283112911
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:11:30 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1e0f0398553so54669105ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712135490; x=1712740290; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DQqEHjYdisnUD2snQA56jk2b7liMK6zBTYwXTs6Sj2M=;
 b=bCiuiwDR3qWa02B/ctaM+jgvRfa5gmH86gMNQZn9Z9UUoLKvKHDeossbEx30mRxTmW
 MZl/lQMoTfierM7Oymn7EhYnrnk+gds2OZpNn+3lH7wcIfgJoJk2C/j+kbawOL4dmBqW
 KzWOxsHEOkWiTinm+8Ny9CYsDtDWKhGXr3zE0xr2rr+ZGTQ995mZ6HqAUVYlpD2JSgtp
 IEyuPjBTCWT50Ht0llz0iec+hSbRVXxuyf8neJMI4KP88CSqZngHU99A03zS+wDz/1kP
 p1NmqwGh6IZwtImDHhIO+Fv2oVUaWbbsY7Hjf5kT0v1gCW0aGx/6PXapm1prEMPm1+jb
 TjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712135490; x=1712740290;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQqEHjYdisnUD2snQA56jk2b7liMK6zBTYwXTs6Sj2M=;
 b=kectblh1hyGtTJMwzFXAXX5lnZGD0zE4WhCSG4OkUbk+feskeYGxocfRH6OxBKRpVa
 jVKXpxRJXhhGGCk+k+fjhKkp71L4jtv6a4LYw3wbPFnQ+HqT9jRNhts4yB1uD1xs6GgS
 1xFIJ/hLbA+FyeIB9gyiAGhDbOrVrexxFOXNt2O1VJsdC82D4gbG/60fhJAcLVD6j680
 DTdHHRwnoMpxf/We+bmyPeHWcot/NU9MugnitLZOi0WrMwu4ydy2KKB11KI4s5CyD3JS
 uCSgeOodWpx9hLxV0yd+0AD5GjZ+TiRkxMCa3ywy42EfUaUNli8epT3TYtARFm68RL+C
 /MRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf8CglPB8zYRd5p8S7WkZD+kneAP6cl0iTA1p0/D60MXbj9MMWVLKngGJi218VaPFGGMqc3pxKJvpeXAaWyo/yc5d+jjb4H5JtBT8WIBbZ
X-Gm-Message-State: AOJu0YzMRGSRrx4LJ6fqpaGxmQ3bAl4bu8aopweeZuij8CAqSlHx4x3e
 rjRjIHzBlqojVY4Zof4IgCWFc7SVUth8v9mRCNt/24rvMqjo/Zulu6OfaJIAE+8=
X-Google-Smtp-Source: AGHT+IGoKCZcGfq8O6r5TZMV+3488gW9BqB93GhZMP+8qde52gj2tgoCMbgU1QhQAK5AgXTygCwvkA==
X-Received: by 2002:a17:902:ea0b:b0:1e0:b287:c1d8 with SMTP id
 s11-20020a170902ea0b00b001e0b287c1d8mr18367183plg.5.1712135489852; 
 Wed, 03 Apr 2024 02:11:29 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66]) by smtp.gmail.com with ESMTPSA id
 lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 02:11:29 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:10:59 +0800
Subject: [PATCH v3 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
 (fix video mode DSC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-3-db5036443545@linaro.org>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=1680;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3j8eHIegp4Va/VwA/6lBtYTg4B03+RKnNiDyMKiJ2vk=;
 b=KYx0Ix2CdVVcXMEVCmbw5LBcbUcSc2xtRS6uG1UPryAnL/gyF8kCDnP4OTQ0zJLN/6LZPkyCK
 qarGJC8xk8BDG+YYUxsw3+ChRenief6Vx+FotV/IsSCYwbmF6Znv3ai
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

Video mode DSC won't work if this field is not set correctly. Set it to fix
video mode DSC (for slice_per_pkt==1 cases at least).

Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 2a0422cad6de..80ea4f1d8274 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -858,6 +858,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
+	u32 bytes_per_pkt;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -865,6 +866,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
 
 	eol_byte_num = total_bytes_per_intf % 3;
 
@@ -902,6 +904,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
+		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
 	}
 }

-- 
2.34.1

