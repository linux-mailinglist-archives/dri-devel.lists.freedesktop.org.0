Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC35991772
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 16:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389C810E0A4;
	Sat,  5 Oct 2024 14:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marek.ca header.i=@marek.ca header.b="JGLHk3zu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8756B10E0B5
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 14:43:06 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7ae6f77f3a0so167740485a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2024 07:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1728139385; x=1728744185; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9jvG7B8d1XuNSMX2AC6pIuFzaK4tQX72GKOrHfdpQSI=;
 b=JGLHk3zuc8Wc3BQcVDUPxjNCjzpopZo721LCm05/zMkwlBhPk880tWM8urK8iL63L9
 KRVzvSLdrjBVHTNvnp/ohjH2/RaR7PcJbqDL7s+CTOyMvnvFzB7Y3cyVxcUpFVST4J9q
 lBIVA6HEb6I9vnZnCTElpXVQ8a8sb8YpkxURZ/0nezs+Nsqub/jD/G+AvKcyfVRxk8pZ
 hXuRAVDlAO8VzN/k3x+BzPZJjNd4M4NUfOyur0I0b07kOvVtd67UvkNT+bjpkGdnJAZ1
 6B5Ud4ot5mFGnhcJs1DVa6tgv4ErOmoHOY7Kk/E91OOGbdDDjQOsPssxV9Jvg7qi4H3W
 yscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728139385; x=1728744185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9jvG7B8d1XuNSMX2AC6pIuFzaK4tQX72GKOrHfdpQSI=;
 b=WhqedLDKp6t6i3DRojnowNZGyPf3OjBiDCaJ5W1yC5b67LdY9XH7ArtcBz9OCJOuvx
 UNZdo9hph6MtodBjo7mLMW0X25BY/kXOimHiLc0VkSFLoeZRWrZHQk/MVSK4InwWsVg/
 4DNnF3CZ7WnPVHj4kj3mv2yHsSX7b4FBfUZyh5lYmVhCGJ2SZtTmLLcCBAmbN0ibGhOq
 nA+bCMyC58ExRIjinfsLhMEhWcU1t9r9hajVjeph13LLBtm9xQ5Ls+Z603bU1d0SJY8S
 El/4gSDw3LAiOEEkloZNJa7uVdThZCZAe7dYmsO0FkZ4HJEKdGZqcCAWb4abmmy7ja4s
 Sg+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzJeWCj2kQ+XLiBxD/L8a1533DNzGSBEFxIHR3/H6GVh1Dl1stHBIyo3RdvILbDZwvb6aqLzxrzIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhiCGz8LhnRItqpPQ4JF1aqrKlZxZzpsLJelJ6J6ZXoZBF6dYI
 VqtoHSiN238J+IL9rPnFJL5UwVlaIc0gbXwaAtxHzszfP9K7EQyt5BHnXN/Wvvw=
X-Google-Smtp-Source: AGHT+IG4yLQuqZlhB/sDECpjfl6wbKTckYqFqL/GvxMFZI5CjeRNaknjtbVKfLUd5sUZjtNEqkV/ag==
X-Received: by 2002:a05:620a:4441:b0:7a2:c13:458d with SMTP id
 af79cd13be357-7ae6f48868bmr934680785a.42.1728139385226; 
 Sat, 05 Oct 2024 07:43:05 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45da74e9fdasm9072351cf.31.2024.10.05.07.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 07:43:04 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display
 hardware), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display
 hardware), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
Date: Sat,  5 Oct 2024 10:38:09 -0400
Message-ID: <20241005143818.2036-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

drm_mode_vrefresh() can introduce a large rounding error, avoid it.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 185d7de0bf376..1205aa398e445 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
 
 	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
 
-	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
+	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
 }
 
 static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
-- 
2.45.1

