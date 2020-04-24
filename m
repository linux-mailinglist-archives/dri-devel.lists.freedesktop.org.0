Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABDB1B8018
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8D66EB51;
	Fri, 24 Apr 2020 20:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDF86E44E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 10:15:53 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id r14so4593276pfg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 03:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kKqnTUenA/rrGtoXHPWbx59Tan7ETAeJu0G1PoePj8Q=;
 b=jxGCXqkJid1cEbzBEHdxZAmk6SP0zwAOb26BSRaPOA6UiIS01PgdZvgAidmq7Vy2LM
 P+VrNbtJXKvbGkOHiu10OPUlYwB6IM6dozMYqAt7/QUi8NZ7uY7AoWQUi/0s+pNg513e
 VQmYhYVgMvui0Gns1IdMI8sWB9zHMfU/GMwr6gthtCdrJKZy56cM3H1D5xOjNgSz7ZTP
 l3pFxITeDywBjGllqR5KPy2LpeoG05Qs5mLieXRsUuBvBvX4cONL95yYRR9u/fikIiBn
 BXdkk0/RLepxrH6NO7WvXAsqDVPHXkc69UObcIOJpFcE5Vbq5wV32NbIK30dt/XaGHg1
 id7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kKqnTUenA/rrGtoXHPWbx59Tan7ETAeJu0G1PoePj8Q=;
 b=uROuRlqJRyQbxgFb8WOyPc9MnCa5bN2PgLqtanlVnkXgL7MGAhr8elECsHC1pUxDwc
 KghNpRMDPHKhIs68rpGLSeu0BldmXX0sPH/vZJWoheXnFlRGXlNAsvkf61n5R/UA/R0x
 jLzJe1f2fuzAa4Z2ALHM5uauC8DkNrhdC0hyuEd3FACr2aZ3KqKba40ZkuJcpNYdwvrO
 6HQyjIdpENKlG/YrRh4Ych5aMLD3BGDzTPjApHWkwjBQkTT14BaygGTM+fhvs3eypnfh
 rePRUv5eVI93yJktwyuwkJbbZugzSA0ikKQv9pS8y6nPap6z5VN/a3yZphmBTrm1+vlr
 21xg==
X-Gm-Message-State: AGi0Pua48bevjWA1dM8tL55ns6i5wRa30hgKZdbfl5Mn1UhhGGd3lkOu
 v0aBYEJTGIzSrGkxUKmabAM=
X-Google-Smtp-Source: APiQypLVT/jJRAyLJCZsU721zNGW4Fe35u6Tl5hXfGOqTbzN5EGHV16pWlevVhBY+Fi/UlcbWeNANw==
X-Received: by 2002:a62:76c3:: with SMTP id r186mr8806021pfc.190.1587723352734; 
 Fri, 24 Apr 2020 03:15:52 -0700 (PDT)
Received: from localhost.localdomain ([223.104.63.47])
 by smtp.gmail.com with ESMTPSA id 127sm5254252pfz.128.2020.04.24.03.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 03:15:52 -0700 (PDT)
From: Guixiong Wei <guixiongwei@gmail.com>
To: linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: Fix parameter name in vmw_bo_init
Date: Sat, 25 Apr 2020 00:14:39 +1400
Message-Id: <20200424101439.13572-1-guixiongwei@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Guixiong Wei <guixiongwei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The parameter name should be interruptible instead of interuptable.

Signed-off-by: Guixiong Wei <guixiongwei@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 8cdcd6e5f9e1..3596f3923ea3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -850,7 +850,7 @@ extern void vmw_bo_bo_free(struct ttm_buffer_object *bo);
 extern int vmw_bo_init(struct vmw_private *dev_priv,
 		       struct vmw_buffer_object *vmw_bo,
 		       size_t size, struct ttm_placement *placement,
-		       bool interuptable,
+		       bool interruptible,
 		       void (*bo_free)(struct ttm_buffer_object *bo));
 extern int vmw_user_bo_verify_access(struct ttm_buffer_object *bo,
 				     struct ttm_object_file *tfile);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
