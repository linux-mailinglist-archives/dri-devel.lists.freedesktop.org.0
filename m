Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D59B52E2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 20:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2334410E6F0;
	Tue, 29 Oct 2024 19:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xfck8RqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E47410E060;
 Tue, 29 Oct 2024 19:42:59 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id
 5614622812f47-3e619057165so3157332b6e.1; 
 Tue, 29 Oct 2024 12:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730230978; x=1730835778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TaIdkluJRQnGuMAA898Bqtz2g8g1yMGAe+YroMJ3Fzk=;
 b=Xfck8RqT1rIoa2QTSqKY3VIMzNS8nctc5sLHEANwmRAg1AKJSWqKGcFvkJz4vzWWo3
 mxqy+7L533eDtvZwElpRo4Id2pt8kuuqIxEz/CZDBhzmct9tx4ZQMQqsjQZSFpFuUrQB
 BvLtKyqvZpin6AnyYn9dtqHnZtyB9cwvreobErsJePd9AE5YdLTesNAAFj3v5RrRjwRP
 gqS4IRZUaSZ9h6IwVmCK5aS6voFcZermVZYga8I+z41WVpBZ6R1tHnTpNddVBbzalQZE
 TAsAp/Nu9oAL1jOLxDYidPgu4SBjZoSTconu52iconQyCEnNIbl5f8o+R++RKgUJtOeG
 8EFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730230978; x=1730835778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TaIdkluJRQnGuMAA898Bqtz2g8g1yMGAe+YroMJ3Fzk=;
 b=g4/VIwahc5g4uSloRmhjfgW2An2G3EeYjGg9ELMILMcgKQeREMdqyA66ySAaGgASGT
 7mf17AqtFae5P7pzxc7ZoslNhx8tvUpUpdXGFkBfiE9oGzp0q47KxC1YiNq6R0t1kjda
 00VOnKai+YiqJJFDVTkoh02WzcNrjNyIbY+m6sA/z6aCUUp2QFTMOAf8mR5S2xQw0Ac6
 TGr+qo0tJgIRTzCKIMzPhwsEQEzQNOj90V/8caIK+l/3LafXqozZb/irrgXB3vgBTQax
 Go1XRdXCRd3tWSR+cFnBtktmuASk1higCzZvVCp2YT/arXAPW8+J1PL/SgMNaQ7F0kq1
 N6Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWurjPUhDQ4BXa8zZ1S04/1RkU0VeecekCBt2fcDf/zNBhoA9V1Tlh+neNU9AAWl4ywsERnUGULsLwZ@lists.freedesktop.org,
 AJvYcCXrw3ILTOSUSG2Tu51nCTEFcmo1TxIr6c0GFt+GRm2L6R+gvPyGyVa4h1grilQATbjk0UAzgO8/nuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQp869EKjmirISLdt+w5KSca8h7kOvwbXLA9FhK9jVjvuYtWuH
 5UFkngTLxaG1AJdMvkni4XFUoE4vUr/h1daqULVhigUKsnzmc82j
X-Google-Smtp-Source: AGHT+IH8Y6mHGJESumZCtyH9ApNxBWJ7xnyPC3msCvWWq8Jvmf+vsM+TIkPiDmEpzNu1wHSKaSg/mg==
X-Received: by 2002:a05:6358:d38f:b0:1c5:e2eb:5aad with SMTP id
 e5c5f4694b2df-1c5e2eb5bcfmr138356255d.20.1730230977077; 
 Tue, 29 Oct 2024 12:42:57 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d1798a839bsm44970316d6.36.2024.10.29.12.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 12:42:56 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_kalyant@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH v2] drm/msm/dpu: cast crtc_clk calculation to u64 in
 _dpu_core_perf_calc_clk()
Date: Tue, 29 Oct 2024 14:42:10 -0500
Message-Id: <20241029194209.23684-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Zichen Xie <zichenxie0106@gmail.com>

There may be a potential integer overflow issue in
_dpu_core_perf_calc_clk(). crtc_clk is defined as u64, while
mode->vtotal, mode->hdisplay, and drm_mode_vrefresh(mode) are defined as
a smaller data type. The result of the calculation will be limited to
"int" in this case without correct casting. In screen with high
resolution and high refresh rate, integer overflow may happen.
So, we recommend adding an extra cast to prevent potential
integer overflow.

Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
v2: Adjust subject.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 68fae048a9a8..260accc151d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -80,7 +80,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
 
 	mode = &state->adjusted_mode;
 
-	crtc_clk = mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
+	crtc_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
 
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		pstate = to_dpu_plane_state(plane->state);
-- 
2.25.1

