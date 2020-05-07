Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47411C93EA
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28786E9F8;
	Thu,  7 May 2020 15:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C827F6E9F8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:10:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l18so6827123wrn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UUABl2wVRatkO4EE0YHkCwHW5aJAIn1l4xu9QGB+vNM=;
 b=H7Rk0o6Cl38kBoDsjrUorBXviUwd9VODqmJR/Uz+tBmHZXSL9sMth1eCNS7BY2g5pb
 z5yvy4aZ//7bJsPBL/n3lA7PC10igt8IQPCEgrndD28dzkQjR8TLHe8NnF33oM4xVjc5
 34IBwl3+byMAUWuzyj13A2VLWbXZ9hfkykOman9nGkQQIGNNLAAK1KBGdY9CggG6PqmO
 8I9ddnAHGGStkxKiE1LYZvl/Y2w6qhLlqnUTmkkTwF++a64nrfVhecjlf2DXaVezqrxC
 1TVlEmYg1YQocDTDp16WV3dpkWjYf0VJthNG9eiy1Dq1rf8wfGkOPUSoHdR/Cm7/7nX1
 sw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UUABl2wVRatkO4EE0YHkCwHW5aJAIn1l4xu9QGB+vNM=;
 b=nYCgKdASeLXdWgwKA0SyS0F75W7nupINJ5qT0i8UIFGxNz19VY+bTm1MFYbPiClyPE
 hqT5yNijOykynKay8qiUbsScPUKyiO8QmKfRuE1FwUyf1dMojpL2RJFFVCQ4NC9MzU1p
 BxL4DxhFLKunx3ZFn9LjrYK6vydPN6TXWBg93Az/j0OqQFr20f6gJBBFDrpc6hDTgyOC
 FsJb1q8honS2bk040tqJpmYC0BbziwnmOHKjs4EOXYwhZ1Yuy+2GLDpYQxWcQBpT3CgZ
 7wT+y4ne+am0DPcm6e6uDW7RhF9MpinPrXMlG5Zy8hiXkK6dA4I7RtIpT39U+yfNoJQK
 /30A==
X-Gm-Message-State: AGi0PubzEdZgikvB1QNjfdsetfJNIsyLoNPgSPRn5DyKGClVmF3tVRoL
 cIgIS3cImSBZS1xTYe4CdZ4Ou3uf
X-Google-Smtp-Source: APiQypKooTvQvYWO57Cqf5CDL99mSvxYzWbjkfQrGKuMathDMjVS9xcWpF4YAAbM1Mnj06DYqxi5Xw==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr15422716wrt.215.1588864257866; 
 Thu, 07 May 2020 08:10:57 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:10:56 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/36] drm/doc: drop struct_mutex refernce for
 drm_gem_object_free
Date: Thu,  7 May 2020 16:07:51 +0100
Message-Id: <20200507150822.114464-6-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

The comment that struct_mutex must be held is misleading. It is only
required when .gem_free_object() is used.

Since that one is going with the next patches, drop the reference.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 918d1ba25f63..12fa121d0966 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -965,7 +965,6 @@ EXPORT_SYMBOL(drm_gem_object_release);
  * @kref: kref of the object to free
  *
  * Called after the last reference to the object has been lost.
- * Must be called holding &drm_device.struct_mutex.
  *
  * Frees the object
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
