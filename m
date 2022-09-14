Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315955B9711
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 11:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E49110EACA;
	Thu, 15 Sep 2022 09:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B4E10E004
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 10:39:01 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id y127so14494878pfy.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 03:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=HqhuQ7GCm2rsYRiDOgm7J5PsMumYPik+gWgifMr97AI=;
 b=StmhHATsSBjXLCwbnOcC98gLAHHkq/FQNlkVoPGZZWORq2lKWYM5Rbq5fl3tC7VXuy
 GpTWuWsG93szuALYeLyy64tcGq9ZIRBXyMJN5fo/FZfifTyKqe01so8vVYnQOK4T2/GT
 q510RtcF90HORXzfWfjBNgYFPYc7VKho3Rb3LjZsqisZnWbTywMmDap7flaCV1ECcU2z
 9gtRFoVO/Urj4t+AqJjIakkTDp1LT78EiIV/IMDHO9uf+Xez2g6Ud0Cj5Ou11wohRq2d
 YcU2Mguku+45alZIKpIANfnV0XOdjFc4lTlqrevZDFu6ZYPJPLSB+kJiYHuvHOjojEiF
 8f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=HqhuQ7GCm2rsYRiDOgm7J5PsMumYPik+gWgifMr97AI=;
 b=Cm/AGoSZTzaMWjhOM6/Wx9VertuwQQP7lOREunitYkgaianVzYt5YwnLJkWqFhPrlK
 ZgPENFZrYPKZa45oe9pWzKBUfbacOcYUaENDxzG/nn4LMumfQNTPXmvEZ+ZLmK4YLEhK
 jyul3ZA0wj91mY9rdggpUDdkXyJL4oFt0k3+d6lwMQHRdAaKsFY8OqXoKCvAh1hdIN4m
 W63ZZIz4uAqRXcmCQfMCgOfbi7B74G5ofaZAU8sz3t2nnToPu9+FNcQbC4JGlTs+BJqS
 e7k71nnuqMqvE8sGVm28mzP/yZr4rQihGBWK2bAMT+7/od47JPuEu2Etf4ididRasbtv
 p9Og==
X-Gm-Message-State: ACgBeo0x0NOxW6s3d5rlbTVFMnzVEpGZLcpolYh5ajIuKHGXPwFzYqe2
 B+XvbIFX6GZIodJlO3uf3sA=
X-Google-Smtp-Source: AA6agR4HeqN2eZDyKsWWb4m6kP1HZfLjFFCmv/LW5KI5/KL+W8U2yNsIM9AOQCeszeNUMjt6zKEfWQ==
X-Received: by 2002:a63:2444:0:b0:438:63d9:bd65 with SMTP id
 k65-20020a632444000000b0043863d9bd65mr24427868pgk.560.1663151940531; 
 Wed, 14 Sep 2022 03:39:00 -0700 (PDT)
Received: from autolfshost ([2409:4041:d9d:79ec:78cd:7d4c:66f8:5f42])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a62640a000000b0053e6bda08e0sm9729768pfb.219.2022.09.14.03.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 03:39:00 -0700 (PDT)
Date: Wed, 14 Sep 2022 16:06:50 +0530
From: Anup K Parikh <parikhanupk.foss@gmail.com>
To: skhan@linuxfoundation.org, andrey.grodzovsky@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] A simple doc fix
Message-ID: <YyGuwqpuwq+PT3K1@autolfshost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 15 Sep 2022 09:11:47 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix two warnings during doc build which also results in corresponding
additions in generated docs

Warnings Fixed:
1. include/drm/gpu_scheduler.h:462: warning: Function parameter or member
   'dev' not described in 'drm_gpu_scheduler'
2. drivers/gpu/drm/scheduler/sched_main.c:1005: warning: Function
   parameter or member 'dev' not described in 'drm_sched_init'

Signed-off-by: Anup K Parikh <parikhanupk.foss@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 +
 include/drm/gpu_scheduler.h            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 68317d3a7a27..875d00213849 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -994,6 +994,7 @@ static int drm_sched_main(void *param)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
+ * @dev: A device pointer for use in error reporting in a multiple GPU scenario.
  *
  * Return 0 on success, otherwise error code.
  */
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index addb135eeea6..920b91fd1719 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -435,6 +435,7 @@ struct drm_sched_backend_ops {
  * @_score: score used when the driver doesn't provide one
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
+ * @dev: A device pointer for use in error reporting in a multiple GPU scenario.
  *
  * One scheduler is implemented for each hardware ring.
  */
-- 
2.35.1

