Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841313EABDB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 22:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763D06E47B;
	Thu, 12 Aug 2021 20:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F1D6E47A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 20:34:49 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id oa17so11829641pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otS/AA0BHrXG6Y0hs1egziVZdEyeOXzD64u+7F8XKYY=;
 b=y0gl9b3tIpV/Eu9/KZMedHII4fg1R7kiwLVGZkep8+RkYoNy0GGBaIsuZatbPQbf/G
 yH9fUOpddKafQBxCDT9TjUt6DmJIKZ5bMcsJKJspWpwHOG8FZucTcguZ1nTdgAPSu8M6
 D0JAYZPW9AZmBbxQwWT/WNRAxNbFJKz7SJcxbYhg0QDmhmMX6E3NjBudIdmW3d9YliDK
 +fuBa+xrVqaAMP7S+RThAkpT+xcYhh/iOeDteO2WdlNpx3F7rCsGbBzLcNIte643whLA
 tqY4JulFN7pdszvcVw/n+rMZz+w6afMevvf/PA601zprSpnxQq0ALJygnx2SM4g/HrRX
 ka6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=otS/AA0BHrXG6Y0hs1egziVZdEyeOXzD64u+7F8XKYY=;
 b=OfkKTAZBvJzD4jxOpGYlzgunVCN5757vMWC0yEs8Pi/a3J1awqd/y9kmYcZGalo7Jx
 zeGZLDJAqqLNTBzBibJw62LMRNux+IrNznfxJMU0rUdVE16R7B5W7gBdTbOhA3YbvYPQ
 vPs4dY/Qku3kCcX55RSuORXjJ2LVhfPoppTdBTYdjj+ITXr/5Px38EsMwVoP9OI8xS7I
 mbaOsCugomHED6vts0D6G3KCML0R3Xl+Cyi5VX2U+/9EaZivzVIieqb6aneEyBvROwC3
 1pbAcS8zoXcMOhmxJ7n2oRROfnTFNwEAd0yjjxvwi/+QsTdgltGhi3R0Dg5LuUXCCIXG
 PXqg==
X-Gm-Message-State: AOAM5329OMgGm4+S5hy/mOH1yin7+0Y6SBKi9sTH3io6ehRXxLtiISJW
 FF3dXquQbexnAbcQEkC9aa1mD54WGn2aYyBM
X-Google-Smtp-Source: ABdhPJziZyCl29IXBYV6dyM0FPW5HPzwPwTmtSimXfaqyRwzb7wvYGj7eZuEvQdSRiD0VUcv2YcwPg==
X-Received: by 2002:a17:90b:380a:: with SMTP id
 mq10mr15958615pjb.207.1628800488664; 
 Thu, 12 Aug 2021 13:34:48 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id h5sm3404482pfv.131.2021.08.12.13.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 13:34:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/2] drm/ttm: Include pagemap.h from ttm_tt.h
Date: Thu, 12 Aug 2021 15:34:43 -0500
Message-Id: <20210812203443.1725307-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210812203443.1725307-1-jason@jlekstrand.net>
References: <20210812203443.1725307-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It's needed for pgprot_t which is used in the header.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 1 -
 include/drm/ttm/ttm_tt.h     | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 24031a8acd2d..d5cd8b5dc0bf 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -32,7 +32,6 @@
 #define pr_fmt(fmt) "[TTM] " fmt
 
 #include <linux/sched.h>
-#include <linux/pagemap.h>
 #include <linux/shmem_fs.h>
 #include <linux/file.h>
 #include <drm/drm_cache.h>
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 0d97967bf955..b20e89d321b0 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -27,6 +27,7 @@
 #ifndef _TTM_TT_H_
 #define _TTM_TT_H_
 
+#include <linux/pagemap.h>
 #include <linux/types.h>
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
-- 
2.31.1

