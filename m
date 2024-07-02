Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FFE924A99
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BC910E6F6;
	Tue,  2 Jul 2024 21:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e4vMBbuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D1D10E6F2;
 Tue,  2 Jul 2024 21:59:09 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7f6309e9f29so165198739f.0; 
 Tue, 02 Jul 2024 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957548; x=1720562348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5Ysg7vbItKfqIGM0QbE+cddDiZC+jdjQozEcgbAHb0=;
 b=e4vMBbukOfCAFaNdmH14FLJgCiDtiWikGZWViQs7BHrK9UWsfZ7eXes4Qq8JTe7Y+p
 xA+cihF4FTjR71naUyRB/7Kzkxm3EJQAmKYXo4ByPR0ndXie+68+KUjXFLfv3OEmhp4X
 9rAiNkW6de4jLbYqkOH+iNHM5rgEbTnBzXDcYnVpAnO4heZqiAiMqrjuhuA6nHkcKQNV
 +kpaC8bUS9jgGhO4XhK5lTOm30jE9Ymp2+YVOGwy+7TOSFAAjVz8ZbbLqviQzHrBviF/
 /RsQcuLPfeWYPTRmrr+ECG1NBx5VK1VC0JdLE3uZBZyNgBt96/o1zhF8VDhDluifrDB4
 OHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957548; x=1720562348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5Ysg7vbItKfqIGM0QbE+cddDiZC+jdjQozEcgbAHb0=;
 b=agfigFsZgkQwHt6f3o+W1CQ//UkEllUspdNtJv+oYLMRBPxlN6RF6aZ1b8TJ1z+r2e
 19ZE0Ztnfx6XrQnXJN/j1ukUJ5T3NwhMmt9H5hmZYZLLWBXJQIqvCjhaTDV10DqCUxVU
 gfg3SibG7WXOJwXKSuQusq3DG2tjJoSP2k0A/SkPIOXKUTPnKaykihSBfixZKm/KScr7
 RA9ctWl0azUu5LNVsdVj0EM++DirQqPjdY4ZmBhQSKwUsMLZ7F7Z+tDcSDiTUM2y6U17
 WUJ+F+ruZ/j/CZn4M2atvhP1r7ftCl4WTQgLJjJr77toPON/eFSLgD2dFV9GscIBS+5j
 NasA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE+NAU0v52W+IUmEkaVRv7Q/kFcMoPcDIl+ml3zlrc3y7Cw5h6ZLwrztOyzqE94T5L7xmSMPITt0Aw6eeYXksGwiiA10ZHZMcdAkf4f1XZUMLCXfdt22KfqfVGzswbz2XNJthM4fqZ5C36C/DtIhra3HgCNWeQS4+4HruOtYT/e7pU3V/90Sz0qsBlfrx3I3+mlntJq6wjBI/4Ft0xWLX7oM2bRtIiWZh4YqpMrO6Cj525STE=
X-Gm-Message-State: AOJu0YxlCApclDxpHHhqk6hA81uc2Z1PuOfDn+oqO8qkSeDnYWsHR7LM
 NPldhsemQE5W5WvoPJWrJyCXThH16wrxArO44NltWCoIRxPtsoD5
X-Google-Smtp-Source: AGHT+IH8RzFKMibwRzTDXrCwMOD3IZhdcfxbN1Z946i9yurhqf82jrI7DF+TQJhSdQTj+9beODn4AQ==
X-Received: by 2002:a5e:de4c:0:b0:7f6:20dd:7117 with SMTP id
 ca18e2360f4ac-7f62ed4675fmr1103968039f.0.1719957548243; 
 Tue, 02 Jul 2024 14:59:08 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 39/52] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Tue,  2 Jul 2024 15:57:36 -0600
Message-ID: <20240702215804.2201271-47-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 9539aa28937f..bb3a3e042264 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -44,6 +44,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.45.2

