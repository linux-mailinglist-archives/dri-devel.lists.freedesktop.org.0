Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03032A1B47D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 12:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEF610E868;
	Fri, 24 Jan 2025 11:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="doUFmtRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56E010E868
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 11:14:38 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so21374121fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 03:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737717277; x=1738322077; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=49SRE7UkGSC+0Ssj+5USiH7s/Cegkl8gvGe0j5unkHA=;
 b=doUFmtRpDjMhNdUR9ob4RivhZLGybaPI6tFdd2p25SUxsH//G4EVgrXzABKDwVAaJD
 aHvyPm5qepuB2ALoragEd+DoogKMXvV6kDO5cHHjLbfmHjVotAe4zwDYFgoHsNpA8r6D
 ywUCPWIC44rxjkDDTidG0qjp1HIxtVjQqqItHP6V7R+10o2B4/a+JxtqoJdglCq3GDoB
 7RmGfTZnI7JUAVVPRs4UnP/lBVLKDEfR3cSfyo4Yj2FwCGXGHPiQSoCxPN6pAeILdj7c
 H2evWuQjp6zf/HTBFNEfK6y0xciN95ZEgRAn1SzlNZYBSQXgw8uPxcP0qu/mkgx7JVAs
 y6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717277; x=1738322077;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49SRE7UkGSC+0Ssj+5USiH7s/Cegkl8gvGe0j5unkHA=;
 b=RCOMEgDD8XD9n/JW8y0oyNsPwxrrRomEwnSbQsyWw9lPp9Lq1dY8YhXfJNCgtuf5Q5
 BVuZCFqw87nUL/MLZ9hSipevoU0NrFGSWkNBzkgka3oZpr/zP7++YxDPJTNLrNNXCuGB
 v0cvQUEoNmanBrQNaeK5Wu96GBrHdQavQ9mr2nv4q6I2ZpHBt1dLHFznfGeqC6I3Zos8
 G3cgoT/m/BessKA5xmJHVcZN5r2blucdmtJvp8O++5514F+2hjvcRTwOhaq8qCURCQkB
 RiWllTHfo7bsME/hWVgqmEC/0FfX215Z/FYyZgELjiE1KyP3kOEqauuDnvGrcP5efniM
 Ow+w==
X-Gm-Message-State: AOJu0YwIzNHFaYo9TbXV2/rricBsugT3dZ3Ra5SLu7cgK992fUNKxysi
 yqbmq1+aMFmm/VPbi1ju0+uD5NwNUWGZkSuPjfwRZ7Aoy1pddC0f7HN4klwQeu8=
X-Gm-Gg: ASbGncuUToQio86UoW4rrxi22PL/TDCSSKzoRo+pqgiQOZSWmaNsG078DWULKLkS8se
 pR2uyt0FQoqUZ5FUA77pTvEeIgcy7Bs3IEtqXMyRg+rYIgruxTp8ClStCahZ/h/OC4cHR/sm4VH
 p3BmpT7arAEtOmUBrGVejzYQADKA3IiT4NtVVwDwFU0TVWsywwBOgkwk73k6Lzwd7KiS/qmM6uC
 A9FbUIxikBwyC6o0NvoJJS+2ocAquNmscp4kafrD480fnV4akd2f4xpdsQVCno/tzB9OazfuQWM
 TSedcgrjLdih
X-Google-Smtp-Source: AGHT+IHvm/UlHmhJYepFpY9+XAqem3yxGy84kPFrHVQOs3BnnMkbppx70vdw9RjWnl6viFsEaAv8ig==
X-Received: by 2002:a05:651c:1309:b0:300:3a15:8f0d with SMTP id
 38308e7fff4ca-3072cb284e5mr104974551fa.34.1737717276912; 
 Fri, 24 Jan 2025 03:14:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:14:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:21 +0200
Subject: [PATCH 3/6] drm/msm/dpu: stop upgrading commits by enabling
 allow_modeset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-3-b0c05c9eda0f@linaro.org>
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nTNh12sSi+bFS767UAWn/EcHJvQRJYETlDdgdnAZ+xY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YVkHVEQzO2H42gTfxsWoNpxy0mROcV3oEz4
 AyfFaZyJYWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FQAKCRCLPIo+Aiko
 1boSB/9Fjf0rWskLkp1CRYYrfV8Hxc3Cp6gZ4ThZcniTvGGLG+/0McgLdqyk+A11cU2jzsLNM4g
 +V2aI4HtslMp1QD6fmTapUdo998Shgg1k7IDk7lObsiKVwfP9CQln2bLNyPqcpo4AQEBdk4vKIT
 +KPBXsjDxBOCrTTfaI9JHj3JX8J35I+7K+U4bA5DBcCdhc5zIExDoAxr7RnL8yin2eWp0JkMiTY
 4kaQLwdPGFFr2tuzRbiV8wUm2x2kT/Oj8qSFKezc8VLG5XLzIM3AXGX1Qrg70eHCTL50IlzF6gx
 sGbZtPmwyIMNkDV2Jck3IckCAc6KtpDzcDv/6Uj0iyBx1UgW
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

As pointed out by the commit c5e3306a424b ("drm/atomic: clarify the
rules around drm_atomic_state->allow_modeset"), the drivers are now
allowed to set the drm_atomic_state.allow_modeset flag, as it might
break userspace API. Stop upgrading the commit to full modeset. Instead
set the drm_crtc_state.mode_changed if modeset is allowed and if CTM has
been enabled or disabled AND check that DSPPs are assigned to the CRTC
if CTM is enabled.

NOTE: This change has userspace impact, as now non-modeset commits which
enable CTM will fail.

Fixes: 82836692d5d7 ("drm/msm/dpu: manage DPU resources if CTM is requested")
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://lore.kernel.org/r/20231010170746.617366-1-daniel.vetter@ffwll.ch/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  9 +++++++++
 drivers/gpu/drm/msm/msm_atomic.c            | 10 ++--------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a24fedb5ba4f1c84777b71c669bac0241acdd421..84313bc1f9888452914612fab559b390cf38c705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -828,6 +828,15 @@ static int dpu_encoder_virt_atomic_check(
 							  global_state, crtc_state);
 	}
 
+	if (crtc_state->ctm) {
+		struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+		int i;
+
+		for (i = 0; i < cstate->num_mixers; i++)
+			if (!cstate->mixers[i].hw_dspp)
+				return -EINVAL;
+	}
+
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 5c8c0661cfcd85445950e0f273b8879e7f077727..fdbe49edf2e1506ebeab500e782d456d77ba4fcf 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -189,17 +189,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	struct drm_crtc *crtc;
 	int i, ret = 0;
 
-	/*
-	 * FIXME: stop setting allow_modeset and move this check to the DPU
-	 * driver.
-	 */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
 				      new_crtc_state, i) {
-		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
-		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
+		if ((!!old_crtc_state->ctm != !!new_crtc_state->ctm) &&
+		    state->allow_modeset)
 			new_crtc_state->mode_changed = true;
-			state->allow_modeset = true;
-		}
 	}
 
 	if (kms && kms->funcs && kms->funcs->check_mode_changed)

-- 
2.39.5

