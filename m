Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AB92F8369
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BEF6E47B;
	Fri, 15 Jan 2021 18:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8219C6E457
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c5so10200533wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gpHmuC5+6mrLTxCF96eU2jys1HshdL5VNQtWWDrXTEc=;
 b=xZIH7SwI6Fbbu2RKOQ3Emd0mDzyDXntheoo+T/kqfqEo8d5VJgHNI0gYye37CB7WwI
 T6Fqnprv+zHjajpyH+7J0eE5X89LiDsWKh5p43VT1uK9niZVeF6c2ks6yd0LI0mwPPv8
 /tL+KSim+ajMJwBegccStwEHWZ1+94Afsz2yZfzsFiY62lLvOwgL8K1v0HSWBV639nfT
 Mg3WUxmoypi+KvEVm8XlnUdWMmqkKeZPi8NjMHjMZl1XahqRv9TuxFvWZmGVUZH4pRoN
 6RfeHl6eHVpW7LExiU4xc1myTcYTPV+jR+p/7A6R3RYscZAwo9BMPmDKFkZoqkQesHRV
 FeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gpHmuC5+6mrLTxCF96eU2jys1HshdL5VNQtWWDrXTEc=;
 b=t4n5QwY3nqFYD2GqnjmLqCpHYtMpKl6NmDoo503YdU/Ngbqy4Sjv4Ra5e4V7Zg9VEc
 VLrIybXGSLGvx2qJgKnkF0Vg88gb8NV7Pu60hno0LWIk7LFrctYyDF+TtKiiCtvftIDt
 GzHOSiDfhu5fbBa5zFTFdkjE5BTA7VEgZXDkIGOMEItU5t12Cn8pCIgDkQgI6thm8dD2
 0lJFNkBx0Za4Tgy/EfYDh8rFzXzo28Wrn4ehsfNJrhoCmg2NvOkIHeCjGRWQMWgUDU/7
 44P4JUIby9BOJkfgliOjh2H51lOjxiVHk2tzGCgAdlDm0/JIZwjTvP5lfmuOj+CGsrlw
 6edQ==
X-Gm-Message-State: AOAM530CYgB7gk+wrq09ENx2k0QGAWplVdhh/LDaklj3VkRCKZuq3DAy
 8sLvUvHsN5rjiYuhVHA+iO7DQw==
X-Google-Smtp-Source: ABdhPJz1rIOt/fxVq/kJAg8SWgzfhLOw/V4zUIlwuFz/czfyJGKZv2ghuwQDTzYqMiJpet5Er7cJwg==
X-Received: by 2002:adf:c444:: with SMTP id a4mr10945203wrg.164.1610734404198; 
 Fri, 15 Jan 2021 10:13:24 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/40] drm/mga/mga_ioc32: Fix some formatting issues in
 'mga_compat_ioctl's header
Date: Fri, 15 Jan 2021 18:12:39 +0000
Message-Id: <20210115181313.3431493-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mga/mga_ioc32.c:171: warning: Function parameter or member 'filp' not described in 'mga_compat_ioctl'
 drivers/gpu/drm/mga/mga_ioc32.c:171: warning: Function parameter or member 'cmd' not described in 'mga_compat_ioctl'
 drivers/gpu/drm/mga/mga_ioc32.c:171: warning: Function parameter or member 'arg' not described in 'mga_compat_ioctl'

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mga/mga_ioc32.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mga/mga_ioc32.c b/drivers/gpu/drm/mga/mga_ioc32.c
index fd2160ea71fe1..4fd4de16cd328 100644
--- a/drivers/gpu/drm/mga/mga_ioc32.c
+++ b/drivers/gpu/drm/mga/mga_ioc32.c
@@ -159,13 +159,13 @@ static struct {
 };
 
 /**
- * Called whenever a 32-bit process running under a 64-bit kernel
- * performs an ioctl on /dev/dri/card<n>.
+ * mga_compat_ioctl - Called whenever a 32-bit process running under
+ *                    a 64-bit kernel performs an ioctl on /dev/dri/card<n>.
  *
- * \param filp file pointer.
- * \param cmd command.
- * \param arg user argument.
- * \return zero on success or negative number on failure.
+ * @filp: file pointer.
+ * @cmd:  command.
+ * @arg:  user argument.
+ * return: zero on success or negative number on failure.
  */
 long mga_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
