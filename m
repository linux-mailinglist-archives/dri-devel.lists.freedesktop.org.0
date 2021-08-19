Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434863F277A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0CD6EA21;
	Fri, 20 Aug 2021 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9AC6E7F1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 11:20:47 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id k14so5593976pga.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J6U9S0s17cRugomog4lLkEVfjR7QoaRMCFqRJRXrs9A=;
 b=J15Ety4t5KzJlI7Uks97AMI91YYCrGRcKqtSgWA0NIXCo7+YEvKpVsr85LEwhzprME
 NwPKvKw6wWS2YjE6IQ7jIcvUuvWJ+xz+mh498M+8hZnF125uwVggpkpUAm/tV5n1qbSU
 8FBrAPVFTrmYi7iQ8EjhncEjF3D0rlOuI3izZejG3GNmKuxBvS01c5CNDtxlWk8xDS9s
 L+qMXCBwgox8ddPkRdOPOtcqWq5uCnQCpBOs7Ercwty/4B8FQUDo8gGOUwwbqG0gfN5L
 ysZCTGRhnwYElD32SCfs2EZpH1Rgt7nXwCjCM8q5YDiDspsNqmRZhiJAMvDbU7oZMERq
 1gcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J6U9S0s17cRugomog4lLkEVfjR7QoaRMCFqRJRXrs9A=;
 b=XelNlIS+2Hi4C3qVBwqz2nIbYpuACWXf7ycSPzKJ3JWcc+EISlKFmXtBKzVf9XqHuf
 s0QXYERxBGga3a35S+rST12+55U8cDs3d8UQkIB7mSV7VAu2ZQzjJKDkvbp7c7eb8MtB
 I5Z8ovLEs2Fmv5Nux88RI6b0Kq4MwHvnOs2+yahR1BPdBrxQe0VlFmKKfGYSMHe9yiUh
 lBeA/j0UnXhWsuRhdchYJp3exJ9bpJFcst6AJ8gq3hs4zp/z6pDh1lmFm4WPvp3P/cl9
 Kfifq2FGJyb2Bs4u6rO3uvDJ6Knh+TnUNhaQCfFg0x9QpDvrSBsvRUwmRU/UCEGo+l/X
 AGVw==
X-Gm-Message-State: AOAM532CQPvK0bnWx7RwGZENPe3BB5xoSwrGHqeUwFRhe+zhzUYllAhg
 XMzOOK7z+jNDy1qtK7gd4+h/Wg==
X-Google-Smtp-Source: ABdhPJwSVklpApGc6dofNQJStqvnbb/RMg00YVY9qzE1oLww46f7u/Zb26Osw4WRsa4mCdM+lmt18A==
X-Received: by 2002:a05:6a00:238e:b029:35c:c5e:b82d with SMTP id
 f14-20020a056a00238eb029035c0c5eb82dmr14201949pfc.33.1629372047535; 
 Thu, 19 Aug 2021 04:20:47 -0700 (PDT)
Received: from xu.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id b18sm3043176pfi.199.2021.08.19.04.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 04:20:47 -0700 (PDT)
From: xuxinxiong <xuxinxiong@huaqin.corp-partner.google.com>
To: xuxinxiong@huaqin.com
Cc: dri-devel@lists.freedesktop.org,
 xuxinxiong <xuxinxiong@huaqin.corp-partner.google.com>
Subject: [PATCH] This is only used for testing upstream progress
Date: Thu, 19 Aug 2021 19:20:41 +0800
Message-Id: <20210819112041.2696096-1-xuxinxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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

We want to test the upstream progress.

Signed-off-by: xuxinxiong <xuxinxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index dc49079a74d1..ce7437d1b682 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -4,6 +4,8 @@
  * Author: Jitao Shi <jitao.shi@mediatek.com>
  */
 
+/* This is used for test upstream progress */
+
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-- 
2.25.1

