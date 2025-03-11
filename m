Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41273A5CE85
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998F510E676;
	Tue, 11 Mar 2025 19:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UrAC3Zo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A656410E679
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:35 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3912ebb8e88so497418f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719754; x=1742324554; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PVge0Bi84m1W4nmefcb1/Z/IlfylqQMKskx2WHqiPRI=;
 b=UrAC3Zo8woqlEVcVHL1njz/oq+yUP+FCdqKzQdfrxqJyrA0cyamogu3rKSICDd47FO
 +5zlIXmwI+mkIAbQFGbFTC+Fs01GgBvXJ5iUD7ebsmf34nNcjDmJY0mSwxeLVt5hTv8g
 B9ErHk1O4Bvd6lw68k0FNAGXQYgEgwLXudWGOZ+TnX7lygM6WLeJJ7K8Ilx478HLVf67
 ibEHZA8KuLE0/tO132rOYzrKdS9JWEGYNSyq/U6XTaZDe4OF7QSKGY5HCxaiFYtJTxSx
 Siv39aut2ZFeell+MLCn1KwS40hpX8e4ZtLprHa6XdWFlSswCTinSoXZlBBygm/uYa+H
 ryqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719754; x=1742324554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVge0Bi84m1W4nmefcb1/Z/IlfylqQMKskx2WHqiPRI=;
 b=CMau/+/utD3z9Em811X7nHXXEeThKXv67Ll4YBf4vueYODSeqZtG6kxv8VZPBX8f7H
 sjLZtsvZtTc4VMGTD0OL4OtvHm6cDLV3DzFtRFzSeuTYa2/Laq6asEDCwovVWuNx+l2t
 4ZJNOGtadCOmFQ8Kc1/FjRHwpt/i8PB+Dnm2uwO+Tg0dp8NugWo15MwxDOfRB1yB17e9
 kSRiMqRw7QCCXqr3ZGRP5LDae5XoP+7eoADRtYRzs+VK/whzTaT4D/Wn8UtGTTR7vjHm
 0REGuOaJRFKsHR4HrKJ1SXGE5l5dVwc9tKWVUqCWkK0HT815m9UeAbkwxbH+Abrl2RVq
 j+3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5dlayvBZdwn8P8Y4bw444WIyDvOsGo2kqb5yCP1gqnNoLTccIck/ZX0Z5ToUMIKAyGXtCTPmMqeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTwix42Gm4E+PJALz2kT7QEtsO+xZbPqSBb5CyEOCfcok9bCyg
 sa5cancSXls6Lo2/pi+nCZEVrQQGx0ZAXHZRHbWFib2XtgHng7VcqFPSaJsHf+M=
X-Gm-Gg: ASbGncvRkZNGip93cx1HhIH7yPm/Xdo5pzvljjQ69UvG8KxnexxIPrVFeYMkMLlNspj
 2C/Dncbrl31UysrjT+LU47+svGCya2GLKrNfC1b4RRgZHSM7dxMz/iDAGouEaBDmdrjE5w/El0c
 f0p5TZt9czoA8jCXmSha56x5x+FticwUcL64F6J60hVsQUm2NP0UZMnvLYr8N9SwukPgq+0W+iE
 Unuxrw5ZZf62Sq9TExetP4rRzNUka/Iv62JUWgVENAg+l7167qMzPN2AIvunut+QH4x8Z7dYwp7
 4jUz/z5dXGZ/qrNT+tqAFRjySSWMJ0HejfcrNSWPe0LuWmDVJljCAonZ/Hs=
X-Google-Smtp-Source: AGHT+IHKlpY9sCmu/+h6R5RUmpIVQoWt904tfMIQ0oOjY3httFCJIuM1s3lsgHr80J6zp84jA8A/6w==
X-Received: by 2002:a05:6000:18a9:b0:38f:20b5:2c80 with SMTP id
 ffacd0b85a97d-3913bb5cd34mr4480539f8f.6.1741719754177; 
 Tue, 11 Mar 2025 12:02:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:57 +0100
Subject: [PATCH v4 07/19] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-7-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=o16ipdDJogxXtmv8XiNUlgMzR8bXtNv0QSZLobZ5CdA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IirK+DqA2UIM8DZHlsOXQa9Nx+Al/d/PGk1R
 zQAUrjjVOmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIqwAKCRDBN2bmhouD
 16IQEACUNi5yj4LEEOfNFUK6AUDkaxdL1plVw/D8RsMSuzs0lPQIhs82LP+td2eIZavNoPmewxT
 Igl4mnEYW8nQdNDaN3+n9twRQAZFtl9zAxy/h/YLO34xhoY0cggoqpxgHPPEKPAcsSP3THmB/LE
 x6eSi9ZqlInAaiYO/vMxRJKZUMRWI5kyKQ9g1Inf3O2rJM5RHt59BlSiqW5xw7pv03gXPUL8jEO
 D3Tn6tu0ogHvP/ry+9bfRxQtp3V3i7UYc1ueD3eOC0iTAnWY8F5maVhZW7Wpb6EOkw7lltEqE1E
 236OEMinPy4moxCSHToijfAmTL8NQF5E1ab9Wgbwb52r5WUfI75I8hPGfXn48NGf89ZVt3qkXZd
 zpYGtE9jhw36+c9QzxJuCXueXWPEWnujIeGHxjfT4D1q60r9XhABITpSdz7aCF0zn0xojgeDuWR
 jI+WVmQJk2CsFfe0PcsZMsax0FL97wB4MGPRR2DopFh4gcH5hmSrYFl/iUsHrupoe15Qk9P+6FP
 2FiSuSYH4ZgwHGShWinySJYjb4MbOX8oPTNSht6iNMlxmfzyuPUqczLAPpSCE8kMOHLlEBZ26lx
 1XRzXZO9k2uw/h8flwYU84oaGIkOmssZZOpYnsFpFnr8qcpBzyMHDmSNFCfC/lar2jRkO0lAaXy
 vIgcSk1MY5MuiaA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Resetting mixers should also include resetting active fetch pipes.

Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 284e69bb47c179ba62363b2df2cebd5172c44f8a..ccf492f27140a2841b454d413e885e4bbd9ee497 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2188,6 +2188,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 		/* clear all blendstages */
 		if (ctl->ops.setup_blendstage)
 			ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+
+		if (ctl->ops.set_active_fetch_pipes)
+			ctl->ops.set_active_fetch_pipes(ctl, NULL);
 	}
 }
 

-- 
2.43.0

