Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 641D94D559C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 00:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6E010E156;
	Thu, 10 Mar 2022 23:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ACA10E156;
 Thu, 10 Mar 2022 23:45:36 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso6658317pjq.1; 
 Thu, 10 Mar 2022 15:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OXegA51qD+CyYO9M7fSmY5tcIBfLmUdoHlbWl+RWLYA=;
 b=Uya5BbF/Dea3p/slOxGOh0T5z35dl1DZwLwD64KB0b7uIeODxa63MztEUsLQQTBK5d
 D+RjR/B/DCsuUXe5VTqlL/sVZ3iPPAX+wmHNi4zmP0hvbQTRdsGTuBd7ORxEdJMxQFeg
 f1xCP90/4jcWi0d1L6liTOs8x1pwQLwnFecjcadNtFhxQA3ZKwLSWrUu/BOxU9K6a3IA
 iIADELN9Zu4tKQm0yfuEuHJKcQTydAKZJJMSbstWPtbiAgwGHFuqDWEF4jWAYDsCX00/
 F58vxhlnFriX7g9PPn/gcLj609Pg+h+n3ssPGc2FC26qCmURAEBWNMbfrkTooHiy+UVs
 /neA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OXegA51qD+CyYO9M7fSmY5tcIBfLmUdoHlbWl+RWLYA=;
 b=ePNxXv0TfunS5kNqYH/Y54Bq4oCsecbek4GLFMklYm39be5wHp+Oh5rrxOMI3PPkS7
 eHAG4BLU0YlKgb8aBSiCXJxvpADioRsqUlZNhKwac+VZsMqNhilS+Xmm/VpRwCO77ZkT
 JKRW+hEWmRsOl4cMvp+Co0Elg2edEhWScI3dFiw4uH4qiVowqSySB9KRL9/IUStWZ+Jh
 k4q38NK/FLNUfA6i5SG74H5DmZ7s35SR5g5kE0aoNxtWAmoRFQWdBHNjKFkZLxuFEAAg
 m2M3gTTrvCXnaUkq16+PU6NFJnYy1MHlOWvY7D7TqVQRi+uMP8eLQ8/2TjxU4Il47TDo
 pW9g==
X-Gm-Message-State: AOAM532NuGUyWA8hrKhyhSjP1dA7Xnu9V8b01CBg/b6KSoyC7Qj9gFMZ
 GQgJyRDtp+m9NhhvkFfUN1qB0nCnn/E=
X-Google-Smtp-Source: ABdhPJyMokPnWrLeEdPTbchYVoLn7v3pddlxvswdSoMvVNd5x9sSPY6XLBlteAA4HXr/Z8aINByJyA==
X-Received: by 2002:a17:90b:4b47:b0:1be:fccf:d1a8 with SMTP id
 mi7-20020a17090b4b4700b001befccfd1a8mr7586614pjb.33.1646955935191; 
 Thu, 10 Mar 2022 15:45:35 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm8252049pfp.90.2022.03.10.15.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 15:45:34 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/gpu: Rename runtime suspend/resume functions
Date: Thu, 10 Mar 2022 15:46:04 -0800
Message-Id: <20220310234611.424743-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310234611.424743-1-robdclark@gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 89cfd84760d7..8859834b51b8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -600,7 +600,7 @@ static const struct of_device_id dt_match[] = {
 };
 
 #ifdef CONFIG_PM
-static int adreno_resume(struct device *dev)
+static int adreno_runtime_resume(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 
@@ -616,7 +616,7 @@ static int active_submits(struct msm_gpu *gpu)
 	return active_submits;
 }
 
-static int adreno_suspend(struct device *dev)
+static int adreno_runtime_suspend(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	int remaining;
@@ -635,7 +635,7 @@ static int adreno_suspend(struct device *dev)
 
 static const struct dev_pm_ops adreno_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(adreno_suspend, adreno_resume, NULL)
+	SET_RUNTIME_PM_OPS(adreno_runtime_suspend, adreno_runtime_resume, NULL)
 };
 
 static struct platform_driver adreno_driver = {
-- 
2.35.1

