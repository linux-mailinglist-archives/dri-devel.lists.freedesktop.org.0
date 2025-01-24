Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF2AA1B47F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 12:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C31A10E80E;
	Fri, 24 Jan 2025 11:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SOdP+98a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401A010E7C3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 11:14:44 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30613802a04so20307191fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 03:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737717282; x=1738322082; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HqZJP4iufIhevyvAoHW7Eu6OisyxKDYbF5HtjUMC78k=;
 b=SOdP+98aXHv5Z4EtWbnZPoamq8h07j8aFP/Kk4E1BwC3euzL24c830MGcYK3yXTYqf
 VjMFjpwTyHz4iKbXrmV+QNLGntGEr4oxdYKCZvpKBT03ALZgGlzBOvLBghR3w+6oX3ZP
 kR9gOBWRgrIQgiXPL/x7cQkg05wfZt4CKWyJ0kDwRcswjek474BTYwZVGQdtf1ndMAuR
 7zoUWl70Nt1jNrLMpxM5oV2O5+ShcHh+wQNG2WP9/+AcYIbLIcwbMPEqJWg8mOjoAqnj
 fW/GsJwWA52HDKltMvG9+Vo+j/Ij9K9lM+olZjqbeygWuoSp5RLRasKqBmkInJL0rvXr
 3ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717282; x=1738322082;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqZJP4iufIhevyvAoHW7Eu6OisyxKDYbF5HtjUMC78k=;
 b=OsxhLK3cEg1+Se+pJDfClJoF5pBnn+QGv0wEOctNRXyrkFbxwF7r1piFZ5xuATkBxy
 JEw1S6NR8j1Hy9zmgeli/Q0YIE4TJzH6vmOAvQUyUwi6FadIss0WWTXlLr0q84zQYJVj
 J3MwdD88Y3xKjlQi/NT92lE4qAEn3omkw13UwAb0mv+KBNOzsJeA6n87DIh/dtjT/Hl3
 Is2jfNdTXIacmN+bdDANBZhR9Hljv1IiBq1PrS2YHkuXpvLn1ZBZsunu5bjKJBRP1F8C
 KlWrmVIRu9ljsO2Z6oO2qYwvArTcTAHNMEp4/mff9CxnW0aqRmvKymeutzz27C3KRANE
 jasg==
X-Gm-Message-State: AOJu0Yxz7WRuLsuEobaPe3i4nykpvHuFfOG85YeeyN5jAhM6TcQ5AHKo
 NWDH8AGBxc9eKpsYtpkikfO9+tDiE+c8rLJvfImtyOMppkH6y4swuoWWoG6Ik20=
X-Gm-Gg: ASbGncuO573/ZpGdX+npkpjq9M0UjzM4fwivJrBiDp559TaVvXoG0dImNQFDydYQ/lc
 n4kqLHWWU7a9bvqzNjIMvIBJxmJO/4lYiH9pgzDZMtLPcn+0Ux71ek3cuWoein3HCKugElunLYP
 A7Q2u/B/0NWR1jQIKlNLOYMrqUzmIH0RLXfwF8CeoDSrdD05DvUX9/gccXbgsoYlV1oSm6lAkPh
 UmedrLDJqayN5fxOd7AVh1E+SB58I8xFcQkvsNcF+lYpyPzcRRxUMHtbSAgBnbJ/gWxP3sAHRAz
 msQAdfLHVvrv
X-Google-Smtp-Source: AGHT+IGbygDMYFkk0NHDouJWb1lGgESCNIcAMGqnoMkLcYKm6hxwcjQGKts6Rc3SjiI4FqcEWgmtng==
X-Received: by 2002:a05:651c:888:b0:302:4115:acc with SMTP id
 38308e7fff4ca-3072cb133d6mr127175271fa.26.1737717282519; 
 Fri, 24 Jan 2025 03:14:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:14:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:24 +0200
Subject: [PATCH 6/6] drm/msm: drop msm_atomic_check wrapper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-6-b0c05c9eda0f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3359;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=STSqFPRboB3sQ4e2j7TOcKj/UooNkL+QUHC/wJG4nEI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YVzfyLXqMiGQiguLsbAbNz16n03nkZg3A86
 jritelnE+SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FQAKCRCLPIo+Aiko
 1ZfHB/0TLEmivajMQxYP83XdMY/7B2Y1Mw8PXawKgnfObCHfQq/5J523H4HSRJOCN16gkYtXIgi
 DG+J71a51F3+tTe5P2KMApNtGaO8VHbgbB5MArsHLgKf0ne1ii8aMTPWoBUDqTPHi3Fe/ojPhDC
 T/RnSmXAjEiZDr+fUnUgaLfw9FhASwWi8ONjNGgSMtx6fc9iELeKTHx2icUnyNdbuRgqzvXR2i3
 hjxzM4vtFQ/ALQof/kfBO+tZt7ZEzws81M3gas+UpTWPSL+dNlxYUioN52zwCpheknppTVzGasH
 NQetVf0FO8fyyA3JRLc9DrI0yV00vsBbO/pDkmB8yzE6eBRU
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

With the CTM and CDM checks now being handled by the component
callbacks there is no need for additional wrappers around
drm_atomic_helper_check() wrapper. Drop the msm_atomic_check() function
and use the helper directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 14 --------------
 drivers/gpu/drm/msm/msm_drv.h    |  1 -
 drivers/gpu/drm/msm/msm_kms.c    |  2 +-
 drivers/gpu/drm/msm/msm_kms.h    |  7 -------
 4 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 4377233bd6447060b1300cc0d6877b6a777b1edb..550bcc77acb0426df1f06b08032307c0deef6c4c 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -181,20 +181,6 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
 	return mask;
 }
 
-int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	int ret = 0;
-
-	if (kms && kms->funcs && kms->funcs->check_mode_changed)
-		ret = kms->funcs->check_mode_changed(kms, state);
-	if (ret)
-		return ret;
-
-	return drm_atomic_helper_check(dev, state);
-}
-
 void msm_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fee31680a6d540d87cada67342bd5bee721662df..321f3c1f4932434e7fb6d18548f27df13c56eb71 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -232,7 +232,6 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
 void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_state *state);
-int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
 struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
 
 int msm_crtc_enable_vblank(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 4cfad12f4dc1f91a78b36572f6643ac135e00067..2d934fc0fcfd90a67f934d01fd9b194d4eb97609 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -22,7 +22,7 @@
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = msm_framebuffer_create,
-	.atomic_check = msm_atomic_check,
+	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index ec2a75af89b09754faef1a07adc9338f7d78161e..e60162744c669773b6e5aef824a173647626ab4e 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -59,13 +59,6 @@ struct msm_kms_funcs {
 	void (*enable_commit)(struct msm_kms *kms);
 	void (*disable_commit)(struct msm_kms *kms);
 
-	/**
-	 * @check_mode_changed:
-	 *
-	 * Verify if the commit requires a full modeset on one of CRTCs.
-	 */
-	int (*check_mode_changed)(struct msm_kms *kms, struct drm_atomic_state *state);
-
 	/**
 	 * Prepare for atomic commit.  This is called after any previous
 	 * (async or otherwise) commit has completed.

-- 
2.39.5

