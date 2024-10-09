Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB185996FF4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F30C10E2A3;
	Wed,  9 Oct 2024 15:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aEV40TvV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1FC10E2A3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:48:41 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a994c322aefso198708866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728488920; x=1729093720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gpoA7U68G9HQgUGPUrZ+1IXl+YXLZClnFOv3Pi/HKVw=;
 b=aEV40TvVEERNH/7KDPXp2hsrVDsTFCS66xPz3ZmlYEVkpA55GwMXoC4PKTVVI0AL55
 +oRbWfnXxgfSfwa+Ug/jBt2dd0zZlFn2fqQv5de3Tkddt1/shlKSGizrqfpsD2PLbgsm
 U2DoB79Er+5CEpK31NCQb0BEHa3YRdvjQhfAvgz1IbL9uJ+TCmXIdw5MR7ke3biHMFU6
 rtTVejtxEInYsW0QO2Ws9T16YdvBHb4PwPckDstfAycajD6ZUA27J/KkCnJI1qVrD9fP
 +i4KVsMkHp29tCUxOC0QQ6UDlTRPQq8cB72sJyEfpwb2Y6jfUZlyexXUudk+rr24SlPE
 aGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728488920; x=1729093720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gpoA7U68G9HQgUGPUrZ+1IXl+YXLZClnFOv3Pi/HKVw=;
 b=FXCxhIvvecsaebCArdG1m/EYzZq6rYMPwSKIwdV6UdhrHGDjRMsWocSkD67ZJlwA0m
 Ph/hrjbyP0YJ8OsQdKdhvtz1zirFozn7ygb8M9OdQjMatNCzVaLyYznuMxsL1urJFFrW
 Ft+Pj4Nex0IznLoCl2yw5iNxJZ66md+dkLdoIWYuGVOFokif6XtZtfPpwH8RpSnJ6tjV
 0Ah01Catu8XElsXYbgLDna9oMW8udKnMxIX5VR2LN7pj9KSncWd+tRgfGXYq549O/ht2
 D3bcZfm7k6rjlkZIRKOpNV0iaYH/WpCpIjY3BoyWHnj7ax7qftaZ3Qe57cFcjZZJcTgs
 z1zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ9f24hHubMRPm7yqah6WhEbAHCwTK+WsVwFTseZpUjOqfQ4GY9HRb8avyTWHXPsSWV0YyEVD9Z94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvX4a1uWQgRnF4cgS8Bc0Ck9DmjoHcdHOD6CplEoI0T6jtIZR1
 rLU7ExSBlTzeNGgjfkg+5SMTwjViuUr6xHSXH/V0aHeVyNhPmawi
X-Google-Smtp-Source: AGHT+IHWOO9nOZunGvkay9i7X+SSjj74oEgJnI0FqGywprSGNAjDKmfmkGDdTyOfIJpukNiscRSlgA==
X-Received: by 2002:a17:907:8f16:b0:a99:4e74:52aa with SMTP id
 a640c23a62f3a-a99a113b8f5mr5893266b.33.1728488919530; 
 Wed, 09 Oct 2024 08:48:39 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993a0b33ffsm623897366b.69.2024.10.09.08.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:48:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] fbdev: clps711x-fb: remove redundant call to
 unregister_framebuffer
Date: Wed,  9 Oct 2024 16:48:37 +0100
Message-Id: <20241009154837.371757-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the call to unregister_framebuffer is unreachable code because
the previous statement returns from the function. The call is redundant
and can be removed.

Fixes: 36462ac19308 ("fbdev: clps711x-fb: Replace check_fb in favor of struct fb_info.lcd_dev")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/clps711x-fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index 5e61a349a4ab..c350340fb7b9 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -332,8 +332,6 @@ static int clps711x_fb_probe(struct platform_device *pdev)
 
 	return 0;
 
-	unregister_framebuffer(info);
-
 out_fb_dealloc_cmap:
 	regmap_update_bits(cfb->syscon, SYSCON_OFFSET, SYSCON1_LCDEN, 0);
 	fb_dealloc_cmap(&info->cmap);
-- 
2.39.5

