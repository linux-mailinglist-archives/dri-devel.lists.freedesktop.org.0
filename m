Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B9282220F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 20:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2936E10E149;
	Tue,  2 Jan 2024 19:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84ACD10E149;
 Tue,  2 Jan 2024 19:33:54 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d409bcb0e7so32569945ad.1; 
 Tue, 02 Jan 2024 11:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704224033; x=1704828833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=luPtVbWA4WkeKb/ML1jEiRoj2bd2p8W6YJcqHctkuXs=;
 b=hSqPG93K7RUb3psDaXubq4Ho32zhPb3j5Z6cY3qnUs3SQtll5civNve3c/PP2nYKMw
 TT8pzGu0MLR2V47+puXZXIbB4emWweF0SA7T344kszJCpGOLq3TfV85iTxsfaJDtR5dh
 SC1sccuU1wEvMw0ZpEzcxpQifTZu8Tv9roI+M0Z9wSQqmmh4h0h1B8HbCEZtsJz5Kxbg
 k+WAFDFuCpU6jc4QFkB2zngjSlLVaVYX1in8x/06N/GtzbRIl8xCGjJmUFROq250ZzCu
 5VvqXOq35/BWqHPBkLKLxbk1tQfnrhgtja4cR6XOj1Urh3ZyKJBvunnEZkKkUF0Lj6S+
 6dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704224033; x=1704828833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=luPtVbWA4WkeKb/ML1jEiRoj2bd2p8W6YJcqHctkuXs=;
 b=CxTtao/QuGIT0WqDd/2Ex9EZgL/Oflc0xizykbd7epgFsAYG5SJzl7pyltFpBEuruA
 TXSDrE0qDA+NJlyZ4TqMDv23lxxHReD1WulJt3qeeAx8jPYqiiB5d0y7hgoZSns3/m49
 C2IHbvohy0pDYIRgXSfzFJ39yjKrsC4PVekAhK1fmkVOF5rdKT1CcneIFvJWj1FsJA64
 HriDDXAXPUGdCZAQqqBPdExMbqXNyRkDVkayj0JHZHDe47u28hV+m4xWDWPnMvT/cW/+
 emv5GBkG0AsDl+RyTCAHPYZYLqW5+rv8AfFbpldLEuLyQ6e/C79a1BBIF62dss8cQQxG
 kM5Q==
X-Gm-Message-State: AOJu0Yx7Z77IGYyx4udeOqGzwdzp8ymbQuFjW44Zk5si6XnXtgtRF5VL
 OWZBSL8dc+AU/c78SzScvortrq6dMQA=
X-Google-Smtp-Source: AGHT+IFhwzQzpZlwnGPVfu0XEYA8BSoSkhH6CurSOcH7BLHojR2bA2a6+ZxoT09Eb80mmHaTQ/2xXQ==
X-Received: by 2002:a17:902:daca:b0:1d4:3797:f829 with SMTP id
 q10-20020a170902daca00b001d43797f829mr8680675plx.5.1704224032869; 
 Tue, 02 Jan 2024 11:33:52 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a170902654e00b001d3563c87a6sm22863074pln.281.2024.01.02.11.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 11:33:52 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a7xx: Fix LLC typo
Date: Tue,  2 Jan 2024 11:33:45 -0800
Message-ID: <20240102193348.250917-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Danylo Piliaiev <dpiliaiev@igalia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We'd miss actually activating LLC.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a5660d63535b..54dc5eb37f70 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1646,7 +1646,7 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
 
 	msm_devfreq_resume(gpu);
 
-	adreno_is_a7xx(adreno_gpu) ? a7xx_llc_activate : a6xx_llc_activate(a6xx_gpu);
+	adreno_is_a7xx(adreno_gpu) ? a7xx_llc_activate(a6xx_gpu) : a6xx_llc_activate(a6xx_gpu);
 
 	return ret;
 }
-- 
2.43.0

