Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8BA1B484
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 12:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531A10E912;
	Fri, 24 Jan 2025 11:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u+PPjaQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C4210E868
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 11:14:40 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-306007227d3so19968531fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 03:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737717278; x=1738322078; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fwj+mo5UAroSLJxp5Ewzj53zIrMhEzrxypv3EzqL7vc=;
 b=u+PPjaQk0QWd1M6pKcYXViA+MHouEE/wJp5lL7hGlCJG/mjFlBlbkLbe2qqisO7nzU
 l0ZEGFvUcDeVH+xHTzXmWXkhm7TA9lFurJHTvRywBbYaJ2/3JzcFFRr+yI0tu70fkFhC
 NNPdirM4rQEJiLNXWau+wswoZsGtF3rxSF1DtmxvqnsXJu4HyLP1K7WhyQqxIRh0klrc
 fkPV5lduMZ+SSL/DC6l/JBD/1fa+qYaKTt8ETUCI4v3W2KysQaz2fb/ZiUHZ8mcPYjz5
 NpGzNm4mhNziTXbdwd6EvkkhRO5TnsBKHEt1kPvFpYZ9UEm6XrwOb69QyBe6VntZTHib
 iy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717278; x=1738322078;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fwj+mo5UAroSLJxp5Ewzj53zIrMhEzrxypv3EzqL7vc=;
 b=MDAis/1wrlb6dFqbfqg+roTvUhTqYe3BS3cq8RT8D1qwNA3OtzADktq/FXvHIhQ40s
 o6lcur20IZMnCC+uLwGB5zltYjggZkcVC7sBJZDR300x6Unw5RbmxJJYMteMI5n5LwaU
 s4RCLkQ79RymTRT8YpY316xgpfiJ0qLBaogUAuhEVLzx5sHg/Ao2IDnbKWgx12aStnqv
 8aLZC6r+l8VQ/x+nMk+bR6xnB8KVd3JiawuhnOdUpaVBJwPxnqkkuvXfNG69lyEhuAvO
 JYa750jl4ciGex+HBHHzat1mq47L9estWEB0RZtgL+biALZgwK8Or/Ae4k5Sz/Bjxhma
 Kwag==
X-Gm-Message-State: AOJu0YwCbzdLF1Fy2B44WYBjffF53a1cvoZs3JGcSYQqQ35aLG8euJw4
 YIqkgDSnB/p9csyApOwL1apS0erV21nBOoYKNGhwsBm0lKEpZuMC2pwMMfQC3dc=
X-Gm-Gg: ASbGncvRnK533S982aHPwVnfuxgLst3gD9h2DG7EoftaIE+8rmpch9DJbunb8kk6fjT
 PCuL6l8kRu94VGp0kIbki4mck2PX94znJtWLpFH834Tk3Q44wZT1ccUnX1Di1igofp8O0TORYMD
 7uAlW/jjEMVni53AmjCqb0Ugf60sP9iH2T0aMgCAWjIj8iDUKivqBh5Aj1vOYKISMNRojgOVA35
 /eDHvL5Zw3tteLsVXca06OFpdWvIGgLX0QSGUroc5R1FRgoS9DaSAPSBf4E2tqsr0xpLt/qRzM8
 AGUP1vFy5aLx
X-Google-Smtp-Source: AGHT+IF+hU0ZazCKVSv6vYDDyjuO4CTENcYUETOBAM8LkY/QMiYkhDEDR5ndt0J3TA6a6cqVWwwrEQ==
X-Received: by 2002:a2e:a4b8:0:b0:307:2b3e:a4a9 with SMTP id
 38308e7fff4ca-3072ca9c335mr96093661fa.20.1737717278457; 
 Fri, 24 Jan 2025 03:14:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:14:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:22 +0200
Subject: [PATCH 4/6] drm/msm/dpu: move CTM check to
 drm_crtc_helper.atomic_needs_modeset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-4-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2997;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YiER9uGGuMLloEwX06ETqf8kcBguXBtNB7NcpB3/rSM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YV5nq8F9m0El+GSJKXaPPIb12nQcNBZmQDv
 tOzihmqah2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FQAKCRCLPIo+Aiko
 1e4cCACDuTp4Lz5Xz6+mOmcEorb5i8LjmnEd0GHFi0favS9T4leDhX3UvxN1wnDqIT7/IbQ14KA
 IvYZOrh5j7JLlzZhKJaGSwbv7qEZqsD/OULP/+gTbyTEjwZjY4kOKBzoSdAv8gEZMwEdYkrlOzU
 9FKe5VDy46cVYMrr2ekbdX0RNBD1qNrRLCZisI/vxIoZlWCSV/NX8jQvYxcbZLCyJ8F5biUbQn/
 HlN9vXvPj/9esINrbv3gKi4aC5LKw1oiPVnJJS40HeyQ1u0dY+UwAnxvEnsMJsZZitQi08XsZL8
 a3rVkeRPgkEvPL6XVJxU5yeXZ68SW5WD1rr2TipPVLU3Rttd
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

For the msm/dpu driver if the CTM gets enabled or disabled, the CRTC
should perform resource reallocation (to get or to free the DSPP). This
requires performing a full CRTC modeset.  Current code sets
drm_crtc_state.mode_changed from the msm_atomic_check(), from the
generic code path.

Move the check to the new atomic_needs_modeset() callback, removing the
need to set the flag from the generic code path.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c         | 11 +----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 65e33eba61726929b740831c95330756b2817e28..9a990386570e037f2b1c994a0140f2b7c4c84669 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1189,6 +1189,20 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
+static bool dpu_crtc_atomic_needs_modeset(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+
+	if (!state->allow_modeset)
+		return false;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return !!old_crtc_state->ctm != !!new_crtc_state->ctm;
+}
+
 static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
 	int total_planes = crtc->dev->mode_config.num_total_plane;
@@ -1535,6 +1549,7 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_disable = dpu_crtc_disable,
 	.atomic_enable = dpu_crtc_enable,
+	.atomic_needs_modeset = dpu_crtc_atomic_needs_modeset,
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index fdbe49edf2e1506ebeab500e782d456d77ba4fcf..4377233bd6447060b1300cc0d6877b6a777b1edb 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -185,16 +185,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
-	struct drm_crtc *crtc;
-	int i, ret = 0;
-
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
-				      new_crtc_state, i) {
-		if ((!!old_crtc_state->ctm != !!new_crtc_state->ctm) &&
-		    state->allow_modeset)
-			new_crtc_state->mode_changed = true;
-	}
+	int ret = 0;
 
 	if (kms && kms->funcs && kms->funcs->check_mode_changed)
 		ret = kms->funcs->check_mode_changed(kms, state);

-- 
2.39.5

