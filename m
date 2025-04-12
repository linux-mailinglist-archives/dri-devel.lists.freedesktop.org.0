Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83912A86D46
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 15:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A7310E29C;
	Sat, 12 Apr 2025 13:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GOSPD79z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F5010E29C
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744464061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cK1rC0XjXhIHTt9tiNECT2Vn+CAc7jag5l0SYJ2eGBk=;
 b=GOSPD79z0914hbHFdmjsajBGtBcInwOWUIhpballVunEWeimu/5TovkDiRLS8jlAtj6CvJ
 7jPN/0+kbtmdylK2k/fS0ScLCvx9/UaC3P5/PYnKLkIR4kkOF8jmcoLNvapytOYy8GJGJa
 uMphlS6+ysjmg+GxQARZ6Yxs6GSTGAk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-Irt9lQvUPLescAHEtfi-xg-1; Sat, 12 Apr 2025 09:21:00 -0400
X-MC-Unique: Irt9lQvUPLescAHEtfi-xg-1
X-Mimecast-MFC-AGG-ID: Irt9lQvUPLescAHEtfi-xg_1744464059
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-22410053005so46148155ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 06:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744464059; x=1745068859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cK1rC0XjXhIHTt9tiNECT2Vn+CAc7jag5l0SYJ2eGBk=;
 b=byoeo/Ry04c0zp7f9amCGZtqRejQKLKMOFnFrz7xfGJXeyxGF00BmmAI4i7mcodacI
 0bOTA2rb9RI9Xi29Uh8xI1BlZ35FMaz2WBt7yfvsAaZDhSKzC4uAoebFh/6GqwXFazLd
 L8HyBJWVSb2AIQcZp1w2WAhshT4JgU8In4+XEFXokwmeO80nDUyVlHMkSRKKNevYdNfO
 N0BLNV0BY84Q81j7Uey8K5ZDkA5s6ds18bbVl9tjJqUZLNaQyDMiCQ+6LHTmj/B540Vz
 pDmj3t2vcOp1ZNYhqmIcWSiu/4v7I79egwoVxav4H5an8VvwR/oM2Nz7LS7VDTaXaDKW
 nNFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpkpzg7V+pVUmB13FBQzosP10Yk6weKHbsBpeQqJk5YpWwTQVq27PK1gsDvABh4OgstgiKBEz8uII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtZXs8nYCpHUZiK/1vm4fleGvoZPoDp21vSLN12c7b9GIh02sZ
 aovh0g0K7zj12u3/AGIg7TCSdyFazwuoL2LWVVEonaNQIbbbLHt8sd4KoOLM0Q/RTD6sJ9pzoy5
 rDv89xkgLaFM6SYQSClmRr3NFt574IDhqN/xWI6JSa2U13/ktNGbnP0aMOub86jtDhw==
X-Gm-Gg: ASbGncsSxn+E07NJFzb6HIKKKVl326paQjybNIz3/mDffStEDOfKCm4DzJPJWy7u7w/
 0R3goSX/cp1ViJemwVNxjzkix7IzuH8BZAl5VtTwEknfI+o9ZqEWIgS4ilmgmApAlJVYo0HbUV3
 u9GXiq/5mg00ty+xPnlvKKmMG0ar7t9Nmkz7QlZuPoXdEUURi83JwyyzxPJ5asnSaFSrbZqSzF6
 X0EWRQKAdX5nbU/q54GbE/V9pZwuF815UgFm/hYbIeO+HVqf7yqZtDUroARDoa0guGxDoD/WCbS
 KNExJwcUaZHs
X-Received: by 2002:a17:902:eb8a:b0:21f:6bda:e492 with SMTP id
 d9443c01a7336-22bea4f1acamr104191705ad.35.1744464059527; 
 Sat, 12 Apr 2025 06:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEThxesy3Exij/NdLn+H03RMD7vSClcGR8SiZ0slO7o59/AF4Noe0XODfKIUFyC5GjjM9GJKw==
X-Received: by 2002:a17:902:eb8a:b0:21f:6bda:e492 with SMTP id
 d9443c01a7336-22bea4f1acamr104191255ad.35.1744464059038; 
 Sat, 12 Apr 2025 06:20:59 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b02a0818248sm6466199a12.9.2025.04.12.06.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 06:20:58 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: airlied@redhat.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Support drm_panic with non-vmapped shmem BO
Date: Sat, 12 Apr 2025 22:20:11 +0900
Message-ID: <20250412132012.291837-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H_-lcJxR0IE3099R261p4PW8VxvU4ukxUBZ-9OUtiMo_1744464059
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Pass array of pages of the scanout buffer [1] to shmem BO, allowing
drm_panic to work even if the BO is not vmapped.

[1] https://lore.kernel.org/all/20250407140138.162383-3-jfalempe@redhat.com/

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a6f5a78f436a..2ff57d559c86 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -500,11 +500,19 @@ static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
 
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
 
-	/* Only support mapped shmem bo */
-	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo->base.vaddr)
+	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
 		return -ENODEV;
 
-	iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
+	if (bo->base.vaddr)
+		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
+	else {
+		struct drm_gem_shmem_object *shmem = &bo->base;
+
+		if (!shmem->pages)
+			return -ENODEV;
+		/* map scanout buffer later */
+		sb->pages = shmem->pages;
+	}
 
 	sb->format = plane->state->fb->format;
 	sb->height = plane->state->fb->height;

base-commit: e7bb7d44c3b97aea1f0e354c6499900154ac67f2
-- 
2.49.0

