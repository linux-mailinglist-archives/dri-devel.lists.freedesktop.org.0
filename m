Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1198F562
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 19:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D936B10E232;
	Thu,  3 Oct 2024 17:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YxeeEdaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8EE10E8B4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 16:13:11 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-2e084dc44bcso146826a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 09:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971991; x=1728576791; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z3WiMbAhFsbgFsMbymS9SFj9ZdJkNGNlqWJ97chhwH4=;
 b=YxeeEdaCaAZ+C8vdAOfuUp0el/T6jyO5BYzoFBptVWDG5qqekwmjw6WLtLPE9yazmi
 X91uoz76CVh3wBzhOwlGJwC9qj1qFnbxAq9ulWvq8asx6RT+IQa8315nJlH35l5gH9jx
 Oo2HOSiFAZFwQS/LixqGJ185fwYoSm2o0Y7ScZCQ9A79QziUw9zBmwqznrqd80Hzib+G
 VzHppK4eDVLQRekJY3Gfd5tDamY6r4BM+yMcA5q9qo5bBnQo3LM2KTYs25xgsd65P378
 vtpur9iUejdRvpZe3wmBwlQPPmZJmTafIeiLZmEwrjTJ/rbcHrAdDLHi3vZYKOAF3ee8
 hgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971991; x=1728576791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z3WiMbAhFsbgFsMbymS9SFj9ZdJkNGNlqWJ97chhwH4=;
 b=evpJ24wl+uf/VZAicpSm63UZ572G3mnqEFf1p1EF5OQlZcBtFeMptuluCexe++4JhN
 Xo2rQzJH4eVoEIqKq4ObwUFw1U0IzzOJEtAXM2h6fmYwls6L2b0+3hBP/dSApV6bR1m8
 yG61LYESi4H+L+rsOSBnAX8LwFhPrEzKOUliC+MAA8C8GJzd4J4E9Eb/sLgCKFvDEAQA
 r9DIoqVYCXD+tYtBojn0/MH553ijk19XrId+lDWugSh6KHNA++zstV+KY3n82mTssJeg
 h0tjI0ukSHriSZ4v/qs30fm8PaCMIPOyylcJJx2i2XOpDR01h/yLQJ+SSvayaDLpQ5do
 jdwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxYwJtuQ9iZijqlDCZI28oNGctLbVQ08KY0CnXmN/4g97UXUfue8d7pqXnv3wRuiHQAdLweNC0Y7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp1DYKCiE5GGgaoYCD9tWh4RCXW+QHNdJVbmsln/rXHPrEW/Zr
 OYnzVEia2d9e9kMSINpm0cyDRkv4NbunHuD6ekNLzyXAlU7KEnhL5Vu/E/A0hft0I9Tf
X-Google-Smtp-Source: AGHT+IECRTHvTd6P+YA/9SXtKlU5SkB5oDthZt0x/R2Qd3F/NleiAE4FG9DI3RlVuzOcBMfQ4d15Fw==
X-Received: by 2002:a17:90a:d50f:b0:2e0:7adb:6380 with SMTP id
 98e67ed59e1d1-2e1849be000mr3540656a91.9.1727971990582; 
 Thu, 03 Oct 2024 09:13:10 -0700 (PDT)
Received: from user.. ([206.237.119.148]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e1bff53444sm1836316a91.52.2024.10.03.09.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:10 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: deller@gmx.de
Cc: shc_work@mail.ru, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, clf700383@gmail.com
Subject: [PATCH] fbdev: clps711x-fb: unregister fb when clps711x_fb_probe
 register failed
Date: Fri,  4 Oct 2024 00:12:36 +0800
Message-Id: <20241003161236.3527733-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Oct 2024 17:37:05 +0000
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

When register_framebuffer failed, it jumps out_fb_dealloc_cmap without
calling unregister_framebuffer, which may cause potential memory leak.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/video/fbdev/clps711x-fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index 9e3df1df5ac4..69db40a7a361 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -328,10 +328,11 @@ static int clps711x_fb_probe(struct platform_device *pdev)
 
 	ret = register_framebuffer(info);
 	if (ret)
-		goto out_fb_dealloc_cmap;
+		goto out_fb_unregister;
 
 	return 0;
 
+out_fb_unregister:
 	unregister_framebuffer(info);
 
 out_fb_dealloc_cmap:
-- 
2.34.1

