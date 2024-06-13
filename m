Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136BA907EF8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779B810EBE8;
	Thu, 13 Jun 2024 22:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TMiZRiPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB15710EBE3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:36:29 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so14693401fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718318188; x=1718922988; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+uEsmC6Fs93CtWuR8khej7lWUC750pqp8djwlJQOosQ=;
 b=TMiZRiPVTcQ2imvN1JKbv2CByXm7BNw7C2ovxjRibfYKg6h7ZWBnJmfveaF9iyIeEa
 HGeq4iKZH5ospIsOq8jZBFkeQqR6loPK7xoU9G4/ocPmZ1GDhDhKrb8OhNr47rC9qZq6
 35UFF8vdG/IvaEdqAF0x4jbngfzVau0llc8zI+dY/s8QDgd6C+BPhoFB7Di3jmkfzARA
 Gfs0l6/4b7Uk9ti/6utQfxfqGtd5XDYP6L4/z0kIssTPLV55qfXOrXJmV7rA74Llb6+c
 96hU0wIXDOO3WMaJv0CXG3aapEkg5P96nG5LmgoIi8rFyJw6513jYAhbDNf66iu4mIHp
 GYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718318188; x=1718922988;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+uEsmC6Fs93CtWuR8khej7lWUC750pqp8djwlJQOosQ=;
 b=VKixzBZNdaSfD8RhY2UR8vo51qhETuDRu8i9ALH6rlN+qBrROrxYYMp5Xz22vIyjCQ
 opJQKkMMN9THm3RAymqnwIrQAZhohJrG1v/Y2WZQ5E+gaQOVqrU0OkQWQntXU+tCAYzF
 lGwfZnpIQExPdNwZRiWu983389U36uNonL7lourvNakgKULQ+ujDQjAdbq05z05Dbp+7
 EuRB+TaAfFdbwVlGkVPfmj43aywfKzrvPFsHFdFZfj6EFMzNysFqnJVqzC2K34bUgNq1
 M/vlfoq3wZakZBK3mII5Y+KI7pvYwf6IsSbKTOF1zOBA7sEiKU6KCirYJ24NzLShI6JR
 m8ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE00hN23PF8q3ylvlXj2CIdFtqZLTmw1EdJsOCo+NPtuqeBlVfwnrWTD2SHQtBRC51jnCW1j9Rx3EmayrykHCInVfszgb2u5AvUHbkTRSj
X-Gm-Message-State: AOJu0YzHIsWEoTqfJBR1tLGlaArG4aJJi2jYZF33yS1ue1LkYAejdLEf
 xS9dKl55cgoGoogDpQ9Hj6ripkOAN6mE4L4YrXW3XK2Zmfk60Qb5/Zpecb9G1O8=
X-Google-Smtp-Source: AGHT+IGFssZf/ZlI4LKs67bZV6Ozo6EnylG8kZfq6joUVujfu+aQgfOnZQIxwNBEHAM1HFjYfKskIA==
X-Received: by 2002:a2e:98c3:0:b0:2eb:fe40:c345 with SMTP id
 38308e7fff4ca-2ec0e463248mr6941271fa.11.1718318187869; 
 Thu, 13 Jun 2024 15:36:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 15:36:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:06 +0300
Subject: [PATCH v3 5/9] drm/msm/dpu: move dpu_format_populate_plane_sizes
 to atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-5-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RmW0TTeUi2rB56wD/1RdcHJO05cYTxQGOdb
 jtQ0YSU1S+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZgAKCRCLPIo+Aiko
 1ZliCACUWB1VPjIZWfsRkXyRAPxoJImYLrFW5Ln+oV36Or+JycieIOKeDTgM1w5ylsfSNmErxHB
 KYLiFSUdVsq7L5LBsNOt7SgenxS3zQytkXrhi69yYkhGRzWL2I1Pp4Ii9wnjjvR/GFFP6ufbOXU
 20WtayHo5Q4VnxAoPKTGIZqYcL7X70Y+lgSxosmztebNjwKOqkLo1GWP5maqSwgFikhi+p3rDPd
 e+3tu1yzunAmE6L/Bg93ir/I2mjdHK7q6n4fKbupMt+9zgecBsp/DpL1UTdK814PoLsMd1aB+n2
 NlNadDk0viM5HH4/So1r2mHNNJeZ3WrgyvIFFtkJNsebZrzX
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

