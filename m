Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A636C478
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 12:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E972F6E3AA;
	Tue, 27 Apr 2021 10:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352D06E3AA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 10:55:09 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d14so5573944edc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zivnrpMt9grXcc00hfPDRekMzfRQWCib77IYIuxpMgs=;
 b=tzfpJC7qfP9xk2oGPQn9+ykcs0cb85xMTdHgEtnpM15L3kcRl8q6lNv/UZfe7dFoDU
 6roq0fwm3dECIAL6HHYIuDYVYuDSXwDDyxPlCZNs0MO0HDdt/iOhOVC4uvAVDsMZ1/6P
 Jxq4rjxWr1qXcqrd7IqOZEfiOKQ7CFlMfIfzGwcDnnywaby3+v0+YImqUDvShgJCw9PF
 DVKsEzVacXSThdRAe+WsfHKFEADgb4qGsUsRndVQtZrBE1IUVziAOwHX3utz6MCXrYvw
 FQysBN8AfTeqpgo3qRqVJOsbin2spCxfpv9uLak+Av5KHV7nIydoUOgiVgvM6YchJCnV
 CjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zivnrpMt9grXcc00hfPDRekMzfRQWCib77IYIuxpMgs=;
 b=UlmZL3iNZ7wyFOzbBZutNLaG0/WMkN23ukFb6tNAz/DqisGq7xuBxOQPRSKH8kDMO0
 +lV0c3pfJlN+jahcnNGlI5BQDXlsRFDoxIu/3tbcNZhIPyGD/E9aFIHCzXbK6tc7GCSc
 wvpW+KU3uVhd76IQoZte1wryOeZwArWM+pPvdTUG51/58YHrNm4Q89Mexj7QUC+Xoqpc
 FhTlYz0D1WKRO7HVoHUj1mAu1LV/6+GAJWT13bDEyD4k/1bKO49Wtj7VZCvDiSB8Lg6S
 GC+QqJXa6pPDKW/kgyoDa0gjdOJ+KpGQS6vTwBTJ9DVTOYYorxiX4MRjaxcfaJ2eHxuC
 kYSw==
X-Gm-Message-State: AOAM531DS0MLWJSfSB3iLHRaNjXXO8hFIUZG9lKsgngA4x5pE15kBMxX
 rf+/fj3VmaWILxdawP2Oi5U=
X-Google-Smtp-Source: ABdhPJx3kMr3dAHbCwzox5wO3bNvndLpGpMhS4LLziiQDl3h/TOuku5SQ+mbcBu9VPcfvrvPZd6PLA==
X-Received: by 2002:a05:6402:2211:: with SMTP id
 cq17mr3524225edb.28.1619520907873; 
 Tue, 27 Apr 2021 03:55:07 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id m9sm962625ejj.53.2021.04.27.03.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 03:55:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/drm_file.c: Define drm_send_event_helper() as 'static'
Date: Tue, 27 Apr 2021 12:55:03 +0200
Message-Id: <20210427105503.10765-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_send_event_helper() has not prototype, it has internal linkage and
therefore it should be defined with storage class 'static'.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v2: Removed all the other lines in function comment.
Changes from v1: As suggested by Daniel Vetter, removed unnecessary
kernel-doc comments.

 drivers/gpu/drm/drm_file.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 7efbccffc2ea..d4f0bac6f8f8 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -774,19 +774,7 @@ void drm_event_cancel_free(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_event_cancel_free);
 
-/**
- * drm_send_event_helper - send DRM event to file descriptor
- * @dev: DRM device
- * @e: DRM event to deliver
- * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
- * time domain
- *
- * This helper function sends the event @e, initialized with
- * drm_event_reserve_init(), to its associated userspace DRM file.
- * The timestamp variant of dma_fence_signal is used when the caller
- * sends a valid timestamp.
- */
-void drm_send_event_helper(struct drm_device *dev,
+static void drm_send_event_helper(struct drm_device *dev,
 			   struct drm_pending_event *e, ktime_t timestamp)
 {
 	assert_spin_locked(&dev->event_lock);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
