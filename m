Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC887DF27
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB8A10F121;
	Sun, 17 Mar 2024 18:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="naNp6x9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24610ED0F
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 18:02:24 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d4ad3a80b7so131391fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710698543; x=1711303343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0U0bqOuHsZY1MSSLB1DRocFHCE1lUuGbf1SYaBHlsc=;
 b=naNp6x9Zf4tsZIN0W8MwRW/MgnDEqocBSwfXEgqMbIh0vfzA4R8hXtH40CK9VZh5x3
 O9Wq8cxYMJaC0olccYTeF9GsDsgilA36sYXG31MWNfuL54qqOYunMmerRwcrAIbokT8s
 gjud+OFSxYjk7h+JQNi4sa4nVWylKmiEGxatwsqd9A6xX0J7zq06ujEd9qncFIhWIb45
 DjVPo/TmTw0QVhDwMS3B1c4mLZyCQFvwYVlgnnvDUgLFWlWNuXchx8mEOn5UgSOv9YsX
 aHOktE2elJvuVj9LLDG24tnDkz0Gl60KDpcLq+Odjo4mynZR1LERzCZ8QqpHfMnksmqS
 yNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710698543; x=1711303343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0U0bqOuHsZY1MSSLB1DRocFHCE1lUuGbf1SYaBHlsc=;
 b=asMYN8ei/q3Ss1IFOax++77+/IVR6zFTlsrHjrHKYaTfF74ELjwunl7ssQYuOliwjL
 TEsokFtzyGEkoPZ3I5l/K/JuBN82QK04wVTtuDKI1XrYKxT7ZJZMs9B36ZBZ/TdeLvbu
 VQ5RhlriMGeXLEAC9EhPVwYERZRmXF0AiuYyuuleqJ9NkVaKszMOAvS7cgOjIuZ+eYO5
 pmB+zhy0Ipf3BVs8Wk2WunhotxwHsf77rgaR7WQnxVYEK6zNZxBVZcp0QpoL9pNdooBs
 hgy14w2hGzmB6r2t3vGMtUU0kPNv179sJClSCcE0OSmO/j75+M1ngLcIdrA6Ti9dL02I
 PcLQ==
X-Gm-Message-State: AOJu0YwClSmKsQzpOba72UVxLWcvD/xkTe8vHCjleuSOyMTcBjDMO1NU
 Zmyef0r1rFxgpgWJGMcKSrPTHW1kbCnuWUbIO/0JEOj/ksnsdlMqI5ljs8B0yso=
X-Google-Smtp-Source: AGHT+IFKWfi30rs+Lnu0FKoHSwp11Wo+LNgGZ0T2ypot6QoRPFBI5pxVPIt7vUgidX9y3/VMfk4scA==
X-Received: by 2002:a2e:9c07:0:b0:2d2:eeda:c019 with SMTP id
 s7-20020a2e9c07000000b002d2eedac019mr7086335lji.28.1710698542658; 
 Sun, 17 Mar 2024 11:02:22 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 a27-20020a05651c031b00b002d4aa0bcf1esm122661ljp.5.2024.03.17.11.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:02:22 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rlupx-000000005e0-3eOh; Sun, 17 Mar 2024 19:02:21 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 03/11] drm/armada: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:28 +0100
Message-ID: <599c1e1cf218bb9b9b5fb4f13022d9a507da42ca.1710698387.git.frej.drejhammar@gmail.com>
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
Cc: Russell King <linux@armlinux.org.uk>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/armada/armada_fbdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index d223176912b6..3a7258de323f 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -54,8 +54,9 @@ static int armada_fbdev_create(struct drm_fb_helper *fbh,
 	mode.width = sizes->surface_width;
 	mode.height = sizes->surface_height;
 	mode.pitches[0] = armada_pitch(mode.width, sizes->surface_bpp);
-	mode.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-					sizes->surface_depth);
+	mode.pixel_format = drm_driver_legacy_fb_format(dev,
+							sizes->surface_bpp,
+							sizes->surface_depth);
 
 	size = mode.pitches[0] * mode.height;
 	obj = armada_gem_alloc_private_object(dev, size);
-- 
2.44.0

