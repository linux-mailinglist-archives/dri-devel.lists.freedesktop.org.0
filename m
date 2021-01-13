Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D293A2F4D94
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1226EA5F;
	Wed, 13 Jan 2021 14:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8846EA60
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:39 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id g10so1855516wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DB5ZhlcS73D7+78VKV5C4ED9gkOhY09FF/WaEagoeZU=;
 b=AONsu4c49jYlWKZxIV71Fh+XZdaNm/Vzg4dgCbN9JbxTF4zXdk0hxy5yUAjRqlY1Xp
 nIupPjhqoIDmU9VkNJPtK0bN3YDe0f2AqkiUUwaqnLI5f/UzmCGOhingAiMylna4SnJ7
 hLXn2MQXPU6i1MKuVELPGT8kK+K/FZOJI4dUhj0jPoBZq2Enr9vntVzkeQDu+4qMmsGJ
 v9PLkQKSiH7g77yfRhELqhLTHFPLU2Zj+6aaz97t1aI4q7b6mzr8jI36fIERyEk5M18O
 pFAOSj+Sqvp1t7uHTA6T4HOtbxb08KOCHlGCDgPp2Qf5TW3Vp2vXs9ztiYrfKzPx/xqZ
 1DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DB5ZhlcS73D7+78VKV5C4ED9gkOhY09FF/WaEagoeZU=;
 b=IMCmo18BzMw8qT49PmVE1E6nPCX0YAv8wVhsfZD7qW1QCIPCvka9hLZVJsTJx9TapZ
 gSTKTPt+c9xRzZnxaiVs7yCCfQhBHjCQ4yYFTtm/rj+s8OQeAuTBlRZg7yxYJsinpA4l
 rxRtvWNP15oLSDi3PtqCypEijDjxuYIeJthpvvuhJyM3ew8DU285jqaGcK39E3Of3I/n
 2Vr2tBTg7I4tjZWN8muAGZV7BTqsi13vmnQYPEazeKsRxPE8vpK03e5kSyDv4OtYF/5Y
 48WnlwOK+qzyGZFuJs0HEj22dZewqhCJFYekTGbBBbOX9n7uu9cpIgHi2nVM1Q17xdZP
 /qEg==
X-Gm-Message-State: AOAM5328eNfu+lgP9wSNKnHo+PxAQmHb5In++Bk2k2pjO6gnQVhZzn9N
 K5w1kNuJssu1q5eSOWwMoWeUWA==
X-Google-Smtp-Source: ABdhPJwgYTdZ2SuZ1GC/GjtSB8bSmqwzQcGAszf80Fej8Y4hpcF1LKJ1kwg1EITnZXMFsMy/JoGVCg==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr2570638wma.186.1610549438672; 
 Wed, 13 Jan 2021 06:50:38 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/31] video: fbdev: pm2fb: Fix some kernel-doc formatting
 issues
Date: Wed, 13 Jan 2021 14:49:54 +0000
Message-Id: <20210113145009.1272040-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: Jim Hague <jim.hague@acm.org>, Jakub Jelinek <jakub@redhat.com>,
 linux-fbdev@vger.kernel.org, Ilario Nardinocchi <nardinoc@CS.UniBO.IT>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/video/fbdev/pm2fb.c:1515: warning: Function parameter or member 'pdev' not described in 'pm2fb_probe'
 drivers/video/fbdev/pm2fb.c:1515: warning: Function parameter or member 'id' not described in 'pm2fb_probe'
 drivers/video/fbdev/pm2fb.c:1721: warning: Function parameter or member 'pdev' not described in 'pm2fb_remove'
 drivers/video/fbdev/pm2fb.c:1765: warning: Function parameter or member 'options' not described in 'pm2fb_setup'

Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jim Hague <jim.hague@acm.org>
Cc: Ilario Nardinocchi <nardinoc@CS.UniBO.IT>
Cc: Jakub Jelinek <jakub@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/pm2fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 27893fa139b08..6a30096676374 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1504,12 +1504,12 @@ static const struct fb_ops pm2fb_ops = {
 
 
 /**
- * Device initialisation
+ * pm2fb_probe - Device initialisation
  *
  * Initialise and allocate resource for PCI device.
  *
- * @param	pdev	PCI device.
- * @param	id	PCI device ID.
+ * @pdev:	PCI device.
+ * @id:		PCI device ID.
  */
 static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
@@ -1711,11 +1711,11 @@ static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 /**
- * Device removal.
+ * pm2fb_remove - Device removal.
  *
  * Release all device resources.
  *
- * @param	pdev	PCI device to clean up.
+ * @pdev:	PCI device to clean up.
  */
 static void pm2fb_remove(struct pci_dev *pdev)
 {
@@ -1756,7 +1756,7 @@ MODULE_DEVICE_TABLE(pci, pm2fb_id_table);
 
 
 #ifndef MODULE
-/**
+/*
  * Parse user specified options.
  *
  * This is, comma-separated options following `video=pm2fb:'.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
