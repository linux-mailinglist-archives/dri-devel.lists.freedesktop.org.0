Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369C9C7D47
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 22:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426C810E287;
	Wed, 13 Nov 2024 21:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SXgRvT9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59E410E287
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 21:03:51 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c932b47552so3569a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 13:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731531830; x=1732136630;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lOCUc/yJUoL2hpg7TdUrHhUe2R4Jfk9THcrUWgwfKEw=;
 b=SXgRvT9r/6rvijf5V8t3xLyLifMoIUPPWppu+91Ho1HdA0vlfewwpRQ7NBQZMpnFTc
 90/9NZH4OuPK2jLWTYnraemRLmsPi4C1SoXth2JJkIwPff9VzheEwhYoSpRVIf8+r1rM
 3JyGCRlpIeJeoeOcqLUiIrpotGHwgCXFrwJaFmBP8ZLGi54szEwEFrnwSanmVgOuH5kR
 0AQzmfckPwxcA3NdE4XFgdf3mV4DvFOUIaLa8yi5ZY26k/E3/Eni1ANKzHkB/LmvG5/E
 iE4wa0kThZrR6xcJxvjihHnY9FfeB+5HPWs/VF8cGl+skdWFZtzHGkH3tk6yCytEchH+
 GL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731531830; x=1732136630;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lOCUc/yJUoL2hpg7TdUrHhUe2R4Jfk9THcrUWgwfKEw=;
 b=iLPKiCQA78vVja3XuleYcfIkogNU98czxq+bQMURr7Y7uzctfFvnW8t8E0AEs4H+YQ
 R5/wAChjVYdSZgF3EhGFoMUO0NCUH4gw+8ywJtiaPGIjIVk9C3CFGRsYcQySILyBScT1
 boGM8TUsefTQ64XCAnb+4Jw8yYfuhtiURn7C8dlZUzRzmk9yJ3qxonLxl6nAEo6U48ny
 GRbMFE48zmX1WXXtRKxCUvRrgpMoYR49WorvbeXzljfklSqa12XKd+cbohjzrdHiwDhp
 ZwtpWL6FbB1ZHOBrEWXqHcuk43dgcNrMn9e1CeFWeec45RuFgO2JNeEqkryzH+XQo/a5
 uD6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTv6b3aUq8twhUad4oiyWN3OaYls0g4sHFHuf97bJ6RY3Pw2cbG+aM1KR3erVy5SYrFYpwlSxiwRY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOxcTW8rPL1furGz9vC4bdjsKSHEphh6cvT9wkM0YO9M/tzAZt
 2XeA23re+z4LoB+e1oulrgYCEpHhPyQTpCQVl40vUPvI7VVA3oZjlw3gWbcZlw==
X-Gm-Gg: ASbGnct8+FrgKbGCbC0baLuG++F6DvgWNtGDBm/c8KROYAPs5tX8X7m66z+mxakoqX0
 n+6GN+eoPMzMiYvHti7nqafXc6Hz2PnEzpU4iilNyxtLzS8xIO7thmP3WRslUHdwqjRKj10UpzC
 kjPc+DTLzTvs13PZOJxv+acM32TAA53LL68ej0nzEQz2IUrmYqQ6bo/9fha51KAzQFXH6O2Pp7J
 ZEU/wlqnJ23RtlMlWmhMpQTW9yr1vJnqeJoNw==
X-Google-Smtp-Source: AGHT+IG1zVNACjIiwuT159tiQbcacfdUCCAM6NVeqCGU2Yzh1607/zU+bDBumeceKweprv/UyAwMdA==
X-Received: by 2002:a05:6402:1a52:b0:5ca:18ba:4a79 with SMTP id
 4fb4d7f45d1cf-5cf762fa6b0mr66520a12.7.1731531829738; 
 Wed, 13 Nov 2024 13:03:49 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:69d0:c862:d7b:9232])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ea3cbsm19603805f8f.74.2024.11.13.13.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 13:03:49 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Wed, 13 Nov 2024 22:03:39 +0100
Subject: [PATCH] drm/panthor: Fix memory leak in panthor_ioctl_group_create()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-panthor-fix-gcq-bailout-v1-1-654307254d68@google.com>
X-B4-Tracking: v=1; b=H4sIACoUNWcC/x2MWwqAIBAArxL73ULaA+oq0YfppguhpRVBdPekz
 4GZeSBRZEowFA9Eujhx8BlEWYB2yltCNplBVrIRQtS4KX+4EHHhG63ecVa8hvNAaXql667tKzK
 Q6y1SVv7zOL3vByy90QVpAAAA
X-Change-ID: 20241113-panthor-fix-gcq-bailout-2d9ac36590ed
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mary Guillemard <mary.guillemard@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731531825; l=2836;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Heiust2lk2TQ7+75yP27aiVUP7Gcr7UNHszJsH/pVxA=;
 b=lzcwlYsBE4dnEtS4J1h0Wf/4iptqrd0IEJ14sGcSTgw5cyU8TenlSxFixHMkQZuQfYbk44Svk
 UYn5uJdkAWYB0zXWRUPHrMruK1IPz0rykyF1bF7/DSCL/HkIw9Syr6Y
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
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

When bailing out due to group_priority_permit() failure, the queue_args
need to be freed. Fix it by rearranging the function to use the
goto-on-error pattern, such that the success case flows straight without
indentation while error cases jump forward to cleanup.

Cc: stable@vger.kernel.org
Fixes: 5f7762042f8a ("drm/panthor: Restrict high priorities on group_create")
Signed-off-by: Jann Horn <jannh@google.com>
---
testcase:
```
#include <err.h>
#include <fcntl.h>
#include <stddef.h>
#include <sys/ioctl.h>
#include <drm/panthor_drm.h>

#define SYSCHK(x) ({          \
  typeof(x) __res = (x);      \
  if (__res == (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

#define GPU_PATH "/dev/dri/by-path/platform-fb000000.gpu-card"

int main(void) {
  int fd = SYSCHK(open(GPU_PATH, O_RDWR));

  while (1) {
    struct drm_panthor_queue_create qc[16] = {};
    struct drm_panthor_group_create gc = {
      .queues = {
        .stride = sizeof(struct drm_panthor_queue_create),
        .count = 16,
        .array = (unsigned long)qc
      },
      .priority = PANTHOR_GROUP_PRIORITY_HIGH+1/*invalid*/
    };
    ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_CREATE, &gc);
  }
}
```

I have tested that without this patch, after running the testcase for a
few seconds and then manually killing it, 2G of RAM in kmalloc-128 have
been leaked. With the patch applied, the memory leak is gone.

(By the way, get_maintainer.pl suggests that I also send this patch to
the general DRM maintainers and the DRM-misc maintainers; looking at
MAINTAINERS, it looks like it is normal that the general DRM maintainers
are listed for everything under drivers/gpu/, but DRM-misc has exclusion
rules for a bunch of drivers but not panthor. I don't know if that is
intentional.)
---
 drivers/gpu/drm/panthor/panthor_drv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index c520f156e2d73f7e735f8bf2d6d8e8efacec9362..815c23cff25f305d884e8e3e263fa22888f7d5ce 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1032,14 +1032,15 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
 
 	ret = group_priority_permit(file, args->priority);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = panthor_group_create(pfile, args, queue_args);
-	if (ret >= 0) {
-		args->group_handle = ret;
-		ret = 0;
-	}
+	if (ret < 0)
+		goto out;
+	args->group_handle = ret;
+	ret = 0;
 
+out:
 	kvfree(queue_args);
 	return ret;
 }

---
base-commit: 9f8e716d46c68112484a23d1742d9ec725e082fc
change-id: 20241113-panthor-fix-gcq-bailout-2d9ac36590ed

-- 
Jann Horn <jannh@google.com>

