Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6596BED29F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 17:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED2389E3F;
	Sat, 18 Oct 2025 15:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xx4SEYAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224E489C83
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 15:33:25 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-58affa66f2bso3583248e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760801603; x=1761406403; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JI8wqflBoJeSVeIoguEa5qYxvXUp8LZtN2UpxTSv8wU=;
 b=Xx4SEYAIPA5+8eHc+uPdLXmNA4jdno+aU/ETe1FidnqyACRPMmiJB5Dc8PaEHVYkt8
 G3XBwv1a0RKBZYqTdrCBjJak8YzwWkd5KMYMGRiZ9Sq9fPa/+BpwXcLB5uRbf3UbTBGy
 TNVirNgywMeCJfDSBYlloJpErjqHlGmLacxMbnqI2zXKximu0DHff5NuCjzsznz0jvoe
 T91WlNAXS6CPYYir3L/PfweR16m69BYHJAdh4QTVT7i/6C8EOZiIO+sjFLnCkXaOuN92
 gefbnktCr84J3U0bBzTa7XP1uNPeJNipEiMjmdh/qwnLW1kvltS3X82GSFe+2duEEQfy
 b7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760801603; x=1761406403;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JI8wqflBoJeSVeIoguEa5qYxvXUp8LZtN2UpxTSv8wU=;
 b=OD9o7+rGNH38SnIQUUrWI1Jj8dFxH/JOEYVf7ok6gf/ouR3x0c2tmC/Kr4jCWukTyM
 87/pK5yubkOlIyjayWNdjlXubzX4A2fNnS5Bb8loOE9I0CNfkkVz/0bwgzIqAePLcZWP
 gzy3j40b7D5rsfH06KCK4T1YoVVlH19Jg62kDO9R4zGU04KSTb+yKHAW2tWYhku7Z54A
 yy83twSBW9gNNm0/BvkUF5q/fdVoRmVTbeH9w0JgoOBhV1VUZtWTWNSlnedjbRZVnDhg
 LCr2vcJ9h21BpTa19nJXb6XxN2On5TTIcfbBssbbLa4f4OogWFjaj7CI9cuVk38hDNbv
 3EaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRf70TF7T6KBqWgfljGjoMI8EtsIL0yj6TINA4s/iylmK+ZP9Wll0PQRBq3DnTDPR/OdvyB4/PZgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3cdR0hqYH6+Duc35m8nq+7qFvR/lhWpQ+aNzJO73ypNc68pEV
 D/pAZpH4K7lMuK9SwTfutbkvtOhEIOOcHz/dzzICXaGZFIjIOMCQJzTm
X-Gm-Gg: ASbGnctj38wF8KdhgnHJmAsgLjdHVTv794roq9xJTq352k3mT+O7eK3IiexVexh4OF8
 gsWTAs3X213CZ2aR6B0Deg7H9+0gptjcRUtHfK6Ap6fOR+TYrhIqKMWlBtbx/fGXEScCxztVv42
 3915dNuEp7wn4+5myzG57IuOx3PmiSyygZirqo73SM1g2/VOp8xqzkbUt8rAitSxHXgMcK+nnu2
 mECQJqbjLsInMeslZwyFoO5wncL3dfr/bgK9KXKFPYdbBFQ+EZ/ncLoRiq1wSlbm2Z7/mb7gPZD
 bG2bOCtmJrFr9MFqF3UnAitZIll/UMLbxg3gJxW9x+ygjotn7ZoIWXq2eX0WbJnylmsZaL7OqgT
 c1pqI3lIiUu2nlxGDJbngXTwspcK6WskSDhyWzpoUZHCoTZO5Nilyg8Wc7nsl/zMwnckZs7OIGY
 y2hgA8GIEauBEkA9wBGb3VeKIJTdc9pmJafTuMGbG0WR2qegwbXjSX/hcXiNAwUGiN
X-Google-Smtp-Source: AGHT+IHNJGLhJHT1HKOGPxf4DSdDJIV4Mlmc7c1/MsjKbF5l/T+nMmFrzXfeEG2XR7zYb9PwANEW8w==
X-Received: by 2002:a05:6512:1154:b0:591:c379:69d0 with SMTP id
 2adb3069b0e04-591d850d2e6mr2429125e87.5.1760801602965; 
 Sat, 18 Oct 2025 08:33:22 -0700 (PDT)
Received: from localhost (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def272d0sm836014e87.108.2025.10.18.08.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 08:33:22 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Sat, 18 Oct 2025 14:33:43 +0000
Subject: [PATCH 6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
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

YUV formats on this hardware needs scaling for chroma planes. However it
is not implemented for QSEED2 which breaks display pipeline if YUV format
is used (causing partial and corrupted output with PPDONE timeouts).
This patch temporarily disables YUV by switching affected sub-block to
RGB only format list.

Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6641455c4ec6a2d082644f1488ea5f5605ccc208..9f8d1bba9139a7e09ee321cf1b6f30f96890918f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -267,8 +267,8 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x200, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
 		.base = 0x320, .len = 0x100,}, \
-	.format_list = plane_formats_yuv, \
-	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.format_list = plane_formats, \
+	.num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 

-- 
2.51.0

