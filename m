Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2074C4FA1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 21:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339A710E933;
	Fri, 25 Feb 2022 20:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684DD10E932;
 Fri, 25 Feb 2022 20:25:42 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 132so5609353pga.5;
 Fri, 25 Feb 2022 12:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jowACUWHyDsjl7cxkEDIstr2wZ5bnGQyw78YwqjKqdU=;
 b=fyUaoszQBgm4VI9v4r+DenYwgGb8WYioSKjYD8d9GWW3UBQr036krbXYoFR3WWH/BG
 zaPBx5NxUgxhqdxQg3BtO38ndaz2iYhlqTuospXGhKVuMjXvGZ6EC5OylI2lMImDaIr2
 OHz/82KM8hfevJ6SLc372r+bU73gvXeg+6z/T6eRyjpFn/kkXvWob2jcSWOlaM52GCJZ
 3ve09pm/0qlM4+urphZlrd/XtXPsrgsds2NSB82NVX6aUGOcghy4Unz/HpD1bH8qCQIG
 wlhKDRN8CXOLCCin6RBRaY/ytSyiOJNixuPjFJBDZRpHAYPIGAeYw8MNfQb3SJynklho
 fmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jowACUWHyDsjl7cxkEDIstr2wZ5bnGQyw78YwqjKqdU=;
 b=dFjhLZ1k8tt/J3YJs8EaLr7TNbNy0guyUa94JxB40aDfASXV3Z0VMXaDXLoLIF7UdD
 Rah0TMqOHaoSalZTw+vx7dWicB3KNv7RWZyypzy+ahJavTN8p5D830fpRMQb/SWlG0oL
 grtmpHUrJYk0NvAKxHdYLfLb7BWcAoiG4pAcmUIfdEWrUh+YUGPE0YRuR0Tg37BTbbg6
 kXGnu1PJxJpWWjZfIvRrKAxrlLnZrqEwdwmAV1uSpCzDvyTnFiChW3r8TVgcrFsbe7wh
 8GUNRyeF3fjBMiWvBxt95IwogzTQeTaIDmQ3W5EXyqqamVL0dAVczB5Txt9A/puDRg+H
 W6xg==
X-Gm-Message-State: AOAM533Ut/T50/o6hHEnoLBBfawfjy5tsHB1PzEgyEIMhJ4f5Kmj5Zs9
 x1KSu2E+DOpqsAEfRu/HzInMqjGsMM0=
X-Google-Smtp-Source: ABdhPJwHXzFJKFr2MWVs+SBL5FNQptcTOBlRKpXW3+HUWllfoU73u+9b/4eXCcOXl7G4Vh5mE59+xQ==
X-Received: by 2002:a62:84d3:0:b0:4e1:b5c:1dd4 with SMTP id
 k202-20020a6284d3000000b004e10b5c1dd4mr9274529pfd.20.1645820741347; 
 Fri, 25 Feb 2022 12:25:41 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 nn15-20020a17090b38cf00b001b90c745188sm3194934pjb.25.2022.02.25.12.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 12:25:40 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm: Remove unused field in submit
Date: Fri, 25 Feb 2022 12:26:13 -0800
Message-Id: <20220225202614.225197-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225202614.225197-1-robdclark@gmail.com>
References: <20220225202614.225197-1-robdclark@gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Noticed this was unused and never set.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 1 -
 drivers/gpu/drm/msm/msm_gpu.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index af612add5264..58e11c282928 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -329,7 +329,6 @@ struct msm_gem_submit {
 	bool valid;         /* true if no cmdstream patching needed */
 	bool in_rb;         /* "sudo" mode, copy cmds into RB */
 	struct msm_ringbuffer *ring;
-	struct msm_file_private *ctx;
 	unsigned int nr_cmds;
 	unsigned int nr_bos;
 	u32 ident;	   /* A "identifier" for the submit for logging */
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index c99627fc99dd..696e2ed8a236 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -21,6 +21,7 @@
 struct msm_gem_submit;
 struct msm_gpu_perfcntr;
 struct msm_gpu_state;
+struct msm_file_private;
 
 struct msm_gpu_config {
 	const char *ioname;
-- 
2.35.1

