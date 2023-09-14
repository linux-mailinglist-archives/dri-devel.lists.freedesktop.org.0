Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533AB7A0C3F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 20:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776C310E2A7;
	Thu, 14 Sep 2023 18:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094B110E2A7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 18:08:46 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-59b5d4a8242so16833467b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 11:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694714926; x=1695319726;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=643G47GETNhqNdCuDURH7WS6HlitohpBl/WopZi3siE=;
 b=JH40VTJYdQb4bgzOWT1XomEjPACJrjpbF/NJ3VukGLQK7C7Y3XJAUbmG6QkSAwpnYF
 EjBt70bzokUtGIPqfPMVAyd2gAL3V6H7Jod+fSrterRIO/CfzgKkQtly9dPJ47slQSOh
 V6Am3iw4xywgETP/hL9pn8CtmICqWi7WuoFQxi0noY9huKpijf3i89Tr72NEhBZiJKE1
 DUUunPbsN6jdZnRMllZCEyeM6wjkDExzP5uNNpywRET6KwU0qnTBnl+gH69hGQFi+DOM
 NeVKvYnOnOQCCfVwPljBoTB/jj6GpIp2KhlUUXbYOdre9D0o7oa8EgnWHw2Ex2w9Fq0V
 QAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694714926; x=1695319726;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=643G47GETNhqNdCuDURH7WS6HlitohpBl/WopZi3siE=;
 b=JXl6t3B5MKI+si5IEOdYc7sADvN6fBx51EWL4xZoRaKzQDLqf/ZGEeyZR+U5PXK3GN
 LgS9sduBLWXu47Ny38lKy9Leu+C0Ix/TM6OnHeKlTqS+7Yecau3exbNKuFEbXlNg9rN/
 rCYnMAtgFdzeAk5AT+9Z8Pvdohuo4m2+Rhno5Gk2wPxCOaDtCWOMXIMAGbMcKE9UdW3P
 BsFoHtZWSOaI3gjpMMumPGYYncNfhV2rczObh1mehk9FuRJRj4wT8r9FdUMXoMh6BpaR
 4+gIEVqti4yjX/qlrAMxw7AhfMD3L9lvVlw+tVppmN9ciriERCZoW/ASn2lEKMDM4qy7
 Vcng==
X-Gm-Message-State: AOJu0YyTdIZ8iVb2WYskdonJ2VO/F4rg6WGVlPG0VvqsUJ8NhI29r0EU
 X/pfCDBnAs2E3OLDBfhrGRV4+gC9D800unRKQQ==
X-Google-Smtp-Source: AGHT+IHNWB0qP5meAQB51iaCUK7XP1sqn9eMFG8FkOmWjyLp7Z/2qgzDTOAe33XQ2hHF6E3jXIVHS2ObMzFQCFbozQ==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:78d6:0:b0:59b:d33b:5ddc with SMTP
 id t205-20020a8178d6000000b0059bd33b5ddcmr133238ywc.4.1694714926173; Thu, 14
 Sep 2023 11:08:46 -0700 (PDT)
Date: Thu, 14 Sep 2023 18:08:44 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACtMA2UC/x2NSwrDMAwFrxK0rsB2Wvq5SinFWGqqRRwjpaYh5
 O5xuxh4s3mzgrEKG9y6FZSrmEy5iT90kN4xD4xCzSG40LurP6LNmlNZkFQqq+FQPm2PP57jRGy
 YMPYnOl9CiuQ8tKei/JLvv3J/bNsOrmjEmXUAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694714925; l=2160;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=/VCD7DX1eCwVY46g4u81ZzjWo56f8DBPp1HX5L6qls8=;
 b=MSSj1xqOuKPodBgV3hCbCUvST05NmhGqT2NoNhh2CgiIOwHCP9o4MvQZLtDioILfwHV7oAWOC
 NasnjoSdir4BVmDVA/kDQPWT/uy8cxs5U1km0orFGKX5eaHoO0od7O3
X-Mailer: b4 0.12.3
Message-ID: <20230914-strncpy-drivers-gpu-drm-drm_modes-c-v1-1-079b532553a3@google.com>
Subject: [PATCH] drm/modes: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
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
Cc: Xu Panda <xu.panda@zte.com.cn>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

A suitable replacement is `strscpy` [2] due to the fact that it guarantees
NUL-termination on the destination buffer and doesn't incur the
performance loss of unnecessarily NUL-padding.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Cc: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
This patch is basically a resend of [1] by Xu but rebased onto mainline.

This patch is also similar to:
commit 0f9aa074c92dd ("drm/modes: Use strscpy() to copy command-line mode name")

[1]: https://lore.kernel.org/all/202212051935289159302@zte.com.cn/
---
 drivers/gpu/drm/drm_modes.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..c702a8b866cf 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2617,8 +2617,7 @@ void drm_mode_convert_to_umode(struct drm_mode_modeinfo *out,
 		break;
 	}
 
-	strncpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
-	out->name[DRM_DISPLAY_MODE_LEN-1] = 0;
+	strscpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
 }
 
 /**
@@ -2659,8 +2658,7 @@ int drm_mode_convert_umode(struct drm_device *dev,
 	 * useful for the kernel->userspace direction anyway.
 	 */
 	out->type = in->type & DRM_MODE_TYPE_ALL;
-	strncpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
-	out->name[DRM_DISPLAY_MODE_LEN-1] = 0;
+	strscpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
 
 	/* Clearing picture aspect ratio bits from out flags,
 	 * as the aspect-ratio information is not stored in

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-gpu-drm-drm_modes-c-a35d782cad01

Best regards,
--
Justin Stitt <justinstitt@google.com>

