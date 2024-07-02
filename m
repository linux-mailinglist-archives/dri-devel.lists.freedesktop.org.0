Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B609924AC1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1809F10E71C;
	Tue,  2 Jul 2024 21:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hhM3yFaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E3610E716;
 Tue,  2 Jul 2024 21:59:28 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7f3c5af0a04so246308139f.0; 
 Tue, 02 Jul 2024 14:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957567; x=1720562367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh8QJ3ROh21ShBzcCiOPzlcJgoRl8pzdhd6qJVNHlVY=;
 b=hhM3yFaDKvyqFCRUMjDRLrXRf8ck38pezthqRymwJAHgeDiCF9nziyK867489Ypbe+
 80FD2c/kJN0XHA41sqL+QQdD25WFg7V9esVB6s52qKAeg0MJsf5q+eO72awwukYlmrcF
 rhGHnl7mZO8gNEt4vy4K6SRoyGCJqo640HXWknhfE3Kkbl1hD1SZfNDiZaRww9ZT0M03
 2fzR47Sk/tg4V/0Knd2Hj3gGw8Waixc9eT1K/5ctkW7Ih3XzIuptzRzd05CV7C8u/p0J
 D95+w2TPuQKK7j36hizmvAIUfRTc5QG6nft6EvsBG1nXanIekZ4L9+QNivn7Sc1tfRWq
 MY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957567; x=1720562367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh8QJ3ROh21ShBzcCiOPzlcJgoRl8pzdhd6qJVNHlVY=;
 b=WvlVeVFoGtJdXT4HZygasYX79ohXXm9FEs4Yh/iV9/K6Ks4SDUgAXYqgZHuABYsrmW
 1MTnME6sDTTnSiXJvg2fwVZJaIvhaZssWR9owptSRPGeAfFQq22LGUTjGohmwVCg4Dap
 ePlohksi08Ep7HlnCAjs8FmeMD4AaZcP8ALXO5ztUDSBiT79zTPDs2UWstgOLyrLgi7+
 HOeppUrq44aCcKrGMJrjECaA/46KvkeJI116t0+riH50QIJfSQNF7Zleaim4qyxKiAwH
 DllXQosoA288Sy+6u11OEU0VCiPfpAPTJNIKIgrqcopY2vQiKjgpW+ReF971epGoQMeM
 uuuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBkaDUZumsaNrHrLRj1H23LxeUNPOiFzlmV+gRShJdiFhV3B0lG4FiIBZfLhG/rRYD6eJTLfQ/TIYMl1P7ySfOGxVKQWxQP6mTmt2pG2rzr/qPOj3bUgNj2rjaJvMh9m1VzWIiQfz90vgpgAawv9iwor2NbXB8SS/OhJiIvPgXaVgMc1oSDymesqeh4CG877A9q9AVGdobqjzfu18JdMEcho+LBQoaNXEPIe8Gy8V9Bx1nKvA=
X-Gm-Message-State: AOJu0YxjzIfT/ag/OhjpxrZ8uzLOMNMRV3b1FUV4mqgVDJnTPEVojIq5
 60oSX7ihWx+2gRs/LyxXNWLCycSx97s1FdeWH4R0MvmJuCce4iDn
X-Google-Smtp-Source: AGHT+IH3xH7tho2sBM1GSeoWG+NM2MBhz/xyUPt2gcXQi9kj/rdgFoV4pSxxHWVcBZJh0cz14Ndmig==
X-Received: by 2002:a6b:6514:0:b0:7f3:d5d3:3e56 with SMTP id
 ca18e2360f4ac-7f62ee8d268mr1165752739f.17.1719957567640; 
 Tue, 02 Jul 2024 14:59:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 47/53] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Tue,  2 Jul 2024 15:57:53 -0600
Message-ID: <20240702215804.2201271-64-jim.cromie@gmail.com>
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd0af086e7fa..086797c4b82b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -39,6 +39,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.45.2

