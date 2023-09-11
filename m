Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6260679AC76
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7110E39B;
	Mon, 11 Sep 2023 23:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06D610E390;
 Mon, 11 Sep 2023 23:09:09 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-79329a8f78bso175817339f.3; 
 Mon, 11 Sep 2023 16:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473749; x=1695078549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPgMplOaghCKoaw6KVIn3I1GwgTSwBS4ON0Ej0Rg2ww=;
 b=jL5AmCVgqgFL5uoWx2vLZMpz0hhw7q0hHLd2je7nu3FoKJ/bA70OJXmGyWP0ZjL0gj
 XbvD1f/psWUHXbxRtPSwiEmnmYOIdcuZ8Y1BVhcDDHA8LssWN08pTsBva/454zcJ3EGs
 jWak+0wD+eLeXF+/UJxK0mt+L54c23oXfBHAB461OtqsprIePzUv1SmT7PQjLIXXEBqB
 QILthwOkC6meNmbv9MrYkw6heLNhoifF9J+GcakSk44zaX5FAvoKUGGkdxoDTC1UZaV2
 6w7DahTPIo84NnuVkD+g85N5ArJAeaDPR7B+qSEn49FguXArLMj9deiwBb0Sep6tsTJg
 ftAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473749; x=1695078549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPgMplOaghCKoaw6KVIn3I1GwgTSwBS4ON0Ej0Rg2ww=;
 b=oD6menbiPCrLKAIs3+C4w8ZxuZYbtNvg3bKWIIPZzFDm+UzykvG1NAW1pi2Ra/JOBR
 6e2qPWcR3fk99Trm1rqRJ6Ie+8RZcXQ1QUD9UZMkgOH5ZcywTls0rqpajJMIzEIEqZu6
 uHqiBKIXLl0plwStl90NQrhS2rKqTXS8IL0FSkun6q8Yedmz2YhKvNwWEFos0BkCskaX
 BroE/kVws2I7i2D58MXi7caCiYANuiR8pXrq7d6iEIs1siXpRJMC7CqdFTzLrozp7gWz
 fbJRO/lAzw0hUOm7vn4llk2bC9tvcInLh6jhJ2oAJ3nxaVFwpigXak/ymlqDXw5MiugX
 Wmmg==
X-Gm-Message-State: AOJu0Ywo36rK+teqHXOmof5JaMoYO9f36IC463nIkKYh95Tf8TsC7/rX
 EiEi+liBOOvfyilaBbyR9hE=
X-Google-Smtp-Source: AGHT+IHX0TSt+caD80mtO3zdFhx13hIWLdOMsQp29S6Hbbwm3vaZvIW2jLmwTNt0GjAv/TclECpUsQ==
X-Received: by 2002:a05:6602:2776:b0:790:9f0c:3069 with SMTP id
 l22-20020a056602277600b007909f0c3069mr13263726ioe.9.1694473749038; 
 Mon, 11 Sep 2023 16:09:09 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:09:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 21/22] drm: use correct ccflags-y spelling
Date: Mon, 11 Sep 2023 17:08:37 -0600
Message-ID: <20230911230838.14461-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_DYNAMIC_DEBUG=n

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 7a09a89b493b..013cde886326 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.41.0

