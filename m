Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D718429FFC8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EAF6ECF9;
	Fri, 30 Oct 2020 08:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE736E8CF;
 Thu, 29 Oct 2020 19:02:48 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id k9so1423541pgt.9;
 Thu, 29 Oct 2020 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=azmT/G24N8TE/tNqTJcXP4u4R0G+FAx2JFXhfXQuMug=;
 b=MFzmyii/YJeRHKCIqFT/YTLhoiu2BinAEhntzjpS0mqt8LswpzA/CFS2KeuOEv0HGK
 j2kWo8RJcKrKSy9nuG9J3NMPHBqdopefT/QJVs5GD1Kv/0lBbUXzLNxmXAy4zVkD1MIN
 C7eRRuc5W5q+khDk26AsTcgo6t81c/3Bga+gwjYlIJF+qXbzuQmp7zKmJiuwmISf1/sz
 vufi+QuFE79Mi9ObCs67utwW3qT3kmJjiUiGkaflT9N+c7AXQydioHOMQdPBQPdtGNQG
 SSxWYFcXMcRJs+Y2j1QSkzGMl/OwBF3VlfvhPIJvhSGaO7mO84hQQWSxxf8BQLM5WAkk
 bNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=azmT/G24N8TE/tNqTJcXP4u4R0G+FAx2JFXhfXQuMug=;
 b=qWz60ii0RWL6CFSL01xuLi++rdQULxdIJyhxg2du/J8ZNmfxsQQvr//IZWJYegRx+R
 x0B8fbRkKgwAxfZJR3XO336pmsWtKmGXBmrIn/pOyAB0e/FU9eI67EeFiwNzPEeMXEZS
 0gpMTYy0jyETB7HlAFG7U5dYiRyLTbXmeWWIauNJmNHAjcZq5fJmlMd1E9rl1uVkR86l
 gzwjGsrYsrpzHTf256TCunZw3is5mjwj0EKXRmBz48KDShwx/i0BC+SNp+JvuoCbMtkb
 qkAgezeffDxk1G5L5Y/5v0hsz71vzesEJOnwECrvQdf6JEZt9sNISLYnEG8zQvK0P44T
 63TQ==
X-Gm-Message-State: AOAM530qQOxWveD0pk2Vf58qRkAsY2Slm+cT3LYiOl0/tvCt2kwZhDAc
 LXUDVhRdYYf0aNOq8k6OBf0=
X-Google-Smtp-Source: ABdhPJw5Eyg9jWRWL/0l6YSrt+Zz4nxhuw1qb7xVLw0srA+3h1RQYmrtFAIogzRd9bv84oV1HqsgPA==
X-Received: by 2002:a62:6496:0:b029:155:b152:f0cf with SMTP id
 y144-20020a6264960000b0290155b152f0cfmr5910952pfb.75.1603998168350; 
 Thu, 29 Oct 2020 12:02:48 -0700 (PDT)
Received: from my--box ([103.98.79.70])
 by smtp.gmail.com with ESMTPSA id i123sm3680527pfc.13.2020.10.29.12.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 12:02:47 -0700 (PDT)
Date: Fri, 30 Oct 2020 00:32:41 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Subject: [PATCH 1/2] drm: msm: adreno: use DEFINE_DEBUGFS_ATTRIBUTE with
 debugfs_create_file_unsafe()
Message-ID: <9ca2c2e4cbd9ebb282b90f742305fd9b481aacc2.1603998014.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
function in place of the debugfs_create_file() function will make the
file operation struct "reset" aware of the file's lifetime. Additional
details here: https://lists.archive.carbon60.com/linux/kernel/2369498

Issue reported by Coccinelle script:
scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Please Note: This is project task specific patch.

 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index fc2c905b6c9e..ffe1fb9be155 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -138,7 +138,7 @@ reset_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
 
 
 void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
@@ -154,6 +154,6 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 				 ARRAY_SIZE(a5xx_debugfs_list),
 				 minor->debugfs_root, minor);
 
-	debugfs_create_file("reset", S_IWUGO, minor->debugfs_root, dev,
-			    &reset_fops);
+	debugfs_create_file_unsafe("reset", S_IWUGO, minor->debugfs_root, dev,
+				&reset_fops);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
