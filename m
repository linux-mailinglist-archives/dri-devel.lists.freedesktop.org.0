Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293ED1D49FE
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ED36EC3C;
	Fri, 15 May 2020 09:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A0C6EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f134so1679001wmf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L457CX6UVQaxlohMgQyzShKgxDOsXvqdnSjPGTeCXxU=;
 b=cM9Uap9I7AVnVFSfXD7uUk3YFoBd1IOIVgb5T8cc4JDSF6ZqhEYGn7WyQoHGGD05LV
 rLWIXwtRupRNBWkf9aYFvG8pLI+vQ+fLGdzzVMO4FpiiFeNGXV0nvEm2pwNBzuZfjvTx
 DwnmZTKhd04NHpTVfwtmzMJXzwty5eV5fK/NPj3q2ybxqeLeS/cCYlvHqTwevalBiaug
 BCBI3EFDFO/BwEoyGZUBBKp8+j7+Z/2SLRSfVwBoUNzbkhbnrS1c6Ace7nZmWyRMAhsD
 FT9/RL0nduVomUqJzi3OxnE1qeSOroGHv2AKT+K+7fRlX6avbwJA6Nx/G+hIhJZvBd4t
 Nktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L457CX6UVQaxlohMgQyzShKgxDOsXvqdnSjPGTeCXxU=;
 b=GWMOM7BXSGNEFN3mSKx7zZdzQHprrBsXLSz1IkN+foVaR1e35B08d8OQ0WqifXrYEI
 HbAu5s+uH2utnE+2jZO0iiuaGTQuZXLv6D5fcK08k6tpROjj0GryHqkj0E6dz5Q5TO1S
 oxx17NNmjOU70vvpxmjF19kV5veUs5NEj4Zn/GLT3zikRR3917rKAQzvTFaS9SRhwIcn
 rbyBQ3mE4szgFx3lhUwRzIib8IcR3s54VvkOwW1jEg9H+Xvh/5vfA/asoXOR02jgvNrc
 TpkZ+/f+Cpv7Gmf4Rk5yOUPPgWq3+V6+VSBsOMPZ+4H0tNi+526WwTw/O4PDdGyKklz1
 iQyg==
X-Gm-Message-State: AOAM531XO+PPN85ewQsIesJkWvnhyVpwqdmxzNwzVFhtE1KE/5UShrvh
 TBjGafNqgUxxdSPhsZHI5rtnFp/L
X-Google-Smtp-Source: ABdhPJxcosVrxKMWJpr5ix4vf99opIgKEhHpBHvC1+4K3D2bukPTM9qkJIAfyLscRc6jTcHKGAcvJQ==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr3087144wmj.101.1589536448449; 
 Fri, 15 May 2020 02:54:08 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:07 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/38] drm/doc: drop struct_mutex reference for
 drm_gem_object_free
Date: Fri, 15 May 2020 10:50:46 +0100
Message-Id: <20200515095118.2743122-7-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

The comment that struct_mutex must be held is misleading. It is only
required when .gem_free_object() is used.

Since that one is going with the next patches, drop the reference.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 918d1ba25f63..12fa121d0966 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -965,7 +965,6 @@ EXPORT_SYMBOL(drm_gem_object_release);
  * @kref: kref of the object to free
  *
  * Called after the last reference to the object has been lost.
- * Must be called holding &drm_device.struct_mutex.
  *
  * Frees the object
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
