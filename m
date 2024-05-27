Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A238D036C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC5210F527;
	Mon, 27 May 2024 14:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kd6/ML8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CD610F5C9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 14:24:06 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-6f6911d16b4so5811343b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716819846; x=1717424646; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y7t4uYmRqlJLrpJDiHKBdOulRnB5HHZ6HHejKDBAJ1A=;
 b=Kd6/ML8pCM8etX8VT/4Ztrp6o6GugPMSGtdnqMdl2jv/hgbauaSbcMLdCNr5nZ9pEi
 +UyJnNyjDR/8OrphvAVJt4widlmCQuj5K+cDcXIYBYeVdO6k0FqezBv4Gh92qVvbcz1I
 cbt4PhfvY3/pKidCe8GU529OC5CwNBA0rslGxWA0+DucNbgqFfLVZzzWYm5ZPVIds7FW
 MzRbxrWpfrvecVlJ0dR2at4oi9HJqe/cM/XNq4Hgr7Iia2Z0+W+1pUGdbFc/THs6V9lP
 WqxO1hBWcK+0zxiDIwPzqBo60xmR2UnHucxud/c/sh6ByVQ+450LdzigwHuN1ndmemMF
 UBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716819846; x=1717424646;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7t4uYmRqlJLrpJDiHKBdOulRnB5HHZ6HHejKDBAJ1A=;
 b=LXetfUcOuBg87rkEzJO+IV40fRmy4lrDDYTkdOnvH/MuarCjaBwsN2LPTVlJHWDNvG
 CUBVy4JhaXxV196GovpSIOmtWVMhpDpoijcH6KYE95pDmWuSV92EfQeSW4YeMvHbUvYz
 KlyMmPwKx3VquDuEl8tDu7px8tXe1GQZAMlXu8+l76Ppi5QJonbNnkjUxfFuPvrSXuVc
 VE1HASCF3yy3VnlcZ+1cVHlovV4v4+dTYyFM2x63F9hvO1NwXK+UVQBJRt0n4ScUhmQv
 wtUng2j2cMkJXJbRTjUTn/9xFusb2texIlnPzY7WIie1b2EmO94UDmaBWNMl5KSg+j/+
 DgFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCogvbJ835OuCu47TTotrtAyjip0yJcfJe6yBTo8rYKF4hB8V+08yHwRjcmMMaGKUSWUsazc3QUDVeMJcq/4aI9EBEVMB8RpxMJg5pJ5Ho
X-Gm-Message-State: AOJu0YzgsIdqqlSD5EQmg2ZyhJG/O0ym8sIrW4Ic2jdZ+viImUSIm4eI
 E2gruPFesHAoutsrkogEwcEb5uW/s1+14tstKqAhGNVYmpe+2jTzEujjMUd7b3U=
X-Google-Smtp-Source: AGHT+IHJ7Gus1KojOvbGG4MRVvDnQ0USYq7JfPcmCETBzGI3IuW+o9e/WGNMRkZQQAcHSiH5qpRc+Q==
X-Received: by 2002:a05:6a20:5612:b0:1b0:24e7:5a35 with SMTP id
 adf61e73a8af0-1b212e5273emr8026076637.56.1716819846219; 
 Mon, 27 May 2024 07:24:06 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 07:24:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:52 +0800
Subject: [PATCH v5 6/6] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-6-f797ffba4682@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=1190;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=hsA6cTh9A+abQ7dtFiITzQof1AHhT8P4eUkFfENrPaA=;
 b=DmbDrlVs3esyebwnhCPWbFsy+3uwdGxILFetgc/uTTqgEnXQ4scfPZdp9cpq2OPCVEMiCYALa
 kYkngMR3pH8CTp6Ev9lolCotIye0Vm+rDHwrPIy1FkaaCunqMdtsjC0
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

