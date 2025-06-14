Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FF1AD9934
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 02:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D5310E4F5;
	Sat, 14 Jun 2025 00:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SarhNRGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9844510E4F5
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 00:44:55 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-708d90aa8f9so26255207b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749861894; x=1750466694; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4BvcwXUpYpF53aglFHdWaMYuKTVfMzFy1gAx/zcHH8=;
 b=SarhNRGr3KQMN+UZwoDUIu1gkP0meM8QDvtY55m6t3uz+h+Fy/GuPe3E3XodtsxfBB
 r/e5MxuwashSadA3BQVCEceFr+19isHYBbE9NeeI4zuAdhtZlBFYsptddK96Da66aASC
 Yu52dvU47rmqsliAHJw4L8to7C5wKY2lSyg36chFRMY1kp39iFJl6u/HZEBvFT0znRoE
 YVGpwm9jQDCdXA5sZ9qQolGQMXa2X1tXTwpIsmhOYkJ3TgPx2hm5pWyEO2gwiywtAXQu
 7/HNwmM1dDKpr302yIgHrKTwx+bagPqJC2wHMFJ9gjKxqRHbD+lJWwgi5Th5UjGzglMq
 SSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749861894; x=1750466694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4BvcwXUpYpF53aglFHdWaMYuKTVfMzFy1gAx/zcHH8=;
 b=K8EuZ5+vzEpkbwixSdmtFv/zcWYhLPwtBcy7ubUHyB/Y63NDHAxXdMLVmsAc45uMPJ
 l3zdL4ij8NSw4S9MmOoXchfZuM4BcM4R78HgO9Ijc3PveXL4eXWyi39hPWHADJ14ErGu
 EC2+7DKeBj8sT9xi0RvsqdCAMR3ZGgTZMS5ETEpue0jSr7tgSefJS3id9hhY1JoTXTtG
 1bKn6m5CFGDCFQEmJVbpQ2IrFMzbegwuQmqrgTx5HBfoJnwy3HIreVLUsJDAAwtKGxu3
 CIKC79GmtiXIqoh5ZyJWOtNiI8rEIkDVOS6PKpZKjV5nnk49bihYMOPaLRyNWVfp0enc
 3O/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5kwiRFcVKVDYEAGuh7kobzEKbIM0IOoyEcO0ZdgfoyI+cU6Z8ye2eDUpGTg/ywaA3dArI9F7paq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVNJsBm9GoM1rnYV6FHsxO2Ygv2XCLFfe1a6Py1GZ2YJRnKGet
 QSJR/ESjQUR4+LoJgCA7lan8ZBjKU4kDqgrZjTEXRRRl4vR9JI0mm9zf
X-Gm-Gg: ASbGncsJcG8FXCfe3iCwzzAYi7spw+fI6CxTJWibrFDKkMdFkMEU9SxiIvi2c7GoJ2v
 0Puzycy1HxQmw2xqxJrR4rKTs21DrCfEEiocRC4gZpq0lTSNEhtJqztrcIOb+nMPeRYbD69pjzK
 Do1KImw7roxjCj+0wlg086xzDBxjukB6oh+tqxwvkB0S1/2SA5PiGPlE0ygN25hbAGfwJo7lQ2Z
 /ILwW/IfCoz8pvZdeTwN8ALJuIbz1wzWljRJXYgIgqJC9n5ElukwfA0QANIpprPkyz7bFNPnqF2
 RnT08b0u9maeAEA2EY+W3A+5RSKS1lg5rpjYzbORU4eQKlV6JrNl8FmYOcJ3HMhlFJFLM4cvNpP
 g
X-Google-Smtp-Source: AGHT+IGjLtwBG/qb8tTfi+EFfpRRiPz60v6QAyBpoxShxESQKaqfAUJV/kdfD3XI+ycQZ6HE2YHScw==
X-Received: by 2002:a05:690c:6c8d:b0:70c:c013:f2f with SMTP id
 00721157ae682-71175492805mr22391947b3.35.1749861893645; 
 Fri, 13 Jun 2025 17:44:53 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-71152793dfcsm8421807b3.67.2025.06.13.17.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 17:44:53 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: tzimmermann@suse.de, alexguo1023@gmail.com, gonzalo.silvalde@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: sstfb: Fix potential divide by zero
Date: Fri, 13 Jun 2025 20:44:50 -0400
Message-Id: <20250614004450.3096366-1-alexguo1023@gmail.com>
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
 zero, divide by zero would occur in sstfb_check_var. Similar
crashes have happened in other fbdev drivers. We fix this by
checking whether 'pixclock' is zero.

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/sstfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index 2ea947f57efb..fd387ca8401b 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -359,7 +359,7 @@ static int sstfb_check_var(struct fb_var_screeninfo *var,
 	int tiles_in_X, real_length;
 	unsigned int freq;
 
-	if (sst_calc_pll(PICOS2KHZ(var->pixclock), &freq, &par->pll)) {
+	if (var->pixclock && sst_calc_pll(PICOS2KHZ(var->pixclock), &freq, &par->pll)) {
 		printk(KERN_ERR "sstfb: Pixclock at %ld KHZ out of range\n",
 				PICOS2KHZ(var->pixclock));
 		return -EINVAL;
-- 
2.34.1

