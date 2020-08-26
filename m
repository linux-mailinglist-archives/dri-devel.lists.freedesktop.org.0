Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C4C253E4B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80636EB26;
	Thu, 27 Aug 2020 06:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAC16E228;
 Wed, 26 Aug 2020 17:00:56 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id q14so2385828ilj.8;
 Wed, 26 Aug 2020 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F84GgHzsN1yeQN6PQRJoTTLm9lE05lKnfqitPnJqWLU=;
 b=e4Vi6MHy6UTLsDMSjkNofHtVcQzUuSjP1UEi4Zl4t/K7FK4wYLGiwebK/NStDprP7I
 odFjBwSqQCKsEVlcnX+yDkG/CENe6HUJJbKAsN/W791aS2qH2UWYswF/4ewLctaolHpV
 CBm8TzzLoKGLF8vkT58wSBPAmXdL2F7T/66f8TVM9Gf3FamqClb7nmLl1NgqcEsVUmHo
 dgabwZx0bB+Gx/t4j2JaxG/c/kX2yzPUPR68YgPP5jd8wvn7WTQR0BV2WhYxSEog3f9l
 QghttGRVagCMEoeemQdkmK0WpfU9s6H6i6hxGmw16LnQM+gcSjIo4/FUoxg6Nb/fe5Ep
 DnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F84GgHzsN1yeQN6PQRJoTTLm9lE05lKnfqitPnJqWLU=;
 b=IZsCJ6tRSgF8vckYtnInz6Mf3Efcl9pzfdbdCQLmnuzZcRPDrwaq4DHW5B8+gt+6tc
 NR3pKtUTF6Qljyk6cbkvFpcXjNCXzRj7ub6mTjTHJEMcgoJrH9ol0nCFvsuvxIV+Jb1/
 /++uY/3WMnCEPqmMvU5zEir3xqkdidJK/XJpULkvWzvJdcacBuaXvuJx0knzGN4B2DtZ
 gtCgpKJ/BxYUSzvglhNGhI3goJdHH7N3FAi/IxhLZ7z3/5yEIHuMzjxFk/8rDUFAXVMb
 6/82wK4QbXA99Ixuw1VnmOO4lOAL8qnva9N19CHsZjKsq785YEhA+A0gx+YE8UxAP6A8
 dIGg==
X-Gm-Message-State: AOAM531kRgCs+uhqlh25OcBxL0yRPruvbX9GpIz/wHRKeV2kSpioNAiF
 r26sU+l/zj69vm+5mfeRXt0=
X-Google-Smtp-Source: ABdhPJym6BLUjQHAO+G1iUIi+hQhRvVbz7JUbJGnpDxNbIAXPZhbdIj6klLQKPC0ZPXyAe01GYF/mw==
X-Received: by 2002:a92:bb8d:: with SMTP id x13mr13758338ilk.243.1598461256033; 
 Wed, 26 Aug 2020 10:00:56 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8203:5970::c4c])
 by smtp.googlemail.com with ESMTPSA id p78sm1479606iod.0.2020.08.26.10.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 10:00:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jbaron@akamai.com
Subject: [PATCH 3/4] i915: add -DDYNAMIC_DEBUG_MODULE to i915/gvt/Makefile
Date: Wed, 26 Aug 2020 11:00:40 -0600
Message-Id: <20200826170041.2497546-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826170041.2497546-1-jim.cromie@gmail.com>
References: <20200826170041.2497546-1-jim.cromie@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This addition to cflags enables dyndbg in the gvt component of the
i915 module, on a CONFIG_DYNAMIC_DEBUG_CORE build.

So here are the message classifications that the gvt driver uses.

   cut -d= -f2 | cut -d\  -f2,3 | \
   perl -ne 'chomp $_ && $h{$_}++; END{print "$_\" \tseen $h{$_}\n" for sort keys %h}'

"gvt: cmd:" 	seen 11
"gvt: core:" 	seen 48
"gvt: dpy:" 	seen 4
"gvt: el:" 	seen 21
"gvt: irq:" 	seen 1
"gvt: mm:" 	seen 6
"gvt: mmio:" 	seen 9
"gvt: render:" 	seen 1
"gvt: sched:" 	seen 15

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/gvt/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784..2c581e910688 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -5,5 +5,6 @@ GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
 	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
 	fb_decoder.o dmabuf.o page_track.o
 
-ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
-i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
+ccflags-y	+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
+ccflags-y	+= -DDYNAMIC_DEBUG_MODULE
+i915-y		+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
