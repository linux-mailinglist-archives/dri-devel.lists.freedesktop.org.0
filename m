Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3B7924A4D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4A910E6C7;
	Tue,  2 Jul 2024 21:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HDXSfWca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DEA10E6C7;
 Tue,  2 Jul 2024 21:58:26 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7f3ca6869d1so192027339f.0; 
 Tue, 02 Jul 2024 14:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957505; x=1720562305; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/963zG9LNPxu+BVNW7S/xeH6c8P5d5ieMeYbq4Ngms=;
 b=HDXSfWcaGL2KB/NLK36rfBlBv4xliF/ayiQboAMiNsvf/WyI/BMBTibhLz0RthrtR5
 /iB2Y8y1eEuMxhqTPxjx4L3usG7pza6VdJp+CrZ8SeOqa7pKQANp587YrzNe0I5GLTbf
 T11Z4/HTc1IjlHe8b5yFQy3nDGR/61Pt6fX+zYSivPr45aMI12sp2GwOxoXxkIiu6ek+
 8RcTT9lHzCDudxMs3hshL5T7MOYXdwdoc6x4FUFQe5EuG20ag6EP7Z1e/k5uC2VPiDum
 bPZhQyRDGIG1qtWQ/HRaypmP5EDz360AQc21f497keGOPJUEwckLYJ4webB4IAAs6yOO
 OFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957505; x=1720562305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/963zG9LNPxu+BVNW7S/xeH6c8P5d5ieMeYbq4Ngms=;
 b=Mj4NWQhzsUEaNY/MzaxG1VyprO3d+6tkiH7jni00jPtTTvm6SKMB3ryDuxO1Nj3f12
 2PYPl9bnQnGKT7kMO+CgDQHFTeO5jfSQEAMcThw2Rn1M6LSQfkzQSlMSyHYQqPhImw0D
 +QINJOQS5wsU3mH9/sF0ig735uytYfh3OOutCb1EgNczV5QRX0he0qlfJqei2J/NQ92f
 hzYeeJIgPKTG/zUWkWpymU/UgmkmD6K1NCEWuggWrMPP4cCd2swmv8feenDLOUr1IzVg
 okreHRlxCmwrLVYlGzxtNSIWuIGbevw/T8MT8mTtcMOAjfgZC78HMlaszXAWEde2hS8d
 mv/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpmMwvZRe4+QwXGNbmE6IYB/hcpzKsVbc1iyI0IHSSZNlu182iQXobSTsrZzxjO+O4JVN+6QgF3oR/XwKwOQGCNwZ0zYk4bZ5WqLUK7VJNBkMYytFE8d7Dekwku3ZUBxjlbZzrc/qxh19KKHc2syVKCbgVe3VwAG7/13/M9AskBB/sk1mCLQRnPBkAvcfIyVq6e8lakkaNiw2K1v1H8/2y+3BzT5KOqvURzYLW7qhKqWNCLLs=
X-Gm-Message-State: AOJu0YzXNR2hg0VLjqA6cuGA62MuKSZzGJrXFUl1kH1WqFkGtd1TxzuX
 pBY1X6jisR04MK5RanCREH38ncrDEMU/GNUCtci8xEJ7jBtbyg8k
X-Google-Smtp-Source: AGHT+IGX6ME8eGVqlfazOAcN/G0b48tkJYoxa8zIbYTUGgfze2KInpikaNyiDKbQdhqd9nSM7L0cIQ==
X-Received: by 2002:a05:6602:808:b0:7f6:15be:a6e0 with SMTP id
 ca18e2360f4ac-7f62ee82b0cmr1045219839f.20.1719957505324; 
 Tue, 02 Jul 2024 14:58:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 09/52] dyndbg: reduce verbose/debug clutter
Date: Tue,  2 Jul 2024 15:56:59 -0600
Message-ID: <20240702215804.2201271-10-jim.cromie@gmail.com>
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

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 4a48f830507f..368381dbd266 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -266,9 +266,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -501,7 +498,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -515,7 +511,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -531,7 +526,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -541,7 +536,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -559,10 +554,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
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
-- 
2.45.2

