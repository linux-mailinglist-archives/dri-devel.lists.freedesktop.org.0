Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD546D05F4D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 21:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304F810E129;
	Thu,  8 Jan 2026 20:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BSCU4sbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B0E10E129
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 20:01:01 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-430f3ef2d37so3060875f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 12:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767902460; x=1768507260; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0R59JhP2h+GNKoVP+C9/jngayGQfqzbzM8akEAfrgYo=;
 b=BSCU4sbQ9gCksEdtDgFJdmxJJM256kd5EdXQ6oDO0M4PQPn65VnPg6wth3yi/zzCZh
 EdzO/vJe9Ihk+CpycMtbetE3ZsbUxNxGzJjwAFx/a+ShjMb9JAwc+8upoAG4KjGCsWDA
 5Q9OD5WJJlZQ8zYxUFzyqUBEjk3xvWSAKzm8fn5HNjZyTWozD5oRQSt/2ylSKVlJaZ4m
 wYsGdZi9lZcdK0PHpbvPMe8WJqI6tySF+J3kIxdr8iA3P3zgII1vcXyCHtPUoFXSJrUn
 zYsltBQi8dOa4HD802d/dQw87B7dF8wDlp/9UAlKZ5jj0ge+oVnZNP81L2QEONOtU9xg
 c+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767902460; x=1768507260;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0R59JhP2h+GNKoVP+C9/jngayGQfqzbzM8akEAfrgYo=;
 b=sz5UJbLwab3PMejoaBWYY31ekidiEuCii9Lln1rNP3ttIO+Fgfw5s86CkkfIxw9OoB
 3+fUbppNG2LTK/AC3MgRMzzt11Tvd50tTpkWLneokZyMAWQWTdj6hCpglHLp1VTWcyIk
 VmqiQOhxD0ZHuzbXOImGgLktPVu8CvxpwYj5sn0Kb/CQ226JHBM3cYSdky8EWvck89IK
 F06tuEWB2kE28YRndSEOePw3n2GSWG0Ww6j0E+Vtse2fgqDqO4qbg5CT6jmzibqAD7T8
 Z9zbMZeIGughMqHixK+A+OM71wpnxPpM0vSgMw8t/dhrSn1jC41wkP3KvV7CDv9EsFZy
 QZrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXEVVLudXPKoaCIIsHqfPD51gwgrXdt5xspl4EWR0GzGRhZh/SBP3mFfoncWNOw3B0J3QM86EjgbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk5w0imFLON6jSU1NviGmx4u00YtV2lP8GkEpf2HH6H3LMa907
 FCltY9Npm5nwtobGhWYcz2XSb+BTw+ZGTXu6sAHuELUhJqOGaGcRRB4Rg0L/YkE7aPVwzfpkPN+
 cSurD
X-Gm-Gg: AY/fxX6QuErMY1OmozrkeqwgtTsuVBWTLgcCMHSv5hWUBBjcqVLLaosYjJHINBhv8ZY
 9aTM9sFIJWDC5hRlWp7krfZHqyLzYRELEmPPS1CP6lRxmVgdZChTPaP/RddNFnu6ZFrEYnyeiEI
 h9/aQhSKjV4nsoT9SJk5jKgXYsFR9l0Go4mTOEkERAGwG/OymmbebLaVoz65mu0Ord8TYDDru1g
 r9yrV96aBS00w/39LXAAilVyVMZ9r+wu914NyQdUzk7rcXN/gb825T2m6/+QP2qsc3mpaHiCUMH
 Xfm/JInqENcC3A03AEM0N0FbP3Rh0ghDxIGwf8A81Kt7EberfqCPwYn+05Vwe9n3UEIW/kHM0+V
 X7MCBQLF/05T5Q+qzx49QpSnC+ERRsbgdC902eHgS2iSiJr7G9VJ8bSUrkkgsx1tiqUf4D2819X
 25kitqe5JTQhNgF6ep
X-Google-Smtp-Source: AGHT+IE0npwunWACAYL+5K87C4JawJUGa/VvYRBjPWPZGKZYwiEeVeAPHCRJ0OWPGNFKQWH85CyAbg==
X-Received: by 2002:a05:6000:4287:b0:430:f494:6aad with SMTP id
 ffacd0b85a97d-432c378a7dfmr8823298f8f.2.1767902460211; 
 Thu, 08 Jan 2026 12:01:00 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5edb7esm17838263f8f.30.2026.01.08.12.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 12:00:59 -0800 (PST)
Date: Thu, 8 Jan 2026 23:00:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fbdev: omapfb: remove duplicate check in omapfb_setup_mem()
Message-ID: <aWAM-SZArPSRNaNK@stanley.mountain>
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

We know "size" is non-zero because it is checked on the line before.
Delete the duplicate check and pull the code in a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/fbdev/omap/omapfb_main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 106d21e74738..a8740213e891 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -846,12 +846,10 @@ static int omapfb_setup_mem(struct fb_info *fbi, struct omapfb_mem_info *mi)
 		 * be reenabled unless its size is > 0.
 		 */
 		if (old_size != size && size) {
-			if (size) {
-				memcpy(new_var, &fbi->var, sizeof(*new_var));
-				r = set_fb_var(fbi, new_var);
-				if (r < 0)
-					goto out;
-			}
+			memcpy(new_var, &fbi->var, sizeof(*new_var));
+			r = set_fb_var(fbi, new_var);
+			if (r < 0)
+				goto out;
 		}
 
 		if (fbdev->ctrl->sync)
-- 
2.51.0

