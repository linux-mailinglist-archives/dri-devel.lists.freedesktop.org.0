Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7728B6277
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B06610E479;
	Mon, 29 Apr 2024 19:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AzwSYirC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC3E10F0B9;
 Mon, 29 Apr 2024 19:39:30 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7dec786b0a7so49973439f.1; 
 Mon, 29 Apr 2024 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419570; x=1715024370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tsc/9WsGromIBMCX1IbPd4mLGTopgfHgqr35jw6ogHo=;
 b=AzwSYirCdL3dfV2cldbHqtlpWj5njzQkcpb81qeKBGVDA/6gTKGLOUIab3vU1MuGVn
 89WoWUO+JY5fREeCwWExqZPirm8TvH7tIH01ZniCC0RrggIpHDMNhtzg1xtWjX6ucFSr
 8Mpexh6I3mL+xjKtfNBZyD0wLvlNM8eCh9XfqLns7KFWzEg3HR43OBvtfwNL2qdWqTGH
 15Y/HR50OkXKt4sO/mMe8pph5oS1sugTRQV/2f4/Hzp3GgFgR2AhPkXvcf4SGqtqh4H6
 yF8jbSBZKDpiyP2GVlhMXNMeMUwQiqWiJqA51Rp+hgaoPjDurjW2i5MhhPpxwKvnKbf6
 hfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419570; x=1715024370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tsc/9WsGromIBMCX1IbPd4mLGTopgfHgqr35jw6ogHo=;
 b=gHp8RZdVj9Kb/ZUSZvpRpDdgidF/1DC/ten7lOmq1ZVhhxlNBAZDjEIsgeTCXXWfdp
 ocY2fEAJ/aU/Zw8PIc5iyw5tZy1nOuxqGlqCVQ5sPYS5mrp5a+Vppu+hocRM8Lw/nSen
 fDw4J59tSq2StXJKG7rP5OBkNlfb0LpubjWAbrmvydQEWIpFJPp4KZRz/jnLRWHMGlsa
 WxMBiFcOfx1l3u7/gjMudeceyt8zoIZzU6arqDr4Y43vEQoEEwqb5gt4s/onQOkkEgqs
 0vYJQId6yeNB6GFK1CvKSMDKR+N1AHnB/DyZFXGx7B45MpftROo15qfB95+7MgsKld7k
 qBhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0ErhGrgAKHGh/JfHhfSzv2zrmXPfzInJRhXVYigE5IA7Nuzqy/7T0x1d1U5QcB90gnyh2rVN4/zfte3TbpEixNxy86b68+1YpDjpZraD00ufATFH8M9+LaqENZSqsHf7pizC1uD6vbjuIvMVoD9uTlJaesBOKPuCXopT+RQLeMdohy4sTiZCjaWnfjNPGXxookbbDNp61Tk/j8EgqQx5tY1bRO6Oz98cH7T1lw2jru95KDto=
X-Gm-Message-State: AOJu0YzGreKyk5FXo0e3Ro2VNGGzsZTgSC1jTcpvGZYCAMBQuQb1GmNN
 Ote59wyI0FQzti3vDxCcstGIQyLwWXqp/BJbaYiKa1Sndu//Bn1q
X-Google-Smtp-Source: AGHT+IGSjAuBVUKjB/XBUA0dptA+ZKvZmIfrYhF8kqBK8ypwvGZwurqlZkqnE/Ouq9b/MO+XR7xJBQ==
X-Received: by 2002:a05:6602:2772:b0:7dd:c59c:83a5 with SMTP id
 l18-20020a056602277200b007ddc59c83a5mr574201ioe.9.1714419569961; 
 Mon, 29 Apr 2024 12:39:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:29 -0700 (PDT)
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
Date: Mon, 29 Apr 2024 13:39:08 -0600
Message-ID: <20240429193921.66648-3-jim.cromie@gmail.com>
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

