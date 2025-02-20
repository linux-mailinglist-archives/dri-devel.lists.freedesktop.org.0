Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E024A3D603
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709A510E90B;
	Thu, 20 Feb 2025 10:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F6LH3ZZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880DE10E90E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:08:26 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2f83a8afcbbso1271777a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740046106; x=1740650906; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/VlfjNAVucjRp1bpDBN6LbVxMwNg8iNsPGxdLh6LJhU=;
 b=F6LH3ZZADz2w/2ZhYcDeHZmKqAWop2+Zvk9B5+Q4JjDQpnOS26uyWowglE/BzOtig4
 5hKKLulIADLdOAkLtSm9k2UzZ5bn88W8j/kdy3mkuMr/K8gSdjWbTRdWGRKxXTO/8rzd
 mWzlEGNyAwqSCdq5B+s0zyiRJa3aRnVXScWW+KgNGZHO37zMR5Bsngu2wbGzZvqdTJ/7
 G2RgOfgBUlOfbB9g7o/836ohgpz+ZnLHy5trdIaT0fEj68JSKu5WA1rpEQF5Kyz6OPtr
 NCBUB/uuEdfU0Od5/Q0FKOWsmYtHAQOUlbOrZD4OCPIbCqrx98wePCg8lhbA2I93wF4s
 b24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740046106; x=1740650906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/VlfjNAVucjRp1bpDBN6LbVxMwNg8iNsPGxdLh6LJhU=;
 b=BuCZg63Nh/erbscn0mM7sMDj5g31NTdy9JkL0QLo3omZ8jE0VHLSNG5quYGNh7ZV6y
 g3BDplEm872qXdJ60KInRRlceD4XJe8oUnkIdSbfhyTsN1edc90NBb18Cq1Mad0LJ5/I
 SQMIKW65gJgDag+Oun6bdpybWpFURUltvr2qw5Gky1MmSJxJFN+sTljQ5tfjdy2uJbEc
 ryYTSUDmhz5Gyl3so414w1byogSkp1/EOaXuGi3V/XC/LFsDgH5PkKYACquDjnGCrRqW
 etW7sy3bPpGimr7TZSsE3NCSQBs3m1w+aFiIfJ2meFokizDbu68DOMs4WI8PiZ1te5AS
 hUEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4VO0hUkeRjHR73q2LC/kKE3/ahd9TLmex+/6qtCgMdvj3hKFhV5HvPw20kPPx8OXd+UiatvWBVNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAdsBdg9u52B2DXWaCxlNHg1/DQQwjODdjwjRMy05Yj9BSZoqe
 8v2oBBjo5a/ujKYp7PXnJP7T11LWWeAwb7FTTE4bXNDbqh0ZA2X1UPHAyO4qTKA=
X-Gm-Gg: ASbGncs+MFoqh1d7SLNVe6gO3eMpNDJp7pylYydg3xoHuWMkGiuq9cI5UoAljwPHoPl
 bIqlXLakG2syCSFijSjhJWj2HqGEZgBEKuIaZKXQLLez1GarDYTIhByxYO6loB0Hch7/5NWD+D7
 v6LwxRZokL0I3hBrASkXWeVZTOElOl/YBsdiQbog+yipjmP9pIIuaSqpidmTYAMN6l8O8P/sx5K
 H04XZV9KGrKEpVuadcioIyJQqbcemHiHVYM2GVqJpzPgysi9CfK3xYDaqRPMgoqYG7s2IcMBU4H
 0fB+tOs+1IzV
X-Google-Smtp-Source: AGHT+IFLxCMRudIcVvWorr4RKj/8cYBxLwu8tZJdzz6fVcUHM0ZcwncySmXk/oO/UFw1vBTAIhvBXQ==
X-Received: by 2002:a17:90b:3dc3:b0:2fa:1d9f:c80 with SMTP id
 98e67ed59e1d1-2fcccc92715mr4602368a91.17.1740046106054; 
 Thu, 20 Feb 2025 02:08:26 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:08:25 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 18:07:53 +0800
Subject: [PATCH v2 2/5] drm/msm/dsi: check DSC width for the bonded DSI
 case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dual-dsi-v2-2-6c0038d5a2ef@linaro.org>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
In-Reply-To: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=3234;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=hKjATXyKQvv1McdvtRyxOrJ1QBY9gQvAVDuJEgo+cmU=;
 b=17pUwBv+mzfkMK56B94QuKGJ5abm9UfGVZw6OxOxzVqtsJOc1Qzti6XjMCs6YMZ6yjKN42pT3
 fcq4CIFTnJvCLNjFsk1NSHXjb+L9HGGWs7B7Fnq3c6PVYwCgXOTrJQV
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

The frame width is validated to ensure it is a multiple of the DSC slice.
In the case of bonded DSI, the frame is divided horizontally in half for
compression and is delivered through two DSI interfaces. Therefore, the
width for each DSI interface should also be a multiple of the slice.
Currently, the implementation only validates this requirement against the
entire frame width. Use half of the frame width for validation.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         | 3 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 6 +++++-
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 87496db203d6c7582eadcb74e94eb56a219df292..35b90c462f637111159b204269ce908614a21586 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -79,7 +79,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
 enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode);
+					    const struct drm_display_mode *mode,
+					    bool is_bonded_dsi);
 unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index f59c4cd6bc8cdb31c1302f8e3ff395486c0b4898..908f5f1649d650f1cf152fc0b263541dc566ac68 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2489,7 +2489,8 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 }
 
 enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode)
+					    const struct drm_display_mode *mode,
+					    bool is_bonded_dsi)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	struct drm_dsc_config *dsc = msm_host->dsc;
@@ -2499,6 +2500,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
 	if (!msm_host->dsc)
 		return MODE_OK;
 
+	if (is_bonded_dsi)
+		pic_width = mode->hdisplay / 2;
+
 	if (pic_width % dsc->slice_width) {
 		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
 		       pic_width, dsc->slice_width);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index b93205c034e4acc73d536deeddce6ebd694b4a80..be13bf682a9601484c9c14e8419563f37c2281ee 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -428,7 +428,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_ERROR;
 	}
 
-	return msm_dsi_host_check_dsc(host, mode);
+	return msm_dsi_host_check_dsc(host, mode, IS_BONDED_DSI());
 }
 
 static int dsi_mgr_bridge_attach(struct drm_bridge *bridge,

-- 
2.34.1

