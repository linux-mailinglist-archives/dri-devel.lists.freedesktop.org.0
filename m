Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C498B620C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365B110FF6F;
	Mon, 29 Apr 2024 19:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T5T+KFmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5693910FF69;
 Mon, 29 Apr 2024 19:32:14 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7d5e93b40feso222609739f.2; 
 Mon, 29 Apr 2024 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419133; x=1715023933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ldBVxIs3YWVEtrUSZaATkHa5+P4x6yD8OeAnS3nVM/g=;
 b=T5T+KFmiOeKjCA1SPuxrJJr8HtGRe3S4jJl0C8S14e2oYnT271byGaKHr7dl9sYb4P
 MH3FcpfxnivGFIXNsdP1yuLDw/pAt+goncBHPyW7i3gg94ltLS5Y1IQjlhWMdVWpuHx+
 avP8XmH6TqgMqVS2mynMg1NVDJlB9pLSDgYCn2+FCNni874nuFi4KjPfioh14F4vAKpJ
 T8FqeP9A8XWg+nQSUwJYx7EBtOBddv//IEeVfIqwZUBGjkfpy2uqRMe05tPuNefBew7W
 T74NSWuXVNJUnxSF08DjnnikEcz4QpnVw3HB4mxl46y9xhhNxzQPmDH2w9DAMNYLRm54
 E1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419133; x=1715023933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldBVxIs3YWVEtrUSZaATkHa5+P4x6yD8OeAnS3nVM/g=;
 b=LHy5wUpriqmolUxbldSTC3rP9IvGErk5B53nhnH/HoqEALsB0f1f7cjlU5zW48u9Qq
 CZqzsFHtwZiR/IikEAkyTmgK35ziUPNe6tD2Jba9Ed4z1KiuqN2XMpPzR5gNbxx/GO+/
 gJgLOcaB4/ccASHPncJC8KZsom1G66HHCwwY7LWTZzuXjAlfRwMVJZlenGx7MYLUU8Cd
 gwgWXgWCTwRMmEtAZQHNyg1Gy8hTdrx5wxUeRNeEXFQ5TzrogChPnkC8iPL0OzF0BbAS
 FLx6gtRIJLBf8VcXnAmFzpOPpDoWM2Rt5Eeg3stJKWKd2Wp2itXJmzI+5qW1jyTJ6Gjs
 Pmnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4yFMG8DatHxCGHuXxlzJCohhQKfwcHV9VE6Lp13ShHEwAd2RR9w2JwdK9E0q+Ia0MgZ85QPvAkNVv4cEBSRfDYGRrnbZ3PfKF5cgBYvlb5iBSDXRiAcfRvhbRAGyby1Rvy7J+aEXHOs9U0g1mir3VYJFbhS+anhqi/mx9zSRm56BPraYco7sLY+5hJ2z7OX2ONHutzCmFhjIOLKiBCe4c3GmK6NAi97sV5EhDhZE8P0Z4JrQ=
X-Gm-Message-State: AOJu0YznFokIoNC8T4jLTXjU3ahteDsb4XA/FKy6/uT03OXrpr2aZ2bV
 WBeB5JrB8zSO6dPlIS35kMyVopN9lxsQsSz0YsjKETIKJHDkaeQF8U3N9tk9
X-Google-Smtp-Source: AGHT+IGHW0PLwjFCn9/rpWdn4NiBooWfUd2DZN1lnB0NLUJaPWaAn9sXEpa4tjxTrKvayL0PZexs5w==
X-Received: by 2002:a5e:c74b:0:b0:7de:c608:15aa with SMTP id
 g11-20020a5ec74b000000b007dec60815aamr6340037iop.11.1714419133409; 
 Mon, 29 Apr 2024 12:32:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:12 -0700 (PDT)
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
Subject: [PATCH v8 02/35] docs/dyndbg: update examples \012 to \n
Date: Mon, 29 Apr 2024 13:31:12 -0600
Message-ID: <20240429193145.66543-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
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
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 0e9b48daf690..6a8ce5a34382 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -52,12 +52,12 @@ query/commands to the control file.  Example::
   # grease the interface
   :#> alias ddcmd='echo $* > /proc/dynamic_debug/control'
 
-  :#> ddcmd '-p; module main func run* +p'
+  :#> ddcmd '-p; module main func run* +p'	# disable all, then enable main
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
2.44.0

