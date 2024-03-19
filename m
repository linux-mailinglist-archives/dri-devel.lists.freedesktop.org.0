Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA86787FE9C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FD110FAB3;
	Tue, 19 Mar 2024 13:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="behYZbIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AD610FA8F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 13:22:07 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d49ca33dcaso46273051fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710854525; x=1711459325; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dKI2zwb8IPiI5g9nKyo02YnrtBE6ItshoGtglMZgPxM=;
 b=behYZbInWUc3Jmm6uM4XTlU8tt8jqmT0YDqTi02OjE3d2GC6Yx0EXU0U0RaSVTXmdp
 qDcpBHgWF1lU79yuhtBqBX8yj1smHh9DKg3N3yhnN2t+O/l1EokkDQNGr2ZUksX2l6nW
 0L5mUbXUXQ8c0aSBRKJ39+0bovoK+x2FO2c26osugvYCVQjK7vU1BbhPnIggTLFM7gaz
 vZOCCxuyyDg33QXYiLOUBCiWLX0uLAeryYdQzimuxWCW2Fe25gjHB9W7Fq43DNfXsYQn
 abGi13cC00kEJ4ivjJS3ROzrROBG6shuO1ynY/0zeeEzcHrvXqkrTBUe3XV0PZy3wfmE
 HaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710854525; x=1711459325;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dKI2zwb8IPiI5g9nKyo02YnrtBE6ItshoGtglMZgPxM=;
 b=XYUzyJzWs6J9wsmZylFOLl7xCHcyws7d8MBw22KNq4u06cccs22US+xzc9roeXZmQM
 YB4jqu8r+7w/kD4CgWy9TA5o8AZVQ4ZxxANF2QpHZRnvJacl3Hlz1isUlXq1oZaapN0e
 9TJjUMr+gQhqJY2L2Iy95Gb8bpzA6PoLF2+ZSmCLZE1F0wCMTY5DlCdh4aDNUgj/AEr0
 rbKyaSx7Y+RUOyCHPi7M1B1E5rXDV7m3xfNP8P2LSBqAb5r0L9VpFpNT8zHA7O+tAya0
 Qz4sYRI1DkrcECew0z+Wywc8wd94JZqzu48slOs0O/blzUe2NEAeZLg5GSWppdR1wH7S
 buag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPCIbwqCvky7zkmoT1OC1mTzM/9aEvqDFXhICJDu1cPNEGymK0eNQdCcdk7/szMzxoMxJSHcIhUKW10eiDCyXc4TpFvccfmo5hgr5nrGr9
X-Gm-Message-State: AOJu0YwiXJispyYrU2ceUj9m3QyTCArupmjdrifz4JXQJQGWCp7gBxFe
 0+N46bcV0aes7IpbwVOd6BJThSQfGJ8ShloNnJwx/yXu71YHj6auaMC/2iUZq56PKixqYlK/8yi
 q
X-Google-Smtp-Source: AGHT+IHq9v3W03NLwpVVlxf9F4CRm6prQJ8JHdzaZQb95xya9Fb+3Vd1JowzCYBfImR7epuE66nlZg==
X-Received: by 2002:a2e:2c05:0:b0:2d2:dfd6:8335 with SMTP id
 s5-20020a2e2c05000000b002d2dfd68335mr1888479ljs.22.1710854525405; 
 Tue, 19 Mar 2024 06:22:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:22:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:02 +0200
Subject: [PATCH 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes to
 atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Cm466EMiV3rqjsRkz5DkhNg6Qor98v8Q4JQTPUTq088=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF3yvndp0SUw1KM5VaAh726lqpCUr5AykSQ9
 4tkZJ/ktKeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmRdwAKCRCLPIo+Aiko
 1UOSB/wL/o++N0d5TuuI6v3xEd2k+q/Uo2k0LJS6hV3hZyG1Xpp26i8LYm+608rJXZQ2C9td1CH
 5XmNsV/93X1TKbucnRd/ZzJXQNd1KEwZc4e/SX5yZC+RAWIVOzOjmTt3LaUQoB/5CkV1pvjTGgN
 FpqqCFn7Hifw9KlgaSuntVOFsrXUO2dZ0+oHAkBLWu8bPeKaLBKsg4UBOr7hHWW9REsZYMsQzVH
 Wk4+DEr68cWG3/FrlNZ+gtzgEF4XTUNxxi8xeyr45HrEvpBiOijdsxCxYmifxz3AUYCOkmFaqkb
 2Lz0CV4tJurf/4IUHXbku/FMPJ0oiscRnONIOhEj8wiFqC8S
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
index d9631fe90228..a9de1fbd0df3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -673,12 +673,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
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
@@ -864,6 +858,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2

