Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65061A6AD76
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A0210E6CD;
	Thu, 20 Mar 2025 18:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dioI6pKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D8F10E6A2;
 Thu, 20 Mar 2025 18:53:10 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-85e1b1f08a5so33924439f.2; 
 Thu, 20 Mar 2025 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496789; x=1743101589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0gFevukveSt7PbWkbUevQGA0uvSXu+LT7vaKBaZctmY=;
 b=dioI6pKF3ytNAjvQtFUqAVJcp82MFVLutTR8lMwT3pmcczpd5M+IDhrMjS3o+Fduru
 maop7CVyRuZRkghc6NszMYiHAeyKVzRSn8R3YRdkZzYzZ85h04MRPoOdWNUO3jDRUgGX
 26Kox6h3/53SFZ48RR71is2UN1QqcMYzGfHbY1+IKVFFYwty1qPnYzkAwjLIqr2Qs9LI
 mTKrjZUNE+UOsh6a1Layr2qUYoLBk9K3/g3y2hLdEMoW9vR/ELrLeAFB/mMLsGIZw4rx
 Shx3b8kz1fbXD/jXnhpdodhTdYSBHvL7avpim+EUOUkFZd8bSSsR1YSAtxVMtHC38zyY
 Cq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496789; x=1743101589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0gFevukveSt7PbWkbUevQGA0uvSXu+LT7vaKBaZctmY=;
 b=Fe1y3yxlNiHobMbX1XyICjqfr+nyXOwBkXWx3gpSOPYuaarYY6Z+McR167+8BquXV0
 8aeSo9ACBchirlLMySeqH2yitg/Oe4E4XYXN/tI8eaT3tpZkD/M8JkksxVtwcGSfs5gu
 BBtvHZRP4uc7oLhdQm1XRvOCY0EQn910yoAXSRZeEZHv/S6KIijUTqsufELrtBZIxcUO
 WNbmgfxj7s90u0FxS0eoEnSsXNn19v57LWK5w5DXNfG+Ey8ta6e0GuUYBDRWr6bIBoay
 d5wGezDHCTQSf5c5Muq2EGXKNjt1K4jxEaa9gadzpPSto21/+N3Z2vwzB7ObflbWYd5T
 PWBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfIDkNbKU/FNHYNL2OjY9YIo734SrhkoJIFQBY/io5F//vxsnG5dRMrHKKrhANdZQ2blY27nAaCgSL+oI6O4ZmIQ==@lists.freedesktop.org,
 AJvYcCWM+ojWVVvPqLU8+JXqhWn9tZSVtgXoozbl75zw2hXd832WUibmJ95poFPpWgjJBygPlHF7c2fw@lists.freedesktop.org,
 AJvYcCXTSMyPnZe/KF0dnD1hlpXnGxqg9y3NIeFmWziqxHQdXr3PEpcrmlJ2SpZ2EQzQsgtjmmo8zHYYBKVV@lists.freedesktop.org,
 AJvYcCXeZKuj34BnKOFOmfL26OEmYtokyIRbtmykVwvI1TWJ9PdGKcK5ROoL29XCuyfNL2Z/V4xu1cwFPZdFIpnaBg==@lists.freedesktop.org,
 AJvYcCXwH56X0iSg7zgPgo0wM+JR9xPXsGznxsjmCmploe1+89XNTSCyzXrQIFyYwWkQzE0QxVybKbZV5z3I@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMkxgBy4JAsXxcAYZp34xLRfZNhrMQYiIwBQv/G9uttbSnvbsr
 UuMs1oTgEqUt+Ja63ae02wlr/opFcs8At/WaQzPNiU+rAqkin9E4
X-Gm-Gg: ASbGncsd1EFh1GIj/Z/iDxG6aiQ5h+C7PohJACMv7cdVA/sIiuJw8IoCN/uvG3pD+QF
 XNtcDDcAC+/Pb2tH6mCvP6iI82+hGAL/TCxyH9hOXNV+tpdajflWMUaQyIiahn384YPf/+rPwDj
 4hH+jNLsOdayK1VAlJgzIBEXeeYe3K6UiKDIXD9y64CPjrqNV8PP9XCp1J6j9T46LO2gRylWcnK
 A+tWFWGph4JmpgeN4z8oKB21aD2VGyBFZ/McTwekxmCnBF9jaZELdeEa/CcSlB1sTCTb4tmtJot
 D9gOi8uoQiU8skbwXo6a3qlAsuttHyoLYRphYscBquJWe205jO0ZkHnnouTY6sTdE2znc4GaRkn
 qeA==
X-Google-Smtp-Source: AGHT+IEl5TzbnKxAjaqmsC8k+Jv8OPkwqppFAxXArvgR0WfDE036J6MPxh1ZsMPTCMeE31lygTHh/Q==
X-Received: by 2002:a05:6602:3787:b0:85e:180d:7c97 with SMTP id
 ca18e2360f4ac-85e2c8f0cb8mr51954339f.0.1742496789264; 
 Thu, 20 Mar 2025 11:53:09 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 07/59] dyndbg: reduce verbose/debug clutter
Date: Thu, 20 Mar 2025 12:51:45 -0600
Message-ID: <20250320185238.447458-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

currently, for verbose=3, these are logged (blank lines for clarity):

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"

 dyndbg: op='+'
 dyndbg: flags=0x1
 dyndbg: *flagsp=0x1 *maskp=0xffffffff

 dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: no matches for query
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

That is excessive, so this patch:
 - shrinks 3 lines of 2nd stanza to single line
 - drops 1st 2 lines of 3rd stanza
   3rd line is like 1st, with result, not procedure.
   2nd line is just status, retold in 4th, with more info.

New output:

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
 dyndbg: op='+' flags=0x1 *flagsp=0x1 *maskp=0xffffffff
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

Also reduce verbose=3 messages in ddebug_add_module

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v2 squash several verbose cleanups together
---
 lib/dynamic_debug.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55df35df093b..c609ff873224 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -264,9 +264,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -499,7 +496,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -513,7 +509,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -529,7 +524,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -539,7 +534,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -557,10 +552,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
-	vpr_info_dq(&query, nfound ? "applied" : "no-match");
-
-	return nfound;
+	return ddebug_change(&query, &modifiers);
 }
 
 /* handle multiple queries in query string, continue on error, return
@@ -1234,11 +1226,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.49.0

