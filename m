Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F862645D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9193510E8B0;
	Fri, 11 Nov 2022 22:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0574F10E1D8;
 Fri, 11 Nov 2022 22:17:26 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id p141so4535080iod.6;
 Fri, 11 Nov 2022 14:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pAqo2IY9qcxeeqd6VBniHfWVzxC9WIKztprXocMtHOo=;
 b=IHrxVqRzdOVlFgCJjcAHP7xGi6G+KpW9xsG8h0U1Eck/d76md+hJkTMGmQPz2h2Cm5
 0LG8PJmGr0zHtZJkP2Ru3CasZbedM7LDLdU2jm6+058/wEuiTf6vkifSJ7b54BSDUG+F
 8YpXArxd6M5DPYS+dvHgRKQciCwA+NrtuLzfmoI74XiBOUbhvg+y3bpH0bmWGXVd4BEj
 hcLANNGjawgGROMKx62vHjXJ/WRJ/X/XiDxiHHJIE2tWhdAdNd+RjlfjYdvcMqH35p4s
 z4x1jq6XHvn+Sz8V8sIh3bQ2ZlzJzejxLofs1WOCcfNkBIDOUCa1OOGr5GDdoHED1HUT
 6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pAqo2IY9qcxeeqd6VBniHfWVzxC9WIKztprXocMtHOo=;
 b=KViqBKjAGPN3MJjzmerF3//6da7emZtYXaVK3dnjhIZvVlwtKgmO3Sbm7ykI1TU14J
 Z1dOPVGBTpNAIbl7a+yGtacczSbiKTg1pWKgf/Ft0TGJs7xY/1GNtMtUWmaaxTCz1xTc
 Yde1oBWiAz3qhf0up7Er9dhd3RV/pYRUkzGfQ749AICjWzPXOrl2s/it5Xh8qtSr5DZ/
 mc8gMWrwkjf8/bttAWBrZ24kMOnenAJVetHWEHC5lsjHlXGmWQqzFG2vrIUw3M6TChGp
 LZ2l89OkKcIrkXXojeiPIC/7ATtKla2VjxLsz0ihfLzJmrIMIzgZxzF7CaOizUozR6R9
 9dEQ==
X-Gm-Message-State: ANoB5plfz7iEY0b9ukYX6Fh6EYYJ/efbaaHnJ0BP93LX0GCVuB5fqIg2
 1eRb0/xPW4qynotxFWei3aM=
X-Google-Smtp-Source: AA0mqf5Y4BJwj1yHUsxhbaxFIfRavIesvXu1ebRXuJGshO4Aa6jTAKpEkT88JgrZdvPOf0d+zkTISw==
X-Received: by 2002:a05:6638:1a87:b0:375:2ff:b633 with SMTP id
 ce7-20020a0566381a8700b0037502ffb633mr1692439jab.100.1668205046232; 
 Fri, 11 Nov 2022 14:17:26 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 c5-20020a928e05000000b002f611806ae9sm1113457ild.60.2022.11.11.14.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:17:25 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] drm: mark drm.debug-on-dyndbg as BROKEN for now
Date: Fri, 11 Nov 2022 15:17:09 -0700
Message-Id: <20221111221715.563020-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111221715.563020-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20221111221715.563020-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm.debug-on-dyndbg has a regression, due to a chicken-egg
initialization problem:

1- modprobe i915
   i915 needs drm.ko, which is loaded 1st

2- "modprobe drm drm.debug=0x1ff" (virtual/implied)
   drm.debug is set post-initialization, from boot-args etc

3- `modprobe i915` finishes

W/O drm.debug-on-dyndbg that just works, because all drm_dbg*
callsites use drm_debug_enabled() to check __drm_debug & DEM_UT_<CAT>
before printing.

But the whole point of drm.debug-on-dyndbg is to avoid that runtime
test, by enabling (at post-modinit) a static-key at each callsite in
the just-loaded module.

And since drm.ko is loaded before all dependent modules, none are
"just-loaded", and no drm.debug callsites are present yet, except
those in drm.ko itself.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 34f5a092c99e..0d1e59e6bb7e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -54,6 +54,7 @@ config DRM_DEBUG_MM
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
 	default y
+	depends on BROKEN	# chicken-egg initial enable problem
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.38.1

