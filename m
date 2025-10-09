Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E6BCA7A7
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FD410EAEC;
	Thu,  9 Oct 2025 17:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="baHD3DaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6CA10EAEB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:59:17 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-42e758963e4so11463865ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032757; x=1760637557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2CgSP+i6gOirYRCe6SP5XNRa5WFOHuIeP0ROyizXdM=;
 b=baHD3DaV71Cg1Z9aZn5DVsR7Q19uZ7uZPQckUPY39Lb5msf1h3hUFoQdw15IaSJiMe
 SMXUqWWIGMxImgareD5m9naVnrLoZ86M16rzgac+TeXU5xnZbyBJlu3qpO6lpWkVXo/2
 aoc7OrYsW/UH0VtWVepqj5UvfZOL7NYbG1WRO3me7T0hN5P2r9KVc2oUpnCqN48dhzhk
 UHVYF4Q+O10zPKVxeaJ+xjZAuHMjCXIAvol6YX2vq7Jx0QOuI+CY9ATTyrCLusXPpZrO
 aR9NX98TipfXzw3Q1cGUrpuZICxyvR0+MSNwb1fWozmE3jZdWsdKM8fsWQjRMMXi2zJN
 hN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032757; x=1760637557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f2CgSP+i6gOirYRCe6SP5XNRa5WFOHuIeP0ROyizXdM=;
 b=gW26/mHZn9QConnvY5RPlOCFUYXj0Rl286wmp9C8FNU776C8tv16sxEF6j72f8uUJZ
 y2R/mMgkagzPzZiFmAyd26CuwVqWTqCgF0c6uAYYF0VnQKiRsfPzlOI+2eUAsvxwOhHK
 l7k9zpAG9ffDqgQWusTnSpox/dHd4CA6+ENu20pWPtqfDqTNFw0VWP3AicRgolE37sj0
 zCItLcA5OQCOw8EZ0tND4q9SvJF4AyPaM8fv1wXaO2tnZw0gYcbpgQzYjw8jSw49ieZ7
 rAzhQtSdhEDoSpLLmwr0dSnbicf9lq74f2MO82B5mp2CtryomeqgoBbvO4FDn7yCfYrr
 aLgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM2TfKoP0H3Ix/GLAcNnHhS/TyD1ME7HXF7KUlgRxWvxjmvGVTCU+lvKBr2G9wZhOXLkWv9lB2F/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj9glDg/z9487kaNWXVzUJwJHiZ2Y+tOwSeoFML8FJM37G/2T2
 8J2JjF+N6FkNFujXXdFobwuztnm3tNTLJuL0YFfkE39/8l5BXp+8xZgc
X-Gm-Gg: ASbGncuGJmJ8oidKX88rhIq1D8eyOwPk2BPedT9MJiER9e1ef1Q81X18q84PECioSaY
 b+23Qq/E1fJlpNbTDvKZdZZ8BeSLzYvKYv/4nQdgIn1DPlUeTKH8899ls3idp9RsVOMUtDSV7MV
 eLK+JPwdYsy+BFExFqdJVD8C21vJMq2jcVNDKRuORMvPZhZg6KWvtAuEXjbmRoSr0hKIRu7Rm1T
 8YI38iOp8qbHa+gPob9ZvOlru73wHa3BHwS9y/qGTAZ/s4sSJgaTFtWVE3WX5G0WQTIvKLq0Ux9
 paS1Ofe5hcq492utfvv5ceo8OSq5TigBmypedd2G0Vo5ZpiXeX3yo+nNkh+e3O/nQjoEwwlfUGB
 cXnobOg38p62OA80IYuZfXlyqQX3G0O7Psq2crih5K7tKrMKIvasjQEeA5YYfy3dtRBaFsYhPS0
 in3Zj220SAP6CUo/uEq9Q0AqmhnaVxHPWis1ouIw==
X-Google-Smtp-Source: AGHT+IHHW7XXxj0sK4ppRb/LDzTgeN6fkIFB7y2JX1QNjPDVNsmviia3UE4J533K6nBq7vvvPw5OpQ==
X-Received: by 2002:a05:6e02:2501:b0:42d:80fb:7347 with SMTP id
 e9e14a558f8ab-42f8736998cmr88482295ab.12.1760032756630; 
 Thu, 09 Oct 2025 10:59:16 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 27/30] selftests-dyndbg: add test_mod_submod
Date: Thu,  9 Oct 2025 11:58:31 -0600
Message-ID: <20251009175834.1024308-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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

This new test-fn runs 3 module/submodule modprobe scenarios, variously
using both the generic dyndbg=<queries> modprobe arg, and the
test-module's classmap-params to manipulate the test-mod*'s pr_debugs.
In all cases, the current flag-settings are counted and tested vs
expectations.

The 3rd scenario recapitulates the DRM_USE_DYNAMIC_DEBUG=y failure.

1. 2 modprobes (super then sub), with separate dyndbg=class-settings
   check module specific flag settings

2. modprobe submod, supermod is auto-loaded
   set supermod class-params
   check expected enablements in super & submod

3. modprobe super, with param=setting (like drm.debug=0x1ef)
   modprobe submod
   validate submod's class'd pr_debugs get properly enabled

The test uses multi-queries, with both commas and percents (to avoid
spaces and quoting).  This is the main reason the test wasn't earlier
in the patchset, closer to the classmap patches its validating.

With some tedium, the tests could be refactored to split out early
tests which avoid multi-cmds, and test only the class-params.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
r3 - skip test if LACK_TMOD

older
  drop -v used in test_mod_submod(). V=1 does it for whole test
  ifrmmod at test end (Lukasz)

test-mod-tmod
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d..09937dca3056 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -279,10 +279,83 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug \
+	dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    modprobe test_dynamic_debug_submod
+    check_match_ct test_dynamic_debug_submod 23 -r
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct test_dynamic_debug 46 -r
+
+    # no enablements propagate here
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    # change classes again, this time submod too
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    #  submod changed too
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
+
+    # now work the classmap-params
+    # fresh start, to clear all above flags (test-fn limits)
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    modprobe test_dynamic_debug_submod # get supermod too
+
+    echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( V1-3 + D2_CORE )
+    check_match_ct =p 8
+    echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_CORE, D2_DRIVER )
+    check_match_ct =p 4
+    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
+    check_match_ct =p 6
+
+    # recap DRM_USE_DYNAMIC_DEBUG regression
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    # set super-mod params
+    modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
+    check_match_ct =p 7
+    modprobe test_dynamic_debug_submod
+    # see them picked up by submod
+    check_match_ct =p 14
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
+    # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
+    test_mod_submod
 )
 
 # Run tests
-- 
2.51.0

