Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72563A6AD5C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AA210E692;
	Thu, 20 Mar 2025 18:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZF50n6IB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289D510E690;
 Thu, 20 Mar 2025 18:53:04 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-85dac9729c3so88933539f.2; 
 Thu, 20 Mar 2025 11:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496783; x=1743101583; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8krvmT3hXiuiccuxDpOYGdDtTsrrIwxKLxWjX0uKEg=;
 b=ZF50n6IBXdju1+Eh7PS0HfbB0keI+2uNmavmXqFgTzqeKbGTrkw30ZBqE2Ff7WjvgL
 ECn60tBCOwMQvW805FZ+STYoqJecUlw6spAzuIDDCWOC0Y3yCo3KAF68hF986m6Ax68L
 UxnnXyyCqGhVS13yAuR0LAo3omNFfH3jYiC9NYHNHNk78UUV3hNOwwDk8lVv65JVnHTR
 YPynC+6BO64P3WvMAXdPLUjHDtaVZrumM68VuH5GehOHT6PafMfSlWPyBWii6j/t3Yhr
 csOXrHr0n2IEH8IsAghqbrFIJVxTRjwXW6HXf35g+jRCgDrWBvlJXPy5foG+4rGNAyzG
 Km5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496783; x=1743101583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8krvmT3hXiuiccuxDpOYGdDtTsrrIwxKLxWjX0uKEg=;
 b=GQpbQO7/UJw8oDelzjdan1wonV86kaLDCpKJKFIdaKvrinV/sK9wFzUhyUZ7bzQIuk
 2oZVBRofost0y24HRGG+3BXiv/5zBAp7fDFZa50cvrtB0c21y0k+hTTSSI/tZnZUZXP4
 7UDmlI+aVkUODlR0zUlRDRDQYVSUHpajaiYaV7xkgHZfSOh3zRAlxrmQlmuKZFrBxR3t
 jPy0OAJPc5rsOfcwHmfAU4tYd/pCV0TSERIZ67RkWv6Yttdqux/bTTRUHo/RN+CFBHgQ
 X7Pfp23qgW0M6SMS5CbU02UuwFyVajNb8UuGJ96lQ1XXZBsSrdzbGzYfivEnFpKGv6cN
 2wyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA9vTu5yuC9SV7QBeU5CuAzDtJWKpIMeHzTkH/JDDsGIsZFYu5NfO1CU9bdEpuVKvH5XyPleq+TZ6E@lists.freedesktop.org,
 AJvYcCVDAzvJjU4sThGlt64tHVOwK2/7wM2BfpJtPyDwijIjvREeDjjMayBjV0zaBLpAFab6SqKuN4o47MmkUdfQgA==@lists.freedesktop.org,
 AJvYcCVZyr6vQqFMwM8RgW8uSEe1/Tx7X0wvQOX8Qhty0to6kUGgCqYwA9EK5log/P5nGPskmPDONWkO@lists.freedesktop.org,
 AJvYcCWKsgUjKQus9PiQ4/wD68tQiULwaqeIyaF90aqjomv6rp8IiSafXvNNg/K+OPRPPxzr31poeLqmtd0VAdMjXW19Sw==@lists.freedesktop.org,
 AJvYcCWLtIptqPCWYDz9csD/H+gK9WL2e3O/dOUzAm8smGJSuv+VtejCGBHBhd8Jt//CGsDo11FPh8WCeqBl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTijhTRjPpACugSG4kW3jXmXL/I7flLMiMocnzns/GP+HC0+US
 PhQW75f3d99jPU9NVBibQWNlhQp6IZXTjN2I3gAkYL+QNajCftOR
X-Gm-Gg: ASbGnctw/7nWp4pCXzey1rC4n4hW7TMWRfz+H4l1paAvIOtDRT7aGFX8Lh1tifBLEcs
 GgYc0Bwigeb5aJ6/d49plMCIrLudZOWOAGfj9iY95Y/VZZr6kgWS0LyNNKCQg0mqhYe7s+XBj2c
 0TXn3mMRjF0GNWgjk1cWHAnCjrH56YHBNxTy2LbONQcd2ynXrthXMf6yJ4/VRNpFIoV1YWwDKZI
 Nnd5jMpAgx9sywasnEvfGoo1cE1F91VBEDI/iZSpOAkac92a/Vn2w6k9WSSS+2mhERZ6b6iUREE
 pM5FRosyoqpybyrCP2Y7l5U+Tic4V5oaZsjHpZS3bBS7ywCDOhFxeS5HcEC91KTu8ZM/0UUDSOc
 v9g==
X-Google-Smtp-Source: AGHT+IGLFUNT7vu4Ze4s5l3PwVkHNFHoLLOgOZkw1v5IbQQj6bj520ZJNqB0G+YoLRgvlprY8LGZcA==
X-Received: by 2002:a05:6602:3785:b0:85b:427c:de6d with SMTP id
 ca18e2360f4ac-85e2ca2d11bmr47845339f.1.1742496783217; 
 Thu, 20 Mar 2025 11:53:03 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 02/59] docs/dyndbg: update examples \012 to \n
Date: Thu, 20 Mar 2025 12:51:40 -0600
Message-ID: <20250320185238.447458-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
-v2 fix missed \012's
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07..4ac18c0a1d95 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.49.0

