Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7520628ABB3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765E16E21D;
	Mon, 12 Oct 2020 02:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372246E21B;
 Mon, 12 Oct 2020 02:09:10 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id y14so12794475pgf.12;
 Sun, 11 Oct 2020 19:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kMl9yrbj49Q3BQxacHHpJSzD9mDjKljs1vKng3vrmmU=;
 b=Wr8RnpP+DKiQ8rLbmnjHRsXOyQyFSWALLo/UAqujFApoQq4ZZVPQgRcBkSxxFcKhNm
 vwxMociFcdb2pNKFj8flGOIyQko9+2Em6A9t6d6w08OT2qVfMah9wsHM/qijOW4FvcUh
 MUq5QVi/P7WSXilooCfbrhBLynMHMt46noLDfWtoPAWIXnKv92yLEuYtETwvaLIDBJJr
 1KZdoLNT6YtXGEOhAZmjn82+CSq0pQv701YqhdxqVHJ2mN0YBvlpt94F9LC/KUdbNKDf
 1UaRBV8w0tXDp+gFmsSCOCidbsmxG7SBPzhA50c3d1PWzsQ2Yteif+h1pXVBbvkVdNN7
 2s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kMl9yrbj49Q3BQxacHHpJSzD9mDjKljs1vKng3vrmmU=;
 b=iqOS7cZYLWpVQMZq8zj+uQvs0OvpZRkK6wkcYsG9HeA1PERTplZapUtvIP3VJLI8GO
 pyCw2qRDV/aiYc3bAWrXcevI2yJ43uOfxOiTXUktoq/Xg0NqagHSNxURlFAkX28LVLEp
 RT3g0HhoyUU0Rktc0t9PuqoUwtvp5hFBifw4p9bjWNtmIlllnAiuGOMYS1WSaw/+/FGN
 FQkYJbcHSrRYexSC90vkXh3/mzQuBzetWiJVoIZLrwXavhQDGY8F2rKZYXtgGSwyNjUL
 cUQsfFg/ELf3YQq/9nBo4kCWXfvjY2XzGKaTq4uTHoEhKVvNhoeFMBGG0HFeothfkytT
 CN6w==
X-Gm-Message-State: AOAM531SPAv7BIOCVMWN3oeokfNMc8FRdqW7j0gcv8IMrYcqmweikidz
 /FhkUSK6JLgdhDETfd0oR+CbF0mIoacKuj9G
X-Google-Smtp-Source: ABdhPJxyxbNBiotDIT/cDYvF6QqCUgr2LglsXzEClcUjc7Oi/NU+STJLnUbvz8pmg0pP8j9pAoijLw==
X-Received: by 2002:aa7:8588:0:b029:152:a38c:fbba with SMTP id
 w8-20020aa785880000b0290152a38cfbbamr22020945pfn.0.1602468549247; 
 Sun, 11 Oct 2020 19:09:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 kv19sm21560346pjb.22.2020.10.11.19.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:09:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/22] drm/msm: Drop chatty trace
Date: Sun, 11 Oct 2020 19:09:37 -0700
Message-Id: <20201012020958.229288-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
index dbd9020713e5..677b11c5a151 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -535,7 +535,6 @@ static void recover_worker(struct work_struct *work)
 
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
