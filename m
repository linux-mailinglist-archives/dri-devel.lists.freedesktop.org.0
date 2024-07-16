Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D79330F5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13BB10E851;
	Tue, 16 Jul 2024 18:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WFhoLnie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67E510E850;
 Tue, 16 Jul 2024 18:58:30 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-80a2939265cso6199439f.3; 
 Tue, 16 Jul 2024 11:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156310; x=1721761110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/963zG9LNPxu+BVNW7S/xeH6c8P5d5ieMeYbq4Ngms=;
 b=WFhoLniethKtXYZ5pXtdbA+Yfdu9ES0B8T25vkNHEmCWUuTTWHWojXpqqYNEHWpCHx
 v4Tikt2oEn6jEIiFUbD7F8aaZOLVmPoik/GwLRttLzaXLOd14vyjDZdjhuMEKJ/01xiy
 K3G/+INFIas8HuCyhlOwS7Lwniec6McgZq574A31moye1uICXRMVtaFWel5PUrqPoSwB
 2uPdGaIG+SJhBoGzIryAzO0FdB89hZBz63+o6vAfXvTIYBwtC6BWvA3odZkxsB0HvYvJ
 6v4EImg4MPo1ZFTz/fp97wGg2zaS3mGgutgGkav0q72AhAP1ZQBj1apxUiTP4bMvppG6
 OOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156310; x=1721761110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/963zG9LNPxu+BVNW7S/xeH6c8P5d5ieMeYbq4Ngms=;
 b=hl0Dwd+2LsSKGdcIsU3El3iGBoVY2IFaekfk3or0F/6RYOn99AwG8//t8DNUTUeQOj
 cQaoqYBoECPnQPY2QUnynQVkYUQQG0RCn/7ghAU+lrDi/jKbRfFiEpCCo+P3/YjJdtNq
 tQubDi6yJV/rVlM03JK1ZJWGFxQtW28WlVjl71L8c+BiPCsWM1mplusCTwFquO71w0yH
 h/QGDtFOa4ofY6psAphfZF3T4cuiqMFhIat6zIilxw0KpU7ndpTcMj9bpfYewd7AIY85
 x7YUJ5+CmGPmGG94jcoQcXeTNQLi3dlmULHvYHyDRhNauFklU4UZ/YV6QND/vDc+1PtH
 /1Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkT3SuxMe09+wjU4A/eB845bkqrayHR4OzZO8ZLdaDNVRW9/Eda8oT3aLD/mTYLXgdNSPne4/IqD7AQt3n4eFj2sd0xxRHRb0cyew1Vld+nfBWBcXJfJTgXJC8yvT8EeFclxB52gDYrtCsBiW0efkh9WEYDVMaxevMfXLc+02diEyanqp31oagqDh857JMlD+8DWMD6mFfgp3+r61U9Aj4dqcMQkQ9bVqUhLD8KEwVrfF2myo=
X-Gm-Message-State: AOJu0YzZQN4Tg+ivUDgtkYb5/gNUq5XHU5gf6iVHoQuGQHlMCSgMhCyI
 Gk43mmLN3trVIuG7Z52a0GYO0rRt3Qh2Gj/7lKJ6T57kXp9/L8v9
X-Google-Smtp-Source: AGHT+IGst7Pb1aOlwZJwZi1xRL71bE8jQTjJ2ODygIZkbSk9dKUSw1szwoP6NrksbYl2gFvzuix05A==
X-Received: by 2002:a05:6602:1612:b0:80d:19e4:9d63 with SMTP id
 ca18e2360f4ac-816c2eef606mr48916939f.3.1721156309942; 
 Tue, 16 Jul 2024 11:58:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:29 -0700 (PDT)
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
Subject: [PATCH v9-resend 09/54] dyndbg: reduce verbose/debug clutter
Date: Tue, 16 Jul 2024 12:57:21 -0600
Message-ID: <20240716185806.1572048-10-jim.cromie@gmail.com>
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

