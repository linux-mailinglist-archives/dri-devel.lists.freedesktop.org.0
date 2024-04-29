Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37F88B6240
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A2510FF91;
	Mon, 29 Apr 2024 19:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D19UtAh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4666810E9D7;
 Mon, 29 Apr 2024 19:32:41 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7ded074a237so57327639f.1; 
 Mon, 29 Apr 2024 12:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419160; x=1715023960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tsc/9WsGromIBMCX1IbPd4mLGTopgfHgqr35jw6ogHo=;
 b=D19UtAh2Rk/7nF+v/7i+VK3QcJB4lAawghgn9RHyClDCr1wQnbtkYMqUn3g+2E0zQf
 UqJFDIdOTSsNoLeytAyyEWEgC2bn4KgMho5EqSFBg2vR+t5LX7B7SnC2BYRa0m3E55Fw
 VYx0ZuC9BaIxK17F3Qw186xr/EACEgVDozLHMqPPkgoL30K2f1DxPqUR4r8tTwWHJUjv
 sLzpj4F6NGnVCfAbJ8dwUROP5EECxJ9KBUDPL10i3vHBRHuOy6P0KrxT71lVCIQ4eE7j
 PX7bHDxa1XuAJk6Rtb4ANywSBUcO6b4W1nGXXjdDAeoJWEgaSVsSIlZxwrjUX0/sd59Z
 biEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419160; x=1715023960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tsc/9WsGromIBMCX1IbPd4mLGTopgfHgqr35jw6ogHo=;
 b=exgRwY1rfZcgbcq8RcXJpSIRlgoCurLuh9h+jduBptVb5IGCQeqSYxHayrkQ4l3CZn
 7F/kA423GRB9JCLuWodP+ZLKz4ii5bzNAyLlw/zV86VI8ffQWYHFw3cg3Qjp/A1N1PKY
 pBv4v9G9d9AJZx4n/am0UpUoLV6AW4o6Q8C2pBi85an+2ix3G8JAcoWyTSO2Kjj3t7ZR
 xtiywff59ZKmxjhpk72Ui4vlUSMBdZ15VDxKvnON8r+BUULrWLkDFERqTFHBSoZsIkne
 35Tdk78g+WNl3Eq3dR+hPdKVi5yj6IX4ZaYHvGLLvtVhSGfIQNRPzsQNkeir/4BLY5KL
 R2Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP9qlAy4hr7CdGEXImJxUCQ6ggtyK/pcQN4TQ7Le06CKRepGw4HOec+6SL5LwUzAH2F+TEiN6I3+Npr7/sAFQfzIPLsG33xm34prRjLaQP8vdo4Rvk4JMHVVKLcRQXMphnRo4tSIlu7t1ChIK4dgSOKvLa4EM32DoM2JzatqrdJP/9VmwcaaoTFgNn4230KCpkJ7JbVN3P7dpy0Sj+3Ltc9nTNes9mr0Kn/xTXTFnqfR5s1sg=
X-Gm-Message-State: AOJu0YxzjmVRDkQTlsmkoGkgKJDVn4opI4vtV+BZy72KLo1U8iqQHNwD
 xpvJrWhIhtiw7XL+jUIO9JPJf1iTqDbKyl/FydPhgOIXZwEx+Nua
X-Google-Smtp-Source: AGHT+IEvl7Ozyqju1Vb002jjbAwsGz0wALuKAmyIrroEmxIQoLfnQkqifO6d2t/QJPOQBzw+TvGRFw==
X-Received: by 2002:a05:6602:3424:b0:7de:cdc8:10e4 with SMTP id
 n36-20020a056602342400b007decdc810e4mr6877777ioz.14.1714419160438; 
 Mon, 29 Apr 2024 12:32:40 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:40 -0700 (PDT)
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
Subject: [PATCH v8 22/35] selftests-dyndbg: add comma_terminator_tests
Date: Mon, 29 Apr 2024 13:31:32 -0600
Message-ID: <20240429193145.66543-23-jim.cromie@gmail.com>
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

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../selftests/dynamic_debug/dyndbg_selftest.sh     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index cb77ae142520..7a7d437e948b 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -217,9 +217,23 @@ EOF
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
2.44.0

