Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5051A1E8A75
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 23:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E77F6E97C;
	Fri, 29 May 2020 21:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD0C6E97B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 21:51:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u13so5278951wml.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 14:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65TKF+831LzNuvirKgQgWrdtRHSJrk79ygPwawVMie4=;
 b=oEyd4AL60jWocSyUts+CwF7h7ayHfmfvWklUcqZVhhoxm8b8SuCZJVnjCP5uuMStlh
 fIaW1jREa8WhWYyOQKdiaPK5Z1ElBgD3wHpx44ee2aLb8ZvslFweRDGA/BlOsI03/QfC
 A2brc18y9amqzzxZv/Mc96WHGuvtPHkPSErlTBfwbAhqe7a3nklHStbjdfBwtYKtJDu5
 e5mFjOswf2tYSdnYDD+yZxrfHrhDBCEbwsIZCuqwuzOdX9x2iQ4Qeg4ALRDVl9cz6mWC
 6bEXGCySiHAcITnCOp31x2+bpYqcSKOTSI7p0ehe9bvowJDbNioT+XQ7Q2ZoPb74ZeTk
 PLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65TKF+831LzNuvirKgQgWrdtRHSJrk79ygPwawVMie4=;
 b=BuIRkPNNn8z1ZKR4rhsfNwE7+jukO04B4WsgCaOWyIMRf2pGW9JkQp5YdpYIgdq1zM
 v96I/QCfS6uM57gwtbO74ePeH8aMtr+5t/jwpOaDmT9MR3rptSH2Mb4HxFjimP7UGLyj
 NXLcWSU2j9QrLxk9mJPqMhsKLqptLHs4lg0mGl9/hONZ6f3Nu9wco8fxLQZOMfmZWWs+
 er0iV7kbzOjYOQEAlNRMTEzpg5lBTW037PIur2ZQAoiZsC/lgN41adnAGUiRH/Ju2Lk1
 sPumGzxq5R9pLFI5/s5f8ytcABtTQsKiWKT5OQwFnb2f+EMXMs/5TbPk573J1uUiQ75m
 PiqQ==
X-Gm-Message-State: AOAM5327vht1CXxykPjM4A1jc+28ZvVEHUAQUnQ57e0z/0cWduk06HNC
 +Slcgm2b2Iy/nOmGAAPewxN6tUk2
X-Google-Smtp-Source: ABdhPJxUK0eJLcz/n08spSqTI+tkDUly+tcktPJEF8NdSYj7qvJXOwK+UD+eD+OvoJTJ3HSkMu1qXw==
X-Received: by 2002:a1c:a906:: with SMTP id s6mr10895783wme.171.1590789080907; 
 Fri, 29 May 2020 14:51:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id 23sm1140660wmo.18.2020.05.29.14.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 14:51:20 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/auth: drop unnessesary variable assignments
Date: Fri, 29 May 2020 22:48:07 +0100
Message-Id: <20200529214807.3801851-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200529214807.3801851-1-emil.l.velikov@gmail.com>
References: <20200529214807.3801851-1-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variables are already the exact same value or will be overwritten
shortly afterwords. In either case there's no functional difference.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index db701a9e9393..5ae5623f2482 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -215,7 +215,7 @@ drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
 int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv)
 {
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&dev->master_mutex);
 
@@ -282,7 +282,6 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 
 	if (file_priv->master->lessor != NULL) {
 		DRM_DEBUG_LEASE("Attempt to drop lessee %d as master\n", file_priv->master->lessee_id);
-		ret = -EINVAL;
 		goto out_unlock;
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
