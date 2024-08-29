Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EEB964144
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451CE10E60B;
	Thu, 29 Aug 2024 10:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TBY6YIga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E3510E60B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:19:59 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-70943b07c2cso293371a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926799; x=1725531599; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dXpohNGjcJfCJqCaQiZhnFBlaCnLWhBefQR/nOCDEO4=;
 b=TBY6YIgaWcFtlOL8JGoptGPQ/n2BkvlbHSuG7mUi29mRo38X9Vpb06U+m6FzvciP0z
 iQhtNkXAoOahbQCOz/wINT30T1Sx7jTvD/v+e2w9v885UAq47PGxe4xWiPpEE3neAjpr
 lX1zsN70jz2sSApyh1eTis8fWugxNe+bQ0rC3aIv6lcQlXD3yvTXF6U6Xh/yDHrJSvo0
 3nVvmapWkS7/ERK/6VdS+D839vm206f+sx+g/i7mJ8FNU1Uj+FQZWHt2wU48qdgqIGYz
 nQxcaGdVVKJnIdKebBmyf75eg50JiqI5iAQs7Fgp0fxojUXjT/6JN2JxJSYsv8aOG8Vn
 K7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926799; x=1725531599;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXpohNGjcJfCJqCaQiZhnFBlaCnLWhBefQR/nOCDEO4=;
 b=eCl8ocYu6O0zePHac5Z1c5HVrvgFPtesAHvXQ7z/aawp5C/IfY3/mW3Vf+fpWZfLc0
 Ola7y1H6O6T379R9c06QiFBYOyV60cG+qNRN8QhuhVUH3qVr/pS6KhnN2EHJMgKWOIt1
 9j3A57iVP2rVbBzQzcla1vPiOVx6UeY+kQ+ZO1zmCzEOGkH8akyrDlvAtzeLvsjNZ0Uz
 g/hM6+/KtdTBEVcJmi/Zirg5qQa1HvC1ArukhPDsIFM/55tkWus4I+KyECEQ+Rki1XuQ
 vasypjA54mGqNNFagddfLZpug2wWO7tyM84Jm5unnjVB4gGt481kTOnnDM1v6AgRhGdV
 hmlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDuEYpr4Wp41SzNnqGD3dfVllZBFwz1jB0iWBhXNiYX8J7eV96Nly9OqrHNAQdcFXj7b7k7Y62w90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfOTKv9XmdilGJYIKImu3bYogNMFGCLhyBKGY5Pim5OvejyltU
 NHSVCSWxuomqIC6TZm/TW6WWuxP5r9yfnmdMzfg0fL1XUIzC/tIVHxcy0JMLVoU=
X-Google-Smtp-Source: AGHT+IHzQlKpb6SgNns8yfk1JCTnZQzAo8OKX9t5/fVEsIUjLhdRx9zqCLt3/Def18N+Yyhol8/MTA==
X-Received: by 2002:a05:6358:50ca:b0:1b5:fa6e:4606 with SMTP id
 e5c5f4694b2df-1b603c4379dmr284289755d.14.1724926798698; 
 Thu, 29 Aug 2024 03:19:58 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:19:58 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:35 +0800
Subject: [PATCH 06/21] drm/msm/dpu: Add utility to get mixer number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-6-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=1489;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=TnuEj9uiNYDGvT/WDFYFtTXjthsNUxS/xNImWJVj/gE=;
 b=kEP+gbv7fJSxwa/V+9sP9FWlxxstGmW3wW7eOAaWmARUmmADQOGPOjYM4yKgyDVB+l2Iz/5gh
 E2wiNvBOm2qBTcMUCpak2jw7GncDdbg5jKrl9dB07Jjuj11u55tN9M3
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

Add utility to get mixer number via CRTC handler

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7d0fff9472441..a27e39c525d1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1306,6 +1306,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
+unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
+
+	return cstate->num_mixers;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b26d5fe40c721..701c35803633d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -301,5 +301,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 }
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
+/**
+ * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
+ * @crtc: Pointer to drm crtc object
+ */
+unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
 
 #endif /* _DPU_CRTC_H_ */

-- 
2.34.1

