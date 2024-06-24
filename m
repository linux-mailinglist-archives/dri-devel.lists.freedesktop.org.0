Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EBD9158A7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D00C10E58D;
	Mon, 24 Jun 2024 21:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sf7z1Z/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3372810E578
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:57 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ec1e5505abso47036071fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263635; x=1719868435; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+AUHfRJKHGvOenWMLfTvjZNZHNZ5mv815tkdUpfKXQ0=;
 b=sf7z1Z/l2chumcSyyuGBd72GDHsEwotz89DhhaIXdrgIWIocxTb4FpSYzfNrRMQkrK
 LkxuQM2Y42WWp8x/RFpGOSMG3FgOnYOLYkqU8u5rWemDK/Cp2wYKdvmpIAPVGJwN+vY3
 aIQyOLZkvyLJWE0X9mbNDE08yBK0WWQ1WknY6Tn2geBPqhAz1elct+2I4JdAa12BBZW3
 8PjzxwcdLaws6p1xApi3HFy93wDkuRBwq+Shy2aGu3HkHgwHgeoZVZDaHoilNFksnRAv
 rLXchRfLZlQseUo3EMyYC5HPZ8ZskPKipnE7EVoRhDKBG0IPdjvKDeMyr8KvQo7gjL9M
 E1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263635; x=1719868435;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+AUHfRJKHGvOenWMLfTvjZNZHNZ5mv815tkdUpfKXQ0=;
 b=Iia9gtd6W6ZHG9Drh664GRi5X3DAd1okTfftH1CjlIoEKQCIRH/4+OhoUf06WMbmzu
 AReMd/n/KAC+8odJopH7gjv72He0E6iLosdjmNoPpeHCilE4zAvrnrIYGycVft9ouXcF
 9Qz/jLXZEUXJPB7edmhX9gBdpDFp0uHxF3zdWZL3l5wbsBBNAxQQKai5XV/Q8a+XhdEC
 P7poXKZB1QXRTTkQ0qniwelS+A2IyIqlTJWPYokQq3lomLWcKZJHFqzt4S35tYpVWprz
 vxznCpk3V5S8VuVFg9K47gGZ7x/D197KKLLyFpubHDaiv5NQKlorT/SklPOpHpoBNQ2f
 yHrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOD5Dt8HRomPyv5/ic8sb4mVGxFP0NL7C61B3zO5JcJ+0LrBMuFs7RVrQ+zcLg1J3M4J+udWkPV1Hps2bcFXGtwCvpBeIqNFn3akWkl6Nt
X-Gm-Message-State: AOJu0Yz15NrtZyuwW9NfXX7hNmCC1LMjdbNa7NV8L3yEwNB6YEh9LGzh
 OeFAyZ6n8C6eif3ru/rJXFscsZ4MFoHB6p1QYzB+s9pgtL8O9rR3bAr3fSzQSCA=
X-Google-Smtp-Source: AGHT+IGYahPhH0LSG8Vag87u1JsZQlReSd3kXh0R7WJsiQVPkj/At0XBAEccQjVCj9TDhlC9KCzNDg==
X-Received: by 2002:ac2:55a2:0:b0:52b:c023:6e53 with SMTP id
 2adb3069b0e04-52cdf3312b6mr1758857e87.11.1719263635250; 
 Mon, 24 Jun 2024 14:13:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:52 +0300
Subject: [PATCH v5 12/16] drm/msm/dpu: make dpu_format_populate_addrs
 return void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-12-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6500;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=P7LNyh8rlNWgx+Y2+qtqWlzrn5artaLGOEdDXJ37RCo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1rlw47OSfMSjTd/9gpYULk8WvC9bbKDa0L1jduCz2qX/
 VtZfPlzJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8kaY/X+A0m2+Xz+smPil
 /2fMOm364JFFn0btlttVc5++e8tauv5EXba6+eFJYimG3wSmH0zWZ879Pel10VvlX2mNzFcE16Q
 cy2E8wrQ6WfjlAp4bjc+M+XgTdwik3Yx1vaHiKBnJ9qpr7QrPCvkTvmuM+R8euXqus9/Hx9ohMP
 AUq8zcZwF7TY7vMvQWr+1VcH7bI8zmbCwQ8c3pvZzA6epvXBYnPXaK/lGe479Q/Vnk6l7dixlTv
 Pb+XTMzd/rO/XKc2ZFNt6uO2Dis5PH/bda8W5hvTa9FPf/e2E3TzGqK87ats5a3X9H1gKdLk539
 hqLnrLRcExtXpneRyt2OMUzH9yV8/qPq+mKpUe38tD0+AA==
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

The function msm_framebuffer_iova() can not fail, it always returns a
valid address. Drop the useless checks (that were already performed at
the time) and make dpu_format_populate_addrs() return void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 62 +++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 10 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 14 ++---
 4 files changed, 21 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index ede926d30285..30d87ff3c227 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -585,11 +585,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		return;
 	}
 
-	ret = dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
-	if (ret) {
-		DPU_DEBUG("failed to populate layout %d\n", ret);
-		return;
-	}
+	dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index abe3a1c0e409..095bb947f1ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -277,25 +277,15 @@ int dpu_format_populate_plane_sizes(
 	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
-static int _dpu_format_populate_addrs_ubwc(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *layout)
+static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace,
+					    struct drm_framebuffer *fb,
+					    struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
 	uint32_t base_addr = 0;
 	bool meta;
 
-	if (!fb || !layout) {
-		DRM_ERROR("invalid pointers\n");
-		return -EINVAL;
-	}
-
 	base_addr = msm_framebuffer_iova(fb, aspace, 0);
-	if (!base_addr) {
-		DRM_ERROR("failed to retrieve base addr\n");
-		return -EFAULT;
-	}
 
 	fmt = msm_framebuffer_format(fb);
 	meta = MSM_FORMAT_IS_UBWC(fmt);
@@ -330,7 +320,7 @@ static int _dpu_format_populate_addrs_ubwc(
 			+ layout->plane_size[2] + layout->plane_size[3];
 
 		if (!meta)
-			return 0;
+			return;
 
 		/* configure Y metadata plane */
 		layout->plane_addr[2] = base_addr;
@@ -361,60 +351,36 @@ static int _dpu_format_populate_addrs_ubwc(
 		layout->plane_addr[1] = 0;
 
 		if (!meta)
-			return 0;
+			return;
 
 		layout->plane_addr[2] = base_addr;
 		layout->plane_addr[3] = 0;
 	}
-	return 0;
 }
 
-static int _dpu_format_populate_addrs_linear(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *layout)
+static void _dpu_format_populate_addrs_linear(struct msm_gem_address_space *aspace,
+					      struct drm_framebuffer *fb,
+					      struct dpu_hw_fmt_layout *layout)
 {
 	unsigned int i;
 
 	/* Populate addresses for simple formats here */
-	for (i = 0; i < layout->num_planes; ++i) {
+	for (i = 0; i < layout->num_planes; ++i)
 		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
-		if (!layout->plane_addr[i]) {
-			DRM_ERROR("failed to retrieve base addr\n");
-			return -EFAULT;
-		}
-	}
-
-	return 0;
 }
 
-int dpu_format_populate_addrs(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *layout)
+void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
+			       struct drm_framebuffer *fb,
+			       struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
-	int ret;
-
-	if (!fb || !layout) {
-		DRM_ERROR("invalid arguments\n");
-		return -EINVAL;
-	}
-
-	if ((fb->width > DPU_MAX_IMG_WIDTH) ||
-			(fb->height > DPU_MAX_IMG_HEIGHT)) {
-		DRM_ERROR("image dimensions outside max range\n");
-		return -ERANGE;
-	}
 
 	fmt = msm_framebuffer_format(fb);
 
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
-		ret = _dpu_format_populate_addrs_ubwc(aspace, fb, layout);
+		_dpu_format_populate_addrs_ubwc(aspace, fb, layout);
 	else
-		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
-
-	return ret;
+		_dpu_format_populate_addrs_linear(aspace, fb, layout);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 2f2bff14c0db..256ca25c37a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -37,14 +37,10 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
  * @aspace:            address space pointer
  * @fb:                framebuffer pointer
  * @fmtl:              format layout structure to populate
- *
- * Return: error code on failure, -EAGAIN if success but the addresses
- *         are the same as before or 0 if new addresses were populated
  */
-int dpu_format_populate_addrs(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *fmtl);
+void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
+			       struct drm_framebuffer *fb,
+			       struct dpu_hw_fmt_layout *layout);
 
 int dpu_format_populate_plane_sizes(
 		struct drm_framebuffer *fb,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 8191282b8819..1431ea753a4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -683,17 +683,9 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		return ret;
 	}
 
-	/* validate framebuffer layout before commit */
-	ret = dpu_format_populate_addrs(pstate->aspace,
-					new_state->fb,
-					&pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-		if (pstate->aspace)
-			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
-						pstate->needs_dirtyfb);
-		return ret;
-	}
+	dpu_format_populate_addrs(pstate->aspace,
+				  new_state->fb,
+				  &pstate->layout);
 
 	return 0;
 }

-- 
2.39.2

