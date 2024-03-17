Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB487DF2E
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA2D10E7B0;
	Sun, 17 Mar 2024 18:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hjievgPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7645410E05C;
 Sun, 17 Mar 2024 18:13:15 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso50139391fa.2; 
 Sun, 17 Mar 2024 11:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710699193; x=1711303993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7LVNnL6i6/3zn/gRTdfjK6M4GpqWD7xH2ioIyRg274=;
 b=hjievgPDh+QDYp3ndkbDS7zIT3qtdYmnf+hBtMsn/x81Rh1fUjTcap4Osx8ZHPfR1G
 6Nh9cxFZWk4rWgxXhdESYtIbhJhjRzOeHjoJ8j3c/ArY4E/x5llM/reb6dvivFYpH71T
 GyUZpI83uHA0A3KRABwYq6ZzdV6bihS6wHCa4AEQq8r4rCB+LgbeHrTx6o7b6NU9ep3x
 Uq7babU1BDLPlXO6DrHfA5AWUE7UWy+zxbmAmqGILkE+Pgv0PDWSHEPUM91OKrL4O3Ik
 CW28a01qubv2ejgWOabvyoeOobgyVshWY7pVRbP038FEZs+UefllHXqZQas6I6vs2Nn3
 93zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710699193; x=1711303993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7LVNnL6i6/3zn/gRTdfjK6M4GpqWD7xH2ioIyRg274=;
 b=iNyK5v2doSrvZhMo0y5wPXMfF7ifEMd1R5W0bbvDB2n7zM/T/AUSVkTTg9mMQoUmr7
 cAp1lMgMV3pSI9SCQSqmyLjhlQ0E68e6EIvxshYKHRneuCC1usYzaE04o2Be3F2VP52K
 gISouy4bfsByCQETDg5i8Ivc58GQEPIc+0lElsigZABxosaJVPSVPz3y/Z+0zAU+XATx
 OzAsabmL+KMgSsFwUG5HkdrJa2RbpXBoUB4KJGhBsq+S305zc5nTE9V+3qCZcEpflBNz
 1Pbw3yW/o5htQ9Lqxv3ff9EK1ToC40EiRHXgfy9GEDP1lQyBw2bFqeaTK/vdk2jS48bG
 tB/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkyK8L8KWNLu+tjlOci8jPsYMlAPZyKlVA6MGs/j13cGRt7UwQimZFBnloKbZEvh06LVgQwq1AwADlrgaLOo1ZQXisn8rBSThgE7xoubmPGh4ITy3dXcygwQKl6sLNl9UKA9xthDpT9652L0k2o34=
X-Gm-Message-State: AOJu0YzNHj1T8q6eIla8d1Lx6ZFwuwhY8+5xlOrhd4GcXTjGi+rmT1Vj
 cdCZlR00BOk0dVUrxtWuqC6FdRMWQABRnaxbcgGFgSGV3G1EBbFRpoB9cSbH1WE=
X-Google-Smtp-Source: AGHT+IF8ZFmPuBWIBYTBZW1A2otV1Uh+/U/dVprtMvmGl6rLftI8HvoNZDUqnnwopuBBdtqeX/oM5w==
X-Received: by 2002:a2e:3517:0:b0:2d2:ba5a:68d0 with SMTP id
 z23-20020a2e3517000000b002d2ba5a68d0mr6061404ljz.33.1710699193353; 
 Sun, 17 Mar 2024 11:13:13 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm1225398lje.64.2024.03.17.11.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:13:13 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rluq8-000000005e0-1qAX; Sun, 17 Mar 2024 19:02:32 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 11/11] drm/xe: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:36 +0100
Message-ID: <261e48bfe34de3612ccaa1dc91ebdfd540635c24.1710698387.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710698386.git.frej.drejhammar@gmail.com>
References: <cover.1710698386.git.frej.drejhammar@gmail.com>
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

Switch to using drm_driver_legacy_fb_format() instead of
drm_mode_legacy_fb_format() to use the same logic as for the
DRM_IOCTL_MODE_ADDFB ioctl when selecting a framebuffer format.

Signed-off-by: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 51ae3561fd0d..5bf0841a9f27 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -32,8 +32,9 @@ struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 
 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
 				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
+	mode_cmd.pixel_format = drm_driver_legacy_fb_format(dev,
+							    sizes->surface_bpp,
+							    sizes->surface_depth);
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = PAGE_ALIGN(size);
-- 
2.44.0

