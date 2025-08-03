Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEDFB19238
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 06:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E916710E4D7;
	Sun,  3 Aug 2025 03:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NwaMrGZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A514410E4D7;
 Sun,  3 Aug 2025 03:59:56 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3e3f0f29d09so9438325ab.2; 
 Sat, 02 Aug 2025 20:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193596; x=1754798396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ayWtPygJ2HBDiY24yxyRlwrUyqnG3sxcO8anqfHfeE=;
 b=NwaMrGZMddoYWBdra2/DP7JD8uy1falHJ3NIRHv8pzvp6c1N0jlPvO7/weGV9Vragp
 U3E3FAnzmCBcczMm4eNg+Y9+vuJOw3pnL8Tw91U3hg1R22FItW4IzYzLiUlgNWiyWq+n
 S6jxsyShmcXUu3AVlrjV7XglCISIxD9+gr2+4ocvnobp6r0mplTwNbUFzdrb5e45B+fi
 mf9dGC14ba77/t4mI9DBI9jI/Dm/IN+i3iVGWOraPdHBBt0kYHYjrfbBn5vEkMDkoyJr
 4NVBBs44yh3BouVyu9AClWleoc+HqIMOfC1DUBLlFeK62PfW0sTpBfL3lvxl6kvrS8+V
 xQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193596; x=1754798396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ayWtPygJ2HBDiY24yxyRlwrUyqnG3sxcO8anqfHfeE=;
 b=EGR5Lz2uuzr2XP/dF2rFdjQ2yfyRcTdOkpb7ussyFsTUOWxySkcleQha+5MloKIu7B
 OyzaXb/v6kWmOmZHErHWdMKj2yiHS+eTTWO+i/3B5hLb/AhGkhfa4yuY48mEcSpvGcVX
 L6sCK6PL6PxTdA704sex7BjWtqS9hTWEAbuzTbgPn1+fbNICHKdg+h8MxA+P/TpmSZPP
 ijEr9k0L9MDhJrE4JgEx9zF117vCsARCeihTyGnB1xHp+W4Tp9Z/uOrugOUJ7LmUpI8g
 eHJTuaUpBne1Zg7XiA7kBWFngA6WV7Y5goefSDOo30zdfCdOndZl+WSKO/Di+6KuOhIk
 Sheg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo9k4ijcFgmobSqLUoM7XCYgNFsrsnOZyufe18hRtvLaI+QqFHGse9nZSSbvJ8H+9Qs75+bmhiLvZW9bl5bQ==@lists.freedesktop.org,
 AJvYcCUqDltDmajz5ieUrdBwprSwcUVj9Y7oBkVY0TZGfzOYmDhwJU2vOS96n5z8iwjGpE+0W/5va/ul@lists.freedesktop.org,
 AJvYcCXGMbQ9T4ev2D+WqZVflO4t0WqL5MCfxqb5yUPX6w4Ly+GV4aW3gPebAYihAYwA0bwD0dHxGbxwFgw7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbbyscI1i+5B4ZitoOyp24xJImeupL3kw3baEkif1U5K35mN7T
 L5aIERPRNjArKsB8vACtcnPJ9N770GEZvJSUovT6vyu4JOe6y5p5xoNY
X-Gm-Gg: ASbGncvZIivhStFsmPDEfUukVSl5w7EcwZkwC5Q4vU1WgMs2co6DTs2AScxZrF1APX7
 0K/x34caL1Z5mE+JPhEkhLnPYKNgLMMXLKIBqFJ9n48aJOyGJ6DODbM+PGoXK07X2C3nmevNwpx
 kd07kBkXky7EuHcSllvxu1b8hJpmrd6ucpS8w2d7LWO9/XFRIW3s18Zc3RQ90cuA/euSGe7a0bX
 7eK++Xk2GuFXzgid0R/2anH1OevBDjenVW0h7o3P6DSQGaXtYsru0/EdwmSu0JS93zlpylCEXDa
 MYW72DHwHhyrPQ/BtbiWx4L3mprFiNV9rnRgTWP7P9RBwhXfqzhVw9jV7kRn+yPuubcmo8r7DcI
 1Cdfpown8x6ovIvBqXNeV3fjoMIlkZzsTwZ0crZNfztfC9oAqgy8GTjo0XkTpyQmvIsOwXYwjPq
 Pmo3KPNDlFLyZZ
X-Google-Smtp-Source: AGHT+IE//iz8Ix/2Qpq304M23ozJJJm9YUKRCP4zX/GxkzB5VUsrG11JTXPFJK78GVVmx4p1MZOr2A==
X-Received: by 2002:a05:6e02:3093:b0:3e4:6d6:b436 with SMTP id
 e9e14a558f8ab-3e41618be54mr108220825ab.12.1754193595853; 
 Sat, 02 Aug 2025 20:59:55 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com,
 kernel test robot <lkp@intel.com>, Min Ma <min.ma@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 57/58] amdxdna: add -DDYNAMIC_DEBUG_MODULE to cflags - RFC
Date: Sat,  2 Aug 2025 21:58:15 -0600
Message-ID: <20250803035816.603405-58-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

with DRM_USE_DYNAMIC_DEBUG=y now un-BROKEN

for configs like:

  CONFIG_DRM_USE_DYNAMIC_DEBUG=y
  # CONFIG_DYNAMIC_DEBUG is not set
  CONFIG_DYNAMIC_DEBUG_CORE=y

this module gets macro breakage:

                 from ../drivers/accel/amdxdna/aie2_ctx.c:8:
../drivers/accel/amdxdna/aie2_ctx.c: In function ‘aie2_hwctx_restart’:
../include/drm/drm_print.h:578:9: error: implicit declaration of function ‘_dynamic_func_call_cls’ [-Wimplicit-function-declaration]
  578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
      |         ^~~~~~~~~~~~~~~~~~~~~~
../include/drm/drm_print.h:663:9: note: in expansion of macro ‘drm_dev_dbg’
  663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~
../include/drm/drm_print.h:681:33: note: in expansion of macro ‘drm_dbg_driver’
  681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
      |                                 ^~~~~~~~~~~~~~
../drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro ‘drm_dbg’
   15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
      |                                         ^~~~~~~
../drivers/accel/amdxdna/aie2_ctx.c:76:17: note: in expansion of macro ‘XDNA_DBG’
   76 |                 XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
      |                 ^~~~~~~~

These sources include drm_print.h, which includes dynamic_debug.h and
then checks DRM_USE_DYNAMIC_DEBUG, to decide if drm_dbg() rides on
dynamic-debug underneath.

DRM_USE_DYNAMIC_DEBUG is possible with DYNAMIC_DEBUG_CORE alone, but
dynamic_debug.h also requires DYNAMIC_DEBUG_MODULE before defining
those macros above.

drm/Makefile adds this to cflags on behalf of all drivers, do so for
this driver.  TBC: do subdir-cflags in drivers/accel/Makefile instead,
for all accel/* modules.

RFC: Maybe decouple from DRM, at least the DRM_USE_DYNAMIC_DEBUG
itself (ie just CONFIG_DYNAMIC_DEBUG_CORE).  Its not obvious that
XDNA_DBG should be categorized with DRM_UT_DRIVER by default.

Do we need a new DRM_UT_ACCEL category ?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508012015.2l89ZOLg-lkp@intel.com/
CC: Jason Baron <jbaron@akamai.com>
CC: Min Ma <min.ma@amd.com>
CC: Lizhi Hou <lizhi.hou@amd.com>
CC: Oded Gabbay <ogabbay@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/amdxdna/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index 0e9adf6890a01..800f81f5a7023 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DDYNAMIC_DEBUG_MODULE
+
 amdxdna-y := \
 	aie2_ctx.o \
 	aie2_error.o \
-- 
2.50.1

