Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDBA69199
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202BD10E540;
	Wed, 19 Mar 2025 14:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QehoH5Yo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8986010E541;
 Wed, 19 Mar 2025 14:56:10 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-224171d6826so45687355ad.3; 
 Wed, 19 Mar 2025 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396170; x=1743000970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b5vghT+lRUUhODnBwluijwY+DynV1hCCLl7u4RlxQto=;
 b=QehoH5YotAON50TjGzECF2OHxyONraGGGrclnCgLXtnq6uKw/N6Ng3HkA4nxaNibXd
 9mq/1pTkMib5eYy1llBFdJKctXPHu2YlZ3EON/+7JKVJs1tdt8yl3lN2+jpd1to9VQro
 iEz9JxiWkj2nEnUrIfe/NubskLBWsRpWUY3OvUUBjJ0zV+fHKm8LsIXqAr14DCU3h4W3
 9XqL1HynSoCMNX6yW4FQVDnzJul45ZvMmLGTOHJhw+yT8ApIaUtkU3PfzBw/LeV3M6EH
 rCUfL6dIVCh+pdKuI8MvVXUpE2URYcQ1c975iGCbA0Bae14igT/h/KhEJCQxTpQd0Sa8
 KZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396170; x=1743000970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5vghT+lRUUhODnBwluijwY+DynV1hCCLl7u4RlxQto=;
 b=aH4GN8jeyWrYxEFNRoFe7fvFUn6a2c2jySqEJncWhMu2XxquFlywhZIX0BDjIWnMhm
 TSy7fKROwzy2QQdLrqr7UOH7uaif768a3MhbGJgW9Xx32bvjYiI+Xuy1KpQyhHrooFWW
 L6uFPFFt5ATKdBwUqWsry6lCGJCpeTJ1CxH8KfmV92lRcifUI4Jz7/8P4kWfsgq74RpY
 QgT3PnLX56JP1xNAIUUNKf2aJVreBaXyhyLbrkOOd0vkk4h1L3RMcNgWOtLM7vusrrCM
 VaoYc3BFzJtS8TZAZ7D8u70c4G5wng0cYnvXsBLW/mcmVAgct8zMwEu7PqUWSU6DiuEn
 /JoA==
X-Gm-Message-State: AOJu0Yx6dhYxB/cRvY7GZO20wSlHhRMzWBLDXMg7qIRgVmpTGbuLVUvo
 ZhvylREYoRjGa4pylk55/PI3iLMGTJMLXZXCZKfsA+hlWSoLhiW2YJr16A==
X-Gm-Gg: ASbGncszhRBHiubcc2LR/CjomEKkV+QLHDL8y9trP0pVIOp6fO4rT5vgpM/5oSf4rr5
 +aWmd9wyL7yRsJ8vG3hBOZSlcnDk1V6ODX1TqvfdUh0OtgSf/McUwdKvAyapbydC0D1yeVF3r/f
 EEFd2A1qauHf+NzuBe7ZRIcECi8PqZE7uQ2uNt0T54YcahgcNXO4r/GRWr7o4MHKF5YIkKR8izH
 pYgPk0QXBmT9XZ5L0hifuBoM5xwOr4Q9PRUlNSFgLdo6IghQB1+dszhlwgH/Ab++5ebQ6EkwgwN
 M7ypJ95nbyqhT4csRO6S12r+4LyRrjOX/5mqv5L28WsfDop6262yiobpNH6BPF1YHtMI+rv98AD
 XLGK1GppWS9WXbOM2hc0=
X-Google-Smtp-Source: AGHT+IG1ust121HcuGrJL14qmOc3DcJXO+l7Y43CZxyk5EJV4JgmEiZBepa3nzlmKg+3Zuaz5qbsrA==
X-Received: by 2002:a05:6a00:3c89:b0:736:4536:26cc with SMTP id
 d2e1a72fcca58-7376d6ff858mr5191039b3a.23.1742396169555; 
 Wed, 19 Mar 2025 07:56:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-737115593aesm11643184b3a.46.2025.03.19.07.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:56:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 34/34] drm/msm: Bump UAPI version
Date: Wed, 19 Mar 2025 07:52:46 -0700
Message-ID: <20250319145425.51935-35-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 70c3a3712a3e..ee5a1e3d5f3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.48.1

