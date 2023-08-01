Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB4E76C104
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6309610E451;
	Tue,  1 Aug 2023 23:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29BC10E447
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:22 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3491568afd4so10771095ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932922; x=1691537722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=IJ6QAXuXIiXi3SvbzHARJ3FLVAcAEnI5NT0pLNP0CvusJP196jFnOTOB6xQfY3XuKE
 A9pcof698ZKaVIQnbtS1+bqPWCGua/R8bj1q5tLpDYG/46Bq8Sbm0OyjJtsdlp5mzOw3
 dOUNDEfQSq2H9uk0x6LhnlGfvDmtvZ/9a8nWouJcfmYsEwPdXQIYRmGWRj2Wqqx8W0Vh
 rEbJgr8xSKWh9wz6jmXZM7z9qG4JgZqLX5t3yojNIw6zqp+6GRvZ51hL628ToxCn608W
 SezECAtnWJVKn5WO9FxlRpVLPiucRwccNSFvGFfDs4TQ/UyGvejhv9kDFQQkVG4PxlFN
 r7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932922; x=1691537722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=T7wpDuaPWiO9x0KU9UCLlg3pl7p34UJXL4K3n3uz+8FycgEZc0VY1/0xkXhVg9Nqv+
 85KiKWiM/zMsdyUE1Syg8VrKkhVkltBeVupEfBPaRZx4FTELpIblGcvd4ZVVTnNMqDh4
 /kgJ4xc1RjHfidv5HkfFdwVtRoRex5770lhKYUoHgwe5fRmb1rPSuhStzZma01AyjN25
 7VSsXG4IEiqwagqoFT+5wR17CTI+W66m+kgrCaQQrCo4SE8wgXW2ic8VShFMtoUezPnj
 PkHisjwYtbFev2U3KBdlnUFbcNayhYOM5OShKWLpnvXQ5WbMge7Zy7k4qy0givik+wWz
 5P5w==
X-Gm-Message-State: ABy/qLaaqcmBJXA63SJuXzzPo9VG0x0YhWQ6uPgfyaqYrcYJ5phc4ZlY
 QTHFvwH/lY7bYQHdejARtJ4=
X-Google-Smtp-Source: APBJJlEZWaDqvIV7CN+QYfdElXFQ3FClfcI9aZyBJGKZBa8oxAQ6Vur8MMljrmHjgELwLfVXVJXUrA==
X-Received: by 2002:a05:6e02:1068:b0:348:ba7e:d152 with SMTP id
 q8-20020a056e02106800b00348ba7ed152mr11957860ilj.6.1690932922155; 
 Tue, 01 Aug 2023 16:35:22 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 02/23] test-dyndbg: fixup CLASSMAP usage error
Date: Tue,  1 Aug 2023 17:34:48 -0600
Message-ID: <20230801233515.166971-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

more careful reading of test output reveals:

lib/test_dynamic_debug.c:103 [test_dynamic_debug]do_cats =pmf "doing categories\n"
lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

That last line is wrong, the HI class is declared.

But the enum's 1st val (explicitly initialized) was wrong; it must be
_base, not _base+1 (a DECLARE_DYNDBG_CLASSMAP[1] param).  So the last
enumeration exceeded the range of mapped class-id's, which triggered
the "class unknown" report.  I intentionally coded in an error, but
forgot to verify its detection and remove it.

RFC:

This patch fixes a bad usage of DECLARE_DYNDBG_CLASSMAP(), showing
that it is too error-prone.  As noted in test-mod comments:

 * Using the CLASSMAP api:
 * - classmaps must have corresponding enum
 * - enum symbols must match/correlate with class-name strings in the map.
 * - base must equal enum's 1st value
 * - multiple maps must set their base to share the 0-62 class_id space !!
 *   (build-bug-on tips welcome)

Those shortcomings could largely be fixed with a __stringify_list
(which doesn't exist,) used in DECLARE_DYNDBG_CLASSMAP to stringify
__VA_ARGS__.  Then, API would accept DRM_UT_* values literally; all
the categories, in order, and not their stringifications, which
created all the usage complications above.

[1] name changes later to DYNDBG_CLASSMAP_DEFINE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 8dd250ad022b..a01f0193a419 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.41.0

