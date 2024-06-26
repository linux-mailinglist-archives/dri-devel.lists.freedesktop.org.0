Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554109199EF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D6210E2C4;
	Wed, 26 Jun 2024 21:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gXqx5GMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514F010E311
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:07 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50bso50889411fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438365; x=1720043165; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U+y9Jw/2GdJnbAqYZ072LCGScq8Q/W2kfxFZFo/y7qQ=;
 b=gXqx5GMS18SJ5FlAMp+m341MjJBW5Qf1a+SQtASTdd5fCSizNNHykmK4KUY3FiXQ1p
 hB4SU+F8bGh5ARz1UXxty4sY7QypErbC88jRVrhSN4utiAwWbqaqPFsTRUYvcmfirorW
 6Xr0uC2NJX3ZB4jbwsOie34QzMfKlv84zTRTVhrpISFe3HrINYqeU+p+6hrPVPaJU1Wu
 FMBWhDHmf1+z5GJn8J2p5JuD1LmqcvlgaDUl83jyZh7g9j+jTpwj+/K0kHSihSP04VGt
 fEHxOAmR35bDzoSJVc1ybxgzfuFwQn3sEHbj8G6KvYb33f9aKyg+D2hz3oGYFODbnzZA
 YG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438365; x=1720043165;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+y9Jw/2GdJnbAqYZ072LCGScq8Q/W2kfxFZFo/y7qQ=;
 b=nQObilcthamhUZ7NKg+8u71A+XYTyqbWoL+GfQ1O9mbuG2Nj1DvhzcpSVKLWEOImbK
 /l5ludniFh+Fd7ULRT3u5UdyRrpnke8NPCKeVylQoMFJMwPJQZMYT7SYIKNSO7uRWF2f
 z1YNGyf1tedXsuk3/5dqCHWQyp5Pg8/UEZon9GgEZlLEjUVfTs+/AprzS2c1Kj0mePS4
 sPG6rE8Lh5y7zhCNKoPtLu1zMA3P+a0CVG5/0Ad5F/zUAWV07VRpGP5SGgHBHtNrp76g
 cPsDn9QDH9IqKjWjYkhVO8E3J0XqJvxe5om47L+qRZ6wLinewQGKqdlm4NOUuIamYeFn
 Ec6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVu5hjTfMkKx7moWLiPdR6BQ504lJkIxjlMpdwZ+GAdQf5pXxsiL9BtHQeZLIUNal2RLlG3nyrr06YlvuGcwSdx2T4ObxgaDzdbC1HU9dj
X-Gm-Message-State: AOJu0YxLcozjeB3KFKGJKr+Z7omSwXY7fKF9krxuNM8ZG2lDDpJZadmD
 +0MTl7hXTT3CL6H3JJsIonQqcAyGj4yauXOXAt0dpRByKOeOXQG0UnTBaWjg5kk=
X-Google-Smtp-Source: AGHT+IGJn3uylwB+3ohJi+8Ec7D8w5JkByYi9a8I9HQib/s9IzApTpfrehCOchB3jirtru6/fxSTOA==
X-Received: by 2002:a2e:3009:0:b0:2ec:5ff1:227a with SMTP id
 38308e7fff4ca-2ec5ff12384mr64301421fa.17.1719438365371; 
 Wed, 26 Jun 2024 14:46:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:57 +0300
Subject: [PATCH v5 03/12] drm/msm/dpu: take plane rotation into account for
 wide planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-3-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oZ0yq3Zy7nCQNd1WNthf0ukdXl1hN+VK6wuUcAguRdA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pNj4RDTeh68xSjxS9P/pE5fDh+kX+68OcVvGy+v/p7F
 34/4tzfyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJRDuz/9NxmCUb9DZPRp/v
 5/+6tOxFJx961U9Pfyl7usfqwvnnt+81cHo27uWNW/TDdmUSy9InQbJy9nuYfx2V5Ta//C6bPej
 NvVrm+l2v3TJuzP6WtGJtI3u3bvPJhtTzM7K0JPiX3Gi/tdBggdKr6vUx3+fO2nHT/EhOjpf4Jd
 Ec98V188sYObSzis5d599som5wturrUdYPsy5virBWtdLWsNDmPLfviNPkKQ4eB4vdlSaY8WX9U
 fHUbMncuML3wwn/lDtq3cLNEW3eEetWMN79olXceOOP6lPVmNwJ1dUPPql/6ApZ0ezhE9c64UiT
 f/WT7V5Nte6frJ//1ayLUz1hbtpW/zdzrnWMe5/MunOdAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Take into account the plane rotation and flipping when calculating src
positions for the wide plane parts.

This is not an issue yet, because rotation is only supported for the
UBWC planes and wide UBWC planes are rejected anyway because in parallel
multirect case only the half of the usual width is supported for tiled
formats. However it's better to fix this now rather than stumbling upon
it later.

Fixes: 80e8ae3b38ab ("drm/msm/dpu: add support for wide planes")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 148bd79bdcef..8f2759d16247 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -862,6 +862,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	drm_rect_rotate(&pipe_cfg->src_rect,
+			new_plane_state->fb->width, new_plane_state->fb->height,
+			new_plane_state->rotation);
+
 	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
 	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
 		/*
@@ -911,6 +915,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
 	}
 
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe->sspp)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
 	if (ret)
 		return ret;

-- 
2.39.2

