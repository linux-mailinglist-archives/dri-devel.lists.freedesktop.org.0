Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A75924A61
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A4E10E6D4;
	Tue,  2 Jul 2024 21:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jnlpaID/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6403210E6D0;
 Tue,  2 Jul 2024 21:58:40 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7f649f7868dso113914939f.2; 
 Tue, 02 Jul 2024 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957519; x=1720562319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86vugQ8piC6pzh4RgCq/qOTI8lQn1pJMR2FsXqHUdq8=;
 b=jnlpaID/1fdqwbPDJAY8bgzP0tfZwSFbDbnVHt4O2bKBgBbpGJ7L77n9+AX/OoC2jO
 r+p4CWANtFxbEGtBVy9h3S5/nYGSYtNpK3eDOILEOJmyr6wa5QZe0Nlw1g9DS0Z5PDxb
 NZdxq8iY+0kmN81GyKChd2apuSgszHDTyNNZxz5ep2lyzoJapg2q9GBYbcgDxO1DWpYc
 I3AjnKRUdeSMP86XqPWvHU+tYutInjYXYfI+XUKu5hy6BjsZhCGHBVR7Os3KByaCR9os
 oJRl90ZfHyW1ezCYqOoQ3WZzkaGMARHW/jtgk7jIHEBnmxuDClTPXdI1fO6oSKUzpE9C
 oT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957519; x=1720562319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86vugQ8piC6pzh4RgCq/qOTI8lQn1pJMR2FsXqHUdq8=;
 b=Qt4VdOl/A89yVGhqFWmetCSgSsFyezdEs6edBhX1sXilfhaRn2AGNuGao3cHacDgvO
 r/DtTBAF4ZxGOmeRPP1DTIKlSdMWOAU1urRNPM4zxVFUkAS5bHAaaLYfE+D1aMFVM0YI
 1whzltT4EzFntyKC01MtsVS5zVrYE+be9ufWgS3LKlhMdKUrW6VbhwRu41wmEjs94F2U
 1aI+2EAKbA229s4KYwyiodtQxH/38vNlSUuSMdNuvcxlDTp/UBisGYn8kU/EfG+qco9N
 GZ4GyltgcAySmcsazkuHyAHYEpTub5EUiHqejAgdSM87lwklN7NzaRFQoLLZ0qHyffns
 l75g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcK2QAiox9X1qppUWGwD61MoYIzh1/bDp+PLu2HYmKzVfd6WYZSWpUVsNJi0ucXVajQ5G83UkL4Wg85Xa92oMGz9K2E+eaWYsoII82i+vNF2OGwDQWa8z+u/L7q3Nd68HBd8yDQ61uPsBb9NyN0gEOxQ3Tuh1x/YAkGvO6smfCQUqCQBkE4mN4Cgdg4mrdIADfBVqDVZZUTgwAWcQMY28XoKzlZecfuy/MAvtQRWpiKbaDJIg=
X-Gm-Message-State: AOJu0YyoEtvv7pyuMBP7w2kr9M3f9urvUk9uBacblbY8afJBL7ruKJS2
 Om1PJWgvMv7Zhe8su2du/clFb3ZTKh2m7vhJR0g9y20a+PP4x0kW
X-Google-Smtp-Source: AGHT+IFh4NknMSqrRunexz7bPyO+GFuFsoZTUZjnQuX30OfvbKxEu2+OkmD/dNXRlYHLCXi/CEVDEA==
X-Received: by 2002:a05:6602:15c2:b0:7f6:19b9:3a3b with SMTP id
 ca18e2360f4ac-7f62edfe2e9mr1313056939f.1.1719957519578; 
 Tue, 02 Jul 2024 14:58:39 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 20/52] selftests-dyndbg: add comma_terminator_tests
Date: Tue,  2 Jul 2024 15:57:10 -0600
Message-ID: <20240702215804.2201271-21-jim.cromie@gmail.com>
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

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../selftests/dynamic_debug/dyndbg_selftest.sh     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 1be70af26a38..b4ba293ab227 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -212,9 +212,23 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    # try combos of spaces & commas
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module,params,=_		# commas as spaces
+    ddcmd module,params,+mpf		# turn on module's pr-debugs
+    check_match_ct =pmf 4
+    ddcmd ,module ,, ,  params, -p
+    check_match_ct =mf 4
+    ddcmd " , module ,,, ,  params, -m"	#
+    check_match_ct =f 4
+    ddcmd =_
+}
 
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.45.2

