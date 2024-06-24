Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1E9158AB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE9F10E592;
	Mon, 24 Jun 2024 21:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pbrcmL10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B949310E578
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52cdb0d8107so4040718e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263636; x=1719868436; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fQ+DHa1toN2+n7TWo7+TJQaBjFWVOUMw0Gcw8PZtG9Y=;
 b=pbrcmL10es4NRZvANLhC8oghPQjZ+othVzXEgSTvCRryT5en+d1aKZ3cBJGKclk5lj
 KQeIWukf/cfc2LhNQD5VPAlM7BXfOG0TsBXsRUnwiG2rBkGNVxj/co4QCizt0vUEEFY/
 ZBKRR0tTP/upzmd+taQW3ppp3ilEgDxnMIHlt4Ac35Bjc5Ta8f0nowcTmUsyRdZZROj9
 YSj9k8ks2kvgAarSGuViuOgQQEvY7XzbxetyMk9MYB/2TPSPoK7qg0TPZSrXkVuDgKCN
 QfnPm6Mm0MARUrzUL0/oeNUw5nT+iD1LWuJBu+xYYO9HyVzuZEV+Y68UOMmW3kiQ1qhO
 CLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263636; x=1719868436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQ+DHa1toN2+n7TWo7+TJQaBjFWVOUMw0Gcw8PZtG9Y=;
 b=uKL2VTP4mpsxpcEw91JdkK0ncehRVdlE6OJB6VpktgqBQ0fcMTs/uAo6RtZ0KYDlX1
 5ItGZQhOtqyS5qYeDXeCOeB6sV1Pl1wVaD6wgeEfz8xeE9pJ87+eVc+T5jNBU9YVDGcA
 1++79uA4BVltw67ok06q4hTmPlLmz9y2ZVf/zU8y/uz7EOln/cikoNSgONlOIh+XUC6l
 AnDq5LrTpASe+tmzcqUMhQJFSD+1V/JbPyhLBfOg1nHpoRi3f6SVVoitG/NVRbRnz0b7
 aSFDnMK4vvRdAR29aosGp+S8fmj9PzuSjKvTjTt8vUmjfC3xSaWc4goKetxoSMO1Q4zT
 CbqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVz8J7UOBek/yJkSMijfq6MSc4ZWFtMDIPGtWMk2ZbVTii8T3KWe+2oHxbk8OOpzq31ZCmp8isJpPwbIMM8bAjH+nQDIIPssIUkgIahfix
X-Gm-Message-State: AOJu0YxoiGGAA2Bhm7WM0zvXD7C1y7aMGbS1x8dJA5m9z57CMPK/bPGm
 XqQPsYLFnDyqvfPjK7cd9CsG4l2s0GqR3ipt1CndwCC08aPeUosqCXDS1Z2VLWs=
X-Google-Smtp-Source: AGHT+IGWt/LXA2KMs7RS+iu+Bu8klNrfjdBf/mEJe/fEN6UonHslShDU5B6mjmWqj3kffaWDvXxzCw==
X-Received: by 2002:a19:6b08:0:b0:52c:8944:2427 with SMTP id
 2adb3069b0e04-52cdf7f65f3mr4135378e87.31.1719263636039; 
 Mon, 24 Jun 2024 14:13:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:53 +0300
Subject: [PATCH v5 13/16] drm/msm/dpu: move layout setup population out of
 dpu_plane_prepare_fb()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-13-501d984d634f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KA3D+m/a7g73ZaHa7e8wf9n+neLVMHpRovLAs28rnZU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGJc+UK3nuvzNMK7zG+4jXibMyipXO8oslij
 VTDrAuOQteJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiQAKCRCLPIo+Aiko
 1bBuB/9DPqusQEDVhZuLT89pAyYTgat2sPdMAaMwHfJeW3Bk0ixx0YJaxEWbW/ikxoly3EVJJeP
 6jXMU8CGkewneOhqb+yl2G+2oIzK9rbpqBIi0jf8xuJ67/hlOa6XR5oeVZ4PtNuUtqWMgXJvgFs
 HJxuVy2VuqN2/+XNhoP05xpreYUb7mjCQN8GT0uxBQwZO3aJPt1uOc5MVjun1eQPTcu5wIWTCdJ
 aIbpzB8Lz4NUFyDPVvBdN286xMwHN/gvLNw5Z1A6/z9OWGlYHq2lDdswJXMwNYgPyI5j9r1JfjO
 xZlFo1kQNW7vDUcrZjNhnlnxLmFZo4hrThNBN1s8wzMXrdGb
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

Move the call to dpu_format_populate_plane_sizes() to the atomic_check
step, so that any issues with the FB layout can be reported as early as
possible.

At the same time move the call to dpu_format_populate_addrs() to
dpu_plane_sspp_atomic_update(). This way the all layout management is
performed only for the visible planes: the .prepare_fb callback is
called for not visible planes too, so keeping dpu_format_populate_addrs
in dpu_plane_prepare_fb() will require dpu_format_populate_plane_sizes()
to be called for !visible planes too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1431ea753a4f..a309b06b0992 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,19 +674,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
-	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
-		if (pstate->aspace)
-			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
-						pstate->needs_dirtyfb);
-		return ret;
-	}
-
-	dpu_format_populate_addrs(pstate->aspace,
-				  new_state->fb,
-				  &pstate->layout);
-
 	return 0;
 }
 
@@ -863,6 +850,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
@@ -1090,7 +1083,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		_dpu_plane_set_qos_remap(plane, pipe);
 }
 
-static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
+					 struct drm_plane_state *new_state)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
@@ -1111,6 +1105,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
+	dpu_format_populate_addrs(pstate->aspace, new_state->fb, &pstate->layout);
+
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
@@ -1175,7 +1171,7 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	if (!new_state->visible) {
 		_dpu_plane_atomic_disable(plane);
 	} else {
-		dpu_plane_sspp_atomic_update(plane);
+		dpu_plane_sspp_atomic_update(plane, new_state);
 	}
 }
 

-- 
2.39.2

