Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9AB89B9C3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D19211224E;
	Mon,  8 Apr 2024 08:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C/6UyKEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1360B11224E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:10:25 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso5509450a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712563823; x=1713168623; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LOr2piSF59rBtL6qQkJRVxuVH7En2uLFiUAi/dy63d4=;
 b=C/6UyKEwT7vQwzqQzfdJFzYXaKRVpCymMjKbT0qZYojz40UMI07on8s9PVs7IqKL/R
 KfJUJnlBnH2xcDW3qqRYrLAYriyj/HZi2eRQetshRpoX3IRjSpwIfRKEwOQNjeS6Krvm
 oZ1BwuFawzfC8OQhBwm0OGFWB4DgIHRvoRwTIWMh/eHneQWaznWg06W4TewhnNj2k3GR
 CZTvp5U84qtM1a6eWw5zImsQUvjxjGbc5rpmyAc8J73Pq3pxPewIN/9CGJcmt8MAjVju
 2Qp8VbUht+ZoubGX4ggjs8UhGYcQIH7w45qmzt0lf6vU172Hzc8JVz/jsKulGIeS7b2z
 RfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712563823; x=1713168623;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LOr2piSF59rBtL6qQkJRVxuVH7En2uLFiUAi/dy63d4=;
 b=sGvt+wLrQvXwynAEGAlUU0tWZ29YmqUdi9bT6JYqgfEM/Yld0VvEUd+ykB7HMO0Pyz
 SYVaq4oS5JGdqhnSodwd0eeM3L1X3NLp1/9rhyzB46MuRtx3IOuFzafCbFu1Ow8mzjB+
 KkLGzuznjuMrLyVvn9V1yIfxB4Lr/GbQB550pOha88QRbupdyJy6yFJC3juW4RSrgq7r
 hbtoEURKwAbe3SmBGWj6cEUJJKHkwcYDZCx51GE+kRXJ1X1ZDy2fT+XtRzhDmp7wh43/
 HPMDhzNGwi36RTm3OuLJc5jubL6Q+cEDEvzXhXInZneyx4vPw/og1P1CW49MWEsoLDn9
 wwpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3RtBbB9wGIPA9Lpx5UhqaJBANh//kywwGy4NajeO266iVQb5yKzQm06irM/eKM71hwcqf1vg/0zBSg7TPTmqgq+G1I8smIIPwH3P9bR93
X-Gm-Message-State: AOJu0YyD4fyoQR6slo5l7kmrFzPJLNIqobB89KJqYpfk0uV/5VxtmuAi
 7/KTMX4t5ou7tVOi77KuuRW6gocS9MrdR7eVztcrVdWpYa5REozhZ6oOPXHsDmw=
X-Google-Smtp-Source: AGHT+IHSMNUBKuLQipt6eiK/GpbVAIRoVBfOGY9eusOY9M1lS39qRZiKY7EBBCgcSpTRamQWTGpjPQ==
X-Received: by 2002:a50:d6d2:0:b0:56e:2bf4:fe0a with SMTP id
 l18-20020a50d6d2000000b0056e2bf4fe0amr6239511edj.35.1712563823192; 
 Mon, 08 Apr 2024 01:10:23 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 b14-20020aa7c90e000000b0056e46beba6dsm2416447edt.16.2024.04.08.01.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 01:10:23 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:36:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: clean up some types in panthor_sched_suspend()
Message-ID: <85356b15-4840-4e64-8c75-922cdd6a5fef@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

These variables should be u32 instead of u64 because they're only
storing u32 values.  Also static checkers complain when we do:

	suspended_slots &= ~upd_ctx.timedout_mask;

In this code "suspended_slots" is a u64 and "upd_ctx.timedout_mask".  The
mask clears out the top 32 bits which would likely be a bug if anything
were stored there.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index d4bc652b34d5..b3a51a6de523 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2546,7 +2546,7 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 {
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_csg_slots_upd_ctx upd_ctx;
-	u64 suspended_slots, faulty_slots;
+	u32 suspended_slots, faulty_slots;
 	struct panthor_group *group;
 	u32 i;
 
-- 
2.43.0

