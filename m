Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D494D65A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 20:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702BC10E954;
	Fri,  9 Aug 2024 18:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KsU6FID5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422D810E954;
 Fri,  9 Aug 2024 18:37:57 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-2642cfb2f6aso1615953fac.2; 
 Fri, 09 Aug 2024 11:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723228676; x=1723833476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=23V8N5AdZVNN/gtxnVahpyZ2F/zrIdL7fbh1DnGikW8=;
 b=KsU6FID56mW1usWvWLwUpNiRuqUd0QVuoovaR7TfETYZbO1HbUEfk6VB//BY8p7VmI
 EMe0Mi08T5AYofGOm8oHTujFeSRlMawfNwJir4oNrsCsNKef/+uzRrlmGyOX+lNyzssj
 k6jcsW0Vl/WHZiJ0cnGtQC8deeMApxdGYJwpa9jds8JqETQMz22/zAQxV88VOD4N3y7v
 aRVw9SjRCAWUDvHMouQAg7HVVAyE/4pJtIzddYV54PRpqNmYAMQyseCRuZO6RZ2Plygx
 iyufSsbrUb5KSb2cgbaIHL+yeawF3YKg0Cjtg86T6vK9AqsFCGf8QcL3F90EP1AbIwox
 G0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723228676; x=1723833476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23V8N5AdZVNN/gtxnVahpyZ2F/zrIdL7fbh1DnGikW8=;
 b=YpJszuvtr62N8hj+JD+IPhQpj5X5IhKnYVNjvL2RPJMBGxx4jqfNWDvNDPl8F/7pIh
 e5xtXbmbBOSs9OGmsfWsjYv9a8jeg8DuY9ogfL1J5F+ZEVYnEBJWzTyj2CQ4tngTWTxT
 oMkVC1qifywvwxweuIfCiAjtJhYfYsBk3EL70c8IyPGxGnVj34wQ0bOY0MhsO7lXPVmE
 eV68B/HWFjKX6CPSefmBp+4Jjb91SMGyoLeSprkSqHVHWdbD/b8tVWxHqfmxcIaW3gl+
 RVEp0a6jmOHzEXG1A/8NDnBKKaOWmXyXi/C0G2CC4t7r2PsSiKUTugtVnAk98cnqQY4i
 J1aA==
X-Gm-Message-State: AOJu0YxQThb0m09eBEpS2ITTaTkgyUJ+4mtRJwYZ80ADrzzgsZHMW70c
 4NVlBTUD0zxBJcHWeQzJQS7T74F5DgvJXpcXhUILKZOCI544ytP3IDlwsw==
X-Google-Smtp-Source: AGHT+IENkZRkxsFSj8C+quRCgcAYIlP4KqTdlj4pXZh5I6G6gUctkIHTSWJe6NHYXlgtEeTz+miBOg==
X-Received: by 2002:a05:6870:8318:b0:254:94a4:35d2 with SMTP id
 586e51a60fabf-26c63021a6dmr2759931fac.45.1723228675709; 
 Fri, 09 Aug 2024 11:37:55 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5a4a962sm68841b3a.106.2024.08.09.11.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 11:37:54 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Remove unused pm_state
Date: Fri,  9 Aug 2024 11:37:52 -0700
Message-ID: <20240809183752.160634-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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

This was added in commit ec446d09366c ("drm/msm: call
drm_atomic_helper_suspend() and drm_atomic_helper_resume()"), but unused
since commit ca8199f13498 ("drm/msm/dpu: ensure device suspend happens
during PM sleep") which switched to drm_mode_config_helper_suspend()/
drm_mode_config_helper_resume()..

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index be016d7b4ef1..c2eb9f14323e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -215,8 +215,6 @@ struct msm_drm_private {
 	struct notifier_block vmap_notifier;
 	struct shrinker *shrinker;
 
-	struct drm_atomic_state *pm_state;
-
 	/**
 	 * hangcheck_period: For hang detection, in ms
 	 *
-- 
2.46.0

