Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D397924AA0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D51110E6F0;
	Tue,  2 Jul 2024 21:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FCyej4L6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA1D10E6FA;
 Tue,  2 Jul 2024 21:59:12 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7f624e70870so253616339f.3; 
 Tue, 02 Jul 2024 14:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957551; x=1720562351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5Ysg7vbItKfqIGM0QbE+cddDiZC+jdjQozEcgbAHb0=;
 b=FCyej4L6ta/oo6werL9wLcOutR016UDslXVsUs0AnE7PWM4oA5nQzUluBA570mypFa
 gTXhwdJCaEwDAxoCvxca7Qrj5kwU3J1e9wHjDAOd3yX53Kia6FHMt9pT1RKvPNiz00Re
 zIoicSHw3MjHYRxZf+glrJiR1YPHiFyYgQ7lpRhkfEcEpBBSqQ+li1q09DeUrj/+mBTa
 IBRqycWI/DW3OcWZDv038UXxC29eMxkYA3GTVGz3FffqA/za8aCFw5PGfQWY8qWV8FJm
 GtxdZ4JJy9fg4aZl/1TpOiR00VGIwRdAr8hewyvFhO/wl+rkPGFu0yiOhYXPzxk61pZS
 R24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957551; x=1720562351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5Ysg7vbItKfqIGM0QbE+cddDiZC+jdjQozEcgbAHb0=;
 b=rfJVGQ2lev3mVxDafULMt5dqAN4wKBss1CtfCVvFhQ+u5SULrZFyYJ8+h4bMqCzFFP
 NPhi9eFSDAtnR66FK+cwMqbHLsMPkTFRkWo+8XDxg73TP1+1Nv2nPrtet+s1CBf/uM3r
 34lI9NNe6vUa1hM9KdHq0w0/OmgwgyPB9PSBpn9wCOvX7HJCeqvOSAPlc9kg/IcD3XUn
 UNJJm19mMj9xxmWCDiX8Z18N7xTUqzvPTKihaw2weKEVDNnb3wszkouBU9IobKYwHg0b
 a95NvnkBaCbMxLgDCqzbnbO221Wk0KZix/IpJknvafwsusYVed6GeoBg/cqsbwX/R+RX
 PpQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjTFlNOhBBhHcXjaBQMc6wbCxZAySmJVzQG2UlI9JWdgUbqopogub9QheNj18mQsEK5Fb+QcFxa5qVnI7i3GFY1iKh71b8dLX2iTAzKr08R2YAI8iW2E6rk+6hASYnw0hXDAdpP0gQ4dmZ2HejxOuA1ZPxOS2J41R6VivNC6LKOgezHX6Hsxd1tgnoUX7kJzb+nkLpeuuoa+ccjR7WrRo7qMk0dlgo7nc42BvBSsz5PLbE8Jk=
X-Gm-Message-State: AOJu0YwyUZvA16np1wOKu6j8affhot7TYcVCOsMTBOI5A/+Uln94fjY7
 FCTQ7FI5Hx16SsjZfH7scvmyNxZatDNHdpKPMKWhkgNdB3fFrtRc
X-Google-Smtp-Source: AGHT+IHqMpLCRs5CaWnYQ1hnUZnwKhYGHnh3SZ6WBUA2X+aJ/huxMzEjPlMSt2OgDoaqgK5zAZJzPA==
X-Received: by 2002:a5e:c812:0:b0:7f3:d7cb:8464 with SMTP id
 ca18e2360f4ac-7f62ee559c4mr1048046639f.10.1719957551288; 
 Tue, 02 Jul 2024 14:59:11 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 40/53] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Tue,  2 Jul 2024 15:57:39 -0600
Message-ID: <20240702215804.2201271-50-jim.cromie@gmail.com>
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

