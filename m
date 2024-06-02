Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA08D785D
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 23:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9414A10E16B;
	Sun,  2 Jun 2024 21:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d96/5mHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2162B10E06E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so4178317e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364394; x=1717969194; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+uEsmC6Fs93CtWuR8khej7lWUC750pqp8djwlJQOosQ=;
 b=d96/5mHETRe0ONfnXMF6IIEtfOdPzaent7RRyYhVhyXz6InV1wSuHuj0TYxlOPJWlI
 ntVKXqXUlrEl3LhQkxD2F80YbN/0UaKIbptsZygu+FYGgin8ggeWfDzaZHANfl10Y3zH
 cxbdWvwjOLmG5zEkeJcsdjc/x/mrbVgMX+9tr5WYe5+em7ltYcwC9EFavnYM6bDpRNq/
 8JjNTbx0sCsPq9xcvd9dWDfX6UPK/SiEZuae13WBIpwZe2UaSrd/7OPchvjMEsPAyIYg
 IZ0wt2P98ndgjWj7mwiIAdoHUea12P3rUIzejjXeF+Qm6D4jmGTUV/MT9WY3XpkAQcqn
 hadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364394; x=1717969194;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+uEsmC6Fs93CtWuR8khej7lWUC750pqp8djwlJQOosQ=;
 b=a6Tp3RUbyUErPObgCoNLN7oSf+K1Lzqm7agYSAEE5z45CP0Er3bL2sLhSH+U+UP/Rw
 jl7kRFRSkkIHSfQf6Kmm3vu0U6Uxn7XqgPuXjzgzz0YXxD/iCPwVAY6yEkpPEZeXkXrA
 +hvvrGJIWzwVwUyQ9ymDqu5QW64lsDYoEfetiKor+jwZcyIXA43tXceXaAzBxt8WgScF
 j6HoX/co0xDs8lCLFo/c1lsY9HsEhlKeNSlnWyZk/LxCTB2frC+sXIHFsWjB3OEd+bq9
 94aTGnhJzVIkHj1ScsFhmBkE15/S2Fw/1sS94t1b+Q1V1P6gyRgXVQVL0IbMpTg+deZD
 x1Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYXXarQxkczS4nkEYPCI89DgR0rmgD/dev4v6nC3ZZbBMBLMOqfLc9fUMxO+v9fNimK7fzkiOymLnqGWx65GmYAaz+GcdeAK5vkkgf4YyZ
X-Gm-Message-State: AOJu0Yxz7WR9clI2zYaCF28bcPsptb+U4Qlx6zGB5U6HA/F9lJcVN1JS
 8eaXgHOgpDeg0eTPOYv6FcoPfONJkyuMxRG4LBjMo6jDWw93qSHI2jGs2vx7eJc=
X-Google-Smtp-Source: AGHT+IGraiOrh//2iVqXW+yWmUJCNiUOLMZnjgqJjUSn/Gflfmxt4LJkXTjjAJ3McUyifF6aR9SLBQ==
X-Received: by 2002:a05:6512:74c:b0:52b:2f78:9c92 with SMTP id
 2adb3069b0e04-52b895694a3mr4169462e87.5.1717364394346; 
 Sun, 02 Jun 2024 14:39:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:50 +0300
Subject: [PATCH v2 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes
 to atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-4-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=snF0WgX3Uzkz2+5I0055uCAP2cYsbGgSQ2GyOQRAHdc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalEj7K/et5w8ArfSrqPzQvVoUCrqytS9Ekt
 R7LzyoaZOCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1a6NCACE40Mt5owlIaVRYYPMHs2kfEaF7aKJAnhZ8wPuMRSpTxBrdJ6o4yZBMZ84cvtBu0YELEn
 ev21zL8SG3E2ASOo08wsa/7ZJWJxURdPwL6f1oVnGoHbs8uvaEioXCE5JBnA6rp4HERXUSRDP2T
 ia4tF5vzPaTuCuMNKVaOPcrb9nNAz5jGvjuc06deWox6GE48zuC7tnVblwbR7ait4W+eRm6OMZ7
 aVhYn2ncV7QHf1ORB/LeE/OYX2Zrl0RxQLe0yuuifr0peggvhhTlQeyxxMS5E0oZbE1cc/62TIq
 OPBikQ47OT7+DmDRFc1wyRTTOUzIwp7m0oisnwmefGGVGvWh
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

Move a call to dpu_format_populate_plane_sizes() to the atomic_check
step, so that any issues with the FB layout can be reported as early as
possible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a57853ac70b1..927fde2f1391 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,12 +674,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
-	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
-		return ret;
-	}
-
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_addrs(pstate->aspace,
 					new_state->fb,
@@ -865,6 +859,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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

-- 
2.39.2

