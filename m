Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B405BDDBC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 09:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C6C10E2F0;
	Tue, 20 Sep 2022 07:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E1E10E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 06:47:12 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id e5so1869270pfl.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 23:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=c5KSSWVkQxJDHC069bgwLU2fYk2mKQxGKTjcX09JPwY=;
 b=HGj8MOzY5CZ5wxY9nmVqBylRA4qoVO1HOk9+EhvXCILBr9M4OZJo0YdHC6FurSSr/Z
 7CJtTPLAHtRDD1EkTvAEtJAep51AV8xpS2UDs7KXapD+l/86KL+PiNrJZo9ulcWhnGqD
 UdhKPlUfLsyqSBENOGCLXdg1RMflt4EvN9baVT4GNEnSpYsXzW3HUK/uC6sW95Rb2SvH
 FHBmMvLDHttahh9qmLz3+f9//48KTDqNjvhgX842FvRn0Lf/WIVFGmuWBSyMCcmkYLwj
 XjqpuhxKWs4SxYBUqQhSX08HMFlRg+Pus5Z0tYWilQWqgwDyKi381Cdvf79bOu3Yhf8i
 q6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=c5KSSWVkQxJDHC069bgwLU2fYk2mKQxGKTjcX09JPwY=;
 b=Ip/P6EtUcydwlYdmtgIa3yO2OxJ1obTj5wj5tI6QRWrF066H0sIEDFup+4dh7IsMiF
 KA4rO/E62vfmVS+2iluHcsduAox5fHQzfwe4iPHpEzPUalbC3TFIpBbfEkHn8qIfHApV
 lER0Pw4TWupHK1QMUh7zkNjtIJ1DRoghPzlkUDNI8QA9Fa5LVFpadd5orZAugOZEelvL
 82ZD4s613R6iEZVSaRwUudllvHDEYodaUFh1A6YlE03jrPzvW8zz8WuQBoXZqJDirWsv
 f0sOq77+Z/ncc7uaZjjXg3yGFWn42ln1vG3VbbfI9NU5rUx9YW7AhPf9z4IukYmhTZeE
 wXGA==
X-Gm-Message-State: ACrzQf0EgD18T78ZzOdOSU3k5gN7pk+itH2+goJp8zqVxilVwRAFEsJb
 UgN68ZIVSJxJ5lgE3/qIvmM=
X-Google-Smtp-Source: AMsMyM5XcLxF8MhhH/PMsaRm36L2TkcyH9kq6drtdeDhum5yfRYVmKGhA1mMkFg3ixyXD2tyXWzvxg==
X-Received: by 2002:a62:8403:0:b0:540:c1e4:fb31 with SMTP id
 k3-20020a628403000000b00540c1e4fb31mr22297478pfd.85.1663656431635; 
 Mon, 19 Sep 2022 23:47:11 -0700 (PDT)
Received: from autolfshost ([117.228.7.95]) by smtp.gmail.com with ESMTPSA id
 i6-20020a056a00224600b0054aa69bc192sm651383pfu.72.2022.09.19.23.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 23:47:11 -0700 (PDT)
Date: Tue, 20 Sep 2022 12:16:44 +0530
From: Anup K Parikh <parikhanupk.foss@gmail.com>
To: skhan@linuxfoundation.org, andrey.grodzovsky@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v2] A simple doc fix
Message-ID: <Yylh1Nst25I6u6Uh@autolfshost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 20 Sep 2022 07:03:14 +0000
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
Changes in v2:
    Correct the doc strings according to
    Link: https://lore.kernel.org/all/f528a8e4-5162-66d5-09da-5252076882b8@amd.com/
 drivers/gpu/drm/scheduler/sched_main.c | 2 ++
 include/drm/gpu_scheduler.h            | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 68317d3a7a27..979685830671 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -994,6 +994,8 @@ static int drm_sched_main(void *param)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
+ * @dev: A device pointer - primarily useful for printing standardized
+ *       messages with DRM_DEV_ERROR().
  *
  * Return 0 on success, otherwise error code.
  */
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index addb135eeea6..80a525dd19bd 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -435,6 +435,8 @@ struct drm_sched_backend_ops {
  * @_score: score used when the driver doesn't provide one
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
+ * @dev: A device pointer - primarily useful for printing standardized
+ *       messages with DRM_DEV_ERROR().
  *
  * One scheduler is implemented for each hardware ring.
  */
-- 
2.35.1

