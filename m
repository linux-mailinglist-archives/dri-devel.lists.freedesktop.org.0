Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB399330E8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE36310E299;
	Tue, 16 Jul 2024 18:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kEwx1dpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579E910E83B;
 Tue, 16 Jul 2024 18:58:50 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7f99d50c1a6so8633839f.0; 
 Tue, 16 Jul 2024 11:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156329; x=1721761129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xowWZ+ekpberKm26oOQ15iL0A2hZa3GfKHRI1+lg3PY=;
 b=kEwx1dpYuD3RkNZUEFKCvhMXnHLnJN1OUheGHaY3YTO7KbsrNDY39M0LqME/WCUSUo
 6bzWVVqvZnnjy1gCaJ+/gIpJuj48uBo7yLpDfHvfa77loazxe0U5AVIL+2tTA4h5XQxV
 F15qV0Cv6IBYYKURb/Dnm0B/PVRylZ84yED+coyB4JksGcWpne8kB8WbzCOUN2z9IegF
 M6rPbV6utD2X9S61F2glyHZDhMjgmtYL3TZW55mR8gnR+uame8UxMCU0zvL6Rxcto8Il
 Q6i++GaHbu9htz2Of+aHr0+MLky0I0PNDGI41GnyyXPt36UsQ9N2jJa/AZsplLdd7e09
 cRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156329; x=1721761129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xowWZ+ekpberKm26oOQ15iL0A2hZa3GfKHRI1+lg3PY=;
 b=rs0NvqBEb0AHl1xFIDtJJpHer29KIiM0y2cw5PfpdBzvK9giu7RoXtkN7qS9CKpXSs
 ngcRE4voy2YFJCmfxiGjv79pBKiKjo/1V8LGCdW0P9NN5ahE3nXzDKgR2/X8sdpKt4VQ
 fAiGp8CA2PliblLx8oZHkzC4xev1HU/Yp0qkjlrLhY1CclEVOrijAT3E0zRtOLdKO4UW
 qK5FF+mx+6QLmU4t6wH1CoaGz9LS3dTxnYYzQl2NtPxKo2XGFXV4IkcJCAazqoPiMfTR
 rBbZxJMY/bhJkGiFcwHZMHnEZIaRkbNGy63B3z+E5zyc8I7Hif7B+vx0eEOGPH/6sEnZ
 VpoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWobBPFWbzVJIFZszMNSsh/QrqPsLlbEr3ibfu+O4GCEnuceyC/0sM4MOgC7hbDt38lmdjQEPTIEJ/pc/R/w7v90yFvv8+tRr6UQV9JijihuiJs7l9rFN8uTpR0GVJ2rkM/KZV+kPA1r1SsmNQdWPtsIMsJkGWxw8E8q5sMvaN7yAicDzDQKiTX2j2iLNGDPcuXDz07yWE11donRjbp/fjmUYL0zBWDLFBhNDGeM9s+QuAddqo=
X-Gm-Message-State: AOJu0YyxnkfRUT1dqq1XrX8uP2SCzCYAGmVntbSvGKTgjSbpf7ZCPX33
 tOymjejpxPQ/YaJ0tpx+GdkYabKrNO2Ge3cjB35BAkAGmxfqarD2
X-Google-Smtp-Source: AGHT+IFbKxBJYJFRLsqlIc8X6rZ3ddxjJaHcru4WtjoSkVJW1iE/Ay/MRGOURVvx09A7Mej6GaYQYg==
X-Received: by 2002:a05:6602:1513:b0:805:afed:ce90 with SMTP id
 ca18e2360f4ac-816c578dc7bmr35156939f.16.1721156329549; 
 Tue, 16 Jul 2024 11:58:49 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:49 -0700 (PDT)
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
Subject: [PATCH v9-resend 19/54] dyndbg: treat comma as a token separator
Date: Tue, 16 Jul 2024 12:57:31 -0600
Message-ID: <20240716185806.1572048-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Treat comma as a token terminator, just like a space.  This allows a
user to avoid quoting hassles when spaces are otherwise needed:

 :#> modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

or as a boot arg:

 drm.dyndbg=class,DRM_UT_CORE,+p  # todo: support multi-query here

Given the many ways a boot-line +args can be assembled and then passed
in/down/around shell based tools, this may allow side-stepping all
sorts of quoting hassles thru those layers.

existing query format:

 modprobe test_dynamic_debug dyndbg="class D2_CORE +p"

new format:

 modprobe test_dynamic_debug dyndbg=class,D2_CORE,+p

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 lib/dynamic_debug.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e9a95b0f3757..235d85765b63 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -290,6 +290,14 @@ static int ddebug_change(const struct ddebug_query *query,
 	return nfound;
 }
 
+static char *skip_spaces_and_commas(const char *str)
+{
+	str = skip_spaces(str);
+	while (*str == ',')
+		str = skip_spaces(++str);
+	return (char *)str;
+}
+
 /*
  * Split the buffer `buf' into space-separated words.
  * Handles simple " and ' quoting, i.e. without nested,
@@ -303,8 +311,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -320,7 +328,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -592,7 +600,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
-- 
2.45.2

