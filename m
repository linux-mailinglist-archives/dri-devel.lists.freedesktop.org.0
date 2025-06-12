Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66E8AD6BE6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 11:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C55210E7BA;
	Thu, 12 Jun 2025 09:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZeG0Jlrb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935AF10E7BA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 09:13:54 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-235e1d710d8so9128415ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 02:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749719628; x=1750324428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gfnJu6FBfjOUzTU9SGHbhPYpMSIgolpLY8mjQIuOQhc=;
 b=ZeG0JlrbpqFUM/XAeJHv3xgG4hnC5C5Uqd88xgz4olefXIKN/krJUUiRnJpNpdCrge
 5dR6w6xxtzbGqKoAASXtXZhOizMdmeUyFrUnCp57CF526Wf8A5jJVDwuB5Gf5ZlIL2yg
 nQHEfZSQON7+Tdo4KYhyF+60lKU5MY9OPTvvmQcWhtY9dewXpONoazQOJx8ZYWvdECjq
 OrXTP5lXY3Mx8XKsSEn/JTcmSK8Rzx5I2eKAXB0xYZnIkXBSztxs6NEfXBZOi/y4dBr6
 p7bKuhpgNPtXWFa0ExxkHf4zcqRkqosSj2EdQnVbAbqDXVk1c4ddt5aV6d2NxKmSpMIs
 ymGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749719628; x=1750324428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gfnJu6FBfjOUzTU9SGHbhPYpMSIgolpLY8mjQIuOQhc=;
 b=tsND59cU0s0s0PTXHvgmEE66nBEKXUIW8pBAeTzwPHP1xhThtnbUr6IVfGfWkRaiPb
 UQnl18/+W5tRz1d5JsHO3X9zvwFVsp4OIuhS6D/dDq5QY6jhFDQGbQQ7nbcmpQaGLHUb
 aGVXWOGIXFzZtKG2LlxtGu+Qd8NE68+Awo/0zRIrgAQwk3Rba9DZm07q7d1BPPivWF8U
 GVjD8aqUBr9bGQCUY+oj+zX22hIZuIwIU/WvQI+ragUN6sUpiZpctu99XADwwFDRbflM
 SzsB0nkmYBQlehgtVpVS5JmdlAvCokzcO77k4Wbv5iQhsZppvM/Pv17nYuhYOBodUtcQ
 y2aA==
X-Gm-Message-State: AOJu0YxC2/lZqgZEWpszHI+3eZb8ALEfj3F4xkUI5o2yl65FoEehc4rk
 bjDzjdsGP1W+NpYJ1mdS1OvydeMhBCY8+LeUtqxPibUJnahmwrKKUm3engXn0MeKX1eK4w==
X-Gm-Gg: ASbGncur+TwxMlxj2rt+eRTXpgmkUGqWvw+Av44eCzypy2IYQTN7Khhch9S+vRMbR6w
 O6i0TzAhKnnhaHpXw3fNtAo9bAiks6nDpUs9gTu6i+nb2r+Szq6LrLzVbnDMqR8b+cA7bPGVExh
 icdTrHgFi4Bky5yUymuUJ4rWDrgUaiNLoM3XYIE/CVYJ/I4mAV6nnbdSwP1xxoB+q6ScsbOITZl
 Xns9BZ/QILxiqN0lLc0QRaCZxI+5Bhoud8b+USVWdwzReHNaWCHIsT/ULE/x5IfdlBRXqR3EYWR
 LwMbWLlDCNJFwwhXX5CrtjISHPryDJq+T10BeQQuVFeVNMCQaxtUqL/d9rDWattqflFkz5n99n4
 Ghg==
X-Google-Smtp-Source: AGHT+IH5B4WttxxRU+tnlLXUWpwJKMyoK9VSqrXBTiL0SbSG+sOPE86VpdHFBeYk5SMdcmtq68Ku2w==
X-Received: by 2002:a17:903:4b4c:b0:234:e8db:432d with SMTP id
 d9443c01a7336-23641b28dfamr100699535ad.39.1749719628579; 
 Thu, 12 Jun 2025 02:13:48 -0700 (PDT)
Received: from sie-luc.localdomain ([113.142.69.178])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e61b5acsm9391915ad.5.2025.06.12.02.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 02:13:48 -0700 (PDT)
From: onion0709@gmail.com
X-Google-Original-From: luc@sietium.com
To: dri-devel@lists.freedesktop.org
Cc: Luc Ma <luc@sietium.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/doc: Fix doc in drm_file
Date: Thu, 12 Jun 2025 17:12:37 +0800
Message-Id: <20250612091237.14425-1-luc@sietium.com>
X-Mailer: git-send-email 2.39.2
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

From: Luc Ma <luc@sietium.com>

Add missing type of variable in the example

Signed-off-by: Luc Ma <luc@sietium.com>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 246cf845e2c9..96696fca50a0 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -95,7 +95,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
  * No other file operations are supported by the DRM userspace API. Overall the
  * following is an example &file_operations structure::
  *
- *     static const example_drm_fops = {
+ *     static const struct file_operations example_drm_fops = {
  *             .owner = THIS_MODULE,
  *             .open = drm_open,
  *             .release = drm_release,
-- 
2.39.2

