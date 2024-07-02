Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE76D924A90
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1589B10E6EC;
	Tue,  2 Jul 2024 21:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AKo0qnyy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD34E10E6E4;
 Tue,  2 Jul 2024 21:59:05 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7eeea388a8eso185105039f.2; 
 Tue, 02 Jul 2024 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957545; x=1720562345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GNz3zEEsQ52HQj9oGak+wZ8oAPfmA3LCU3EZ10XWgs=;
 b=AKo0qnyyDwf6vkQTimsTsfwS3qOHnTt/XI5NeDezE4bl98t1TY3g4nHvWBAt/FUw4t
 PSdpii7Xt3e+h347zLXNt3B1jRcLQDLpcO/ImBi0LaL7YNkMer4SyydE5bzqzI0i7bX6
 B1zM5AuObSwRcyA3zljIhlBz6TgWM0o0gLkVj5cFiMpNv8jGhKJh03QKQvYFNTTI7sfO
 /oUrLzftR6JzS9IGKs6EugJsBoSJvzJfRqbOEJ+lHDGQNyNmEO+vbPQUAAqsJT6p6CtE
 ZxQxDeyFiX4BuaxXJ6tei1MMv1uxQsZIRuJN9ebiRYBpPrATCRCKqMwQqu2fgTffaFdn
 zsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957545; x=1720562345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GNz3zEEsQ52HQj9oGak+wZ8oAPfmA3LCU3EZ10XWgs=;
 b=GLt9pvGtvn6SR6GRGV46mquRoKc/0rHcYZHZH3hj+5ePIXiFdd4pqCHvas21/WI9YN
 2kSuX78/0JFJLr057Jcsm0nz8di7RrinRCGmxEXrGJACQsxxM5vdiVZYjabiPYVVmx0k
 N5LQk79Ypo4dXfBiIf5Gh3YSyTdLA5YEYxhVeliGtjcEbUmQSAsew78yQrkOB7FdX9HV
 QGLy1+kD0ZStJklSDYRtZyGYEk+3SQcui7CJwuiBvy3bbAyZO52DuMYTkjS2dQq9FttB
 qb82Rff/HGUAEMjIW/svSYXoLBnpYW2wb8UXgNTCpPIKzbHHvt+UE+DFchenZSa4p0Hb
 0ZsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBk6fpBpfaAdQf4/3LK6HbjkkfLrDTwbTBs/XWF41nSrM16/dlcDxSNMhpvLvR5oJujWFNhBs93wSjMss+KJF0ndr86Xc5edHUTh4sI8F0rbBsAQwKyzit28ureW184NIDJ26HTdBqaqzGItj41dj854nZivFuAj1PSRC5OCumbRK5CXXtwiPleycb2lUotLMyxM5vNNP3JuMeE+Bp1JMS22Lm5lg4i+jplxKzus7GkmmI1/Y=
X-Gm-Message-State: AOJu0Yw2ekyNdm4zDLQsTobKPPKAOYGgYISDPYZEhLhlUJh1iPI9owI5
 3Rv5Vu9LVmMqTWPnayyWUOIyqICaJPKrMFkiLetBvwUKGAdveKuQ
X-Google-Smtp-Source: AGHT+IEpSIuUlWiXo7AlLLZ9H4oUpyxuj1IwsW6JEpLdySuCQ2Dy4tOK0pH6QgalXu1yNAVKG98Eig==
X-Received: by 2002:a5e:cb42:0:b0:7f6:1f5d:3e02 with SMTP id
 ca18e2360f4ac-7f62ee18215mr1105126939f.2.1719957544885; 
 Tue, 02 Jul 2024 14:59:04 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 37/52] drm-print: workaround unused variable compiler meh
Date: Tue,  2 Jul 2024 15:57:33 -0600
Message-ID: <20240702215804.2201271-44-jim.cromie@gmail.com>
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, I'm getting an unused variable
warning/error on 'category', though the usage follows immediately, in
drm_debug_enabled().

This drops the local var and refs the field directly in the
macro-call, which avoids the warning.  For static-key optimized
dyndbg, the macro doesn't actually check the category, since the
static-key patches in the proper state.  This is also likely why the
auto var appears to be unused by the compiler.

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
2.45.2

