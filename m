Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691ED51B5CD
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 04:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A051010ED55;
	Thu,  5 May 2022 02:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3316D10ED37
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 02:22:17 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id z16so2557641pfh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 19:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ef+sybKBAkUjKLs8tlJYfzgpqHk/AEhKYaj2VVeifvg=;
 b=OG/lleGzbi4WRp3eEVn2Ky39PrCMOzoBfa81MHSat9WWdT6+lVMGwstvSB7TyQrK0O
 ekPuX5JS4wq+jTGfYLENqJFAo8PYJ0lOsTN+qpSxH0S50gN1dgHXfv5wKC7rXy9o+CHx
 o76liOhu+Mj7Pejjz3EZ6g0SV75SJazPqoOzQG5qTHicMLiqT8td7jtc+6D0Sv9GMq7L
 BvNSCf/V9NPNxftEg3HDXhsHd9MsG9sXVL1ckLWa/boFegB5JA0RjPq7bxzR2O2I+wiz
 xTel8KCWKQ8Wrz86uuQ/hrVRBvEzo21tlHd3jds4Hq7TejkqH2sb7A5t7AFv3bNIMnt3
 +GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ef+sybKBAkUjKLs8tlJYfzgpqHk/AEhKYaj2VVeifvg=;
 b=LzC0kH0O4chtFeyVKl1LKicZjoCqxE7Eq0L4LhGf+U4kwl6tFqQUj7c0u1cGl642pl
 HTPGvUoEYwt6ik6zp55e3nyRfdUEDZ4Vke20eJDN6lmj9yfxlWqXV5ImD+damjTp2jg6
 6fWGJOuL9/Abrw2lXPuiZy6Dtli86m6if7S1+HIzAFm/dO5ue+F/q64hoOA4CMvCrWad
 7e+tuKATNDV5zjWos65vcoxGohsnsGADmJ95V5GWoCoKhupspDzc+AkE72yEZyRBUjQf
 ejTmCr8nQFAAvaNZOpwo03P91xy/SYn/lfXWOEVXpE1qQIa/tB1BohnHYbvanY4PM6yy
 KINw==
X-Gm-Message-State: AOAM533dfcgSdkGC7OGwEM9F1oEv0aNPTVln7/VE+tzlAal1kVqmKJIb
 RYfE+p+NfcDKTczWzfUFY1A=
X-Google-Smtp-Source: ABdhPJxwgs2AzWqDhC4ZlkGGOfEWL9n90q8upIDnCzYEAp4SHXBb9BBiuNWmzfxRnFREFEVH6h+mqA==
X-Received: by 2002:a05:6a00:c83:b0:50e:eea:1b9 with SMTP id
 a3-20020a056a000c8300b0050e0eea01b9mr10598547pfv.47.1651717336875; 
 Wed, 04 May 2022 19:22:16 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 v29-20020aa799dd000000b0050dc7628152sm99911pfi.44.2022.05.04.19.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:22:16 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: airlied@redhat.com
Subject: [PATCH] drm: simplify the return expression of ast_drm_resume()
Date: Thu,  5 May 2022 02:22:08 +0000
Message-Id: <20220505022208.57157-1-chi.minghao@zte.com.cn>
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/ast/ast_drv.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 7465c4f0156a..760b27971557 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -159,15 +159,10 @@ static int ast_drm_thaw(struct drm_device *dev)
 
 static int ast_drm_resume(struct drm_device *dev)
 {
-	int ret;
-
 	if (pci_enable_device(to_pci_dev(dev->dev)))
 		return -EIO;
 
-	ret = ast_drm_thaw(dev);
-	if (ret)
-		return ret;
-	return 0;
+	return ast_drm_thaw(dev);
 }
 
 static int ast_pm_suspend(struct device *dev)
-- 
2.25.1


