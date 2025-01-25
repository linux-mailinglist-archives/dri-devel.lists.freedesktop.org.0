Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A480DA1C16B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A760B10EA67;
	Sat, 25 Jan 2025 06:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JrQ42gN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E0410EA62;
 Sat, 25 Jan 2025 06:47:11 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3ce8a6bc715so21102055ab.2; 
 Fri, 24 Jan 2025 22:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787631; x=1738392431; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=419xiuPVMG3qbwGo3tkCVXoWQ5CudHQx226Ckf7XZpg=;
 b=JrQ42gN3gvjYK9jhjejDBuELxQVxrmeIv3+4HmwIZawKD3Im9YFqv0rc6zWu5/4oNQ
 B+MdA38OubyxnhWXc8lUxWY5qpILa+fngqndZ1+Xv+N/7ifSgfkT6CN7iVsWz5q4Dj28
 QMpimptEyhKM/VuHc1B8dKvlD4x2YBMRCmCfbp8vLjRbqm0XcIjar0KLtxOgdhhcvNku
 ZIBTyUI5VQuJonE+zXnC9I8g9hYHqWE97ceIAsIBzTI3EKPjenrwapk3RCSfQa1xYAH4
 Q090qY2/IMD0BtTD7eQ704gith9JPMupxq7yXfNjx/VKuWKtNqVK/5VJhOF2NiKcQV4y
 4Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787631; x=1738392431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=419xiuPVMG3qbwGo3tkCVXoWQ5CudHQx226Ckf7XZpg=;
 b=cxRRr7SBwJOG7r3KnkN1eVDLSAZ149AkN6H9BQH4EDXUWae15L3I0z88ebAQ4iyNNf
 Wk4TbIHl4/JqKwQOzIa/DVbjSwHzVCtqCnNzwtnWn83qo1ccaV5p9xVOp0zJgGcxhFxp
 O6BpvDNfJaV1DL3/z7Vcfq03zoaFGsk1VWp+r+qOLu0jmGuusGo8zsuBwghm2/P+q1gE
 0oAiXb6On60vEmOypn6JB1guX++88NvvyhW+Nl1ZU6DizYz0U7NqrhDHdNn/TQQqpUBE
 rRycF5PfgTape9WncFtiJ2CHc/aYiqtbE8QOxOuI8zAQ1kJH81mXRjit1Kbg4SMw0100
 F8aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHfMdRWA3C+TiX5SLpWhI24Bkn3qSo/dfu5WGxWoWRhkNgsdWkghUCcvDnwrNxLO5F/z+bK4LTGT6xVYtWfg==@lists.freedesktop.org,
 AJvYcCUV3ykRcuCfYMpb+7liWkZf+L0iI1/Nb2atIL6WFVKwIGRQZU5Xkrfbj6z9BqA4B8pp9ur6ClJ0W0w4@lists.freedesktop.org,
 AJvYcCWWYdCY9dBmSt+GhVEPiB9XjYKuo8V+CtNf1XPpqJ7WbB2ibPDJ/QMm0APTamEjKGlHwqRc9jj+@lists.freedesktop.org,
 AJvYcCX4hSaw4MvzJnY94aSqNmEwvo/sC5NoGowWy7I4iEzhDw6VD5LG9R4yg5fw3SmWUHBmnQeAF8BOWFuM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+IDBdZDG/vntF8+BVJED9/7ZUYaunvh6wWbjv2nO7Zz1DQmPN
 H9VPyxNIRUeZKV8qp4a1Kcvg7OOlpZ70R5a4WOOnNkieopJNR8LE
X-Gm-Gg: ASbGncsSUcJbqIhs+Na5DAV1+eDaXiNFRS7k4DJCZysfjZwy26aSF9IDhQPMQWCTtYj
 ebMPbIJdiPRodGbZGtmAAXgbHNm4/Yj3WnkwBuUPI4kD+aUvy1mkiVvJlfrsujbNp4amPkuRUVu
 iYEmUM2TSV0vTg3SrtmnMqbH+i/ahjlWbxW9EiYNDm9FlpmGkzFx8CGXIw0R+1ZFv7NgvpMHgQM
 I3RNy4uWsVvmTdxfh1YD7qts2G+iNSetlkfIq7xkp1aTg/Ygnk65ICvAOxStvrxy7Cot4Ahe4RR
 uIK3Mq+e58Dhfq8Y9GM5iZSX8V+OvClNhelnOFwwZDQACj55
X-Google-Smtp-Source: AGHT+IEdolY48jcy1d5GbnNNp6uwMS0tCY3zAQsNey2Tb/bKtSSTu+VxIC9kGp83MyjaHTPxuWcnsA==
X-Received: by 2002:a05:6e02:1aa3:b0:3cf:cc8d:48aa with SMTP id
 e9e14a558f8ab-3cfcc8d4b85mr45317065ab.21.1737787631024; 
 Fri, 24 Jan 2025 22:47:11 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:10 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 31/63] selftests-dyndbg: add comma_terminator_tests
Date: Fri, 24 Jan 2025 23:45:45 -0700
Message-ID: <20250125064619.8305-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
- skip comma tests if no builtins
---
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 68a9046405f2..368d10a691a0 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -216,7 +216,7 @@ function check_err_msg() {
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
     if [ $LACK_DD_BUILTIN -eq 1 ]; then
-	echo "SKIP"
+	echo "SKIP - test requires params, which is a builtin module"
 	return
     fi
     ddcmd =_ # zero everything
@@ -238,8 +238,27 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires params, which is a builtin module"
+	return
+    fi
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
+
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.48.1

