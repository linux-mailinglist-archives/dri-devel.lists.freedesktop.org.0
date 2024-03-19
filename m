Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546FA87FE9A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3B810FAB1;
	Tue, 19 Mar 2024 13:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ghF7pV0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B51410FA8F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 13:22:05 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5148ea935b8so1905357e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710854523; x=1711459323; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uoxH2nSafGqlFxak1VvOTinRqhcDU4q0kbONIBvGYYM=;
 b=ghF7pV0j4ZUIb/5DtdCzOivIvgEMEXwlEaHtwaydYdDNiKv3Jz5PxDANc6z8DzMaT+
 W8t91xCWCq0TvQpLMb8eei1CbpnxUwMhT59rRc28xqAbuyrkgQp0YFGZfbyrLm1sDS/P
 RM0u9ZjISnqgC//l740z9Fu00JpyZ1aBeLF/33VAKJAdTrdcjZdV/Bf9aU2z+VAOsnfi
 zhFwQOGKmjhU5FMCGM3ueU83wjvcjSZ5u5z7PDgJ5A8hy43pjPo3AIalo6tLs9+4srlM
 FmIGjf7uVC0lKuLXZCvujkw1LxcmikSL8ihTv+nIqnVKQWNKPuhEVQ7chnBq6G45D0gg
 XPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710854523; x=1711459323;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uoxH2nSafGqlFxak1VvOTinRqhcDU4q0kbONIBvGYYM=;
 b=rrDjF5Klm+/o8dXucjpFd4J0dfLxR8PsM865JKSznu4IUH1rc3Z74M8EUpZnchyJmh
 URMb6YRYaWXgFEzY2A4zWPxVGDs1hFnim+QMDeMieiX3FQ1o+fTI6BNZP2xuRTIEbHlj
 MTeN3w4kDUsDAETIhEN3HoKQZQXV9hoCKjfzLa2ChftuE9ewLKTHzhEclW0Dq3O/jISY
 4CaPW8rTV50UzlZVWxZExA4NI1vg3ynlUhEo+uiUk/9LcyOtEQKCaofENFSzjxWf5mjB
 6HXtmtaJvWkBlAlxooNFyEEZv76g2kwWtH37MxCVX9ajCyRsjxP8Uz2M8K6/vTswXilC
 IpNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoRULuhxIdwz+v1f3gS8GhtDkXCMdFul1ZzLG5/3edufzFyKyLuYOr7tJSdLHWuG/+blWERyMkYpBzNCk7yjw52X4rJAUPmwANg1dWdFdu
X-Gm-Message-State: AOJu0YyORLDKYspsD6Sto1rX5Q7amcnikomXhHg1jXEK/axJtt5qUkGh
 Lvs9zo9uzADILj8tcFdHwEyAQ4o9q3ctGfsXEq2f1LgRSgS6c/SnweqYkD73ql+WacXrc3RKXCT
 h
X-Google-Smtp-Source: AGHT+IG7LcAyXNXLh9gEK/nZvccQqdCxoiZfBEmRbCLT+JwTOtMZhlpo7rls1imooGepjptLzAezaw==
X-Received: by 2002:a2e:7314:0:b0:2d4:6e24:3ca8 with SMTP id
 o20-20020a2e7314000000b002d46e243ca8mr1698051ljc.46.1710854523377; 
 Tue, 19 Mar 2024 06:22:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:22:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:00 +0200
Subject: [PATCH 2/9] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-2-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jvHmyU6LpSpkeEhCjtJZWDUfSAyNw4kv0iGJlybdwnY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF3mg/lUnYChbuRD3uRuuewKBgmUKSeY3E7J
 kpIKbB1KLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmRdwAKCRCLPIo+Aiko
 1YkvCACb8iLD+GOZcSSwv5SOOW8im/SZ3oCI5GcMebNmI7Mo+7zoVz7eOGwir+H1zGG1ynzzKT+
 YdfjeJjXAeq6tJ94Syp8MA51R+okeqmiOro/3rosf2Ht0w+3bRUGhhT8EzUk6qWbrTwNTexUDS0
 24zzUKN6gcCdGHATy5QLrzjX0kMHzPHv/MSTa6WWoKxHr/OzRJeuqfB2GaQVLoyzYtcneZsr7Rq
 kZ5DIJYy1hY+g0z1btfeBH+U4Q2pCJ4qT65M/EUarRM6sAlvI51sbLYQcvEfhVctqd+CFL/Q9/h
 fYNoF2APZFka11Nwf5YtDXcKxv2NgtTbE+WxsTI8QrDwC8xg
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

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layour in the plane state and drop this call from
dpu_plane_sspp_update().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ff975ad51145..5b15d8068187 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -646,7 +646,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -676,7 +675,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		return ret;
@@ -1099,17 +1099,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	bool layout_valid = false;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else
-		layout_valid = true;
 
 	pstate->pending = true;
 
@@ -1124,12 +1113,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
+				   &pstate->layout);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
 					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+					   &pstate->layout);
 	}
 
 	if (pstate->needs_qos_remap)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..348b0075d1ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,7 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
+ * @layout:     framebuffer memory layout
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -48,6 +49,8 @@ struct dpu_plane_state {
 
 	bool needs_dirtyfb;
 	unsigned int rotation;
+
+	struct dpu_hw_fmt_layout layout;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2

