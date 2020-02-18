Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F47163ECF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45176EAFC;
	Wed, 19 Feb 2020 08:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE816EA58
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:28:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u6so25025754wrt.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 09:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eNI2AWl9XZZdPLhTH38nobJrQAEGZo6b2lzQ8OJ+Zy0=;
 b=BEPrmeX7IGavrgcl5UFYDjCya7DY+d7v1Ci8xLDnvdkACVurKxN6CFEydbhEwjRiII
 YczNSQ57KGsu2VIxf/pxiEMquZhQ38BjFf7hNc4dr0JjUKcBoEFsnT4LuxgkMRrTGS7f
 H82k0lkZCEefvhcyq15DvtuzxNHwt1P3B4f+s1zHCCSVasUa3lX/DZb80SuIZLDFTdjG
 6ZNcm/DmTrABviB1r0hPR0RSh71QspJbZV05UGcHLELrEakRQ3xh1OqH6WHXwgkF3eLL
 45xksEbrUYI3PPucQ14bzjjc6CizoX84Wx5D+a7nGoIBIEvm9zl+LlW4tvFnvmjTAnO8
 xdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eNI2AWl9XZZdPLhTH38nobJrQAEGZo6b2lzQ8OJ+Zy0=;
 b=T0lVGHciyFhN+3AKmWg2LpGXtwtzU3lQ71IJ+6QfjH2wsYLiE3lwJtb2I74H4RsaTX
 0i2BsYA64PJyP8y61HOtdLVLX0C54bygS8sBQB3ATcpNBKuud7W/qHtJwWgij8huNU8u
 4Su1HpMquzo1sInkoGPb4a8/kXIuHd7wJDpyWn8+feSubr6RWCnOVQGx0kV022Z3WCVi
 102K4IE4fdIxYMhWiHWLZpzm4jrZrGbR85xwotj9MTxeT5KskaHNZo3eMPSv2B1Q2IVn
 UsMpmBGNypbNT/J1B2bzmSItdMpJHO3jw+jObjcsvYwrirh2vs77s1FXZNij+AMNB2nI
 m6ig==
X-Gm-Message-State: APjAAAXWV5S+hKd4O7XqUGvZJpIxkDWlw2O6/4HGo5NuejcjJtDnfjLj
 RBR/Zwr2FYTCDmMtgOvzCLI=
X-Google-Smtp-Source: APXvYqzZVlKqI1X3heHQTWa9mpr/flMwMWrInKVpi99QI4k1Mspdh8QmywKzulmfFLgBb+sinvS2gQ==
X-Received: by 2002:adf:e641:: with SMTP id b1mr30115473wrn.34.1582046937280; 
 Tue, 18 Feb 2020 09:28:57 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:28:56 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: eric@anholt.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/v3d: make v3d_debugfs_init return 0
Date: Tue, 18 Feb 2020 20:28:18 +0300
Message-Id: <20200218172821.18378-7-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218172821.18378-1-wambui.karugax@gmail.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As drm_debugfs_create_files should return void, remove its use as the
return value of v3d_debugfs_init and have the function return 0
directly.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 9e953ce64ef7..57dded6a3957 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -261,7 +261,8 @@ static const struct drm_info_list v3d_debugfs_list[] = {
 int
 v3d_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(v3d_debugfs_list,
-					ARRAY_SIZE(v3d_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(v3d_debugfs_list,
+				 ARRAY_SIZE(v3d_debugfs_list),
+				 minor->debugfs_root, minor);
+	return 0;
 }
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
