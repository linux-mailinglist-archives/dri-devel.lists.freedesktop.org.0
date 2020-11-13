Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F61F2B1C40
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BB96E53C;
	Fri, 13 Nov 2020 13:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A348C6E4DD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so10001040wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tsA84tchu/fVBD8BOW0vRm+o6+cq+5iG+jRvtUiphpA=;
 b=ljkhqYySRrWFIwFjkjtJqAOVwEjQpjcXz+P0dCfR06bxVDX+TFbuC9nUsXJd/9wlJl
 Dn174tiIjfzxErd2027y8/GR6KJZsMnqluLTnVaSVT393O7ablFJhKZThhKDvfLsmEO4
 CDkKcSiRsOKOxRicNS8l2wW80We25vptVDk0vs1ahrW9ONB/bAIAmPheEhWa2xIo7oFy
 uZ+2r2cCKWJQNJyiG26Cfe7MJIr6Uc9P2iNZwu80ma2/ckIYZYH7RGmBpLh+rjph00z/
 adlERjv3mnMt4UrG0hHN9Qd1dznr+yVA0DL1oJ6cK1B+ZPBVNwSAGH7Y7GIpWVIhDbsu
 CDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tsA84tchu/fVBD8BOW0vRm+o6+cq+5iG+jRvtUiphpA=;
 b=UZ3kdVWHDyYNYddzqLbUHG1g6Y2Cg7ANfljfzGoN7w0XnO7nGP0WBUtn5YT4ycaHAX
 jfBIIbzbelW+qLWhIpfs6eBa4Ibfa1u5m2LbAgz0qgvjnA54njCnbyQArgxwsYcxdcsR
 0VtV0VU4osUmvhcm1KAlLyGw6AfbAa0KhzDu1QY0IjeUohL6YM4QhdmoZ/grP9gxW96W
 n6k6pYDgixI5aEBRZ2+Hc/5ltaXXsTd/76tOnTXVbbSpLLUkGcJKJNM4NBKDU48fWMrC
 Iy+u8wpVqtW2oiHbyxrZpyIOd9k3mE1MQprKQV9jV/J+rDznPLwb7t6B4Ax0UCAcprHA
 gPcw==
X-Gm-Message-State: AOAM533UmZjY8FQd4g+z2A/r0LNt01zKkH3rRru9NlCUA4Wc1/HhgZbS
 tciRXvQG98VUKlOlnFr4ODJD/Q==
X-Google-Smtp-Source: ABdhPJw0ubF+ddCYt/IdqzNmhTYlMrII1PRfSKp1xN+rqZtEc0LeJm/oKMgfrtivtLV7J47M+qK2Tw==
X-Received: by 2002:adf:9e08:: with SMTP id u8mr3517443wre.282.1605275400292; 
 Fri, 13 Nov 2020 05:50:00 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:59 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/40] drm/lima/lima_drv: Demote kernel-doc formatting abuse
Date: Fri, 13 Nov 2020 13:49:13 +0000
Message-Id: <20201113134938.4004947-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/lima/lima_drv.c:264: warning: cannot understand function prototype: 'const struct drm_driver lima_drm_driver = '

Cc: Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/lima/lima_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index d497af91d8505..7b8d7178d09aa 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -255,7 +255,7 @@ static const struct drm_ioctl_desc lima_drm_driver_ioctls[] = {
 
 DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
 
-/**
+/*
  * Changelog:
  *
  * - 1.1.0 - add heap buffer support
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
