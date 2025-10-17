Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0FABEB6D2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 22:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA5010E19D;
	Fri, 17 Oct 2025 20:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KLdR1iGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFBD10E19D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 20:00:56 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-57992ba129eso2758135e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760731254; x=1761336054; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E6uQHUW9ChgQjFk3rZ7rRlcJ/k+AJJTDJCwK+JBs0nE=;
 b=KLdR1iGkp1VFau+ij97aernrMHPzZ8qdjM+2UkjJx3RRPxYZJK2S5ZxgloEWz33p7H
 74szbF1oOWxoivgzzQYl7ec7sC7DGnCORgm3d6WzWZA0s1hXeft2O4sZ0GK+4FFWG1kz
 PlJoz7ZFjwgX7jZ72pWbb+qrqPl3GLEGg+a+eHtVhsOV2n+gjuV0CSxWnXumvdkteLad
 B7OowZXPTbcv/DcC7pNXKM9BYrj89bkZ0O3zvaDYHAO1jZKBg6dcPxqkwi8BTMZ8OsBI
 MJP/jiIZ77sGVwKUYwxsK/ZouJIcLn93zAwRHO217UqNuZB4HFAvyQ5z3447T1XfshbD
 /1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760731254; x=1761336054;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6uQHUW9ChgQjFk3rZ7rRlcJ/k+AJJTDJCwK+JBs0nE=;
 b=D3ZCj8FlrxWRKjSBuQ8dnUyhitEIkX30sk/boH5LFh2pj8jn2GxkWzM71SenNWhQ7m
 dCu8VmT89g8IXnouKGw70vZVtAlAwoLXbwZrc1DlqVV3x7GttT+pyhGZQEtJb5H7Xh3E
 7jKNWBynl4Neriw+ZwhA9DrVvH5vw+bFvQSCU7EGG5E0Lw1jrVhvJoJbeEVtg84YdZDQ
 hDzm0cnrsHrdMsxNTjsY9Ok+ZwZRi1zMCHn8SBF/aYyWoFetTjiEdFRn4E/ssH4Tm96d
 XIQg4RHrMfLug030lTQWC5kCnthRYUsIoTu9ABQPWriHAJ1ab2V8M0Z10Ezb50Fs6Usw
 othg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBmFytFxSn7ke4y43PiGDfOGnp4fQcjLr+qoFScQthv3e61B/lPYp0liUjz07+yWlyXuaMGOHnC2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqLvq0stw9VgEu8Klg62gvcbGWhArZjyMP2f+Oe7/JFqJ8TcUc
 jTaXwffyVQLhrwX7UK7dRwckl3OI+ilDpu/SlgKxiWNc2RD+DRDDxDpd
X-Gm-Gg: ASbGncufb8ecZ6ShZmKXKP2Yxp8Oh8T83l8sz1fU5XiIgVfwMriLI7kbvaMqnlE2ntR
 aCcgPULdI87wsyI2MPVJl5kn3ldJPEfkBpTn6adENw8eyI7bigBvO6WfP7Gti85QrQFx5TmngZq
 LVLaah1cVrjHgiBe2BHeIobKnnmukTm7BZM/jRKA430jEzIK3R5HrKjmi4mRX3L/D5uXcBtlXKB
 HRG6DPvpz4YhQoVuH/6+ecM2WVRXuAw7hQrB/kVuDjZ37huzpQk6hi438hZx3v2ITuCjR7XQmUu
 q3hTLnB5RtumeG0LNSCwIyQT4Cp3FJapHaOZrfSRFQdjtZsFRW8WoeB0SmPsB2VNkyuH+ee+kAj
 fbo1wy+CqY8L/NZ9SGtGAxYJ4V5AftwZmWxf6LS9OzDRQLsMiimahOAbYfIPKfjXK14V77KA+6i
 8IyP6X5GusR+3XEkb3pf7qKJQIsHQaUqa3QRWbKIifZNId5J/hlALggs5zO5OnpQ==
X-Google-Smtp-Source: AGHT+IENQjN/CUYsH9VFFm4pVHWkRuMc9LBZvX1RWDo3Xnsvi+JcACMpM7wNhoU7fWK1Lo5cRQfMcA==
X-Received: by 2002:a05:651c:1586:b0:36b:5945:d3e8 with SMTP id
 38308e7fff4ca-3779796dc35mr16004461fa.39.1760731254333; 
 Fri, 17 Oct 2025 13:00:54 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.13.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 13:00:54 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Fri, 17 Oct 2025 19:58:38 +0000
Subject: [PATCH 4/6] drm/msm/dpu: Fix pixel extension sub-sampling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-b4-dpu-fixes-v1-4-40ce5993eeb6@gmail.com>
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

In _dpu_plane_setup_pixel_ext function instead of dividing just chroma
source resolution once (component 1 and 2), second component is divided
once more because src_w and src_h variable is reused between iterations.
Third component receives wrong source resolution too (from component 2).
To fix this introduce temporary variables for each iteration.

Fixes: dabfdd89eaa9 ("drm/msm/disp/dpu1: add inline rotation support for sc7280")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6effe0fa4837284a1f038e4907c4c91d239aeb8b..905524ceeb1f192c093f1be7f571b29eb4b53379 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -500,13 +500,15 @@ static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
 	int i;
 
 	for (i = 0; i < DPU_MAX_PLANES; i++) {
+		uint32_t w = src_w, h = src_h;
+
 		if (i == DPU_SSPP_COMP_1_2 || i == DPU_SSPP_COMP_2) {
-			src_w /= chroma_subsmpl_h;
-			src_h /= chroma_subsmpl_v;
+			w /= chroma_subsmpl_h;
+			h /= chroma_subsmpl_v;
 		}
 
-		pixel_ext->num_ext_pxls_top[i] = src_h;
-		pixel_ext->num_ext_pxls_left[i] = src_w;
+		pixel_ext->num_ext_pxls_top[i] = h;
+		pixel_ext->num_ext_pxls_left[i] = w;
 	}
 }
 

-- 
2.51.0

