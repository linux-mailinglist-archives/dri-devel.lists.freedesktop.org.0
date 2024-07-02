Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2312924A3B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583F810E6B8;
	Tue,  2 Jul 2024 21:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="js06m16f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE1B10E6A9;
 Tue,  2 Jul 2024 21:58:16 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-376243a11a2so17111015ab.2; 
 Tue, 02 Jul 2024 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957495; x=1720562295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5R1ZNEsygnLGTQO2NIWkjU0SF7pc6VSZuM8NRzidmQA=;
 b=js06m16f8oV/cb8k8B+CM4WFI0IO7+WT0xoA6SXvf9id/risQgnrH5hM371K8SYhJJ
 ji6tzNjoGTwj8TTo09BeGLwkuqEiXDh2EI81CuiTb9pAIIgK3DENOSor4zMK9EoJhVOS
 arI8O46nAGMMFGZ5c7yuVPJA8BGGivvJG0MoT0JESOCZK/KRGg6s5QWJdyyImPclmcdV
 Y4hMGgrjqIehhEz66vPH2ElBCFKcV56Ayd9eVjeOw7guvVjzZcMlXgV1dVvBNzrhK5k6
 fZlIXFjVXEjp4J7AJFXC1QtE2Rt6LEWAciH6EdJfUl7mD4qlUhaWUyHWNht2/7z2uLaW
 xZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957495; x=1720562295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5R1ZNEsygnLGTQO2NIWkjU0SF7pc6VSZuM8NRzidmQA=;
 b=eJnE9AGUiurLoyBUM+ssuwU8f+X3lW0HI+V+XmfsqhLBfh5svsFEQ79WCNSBfntl1W
 4HvoIIFybyd2lpltVuKBCCOeJIM1oF3fDX10qQ+spioAuIVmBZTK8HLIQUDZqv0nCvbF
 Pd84T3+Hg3YRSG5KHg9/KTyxS0npwLAC8w9plR/wxIRJbVPAQNlVlEbupJ3Ne7B1+5ZA
 akPcov9z+/0k7u+yqFSpvGbR0zS6BHKwPANDz8W0dKM2UCs7RKf+pWQLKERIC8M2vkGL
 veXSWZI44p4+S0/Th+CQ6ika4P79KRauz6mtSHqdNp7Bp1GCrtM4KR+RnuvvKfUG4D9i
 pJPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAYWR1gbt9SoHrI/Tc12EEVmBca0nWYqrdJIj1eF2HDVjA3vyxJ+Q8suXzW6im6XQewHT7Qae9BUBOvkASwkbd+PBP++7PCZKOOOTjoSSKgOZjJ6/6He8t5V+wIhpsXUOCLd4k/BcxKg1h9bf8DhyJk0WMJvDxRd3OvZifaXmNse0pfcaqVBnWsAKsTwd9m1pcopBfPSE9A0ff8gdtobnULFqnRbsLcz2TJ80KDS5Wz5GTMq8=
X-Gm-Message-State: AOJu0YysYjE0yycWkQ0NseFErafhJ+bKNT44FcAa0IlvVhcMRhibQV+T
 EcHwK8ssJs2wsILJkOI08KxFFfijOwMK0Gs/W54e8X0XANEnZHPK
X-Google-Smtp-Source: AGHT+IE+ttIbCy0SMKnbv8P5dir5+2/h1iAP1anhrhtyYoJ/ag2FDZflxmfE4svH4Uxez+4Zs/MseA==
X-Received: by 2002:a5d:9541:0:b0:7f3:cb2a:a1b2 with SMTP id
 ca18e2360f4ac-7f62ee85397mr1239939539f.13.1719957495211; 
 Tue, 02 Jul 2024 14:58:15 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 01/52] docs/dyndbg: update examples \012 to \n
Date: Tue,  2 Jul 2024 15:56:51 -0600
Message-ID: <20240702215804.2201271-2-jim.cromie@gmail.com>
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
2.45.2

