Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41B8B6232
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F305310FF92;
	Mon, 29 Apr 2024 19:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JoBiCSHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8354D10FF6E;
 Mon, 29 Apr 2024 19:32:25 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7da939572b5so196841939f.2; 
 Mon, 29 Apr 2024 12:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419144; x=1715023944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMzYxLrk1uqdLdUeUsWli3XNHzvndTERg2zJwX54xCw=;
 b=JoBiCSHIG9MNOJmkRk+oepaWEpcrRXVRJXTLnQ6FE+Oo8DzgKP/AJnA+ma8PMTegAl
 gu+SIEeukVMvD/NEepErndiWNNg4I9MzPJvK3u353GJa5lK+SY3xexWu1BZJ+Ed2bKs2
 bJI4jJnjXZelIRuwPMAFPEHyY8ZWC3n3boWoH4U9cpgu7ZwtU3iBsHkjTM2/dGV1quOb
 NgBntpE1xpLAeZYeUIWbyYtSHjyAvAXGXL8j1m4Y/yW5L/TqYE7Rj3V8nQVufgLIiSiy
 UBdeXtC5mQPpPu3MeOBF5pwX+8X9/Fi70S1U29U1YF5+DQGhM1UqKqibWjg0PeNw+R+y
 mfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419144; x=1715023944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMzYxLrk1uqdLdUeUsWli3XNHzvndTERg2zJwX54xCw=;
 b=RPMq/C4WPxv9N6e3aT5JwXpCIYkBvVj9bxufyVajr1591GxaVeQ13L1pcjSuj9DQX7
 /EV7chihSpZX/kJ4gok4k3SnINTJD3ofPP2iyDYjJz8BvH3RNd+Qg+en5ZzSxr1u8EwD
 zQSC2AH7rF9mKHL6r5frbMv4OgfIMfVVjIP2PfH/2p41bCe9Kj67mBvBTZPencVsEhAH
 L1b37ZiHV3K7C6fU1t70fF8L37Xl2btpYmADv3Jtk+uZ8CoPxRcftuYPd3zkP256IzID
 CvRQUO/J8ldKwRIIee/buwRBnsAo5CyNR1c6Wb0FSX/8WrPCRsOmcbLGSZ/HLRAkZmgZ
 pEoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTvYhOi/kGMCvFLVYKLE/R9lFDU2c3rDed4hja/JyMLnMbwYCdzRpYqsE+uhhfWF6tDQ+0LRg1vw3HfIYZqxqLDQwDyWGpMlxyVuKPrbjk4kUJNQugDCK46aE5ZNZcO+PY/NpznmX6zI9fOR2sdAWPkfT5vyGfdhV9KUhky8FlDCoLFiQm3eTCSaZJBiZyaKar9ffR3x5x3pQRIisxt0NAfirRQfvESB8EzX/pLr/lNDQq/ag=
X-Gm-Message-State: AOJu0YyJrIISFa8B6Do9rhZ0+CGQEB/e4Yg0tvsUVJgsn7+XdSG2CL2v
 mwfQ1WSsuxelndnH8zN0YLzkSyKJ+4GLtVPSMEpBoLiFJ1Lx9EFm
X-Google-Smtp-Source: AGHT+IEM7xw/zU89y+PDQLqPNs+od4nIfUgSCC7WoiOktyCN7c7AVwtLzs+QmgS8y2hAIEBQYnMVNw==
X-Received: by 2002:a05:6602:275a:b0:7de:d935:de0a with SMTP id
 b26-20020a056602275a00b007ded935de0amr1619647ioe.0.1714419144239; 
 Mon, 29 Apr 2024 12:32:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:23 -0700 (PDT)
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
Subject: [PATCH v8 10/35] dyndbg: reduce verbose/debug clutter
Date: Mon, 29 Apr 2024 13:31:20 -0600
Message-ID: <20240429193145.66543-11-jim.cromie@gmail.com>
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
2.44.0

