Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AEA292FC9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6566EAAF;
	Mon, 19 Oct 2020 20:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B496EA94;
 Mon, 19 Oct 2020 20:45:55 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id v12so404886ply.12;
 Mon, 19 Oct 2020 13:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mM34E3X4vpoNxytPQSc+/o1jOvHyhw217+EG77sMv+c=;
 b=LBZq9e80i2kTt0UvwPxVRaQHTkxAHZL9msB0CkdkuL0IWIzAfxLCVskEC3TSNFtQvb
 lvuYYwdqrx+QaqBkViz2A25krnPpFxx7jbESi6FxAPo9AHhgK6jGJIaGWQffDGA58IoP
 bdtMy6UQDJqCJ/dDaJ5xwDq4UlaVu37cU5Pb3RdlSJirtvAptbf24+W6AbC+aN7Y432E
 K9tqD73KVYVETz5RCvkCZvOMb9y3Hzpj03sZeV6iyoVHtF6YoHcw0tGX8bZ1pYsT5V79
 DbMs0Rfj6y3eLMDDQjkTRna8X72vhpNiRQwgyDntt3OgIjEOlo/MuSeC+KUk7454Fk9m
 pafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mM34E3X4vpoNxytPQSc+/o1jOvHyhw217+EG77sMv+c=;
 b=GOX1naqU74xxFdZfAQtGFaH9Kx8WSgL9zWuVHldiBpkqZ3gkqD9I+eJUzGHDkw/DNn
 lOfD6BfeUeEZFl2b81lXDrcblgtRgy0cmaLeeotw6GuSd3iuM5OuqJuTwOpqv+o1QPVC
 4ssWj+22sEy3zeqiD/pu7v8XTr8bEsXxEidHoJhwDjoAzz/gVqSHc2vO+qYA8rzsTNVc
 IemLN4B928vvTjVYLHQj2SrOv7Wxag+FwDfDc2tcNrdL+OOx0oSdkzH3ulC4TYkKIX0/
 ubU3EunHTujytcA+GEipyrdj3OZ15kTahScU5iF5dyL8KAkxZACSUjl8uFsDygHgScwt
 flaw==
X-Gm-Message-State: AOAM533Y0zH7fH77sNuqABP6rNLrf18x/UQklzNxQc6Sl/FVBEpYZ8k+
 357EWY8u0mTIZT/lNdEX55kg7gT+mOAY/g==
X-Google-Smtp-Source: ABdhPJxESgo/rkutIMHVbmiA9JJvXnqgXfWq+hL9O5Y9YxHLj0S+dAiI2e/Sxy8WF/AyK9oo/R81hA==
X-Received: by 2002:a17:90a:3e4e:: with SMTP id
 t14mr1175504pjm.217.1603140354046; 
 Mon, 19 Oct 2020 13:45:54 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y4sm399856pgl.67.2020.10.19.13.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 11/23] drm/msm: Drop chatty trace
Date: Mon, 19 Oct 2020 13:46:12 -0700
Message-Id: <20201019204636.139997-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It is somewhat redundant with the gpu tracepoints, and anyways not too
useful to justify spamming the log when debug traces are enabled.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 015f6b884e2e..ed6645aa0ae5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -545,7 +545,6 @@ static void recover_worker(struct work_struct *work)
 
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
-	DBG("%s", gpu->name);
 	mod_timer(&gpu->hangcheck_timer,
 			round_jiffies_up(jiffies + DRM_MSM_HANGCHECK_JIFFIES));
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
