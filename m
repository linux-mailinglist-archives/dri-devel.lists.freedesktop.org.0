Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98E28B623F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A1D10FF71;
	Mon, 29 Apr 2024 19:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cwWoUS4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C0F10E4D6;
 Mon, 29 Apr 2024 19:32:40 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7d5e93b40feso222628439f.2; 
 Mon, 29 Apr 2024 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419159; x=1715023959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OThLtlQLHmt6Xu/dLjE7jt3V84uDU3HgUSM9F2dF2XI=;
 b=cwWoUS4EmSWZSeFezaACVRc/JtnPPTzMkDA3HCt3u0nIz4mTZZ+CIhx02JLgCWIllO
 INamEDKHJLqlzy4yvfXm0I1H/4/UAJ47u/OQj56c1KcGwx3lb2HTx70iX+jzn1dBFI9q
 jVtGDu5lfU0PV9dEGhDVspe87FyVfmEKWUx7BhZ8LDFqC3Yg1ZNsWkb7vYsVdXYW2stl
 auFVcLhFvDAMzh3BbRCgWczGjaWHKD1p8LGmqq+j8M4EDlmxAv+NxHMIPc6mibIuoqGf
 taHex9AcmWNSi2J1CG9yU6JP1Kq3LEQIYBqPK+Yggxeeu44c37jD3FLP/be9EPmJPVFB
 55Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419159; x=1715023959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OThLtlQLHmt6Xu/dLjE7jt3V84uDU3HgUSM9F2dF2XI=;
 b=MG9XIj6ZDpJmlk3dCIUrAB7SaEsgAs7RT5YrynhgzkN82wZA9eSVYGcNQG7jzDxNVy
 sLeUwKntvp44T4JgIr9A1dE8p0jht3wPdmpsrt2ERKAje20JPo1LQnECrZg3yQ5TDlgd
 yrEjtqoyAVfRSomKqACBdfH9erwaIlY/5N8ZOTq8j0TNzTnlNBhGRC4OuBMTLPmVc79Q
 Z6D9i41wau7Mhsz5j5zMcBohUTFhqBOcYKSOW+CGu3vtj60o4eBQxbllSrGVQXInP58Z
 UjTraik11QZwwQ5iTFZ6iVImHSjCVsjw2OKmmRdIHDcLceBCwsxXfu46Ry2+ZQT5DCYY
 RZ+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMX2lXBMTcmJ5L0hFSvvfipVUMGVJk2E94n7DUid9XLmpgrjDEi1GMFXw2UzZHEJO0korFdseCKToD+eTeg5URmaJXjfG1J11uN12SjJuflaja7YqAfhQMtbWx+U5BNPpUpRdJ+u2g6/TByDRqvlZXHmsdha7P/f68rgqw3pJvr8RPdnHW751/IoCRbV9D9YwaJJqsjaHlDtyT3oQG29Rt8yJyQaIy9yng465B8Ud8swy4iLc=
X-Gm-Message-State: AOJu0YyuzxSgkihh1ckHaVGGSTdQa2nk7FOsEc6A2gyzMCX3d5y3wKed
 1zgyjs4eFV/BjE5kFxS99kpEJxo0ZMUeqg5RCGVEZH0uQ7a5ZCA7
X-Google-Smtp-Source: AGHT+IHgblQU2XTGAf0Eayg4FlLzB3xPXagAcjM9qSnZz48ZH/Uw5+5PWqitVmSs5xwWAIoFf2KeRA==
X-Received: by 2002:a6b:510c:0:b0:7de:d078:16a4 with SMTP id
 f12-20020a6b510c000000b007ded07816a4mr3684490iob.0.1714419159322; 
 Mon, 29 Apr 2024 12:32:39 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:38 -0700 (PDT)
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
Subject: [PATCH v8 21/35] dyndbg: treat comma as a token separator
Date: Mon, 29 Apr 2024 13:31:31 -0600
Message-ID: <20240429193145.66543-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
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
index 31fd67597928..c1bc728cb050 100644
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
2.44.0

