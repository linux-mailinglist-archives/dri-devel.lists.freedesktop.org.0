Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5568CE5FE
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B2710ED36;
	Fri, 24 May 2024 13:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X8FUCos4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AC010ED36
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 13:20:13 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6f4f2b1c997so3350043b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716556812; x=1717161612; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1q/zNwiMaDEmdeMjqIrsYp4iIRvhgkioJMBpY2/fUh4=;
 b=X8FUCos4tMtiUkk+Hz0FY5FfPV59Jg8zSBGHyoUaDfwEr84zh/mtXpW5gggQ0zxGYq
 /CPmK/zvx/pFTcJlo5OwXFb25oAFPWprsXykxAnWalexYaKTP1O88elxVTDtwMjlczy7
 22lNVAzS/GxF+2gIynx5wvb7RXuBUoys3GpPEGFcxDDKgiFW7R8krOMyGfnbE/CM2ju2
 iTuRQKocwBLl7kq1skvsCgSJlptHyVSf5g+gTnri4aknwQUXwz5zFoL1aLAI1lU198S3
 aszer4Zu61QL6P7+MJmUc/MPzdsNh9oydHpq1e382WVa7ly8qo9gP9tRyVvguwt5AlQG
 qKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716556812; x=1717161612;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1q/zNwiMaDEmdeMjqIrsYp4iIRvhgkioJMBpY2/fUh4=;
 b=GDGb9islxX1vQgNhfmTd19NBdLJhnQknzbzKPpzQza9PARTtm0fYQd90k391wQcjJd
 yQy3H1JhHrUC0YYTihmllrgcHwqgktz3phpdbCfajVInLEKM21VrG64UKIgENJZxCtYs
 cPu8gyJaH6nDihdIGt8o1/ncd+LckVEMBjdRvmZPVLvy2oJ1UVxBfVY4gTAXRhzXA6qG
 zvrRFm09j8sxe3bmODMQ/LFbDF1OeRZ/mJL8hyOSEIzwFqPBeyOpX7oeApp5mltm5GAX
 pWbh4nKqRxFM3WpeHoPMViAl2ALtxmeQL0NvEaxxEXK2I7RzC+lhdytiQuU1mqO2GKy5
 6x6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVCNsA4RTh7sxviY7JsZ3iLJPPHZ/d9qqRCM1wrE1EXLo1UB/QzzIM8/QRMSpjUPENFK1YvVBsN4mwMJK8yRKQR8xv4amlczqyuQeYoOJw
X-Gm-Message-State: AOJu0YxVhNckYflG1+hQKn5KwJWf2QJk/lMP3zGoyGjsOsdk1jUuTZRl
 ZNlAi/I2G284ZS2KP4jI84wbbVxC5JOJcUTgEd9aM3Xm9I89c3pWDiuo9bqHaVI=
X-Google-Smtp-Source: AGHT+IFTBEqgSXOTYEBmmTBP7ahN+ciJeUale1+9G3+OEB3mk4T0neDI0vGwWmLizhpygbPe4PvKvw==
X-Received: by 2002:a05:6a00:1f0f:b0:6ec:db05:36c3 with SMTP id
 d2e1a72fcca58-6f8f2c70be7mr2301910b3a.4.1716556812687; 
 Fri, 24 May 2024 06:20:12 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 06:20:12 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 May 2024 21:18:24 +0800
Subject: [PATCH v4 4/5] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-4-e61c05b403df@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=1725;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=kdfjO+qJ+tyWY/8kntVCewHf4UP39s93vNEdOjHmAf8=;
 b=cTGzbkJlwdCbXS+5swInq3OKf6W/F1COYuaXwxsygv8aAxqTpynn8511jyeBz+cpg7BXte/ZF
 /NCUw9kAXChB8P18ZcwmB+O4etXAmQbKOd17kMZjCuQ/I2vq8MUqG6D
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
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 47f5858334f6..7252d36687e6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -857,6 +857,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
+	u32 bytes_per_pkt;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -864,6 +865,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
 
 	eol_byte_num = total_bytes_per_intf % 3;
 
@@ -901,6 +903,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
+		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
 	}
 }

-- 
2.34.1

