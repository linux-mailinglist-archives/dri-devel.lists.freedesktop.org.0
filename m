Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD708B629B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1345A10FFB5;
	Mon, 29 Apr 2024 19:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RJP7Jamh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEF310FF4F;
 Mon, 29 Apr 2024 19:39:46 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7da939572b5so197147339f.2; 
 Mon, 29 Apr 2024 12:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419586; x=1715024386; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bvtcoSNmHJyPK9Yxvdf/16D7QT7gwaP1R4zyZ6VaX/E=;
 b=RJP7Jamh9Y3XjS9TpXfZHYsUIpDzY5eJVOWujCo2FgCiQrxUX8Wvgv9dSqE2Few78z
 XhO9m9BZsPwjL5La5ZKoWudclWue6rTj3PJqSeJGoi3k7giBRefFSs4b+45nhqskOcaL
 a6UyxPPBMRsnx1l0ZR87y/g1LR6nFbbFGk0wPGM/7t4b34GLUSI+S7e+CwVmPUV6KykB
 DFT2mP7V5fyYhxJu3C7izONLu8svPGrFFq7agSUepcl0cxUAtNkJyHsJdE2liNw5r/F/
 HQRztQ9Y9g8NsyNne/WSVe65KdDI6fgXEG9/wvdFATSuMQ+7ptcH5FauW7I22gWRr9+P
 gN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419586; x=1715024386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bvtcoSNmHJyPK9Yxvdf/16D7QT7gwaP1R4zyZ6VaX/E=;
 b=e2kgRNpDTFSwj1Po6sg0EP4i5c9DKU25rAaAk8Td9DrNdmb7yHQ2c2jLOMtxu495SB
 jchiForJMsJgI+xujYb8ECqBiOebbO52F3NKjqcTW46NioLAQ66tGXnxLfruudFPASbQ
 bq50GZr1ywc5nQKNsjJgFKlWjCGabdfD9Jqrz2bG1mkZ/kEsev/mhvuMpHKB1xnEQrYx
 VoENUlBxd42AyOkwuXy5qIyoCulnIpMr3KsybDWTMjU94JRvx+JLzXfMV7BBK1CqMbbT
 V5lxg6iUOPjx9IW+rcIiJpamkp8TGZJCpG7JQbgoNzsUAEnsEcqlu0ElgPOfo0hJAk8v
 1HOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB6eHjWtbTqDNryZjsrTyx98mBhItWVtvWfokSznM7AAwlXtlt8tINbQLDxLJdU1bjm1d6ww/KBNTSADmxGZbv0rt4YjMBPSGj6MWLBJapeRoeF69yXCvX4VRad8uXk/H1N8zMhkl4qwM6e10AbdVxSCykFxiawRSjlcV9iD0JrTmfY7mXOhMs12rwFz6wlMa0s7WpmE4gCGEfYmLo6r89Lp3tIaCQ8/lOEonV5kWL0wtM4qc=
X-Gm-Message-State: AOJu0Yyg5IGfgND9zgzqh0QsR3xK78i0A/H2/JFVLEG4A3YpcgyqJqV7
 GwQ8DHZfmzm/7UriXEOS/v97mXta67nYnVxchF6k9Ta/jX1h+uuT
X-Google-Smtp-Source: AGHT+IHSnDWahXuoiSDXC0PbzHzDdWYaT2zAER4xc4v4brlYZetM7hGw+hMRIEMbRLILknW0hU1xag==
X-Received: by 2002:a5d:9492:0:b0:7da:67fa:7da7 with SMTP id
 v18-20020a5d9492000000b007da67fa7da7mr14361568ioj.3.1714419586086; 
 Mon, 29 Apr 2024 12:39:46 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 35/35] drm-print: workaround compiler meh
Date: Mon, 29 Apr 2024 13:39:21 -0600
Message-ID: <20240429193921.66648-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
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

For some reason I cannot grok, I get an unused variable 'category'
warning/error, though the usage follows immediately.  This drops the
local var and directly derefs in the macro-call, which somehow avoids
the warning.

commit 9fd6f61a297e ("drm/print: add drm_dbg_printer() for drm device specific printer")
CC: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index efdf82f8cbbb..c400441cd77e 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -183,11 +183,10 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 	const char *prefix = p->prefix ?: "";
 	const char *prefix_pad = p->prefix ? " " : "";
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	/* Note: __builtin_return_address(0) is useless here. */
-- 
2.44.0

