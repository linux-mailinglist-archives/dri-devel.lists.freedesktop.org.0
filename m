Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C33D642C98
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8744010E24C;
	Mon,  5 Dec 2022 16:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE2A10E0B5;
 Mon,  5 Dec 2022 16:10:22 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id v1so3233421ioe.4;
 Mon, 05 Dec 2022 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G8QffJLp3kw2N4r3vK4klTqQs8lga3DqRCR8wU17sc8=;
 b=oS4APd20UudCaozy0ge/CvTILvoX4Znvcg3LNw/GRV5Fp7HKZbMQ0E4UEUwQHB6Qwc
 TphBbuArSM654WXtLgtD2zWRBNVykIknWMMlurj4Gk0ue3eWL+chjQFvkUWbPdtcSAc7
 Wf//nqV7IzshKpInzV5x/VYb6SIUWyt4X3eGdIFN4aO57hSCLkMhCNMC3u0HBon3HwsH
 /wDOqR4Did+T7TiW4/odGvX8lYf7ifdrpFJ4nxv32VHVjoz0g4Zi32vPafaE4kqe23gG
 gx3hxqtUJoorfbd8kzF+ssrHqa/01JDUhO8RvXqoSP+rfSdxgE4qulm/kSjeUuBkqYMa
 J9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G8QffJLp3kw2N4r3vK4klTqQs8lga3DqRCR8wU17sc8=;
 b=yiH21HrW18ZhqcXH2iw6hNyhrPWLZBOVa+OGHFsujcYtT0ScYlFCpZTmFQEbdzM496
 w8wUccGIhOgkiuDZumzxElOxNo10klG8AFFxAs/WF2EkcTbQbiicDHFI30HGlHf5wg75
 HSGc8aWSczMcak7LqFNUH6ZcirXzGn05ADO1L4PJd2yNHYCDWUczqs7qnxyS3O0qyKkC
 WyBrDgKxy6vCup9ooIRbh33hhYBUCG0YJaEORrIXAx3djusLSe7mNIP5RPGE1+lecN08
 T9TY8URSr14vOqzenOcNS+BN6nrmE6UzhlXOmh+BdFNVzcURiWVvjToGsEQo2PsyTM7p
 2vIA==
X-Gm-Message-State: ANoB5pmqKzQfG/U0MuAiuWfNb5TJHLbNYOpl8iKck0pYpjHpHxwLFnh8
 lLbu6p82CQtqefo8QPKXxHM=
X-Google-Smtp-Source: AA0mqf5hdNHOAynaLAX+tie/6leL82DPkOYfZDoVTQ+aWlnNebYdjzKQS8cNdh9TzJZaO6Rs/Ys2hQ==
X-Received: by 2002:a05:6638:2594:b0:387:cd46:4607 with SMTP id
 s20-20020a056638259400b00387cd464607mr25372349jat.225.1670256621877; 
 Mon, 05 Dec 2022 08:10:21 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 g19-20020a05660226d300b006bcd45fe42bsm6017753ioo.29.2022.12.05.08.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:10:21 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm: mark CONFIG_DRM_USE_DYNAMIC_DEBUG as BROKEN for now
Date: Mon,  5 Dec 2022 09:10:04 -0700
Message-Id: <20221205161005.222274-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205161005.222274-1-jim.cromie@gmail.com>
References: <20221205161005.222274-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CONFIG_DRM_USE_DYNAMIC_DEBUG=y has a regression, due to a chicken-egg
initialization problem:

1- modprobe i915
   i915 needs drm.ko, which is loaded 1st

2- "modprobe drm drm.debug=0x1ff" (virtual/implied)
   drm.debug is set post-initialization, from boot-args etc

3- `modprobe i915` finishes

W/O drm.debug-on-dyndbg that just works, because drm_dbg* does
drm_debug_enabled() to check __drm_debug & DRM_UT_<CAT> before
printing.

But the whole point of CONFIG_DRM_USE_DYNAMIC_DEBUG is to avoid that
runtime test, by enabling (at end/after module_init) a static-key at
selected callsites in the just-loaded module.

And since drm.ko is loaded before all dependent modules, no other
modules are "just-loaded", and their drm.debug callsites are not
present yet, just those in drm.ko itself.

CC: <ville.syrjala@linux.intel.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
.v2 - default=N, cuz CI tests BROKEN stuff too. @ville.syrjala
---
 drivers/gpu/drm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 34f5a092c99e..5adc8d5b6a40 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -53,7 +53,8 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default y
+	default n
+	depends on BROKEN	# chicken-egg initial enable problem
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.38.1

