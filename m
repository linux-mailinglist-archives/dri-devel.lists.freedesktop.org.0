Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830DB8C91DE
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 20:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB1510E168;
	Sat, 18 May 2024 18:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KPYiKJoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0510E168;
 Sat, 18 May 2024 18:29:26 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1eeb1a4c10aso39784225ad.3; 
 Sat, 18 May 2024 11:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716056966; x=1716661766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=JiRUq85Ly6zqWge3zqGsIH/ckCQ3+fLPP5hj7FWXBBU=;
 b=KPYiKJoDZHzYZ14Vi1ymLuv4UOrkZkug8mKNPM1FgBAXiNwcrgDJyblxWH7qUhcCHe
 Fbz9QlITiWoNtAuxQvrKf35P/A8X4O4TD1l8wBTnFv+VrMfynv/m5VDr1R7rl3WqzX/c
 MYgJeDJmy6a2gw6KS4zkNPPqFsFqYj0N2Jsdo7zV4lBvmoWYVOhCaSPdK8J/oaqFioMj
 lc57E9YXkq/6wIxIXRBw+3pPDeDQkCfuMhOr6QYXWt4D+e7Rn8ILsPZFhnqRJUx6eCLO
 a5Ee2sGie37+vDhUPMPEyh0pnDRG1q6jeziuC8S79H9F2y9vW+0vvqv5rOfwQjh1W//T
 nR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716056966; x=1716661766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JiRUq85Ly6zqWge3zqGsIH/ckCQ3+fLPP5hj7FWXBBU=;
 b=eLp4wc6iJsotWZbpx1d7UaYh7ZdiFoQhQxqZAf+CgRhTiAqKVhXUtdfH+wbl+oBk58
 b3+NYtywWn78ndP/cGcNxCdxgnPg7ZiZChjXZRvD3KpkbiIjiq0jt5PQrbbrquzxHLNh
 nF2dLpM95Pff2Tsb/cEgvmHt3gCpzhd64zVVPTPWEnejjlVNYhsOibO2cUyjB5lSL3uZ
 7jUfohU8KT0sBdWbPCOaHuyc68A4kH3HTrA4btgMlOLuDYkCISWLgyTUNDh7s3EP2Xnn
 WMs9gYRuJncjn6KCdJGp0VUSyoMXGvrCmFPEfrrlxZ3bhPQHpSXCMsgJZMTzaROuz/hd
 uuZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6u3ZNm7dfLkcLHvR52tpq+vH6aVTuXv8uyCTg5oMQfbUVYt6uOwwCjHW9qgQ6IA37May8Sj6AbmaXUzzTAHnn8KpnUJrj3Z+jZpTVCEp/r0zFMidmzdtalf1f22/UiBbquyp4XSWKdfby61ktcw==
X-Gm-Message-State: AOJu0YzQLlO7wc2lkhi2mjWUPA9z8FQpfniVDImSXX9IjGi2MMf/qsXz
 3J5jIofcH39BR6u+G9+R3li/ae0a79by+XwIJFlISMJ5tCbIj6UA
X-Google-Smtp-Source: AGHT+IHrchQFBqcCRziDIkRqhjVokcfHXnTHGOpiDCIh9oIqWZpJHQZ6+lBwn2M5/178hOdM1GGESw==
X-Received: by 2002:a17:902:fc45:b0:1eb:1d30:64b5 with SMTP id
 d9443c01a7336-1ef43d170ddmr319568685ad.19.1716056966303; 
 Sat, 18 May 2024 11:29:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bad61c7sm176922435ad.68.2024.05.18.11.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 11:29:25 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: David Airlie <airlied@gmail.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
Date: Sat, 18 May 2024 11:29:23 -0700
Message-Id: <20240518182923.1217111-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
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

Trying to build parisc:allmodconfig with gcc 12.x or later results
in the following build error.

drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_mthd':
drivers/gpu/drm/nouveau/nvif/object.c:161:9: error:
	'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]
  161 |         memcpy(data, args->mthd.data, size);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_ctor':
drivers/gpu/drm/nouveau/nvif/object.c:298:17: error:
	'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]
  298 |                 memcpy(data, args->new.data, size);

gcc assumes that 'sizeof(*args) + size' can overflow, which would result
in the problem.

The problem is not new, only it is now no longer a warning but an error
since W=1 has been enabled for the drm subsystem and since Werror is
enabled for test builds.

Rearrange arithmetic and use check_add_overflow() for validating the
allocation size to avoid the overflow.

Fixes: a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Use check_add_overflow() to calculate the allocation size and to check
    for overflows.

 drivers/gpu/drm/nouveau/nvif/object.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 4d1aaee8fe15..89a812f812af 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -142,11 +142,15 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
 		struct nvif_ioctl_v0 ioctl;
 		struct nvif_ioctl_mthd_v0 mthd;
 	} *args;
+	u32 args_size;
 	u8 stack[128];
 	int ret;
 
-	if (sizeof(*args) + size > sizeof(stack)) {
-		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
+	if (check_add_overflow(sizeof(*args), size, &args_size))
+		return -ENOMEM;
+
+	if (args_size > sizeof(stack)) {
+		if (!(args = kmalloc(args_size, GFP_KERNEL)))
 			return -ENOMEM;
 	} else {
 		args = (void *)stack;
@@ -157,7 +161,7 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
 	args->mthd.method = mthd;
 
 	memcpy(args->mthd.data, data, size);
-	ret = nvif_object_ioctl(object, args, sizeof(*args) + size, NULL);
+	ret = nvif_object_ioctl(object, args, args_size, NULL);
 	memcpy(data, args->mthd.data, size);
 	if (args != (void *)stack)
 		kfree(args);
@@ -276,7 +280,14 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
 	object->map.size = 0;
 
 	if (parent) {
-		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL))) {
+		u32 args_size;
+
+		if (check_add_overflow(sizeof(*args), size, &args_size)) {
+			nvif_object_dtor(object);
+			return -ENOMEM;
+		}
+
+		if (!(args = kmalloc(args_size, GFP_KERNEL))) {
 			nvif_object_dtor(object);
 			return -ENOMEM;
 		}
@@ -293,8 +304,7 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
 		args->new.oclass = oclass;
 
 		memcpy(args->new.data, data, size);
-		ret = nvif_object_ioctl(parent, args, sizeof(*args) + size,
-					&object->priv);
+		ret = nvif_object_ioctl(parent, args, args_size, &object->priv);
 		memcpy(data, args->new.data, size);
 		kfree(args);
 		if (ret == 0)
-- 
2.39.2

