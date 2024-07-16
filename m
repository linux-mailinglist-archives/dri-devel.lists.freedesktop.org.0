Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC349330C7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDA710E56B;
	Tue, 16 Jul 2024 18:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e1gXDnXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D5410E83B;
 Tue, 16 Jul 2024 18:58:21 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-8046f65536dso6038339f.1; 
 Tue, 16 Jul 2024 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156300; x=1721761100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5R1ZNEsygnLGTQO2NIWkjU0SF7pc6VSZuM8NRzidmQA=;
 b=e1gXDnXuceDz3Tui3WZH7/C5PEmpr+tyRKtdh6x4JJeaQp/9c7lIbdanDRgE/U0PX0
 Og/cBZoGGj1X8B1s2Yx2JsPxTonYXT/462Z2hL5gcfQpDD0KVDs6QCjhNakKdX91aPg3
 pMdqeKs+XcGq2GiIcTPiCeHX4Jqc3AtspzUNCCH0xvB1Oa8TIeykwCxMktkMc7fzJCUI
 nwkco5v4pF5u6VvlHjtPIsjP1VY96q/82qHILlwf96TCkryTwrKDAIP1tlJb/egmOn5C
 75sBzGhJcVsaKGoYPcHcMgREavzcAix5GsnXkCE2JSg9RbXP9OpggOooqjEuGj/Gp59w
 NM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156300; x=1721761100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5R1ZNEsygnLGTQO2NIWkjU0SF7pc6VSZuM8NRzidmQA=;
 b=G7xa4B7C0XAiXYlwGSTkD+93UeItQ2QsK5SG/e5njlmAvzC6OhUrGa4Xq5HPzV/kaR
 ChmLMYG07NSTRWv1ipbOjP5Gg6TvoBYkVWCzxJgktIyExuU39okpSLTUyJ44+Ect450N
 ZasUe/utp6nJj55md4t9eEvDwoD0WB06jCY1614KyezKHD6DUEbGtjnLpjE5Iv79qHV+
 rHHwcTWk5L2u9kZBASEAr7+LL31dy0HeNmMSulTyShw0GS/OnTfTOfWMMsKlDVGilg/E
 CVgXJFLNmIcyh5u3bnD4yY7Bs4uER88VOq+vLu+Ulz2z2wNSgnpdk/buysqUu06GP4Tk
 qZZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv7GY9bDPcBRdUozzlYenCZAL8q/IWEldu63ymzvHyEcS1KQzI08Z29jRjhSPCVk1eRYBfxUCRmD59r3XZ/NE3aM3Yq0SGgirblZbWpkuGQlOhhUJROICkPvw3IGeXNItqhxGX3+sQ7GPcwCB36oWP7FLP5Gxit2aS6DLg3UA8MP883cA5XolLqCEswNmPgukqIyQRejzkjcVueqmWC2C5KloIv1RM5C8aN3errMz3VlIGwcA=
X-Gm-Message-State: AOJu0YwJZ6m2Bvxp7vs3i1H87Y9Soys2+w6rH4WE0FA0dxDCBVTNIwn8
 0akQESc+yYcdUlqtvCYkWpb/VY2b01znHT/1oFND1dOCJ8zH6Y2d
X-Google-Smtp-Source: AGHT+IG/GWDlKRu5+OOMDNAMNMhtDFiwfQtpn8aBJzDUfIXJDuLqEafEhFwZW4oo9t/YHsJs9EPD5Q==
X-Received: by 2002:a05:6602:1502:b0:803:980e:5b38 with SMTP id
 ca18e2360f4ac-816c2d03801mr41542239f.1.1721156300341; 
 Tue, 16 Jul 2024 11:58:20 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 01/54] docs/dyndbg: update examples \012 to \n
Date: Tue, 16 Jul 2024 12:57:13 -0600
Message-ID: <20240716185806.1572048-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

