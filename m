Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B4B02E88
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 05:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA5110E0FF;
	Sun, 13 Jul 2025 03:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JV/Hwjel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B1C10E0F7
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 03:08:45 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b34a71d9208so2464578a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 20:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752376125; x=1752980925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VXvmkRtZbf2b+Njy0K8dmXZ8wWln74jkiBHLW9XMXyE=;
 b=JV/Hwjel+I9sIEBXhsUI5AtKpZ1rFxTVIo+qZhskeG2nyaWpa4hhEuPmcJ+UMfUT87
 OrXF6EIf9h1M/57fc0/vtygsfUT3cP7ivXVF7udig14PDycoAbyEbynq27U96l8cpRc0
 7o6UuV3aV5y44rQPDBsqdnSuriQslnjHC4sRDFpnDC5nlmsIkXdKQJvWMBpwvB8iDKqh
 8JV7glVgAl79tFgUPXGTdM2Wi7amaSceOJRr4qH/MJJIuqG4xigPFR9dGMzXIwoG535t
 g/0Y7yNzD7/9y3+Po0t40lOMVXRfh6WCcP7o7pSq01RJ/evDWy9MH3zuXSIO90XDFyM9
 qfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752376125; x=1752980925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXvmkRtZbf2b+Njy0K8dmXZ8wWln74jkiBHLW9XMXyE=;
 b=X3QKrTU3KRj0h+4XzwRvNOVevZX5E7Byn7l9g2WaaVwibSGVfjvepV0R+RNA0g/oxV
 EfI27gvm772bye7VcjegtMAh/p94q3frMg2FghMfY+UhfftUKeSlGj0vuc+/NPvcuVfA
 94qoIEus5ZsqaP2j3LiulE8l4s6af2XyC4gLPU9gY6BJviCBIfaQHP4gKtllFwU83n7F
 nWKpUREirHsSR0tYiC1zsmH8Ot39k9vUWWRaAvEH6Q9Y308VXK/pJ2tKNHkNpmJ/zB0f
 rdCtkjn8rFNDOTUu+sjNRrCvne9ZKA25OYxi1hNHR4I5cxTS6eRhVzM76lUDaiqRxppr
 12Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5T4Zp8US71gsv0dXw1xi8/lYLyJTyil/7zZORDor7muVCufi3IP7ecJjr8UJCLLzOHPOYeqiBTrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1R7wv7yg7bkKQgGAgQjdaHq8XoT13hGynRXB5m9fqPi6apn6D
 OF1tbRmsbgUb4l1x8bDLL1g111OMnx8tEGXH+qq25gDKTOTyZRe5JGMm
X-Gm-Gg: ASbGnctezDQAKN2GLS7mSoAJTP8LsTkeHkx9Jitl+KUR5C6O401cMqTNGOgJ9nhFRps
 pjilEnIPY+5feX25RRRJHWjufNyyG7M40jrJ0BWnSX1Tbyjs5LRnQlkTHbp5JoNQl3oI1GfS5Wi
 FEazn3oxSgcLfU7J4+CNYvD+P7Nms2cgmZdli0dl3K/Dik2SlwIGulq80r95rjLjufGO+ZMweS2
 1SsSsboEpLh0oSddo+EtaefbSD54PnU0tt+ciO41S7z/4ibOh3k7xMWWNWknze2MNBm7WJjV1oE
 sTFDivJVeNBUgp147J7UdMrh/18nQQhnC661WhYomppDVQg5lgohe1FpVgrcSqnh+/ntSrQLlNN
 ykZXI02lj7bkCLPb7CMd9S2IyTCm2y9u0zPpX064zX+j3GsE0NDwgWOS2
X-Google-Smtp-Source: AGHT+IGJn2mfV13kGWqNsFG87NUzlj6w+JlP0SqQyWoNKdedSr6NBSs8KTAdv+NjN201O4ijYH0AjQ==
X-Received: by 2002:a17:90a:c88c:b0:31c:23f2:d2ac with SMTP id
 98e67ed59e1d1-31c4f53f737mr10992295a91.19.1752376124847; 
 Sat, 12 Jul 2025 20:08:44 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23de4283a81sm69421585ad.27.2025.07.12.20.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 20:08:44 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] panthor: set owner field for driver fops
Date: Sat, 12 Jul 2025 20:08:29 -0700
Message-ID: <20250713030831.3227607-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250713030831.3227607-1-olvaffe@gmail.com>
References: <20250713030831.3227607-1-olvaffe@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It allows us to get rid of manual try_module_get / module_put.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1116f2d2826ee..775a66c394544 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1400,14 +1400,9 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	struct panthor_file *pfile;
 	int ret;
 
-	if (!try_module_get(THIS_MODULE))
-		return -EINVAL;
-
 	pfile = kzalloc(sizeof(*pfile), GFP_KERNEL);
-	if (!pfile) {
-		ret = -ENOMEM;
-		goto err_put_mod;
-	}
+	if (!pfile)
+		return -ENOMEM;
 
 	pfile->ptdev = ptdev;
 	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
@@ -1439,9 +1434,6 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 
 err_free_file:
 	kfree(pfile);
-
-err_put_mod:
-	module_put(THIS_MODULE);
 	return ret;
 }
 
@@ -1454,7 +1446,6 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
 	panthor_vm_pool_destroy(pfile);
 
 	kfree(pfile);
-	module_put(THIS_MODULE);
 }
 
 static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
@@ -1555,6 +1546,7 @@ static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 }
 
 static const struct file_operations panthor_drm_driver_fops = {
+	.owner = THIS_MODULE,
 	.open = drm_open,
 	.release = drm_release,
 	.unlocked_ioctl = drm_ioctl,
-- 
2.50.0.727.gbf7dc18ff4-goog

