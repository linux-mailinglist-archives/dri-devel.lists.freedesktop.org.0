Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8998E862A9F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 15:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACAC10EE50;
	Sun, 25 Feb 2024 14:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ggfF4RZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1567D10E416
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 14:12:52 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-512b3b04995so2324643e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708870370; x=1709475170; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IXkFidtqGVYDP8/cl+5cTf/LoCCSdGW5wG6DXUHuPiw=;
 b=ggfF4RZ7x/D4cdgVEO2YW22YaGhd0YhZbddbcLP88rnXejLEZM7CZYJJtDkl99S+X0
 1zBFO+lsf4CAumkqSVnXd5BXiSDNmXpOQFtomiE9IK5sdvCnp93HWqVxfAsaBFXaGWyV
 2FqUv2Cp/yHuTUPwL9MBd2QdFnGNTw6ftScIJ1JXA4bWxW4JhOhEeRPGIw6tXRSv50I3
 MY/0M6c38+0t9/k9c2uZJoXxhx1ANWzrjp/QZA55NaK+hWzsTv/UCXSUQCoHs5n7TFtU
 1efZtuyFAerguP1Yjp6uzi31+xe2ehNhSW5tKScBEzEXMWRHtgy3JjmPS1sOF7TWHAmi
 8img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708870370; x=1709475170;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXkFidtqGVYDP8/cl+5cTf/LoCCSdGW5wG6DXUHuPiw=;
 b=CQbP8n4SMB5yIfkZgr9w/p2YPdmt0KHFjEAgzfwV/dS+oUGjR4fpS8NaKm1jrBlUBU
 wFAvjgOwhpLTPiVZbeqrjoyBWCgtzRGcVfciILkV1xbWZ2TFT/QIUTOBYm0bQqq9f39k
 x34E3oy21qYoG27WvPpzkHxW+anmDPJQhqBPQNlNOGhdvpglkFdWSbI+T55ruQ1YJaUn
 Rp6ThUcPtSv1C5Rs0PgRZpb7eLr91X3Iz56uXEDG7W4R+aCKNjySyCgMLJyWBw+OIzhU
 3An0E7Oby9JF4uI4WODjIqXfEXi5x5k0Kwq1PuNhCxteharRmlIkCGkUcsC1BGT0G6r2
 IkNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYHcUpTwwmLXZtb8Rdj8uIf52s06e/zRZvqtirgDwYVSTXEwFMrBHiD8KlF/xbdqr+g+Yz9oNkEGeWqzOMygYfMKozj4qmVHUQjbBmQIqc
X-Gm-Message-State: AOJu0YzaiWtELlswWDUdOmO6sgjtZyraeC6DZtGTm5J2Jt8U3qkqTGP9
 5o26bAd7DivGBBkVo/RhSDWDXozsfUpjpDVHCfZfJxbmM/SrK8ZEOwOs0pGAPwo=
X-Google-Smtp-Source: AGHT+IGZ1yVlZG62WK5s8XgMXseEorjE3oDAcLvokJCsoAwczaJfRkKuxwH8PNeZCfgcle6av35Q4A==
X-Received: by 2002:ac2:5388:0:b0:512:ec6e:9f2a with SMTP id
 g8-20020ac25388000000b00512ec6e9f2amr2791473lfh.19.1708870369931; 
 Sun, 25 Feb 2024 06:12:49 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 w13-20020ac254ad000000b00512e5bd2296sm522931lfk.217.2024.02.25.06.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 06:12:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 16:12:46 +0200
Subject: [PATCH v3 1/3] drm/msm/dpu: make "vblank timeout" more useful
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-fd-dpu-debug-timeout-v3-1-252f2b21cdcc@linaro.org>
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
In-Reply-To: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=A4/oTwY5JpAU9dbsu93L7dZvCPx7K/2ZR18bKOeKyl0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl20rfZOXUMpqNliF8fh0oH/0RuleHVyeXPPDGe
 FISdoya/+aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdtK3wAKCRCLPIo+Aiko
 1TuEB/0Z/hHj29uzA3HA/VxFscGLzDGqyZUj4/ANTvm9EjAYa0jQ1LJccv3i1tiK0jnqxIWiFoc
 wnYLHUf5Gnp42YrF0h8S+uPIOX5nmPadqvtKmBuY8GzoZs9/IYY7ggAMzbGf3HnQHDc4y6/kAbH
 1QNNrifLpUq5wHtBq3a5QE/uZO+cXGp4ozHDQM04cEUW26qvjCcR6bMADk0Ft777z41tCostXqI
 VLDhiefC7by6PVbjx5VTY5fVKqRr1rDR7DNWIy75ZRDDVSml1SirAMOr9nydO1UNltGDhVZgcGu
 ucU+IKr4qLybtRBJaNN67n4kqWQAKakPMqnsRgbLBCnrO3nT
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

We have several reports of vblank timeout messages. However after some
debugging it was found that there might be different causes to that.
To allow us to identify the DPU block that gets stuck, include the
actual CTL_FLUSH value into the timeout message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 2aa72b578764..6058706f03e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -480,7 +480,7 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
 		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
 		msecs_to_jiffies(50));
 	if (ret <= 0) {
-		DPU_ERROR("vblank timeout\n");
+		DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
 		return -ETIMEDOUT;
 	}
 

-- 
2.39.2

