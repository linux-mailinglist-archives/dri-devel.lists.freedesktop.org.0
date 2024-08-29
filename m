Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D5964147
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF05B10E614;
	Thu, 29 Aug 2024 10:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="revnX/8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0421910E614
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:20:08 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70cec4aa1e4so330498b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926807; x=1725531607; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sCM9+J5N4G47yHA+9svPJMNmtm7ygy8LRAS3AKbj6g8=;
 b=revnX/8KemsuzmIArY0mZp2OVEkE4NrlcmkBgyqlbABY5pXs+klmoif2LmMQUTf6eI
 5mdXU8QRolE0tutOzlCu1t2AHEl4x85rZ1RxxwBKrllnzVfszo62+dszsUxrS3B9mK8+
 gCL9/bS5KWutcZQoDi6ZMJhf2sHTp7NIvevQlav3h5+NEVOJBZslenp/0IZUDofY4p5A
 6BGj/aFJXv3Yfh7DNPgxzsm+Ew2x93xav+4lWdlBh3xY8isSuxCJUrEwPNTdlstxtYVQ
 O8Q8QVhJI65xRm1Hqwv9Mi+Vv+n5UiTvP3AY0zJV6SGlCmG7NxZCy29ES3kC1kpL29Bx
 TPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926807; x=1725531607;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCM9+J5N4G47yHA+9svPJMNmtm7ygy8LRAS3AKbj6g8=;
 b=v10jTu+IAc3CnG6ineGwLhphp4HthgSQfieSuTmXhuN99i0I+CyB+wTOFEgqewzhPy
 0x9k8K5tc/yKFJStbfNOY9nQo9L90V8F9153v5kmq7fQ7br0x1ebAZnGfhY4O5+BK5lV
 cjsod0OjiXZvk5hweqOQ0uKxlpnbfUrhLsmK+vSUD15ee0O6gscS0qFAHQWV+flLc2bj
 bGbXzYxUQprwLCs7Rpw7iDax6DoXQfLpuRtNlEAocKTJi28wWrBMku1ZUxiBM5x28blD
 SJ6B6djoYAsGw4QH+27v//bHb/JiW0CgdlDDwzNCHQJq/gA6Aqd9THEWZOdefE2vC88O
 sBMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOfM+lPtUkx4xB5ao4zYb/EDkT8Ac/PFyuo/MAaWf+CQJGdaZOIlCR0LJ5PIKq3kGI13ipZOgV0Vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylOLZvghyAz1Aoejwq5RG04WW1mTzxUPc80C/fc3PxnKkeeRF0
 OgNZeQY3RX+vnKHoLfjxfD6zY90+96cL9af58OJm7VfvPWEFovIsT7EjHvhPmAQ=
X-Google-Smtp-Source: AGHT+IFo6JqACOpnth0fo0ebIHz2s0TbrVB7OHz+muTbyPW6Oj8OzQXal3TuFyZ8y86blnUcHVs4ag==
X-Received: by 2002:a05:6a20:43a0:b0:1c6:ed5e:24f with SMTP id
 adf61e73a8af0-1cce1021453mr2687410637.23.1724926807471; 
 Thu, 29 Aug 2024 03:20:07 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:20:06 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:36 +0800
Subject: [PATCH 07/21] drm/msm/dpu: Support dynamic DSC number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=921;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=0yy1liVIVVcBNaGfsGh4eMYqZcgCYhVFKjgWT8Yk1d0=;
 b=PwOW3rRew35aIX4xRyng/9JjRkID8/gLpZS+9EYNgSES93anR/gwegVFnq/E8Gu6stEEFpRH/
 CqB8AK/26+2AOcc8A0fnpWAoCQs3VSmafagyoRBeq9Xe8yckQ/TJZpN
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Do not assume DSC number as 2. Because there are 4 DSC in
quad pipe case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6bdd9c21ff3ed..05b203be2a9bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -553,9 +553,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
+	/* DSC and mixer are mapped 1:1, so reuse the mixer number */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_crtc_get_lm_num(drm_enc->crtc->state);
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }

-- 
2.34.1

