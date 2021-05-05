Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41F73733BE
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 04:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DA16E402;
	Wed,  5 May 2021 02:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA18A6E402
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 02:35:55 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso455192otv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 19:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GfhGC55J2OjEdw/7PTNJyCxRfWG9ZUMJ95NKKd86u0g=;
 b=rphV2EqsYRzSsIbvC2C0a7SvtrMsP4QtRZb/7Z2MX+lzpD4qhDJG8MmDjPeCKoj4TN
 AzA2BqUsublllOKQUSl8RglZbLKarS+uxlmS4unHRnpcakfsArSSn9D/A7DdRFx/Mi//
 LFve5mr3n+fnftrtTvt4d1yhzDE5NOTkQnLDoMPsac9kOfx+wdoC4YT8bEeS9OkNjfJ7
 lL4ErUyPoSsBlS6HQpWtLYG84SsY6uYY5KklVeu4bLQC9EOuLaCcHsPTWaT3IpbNMyMd
 JOdhELwuAmq5Wg1okCzMpE6mpOYDSZ+El7N4dThHd/azfN1eIjcBK4auZ7pGrmS7/M43
 DPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GfhGC55J2OjEdw/7PTNJyCxRfWG9ZUMJ95NKKd86u0g=;
 b=FPiWvN1N9wne0Y7hI/Ieh+1cH2T9eLjIKoykxGsCzFn2n6po1B4nzd0MqtxVcpmAyY
 cQzGbr79k0UtkjyE1iFxaNNu4OqujORH+r3tYsLiGxik+aVf4PEKZ1qgd+7SvseQC2fR
 nek4SXsxDaTZNjOdAOon2dTMWg6khfkWtgVbdfxOhdv5rT2IJSuZfooE0vy2UpnV8KJu
 hxVvqc1Q7dER/lU9odPTxfg0av7lvPYVwPktbeIJG8GELOXXsY8nGL5Gsm0kn+0YqqrD
 mm6zdP+asMTdv0+kRb+rdy7eypcC1V09tYjvR0nq24nVbHDPz0wFhyWadjssiY/TZ+sn
 /Adw==
X-Gm-Message-State: AOAM533rhUOQn9uDbOFlG5AJV0DNUxzHcAQ9fIVIXa9mWT6sJgqda1QJ
 Fn6pkei2a334ZJoI8rF4XoM=
X-Google-Smtp-Source: ABdhPJzy++fj+9aHMX278OES8bsDJ7/tIWDToemKnYwirNCewCj3Wf2m0qVz92GuaTcN+1PPe52otQ==
X-Received: by 2002:a05:6830:18d3:: with SMTP id
 v19mr20003182ote.339.1620182155257; 
 Tue, 04 May 2021 19:35:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l7sm1108108oov.5.2021.05.04.19.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 19:35:54 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH] drm: Declare drm_send_event_helper static
Date: Tue,  4 May 2021 19:35:52 -0700
Message-Id: <20210505023552.2622938-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
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
Cc: kernel test robot <lkp@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

0-day reports:

drivers/gpu/drm/drm_file.c:789:6: error:
	no previous prototype for 'drm_send_event_helper'

Since drm_send_event_helper() is only used locally,
declare it static to fix the problem.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/drm_file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 7efbccffc2ea..def5df9f19e3 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -786,8 +786,8 @@ EXPORT_SYMBOL(drm_event_cancel_free);
  * The timestamp variant of dma_fence_signal is used when the caller
  * sends a valid timestamp.
  */
-void drm_send_event_helper(struct drm_device *dev,
-			   struct drm_pending_event *e, ktime_t timestamp)
+static void drm_send_event_helper(struct drm_device *dev,
+				  struct drm_pending_event *e, ktime_t timestamp)
 {
 	assert_spin_locked(&dev->event_lock);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
