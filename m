Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A69946406
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 21:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1B110E1B6;
	Fri,  2 Aug 2024 19:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bk8uy9uT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5CC10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 19:47:39 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so5821465a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 12:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722628057; x=1723232857; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hRkZO0QxGsY8q5b8djGsFwrWLk6pIxSotLSe9SlQGrA=;
 b=Bk8uy9uTQJfje5GEVXba1RMxR+tAAatUNbta7Qbpfpvqj56hDhizMNY1xrUiCMMNMk
 iRSzjdB2/8gQgv9IS7AB9dvX8E1bXk8nfaMnYiTa+BNiNuwJfvVe+4lKsnsPIwlZCEJZ
 TlazGi9wPlP+c8KJwlMc3gd+C4Ntwt4gWTt/7mMd/4XAldWN1QRmT+UzfbF7kKcA2Zbj
 ihM/AiwHTbd+Y+DxejnkFBTQfRLapg/4UOTrvmzsmvlLTP46BrQEHyCUfe57avCEZjz+
 Dyz4vMxQ6lCIUN+0Mna14aQo7KLXKHCjNUtpEg34K1YfToKTxddV86tMFsxT7d+ZE2rs
 2ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722628057; x=1723232857;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hRkZO0QxGsY8q5b8djGsFwrWLk6pIxSotLSe9SlQGrA=;
 b=iC74NKmgWnmYEq4ek6a4FVsA2YOQGLKPpEumt9thZcXAntv1tcLJ9dl2r4bUJ1XTGt
 9RKZDNQBHW45Im84KcFg5bJnFRescF+U+z19cpZ0mmmqP4Avn1w8Sc819pj7md1YKF5N
 BGVuVun+Y/OkUDrOWQ/XEB/u7D5opz4THAoXA/cq39hJMZ4rYTffGIbuxxA1q/0IsWZj
 2QUP2VGREJPf0RhGy7cZk/TjLaTZ8ORmW0Z1UXlovYQMlkMFB+lUBaPhHWfuqcyvIOpz
 Ip7GDs4M+T2fj7zv5HvRPRNAyDUERkIl2PrgQkwLxkVV9DAyz5XgId56ju4sLS+gQV27
 T5rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7g71u4rBav9sW8rlRrJBXuKZB86/qAWmZCQDmOd8gnJNs/Kgt09Vn/zyCQZCEpYhmE30X5W0s5t7Zj5wUzUv3nq95ktGn9YtXPKcXQgvr
X-Gm-Message-State: AOJu0YyrX38gsF3wnMkdEQIXk7v9oBmCc4l0Mg0dS6bKtyplpQ4dm/Kd
 noNovfiNzbGOu+s/mJBsaaX7jipMNE7TxePIFpEUYfO6B26hWCulpR+tPkBMDvc=
X-Google-Smtp-Source: AGHT+IFic68LAIlCdG/bfKeHoDNIwgwWvtlOrgBoVGhYtpiN8xKfnemLwzBvFi2dD1lEy8v40ozXYA==
X-Received: by 2002:aa7:db47:0:b0:5af:5538:e03e with SMTP id
 4fb4d7f45d1cf-5b80b18e4c0mr4159463a12.9.1722628056902; 
 Fri, 02 Aug 2024 12:47:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839b2b556sm1440939a12.25.2024.08.02.12.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 12:47:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] drm/msm/dpu: two fixes targeting 6.11
Date: Fri, 02 Aug 2024 22:47:32 +0300
Message-Id: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQ3rWYC/22MQQ6CMBBFr0Jm7ZhSqiAr72FY0HaASQwlU0UN6
 d2trF2+//PeBpGEKUJbbCC0cuQwZ9CHAtzUzyMh+8yglTaqVhf0yxMHfuPL4tn5U00V2bLRkIV
 FKD977NZlnjg+gnz29lr+1r+ZtUSFxjSVaezgjbPXO8+9hGOQEbqU0heqIkHlpQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org, 
 Leonard Lausen <leonard@lausen.nl>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TjN2mqLbZL+GZvBbQNPpxnmGx0zOZo0YLxgNMkhjNgE=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBmrTfXh2xfj98dHX4dp4WVxiTewYFdEJvL8x9/I
 +GVW9tGYNKJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq031wAKCRCLPIo+Aiko
 1RcBB/icOU+VTgYw+8b1leBG7lCGIGdzBaJb/Yxgd+nQYVsGIKxVnrqaSXzlWiXYlEgokYGnthp
 6NvhfFxjeUrr3Z7qKjz+cj2IHCWzZbhbqNwEEVuiKu6OPT5hotL2V2wm1byGs9oTK3xwI5htKzf
 pTrTmbF9+w7BxxHRSa7hvERKYLj8bspW462GgiWhDzkGDf+i2FV6+xTKrkm0nTzMvYCAC50KsBU
 xSQonKPKsCsZtbL3HOFHTy4SRWiMMgI0VQv8kCG+KbQ5lBQIFWFsDzMjUHgFuVgH8dCznLPyuVR
 jdzl+JPgkLVmHUuhG9B5XbefEFaTNk5D0aYvJQyyPlr/eFE=
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

Leonard Lausen reported an issue with suspend/resume of the sc7180
devices. Fix the WB atomic check, which caused the issue. Also make sure
that DPU debugging logs are always directed to the drm_debug / DRIVER so
that usual drm.debug masks work in an expected way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Reworked the writeback to just drop the connector->status check.
- Expanded commit message for the debugging patch.
- Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org

---
Dmitry Baryshkov (2):
      drm/msm/dpu1: don't choke on disabling the writeback connector
      drm/msm/dpu: don't play tricks with debug macros

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       | 14 ++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c |  3 ---
 2 files changed, 2 insertions(+), 15 deletions(-)
---
base-commit: 668d33c9ff922c4590c58754ab064aaf53c387dd
change-id: 20240709-dpu-fix-wb-6cd57e3eb182

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

