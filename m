Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05E93312F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3DE10E85F;
	Tue, 16 Jul 2024 19:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XS5fB7O1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01310E82A;
 Tue, 16 Jul 2024 18:58:51 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-816b627a7b6so5622039f.0; 
 Tue, 16 Jul 2024 11:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156331; x=1721761131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86vugQ8piC6pzh4RgCq/qOTI8lQn1pJMR2FsXqHUdq8=;
 b=XS5fB7O1Z2kl/iYW89cyHiw/IaumSHAYbLu1iio6w7obDQZNil3SJJKhD//7ALo8Pf
 mzwGK9nxydgAPNtxUz5oju9QogLdwqHFusEjJ3latyu4POCk8RVIv99L9OAnL20wyIFD
 /S2rdcdCH4XODzryD4eHAXo5Jq/BToxPTVh7/5F5HfLOU3GDdhKGdBngBkJzIIq7IwaA
 W0/QOqrKFXRQDrqdzagZO7Se+NsJGleHPJsY+5ZJ2ALRR6dlobRpAyN2FblImGQHuvS0
 M4ly4E0/GCs0NcX2Mr+499jbCY+fw8Bi+89vpRPoh1rvoGvjG1ISXKlawOLv1gMfqFIo
 8FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156331; x=1721761131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86vugQ8piC6pzh4RgCq/qOTI8lQn1pJMR2FsXqHUdq8=;
 b=FgxBwm+T8L1hoPo0FxZOKRd/ugG5ON66gPxVuCd8LcFatCmexkBYyGewjRWeWmn+jI
 UyfVQhYATBBSTiox+bh74PwVn0LZcw6dSa0xmSj4Vh0CMkUPdawt9BvcKIyHUXOQmh42
 +p3F2gTRTjYD+b4vZaV33KanrE5FARn+bMjVBIszp1XknLh5ycf2G7Z6Orpqni4gXGDu
 SgNqNWbACuiIVH4MWSQsqZBIz8Lmwt9n5Ovt2jHX6FgRf0BbMm2S5K+ELiyoxoavirFE
 Bq2DKGUkFyc895+lmZryNH34lPckJ+IA4x7nULEkejlGKzV6e73BPyRwoNHpkD8gCUKr
 39YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9eHqdCeAkiQku+9mBi/z2Qya/c/7tEyEx7BGfZ18hGTQo854a3AFf2W4oHfrzHmYJ4i56/AMDjlXX6fj06XMaxhcBTLMXR0xYyV6jld5w4Xt+DhfotsA9euXPQE+Dhx+s9+RFJaQXZQ2Isa2G8YQ5ecE7O8D1PvAT9sOBN+AYhr/pONmexXFKx/zq0n7lRxc76y8piY4v7FU8fHY87FVn5rPDHQBC8fCYqPTyzmIaQAu9dSo=
X-Gm-Message-State: AOJu0YyY66Xyhk55cF8Xzok2ZJ5tejfbWXvm3ECCGyOat7BbACLbXCMG
 y2UvxHFK8PdHjed2bnRPvJCXZJBVVegKolP5cmYzYnRfNeUBc+xF
X-Google-Smtp-Source: AGHT+IGspWRAZ8xQXE2wAmaby0oqEdb49oPrtrp7fF/Yp/QyZ4mDqvRaV/q4mGSb06mvHiXzLyf7xw==
X-Received: by 2002:a05:6602:2c08:b0:804:2216:4b23 with SMTP id
 ca18e2360f4ac-816c6519eacmr47580439f.17.1721156330718; 
 Tue, 16 Jul 2024 11:58:50 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:50 -0700 (PDT)
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
Subject: [PATCH v9-resend 20/54] selftests-dyndbg: add comma_terminator_tests
Date: Tue, 16 Jul 2024 12:57:32 -0600
Message-ID: <20240716185806.1572048-21-jim.cromie@gmail.com>
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

