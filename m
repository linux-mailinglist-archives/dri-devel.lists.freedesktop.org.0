Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5165A747C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 05:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FF210E175;
	Wed, 31 Aug 2022 03:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAF810E175
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 03:33:10 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 p8-20020a17090ad30800b001fdfc8c7567so2567081pju.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 20:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=07kADcidHjuB+Zmfi9pW30oDxS6PMQtLtwVQUMEE3p8=;
 b=W4n5HGp1uqRBf+urkbXzHyzmnpXgQ3zSUt1wl8xWOv4rV5WfIygy6yufSv1NH0OZat
 ZRezN2aqcjzZWQxkWTKn+de+qkrid5JOHB5qQUFw9wmP0ZA1AUCK9S9Ml6WHgpzqIZN6
 9vXFk0kY7b8cZ5QW6APNJk9fJJpzIRmdFMQ8u0jmL8HHuIOzom7vZDEbovwVbuAN1x/U
 GrvanzmRgv0zxVuz+6KvRIgSg9YOURahPDoFoa0SfR8J9/YVYEy8HQ5xPUPqCry5kYMC
 K1l6OR8fJ6MkYV/Z7PCKhzyIFniAJdCG6W65fPxapPrmEj/EhT0cHQLwbHL1Vs6tIH0B
 8yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=07kADcidHjuB+Zmfi9pW30oDxS6PMQtLtwVQUMEE3p8=;
 b=OyWJ4z8GoAqbVcTBY/s67saLzQ0Jy4ODNGEZfCgTV7DU5scvyz9Dcvp35BcXkv2LSv
 wGKsK80zEaLZv4ONULA6LV2YcuanhjleLK3y+2rw+OmLD4wSB8Dr/zfQ2TWmzUGJR41Q
 92Vun6Y9SK1NpZX21eWm8InC096OO5LfN9e3zSrkL8QdCjZbRNkLeEyUNwMRlPvNy0Im
 PSBxVAC2Da5ZpTPRWH0QeZOx+kY1O+8Sry+a8BYxUoLE7famniFdH0FxNyByqlyplEQJ
 Aa8wg18j+c9iY2o/hKfsnaPqgN/G9lMgD1baIxPOnJtRz/SYKfgfPJrSGicuIIuP7Q+A
 x1pg==
X-Gm-Message-State: ACgBeo2dYevB0Y9WXtXIkt+xL1O2zd/xhVnPBZ0+UKLisTlnWHV6gyZh
 HbmpTwI3gYVoAhKqlhYdEaI=
X-Google-Smtp-Source: AA6agR6HHRLsIEseMQjMkDurFXXKbwIy6vzrqpXrQFq7JfR6kdzF1mrc7a8WL1EamBO5Iw8ZZhsm7w==
X-Received: by 2002:a17:903:18a:b0:16f:8a63:18fe with SMTP id
 z10-20020a170903018a00b0016f8a6318femr24439522plg.174.1661916790375; 
 Tue, 30 Aug 2022 20:33:10 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a17090a2f0400b001ef81574355sm327503pjd.12.2022.08.30.20.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 20:33:09 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: airlied@linux.ie
Subject: [PATCH linux-next] drm/gem: Remove the unneeded result variable
Date: Wed, 31 Aug 2022 03:33:01 +0000
Message-Id: <20220831033301.302121-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: tzimmermann@suse.de, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value drm_gem_handle_delete() directly instead of storing it
in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/drm_gem.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ad068865ba20..3fa0deff3014 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -782,14 +782,11 @@ drm_gem_close_ioctl(struct drm_device *dev, void *data,
 		    struct drm_file *file_priv)
 {
 	struct drm_gem_close *args = data;
-	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_GEM))
 		return -EOPNOTSUPP;
 
-	ret = drm_gem_handle_delete(file_priv, args->handle);
-
-	return ret;
+	return drm_gem_handle_delete(file_priv, args->handle);
 }
 
 /**
-- 
2.25.1
