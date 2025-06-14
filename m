Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CD0AD9A38
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 07:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E7810E12B;
	Sat, 14 Jun 2025 05:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ocn3m/zf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C1110E12B
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 05:26:33 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-70e3e0415a7so27142057b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 22:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749878792; x=1750483592; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fJ//krHGMnPWZB5Q33bWy4al2+1hIHKEXPMnm5ssurI=;
 b=Ocn3m/zf7KMoF+Uby3xAJKf7jsOberhMG0uRgmZvx/c/HRsI5cQu9pNojVdCB89pME
 jSce7htDwj1lyGJ04+izxypIq24sxkAK9MWT/98dASJJva68W5kpf+sfCzdK52LsHaOM
 wvjf/A22kfSZaDkdgtZR7gV8QJnsUyZlXVH5kKmcIiPGtGE/ztdmaVDPJJKqd5IqRp2G
 va11k0YSmJXOyGVawHeP9/h0EFSartwrLXr6CS1Gtyq4L4CpkN5q/3yXYp1ZYiGG9a2t
 8MRlAoMzOOJ3QdynYH2wakon6N2AHFAYQkecvsjluQA/UJDZs+pxdIOH+hNAUwQ/RfYp
 IkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749878792; x=1750483592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJ//krHGMnPWZB5Q33bWy4al2+1hIHKEXPMnm5ssurI=;
 b=tmI/utTCX99nfg5XHOIV1dY+Mz0fdJM9EwJcVcmmJ6PTabB0SZr3aj4uKgeKbQ/6nO
 1QLQcoYRPd2IW+4f3wEfgPRB6f4+/R4E26nIenoeNaWgxlOSf1ziTpH5a+gyrcGqS4Fb
 fgso9WbgQiBkoIULM5l8+HcDCE+0HTuzmVL615gTi9MOefUWbMj5LuGUgMOqtQkGY8Vx
 Vugnb3VR7IMI71PWL71VyF0Wc6UZUVwFCxO7n+qUYu0doeXNa7ib06meiOPT5ACTt/rM
 YPoc225B87OJeseVPliqzKdWPvEERO/bZe3ahv6SKOo56OVmGbVrAaQTfn2g+DB7qztz
 RKmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+hMeLff1ZWu8Qho9L/CFsjPLR2hHT+r4mQRPUv4vIybVtLlPGJrQguDKYPrBYzl0u6p/VAXSeImM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoaTd+PKPmzes94wJ6oSyh7tjFcwk5eJlVbK4NQCf3DOtCQ7nE
 TbhrtjTv9ikYS6HFGGfCPxWQ6r+rpbSsi5IQjpQe96V5A+j6o5hnBr5D
X-Gm-Gg: ASbGncva47j01QkmLt9KJJSZ8ZJip+3EHYtELQup6jbe1UTosRxsZbt7ZIKSyu6+oRk
 HxWcV8mkH09MshPjthHjDfB3Uh7y/3NfVAy40ZwFRpEOa1vd3HZLhxrkoLPTNx0FfB+WlCHprBo
 cddCD87CYizwwusGLFlnua7B7iyrt+dhDpqB1ibsQ3dgbORFJzG2pyJ1XhfZz6/hf4VIBo5yUBG
 nJGagR9QIJay3oae9Wgv7Vg/9Ju9D6k2oszvouir5ppRwPVDnF0v6URCGTB34Dek7UNVkrkw335
 +yYWAqEq7z6EDKpX8ttgKLR9CQAM7wVlsWbT28uOCYKTwYODlXupQTq5LFxLcdHphA2cjEN162S
 u
X-Google-Smtp-Source: AGHT+IECiqewpok8U4+1eKYPDaZZt/oK9V8Chhj+9rUS82dtw6OQW6ZhSPid6O0SRD7zxoR3WsVfdQ==
X-Received: by 2002:a05:690c:7443:b0:70e:7e33:fbd6 with SMTP id
 00721157ae682-71174962c9dmr34072197b3.17.1749878791713; 
 Fri, 13 Jun 2025 22:26:31 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-711527973d0sm9017927b3.58.2025.06.13.22.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 22:26:31 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: alexguo1023@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: i810 Fix potential divide by zero
Date: Sat, 14 Jun 2025 01:26:29 -0400
Message-Id: <20250614052629.3549586-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Variable var->pixclock can be set by user. In case it equals to
zero, divide by zero would occur in i810fb_fill_var_timings and
i810_get_watermark.
We cannot find the default valid value of pixclock for driver
i810, so we fix this by returning directly if 'pixclock' is
zero.

Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
Error out if 'pixclock' equals zero")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/i810/i810_dvt.c | 2 ++
 drivers/video/fbdev/i810/i810_gtf.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/i810/i810_dvt.c b/drivers/video/fbdev/i810/i810_dvt.c
index 2082b5c92e8f..1db4a63a2631 100644
--- a/drivers/video/fbdev/i810/i810_dvt.c
+++ b/drivers/video/fbdev/i810/i810_dvt.c
@@ -251,6 +251,8 @@ void i810fb_fill_var_timings(struct fb_var_screeninfo *var)
 	xres = var->xres;
 	yres = var->yres;
 	
+	if (!var->pixclock)
+		return;
 	pixclock = 1000000000 / var->pixclock;
 	mode = i810fb_find_best_mode(xres, yres, pixclock);
 	
diff --git a/drivers/video/fbdev/i810/i810_gtf.c b/drivers/video/fbdev/i810/i810_gtf.c
index 9743d51e7f8c..ae001b256ace 100644
--- a/drivers/video/fbdev/i810/i810_gtf.c
+++ b/drivers/video/fbdev/i810/i810_gtf.c
@@ -259,6 +259,8 @@ u32 i810_get_watermark(const struct fb_var_screeninfo *var,
 		}
 	}
 
+	if (!var->pixclock)
+		return -EINVAL;
 	pixclock = 1000000/var->pixclock;
 	min = ~0;
 	for (i = 0; i < size; i++) {
-- 
2.34.1

