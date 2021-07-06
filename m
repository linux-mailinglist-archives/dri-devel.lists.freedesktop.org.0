Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D550A3BDA74
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 17:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0486E48E;
	Tue,  6 Jul 2021 15:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3B16E48E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 15:45:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so5711232wmq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6sUMiO/vlqHYcT9Ka+FoYD9FGjoPX5wgJXj2zjZnh0I=;
 b=hXAMxRnQizISn2Og5gSA0eI4pO1W1QyLxDiAS5YxR+1e1a1k6rFf9Th3ueMZDangyp
 64O5VAgrTijwKKdInhCyN+Ao1ssE3Ie09BBt3ddFXtCE8s9vQLv/McKe7WAx/Z+VjdMb
 VrzchTn7+bU+fwBA0PJwxNg+TNV6rFWEkYwNEA+tu/oHI+R2+XzKUhbxvVBtbk0cPNCX
 QGRD6O91sPBNwtSNEXTxf+36gT4jVbQGgU0kNmchUEzH+QrwMIg6gStARTPwvnDJQu9S
 J6HpWtcQeoaifjLW3z1Jn9XgiMGtHp8/VZmt4bfkBIDjp0pb10AdWPuy8mvhuKVPq8n5
 DjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6sUMiO/vlqHYcT9Ka+FoYD9FGjoPX5wgJXj2zjZnh0I=;
 b=lY9Nc9XX3ymy9Mr2iUu43zwzGXtZkr2zn4LdnFazwPi0UlaNqYF5mBm7CCF4saKnDe
 VugKxdCap17H/Zwl53PRDQhOmva54EUM8M34x1YfQMV8yKl+vGnNsQFme/0VFpp8onUV
 9uwpPoQVzhwjZdfKJKthfCpwZF3RXqBsYRJayoYcD5+noEMxmiN8u7L4oxZckzhO+uHG
 MuYl/MH9zP2s+8zzFPtiinW5OAsg2QLwRpXIxYv33q2UmkPrm3iffDRw2su6KmrfJW0m
 9Kww9nB3Cqb9OP+bxTt8YTWJ8ro9Qh4mK+Ly8j3ar3B1WJakT79al4a5amfFqw6BR0i8
 Ji/A==
X-Gm-Message-State: AOAM532TW+3OhUvGaE7y+hPQ1rjXM3H4qqvmT7wFcpipbRaNDCbcNhYW
 pzyRFJQfyx6V64AmZn0pTMA=
X-Google-Smtp-Source: ABdhPJyRFvzDV0toYmRbVUjrbokOwKoEokGvI/ADU3xldJSF6t0wvwSflP9fQR6wgXuGfaz3J7g1mQ==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr21380696wmf.79.1625586312644; 
 Tue, 06 Jul 2021 08:45:12 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:a4f0:53c4:7466:d06e])
 by smtp.gmail.com with ESMTPSA id
 k14sm16236019wmr.29.2021.07.06.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:45:11 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: melissa.srw@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/vkms: replace macro in vkms_release()
Date: Tue,  6 Jul 2021 16:45:10 +0100
Message-Id: <20210706154510.224695-1-martinsdecarvalhobeatriz@gmail.com>
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
Cc: bcarvalho.ic@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace macro in vkms_release()

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 496de38ad983..e806958027c2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -52,7 +52,7 @@ DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_release(struct drm_device *dev)
 {
-	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
+	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
 
 	destroy_workqueue(vkms->output.composer_workq);
 }
-- 
2.25.1

