Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D48B6286
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C6E10E514;
	Mon, 29 Apr 2024 19:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aIqSfr45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9332D10E514;
 Mon, 29 Apr 2024 19:39:29 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7decef0e157so58219239f.1; 
 Mon, 29 Apr 2024 12:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419569; x=1715024369; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OThLtlQLHmt6Xu/dLjE7jt3V84uDU3HgUSM9F2dF2XI=;
 b=aIqSfr45uQxu6jkqW7Y1GPky1eaK32rJvZy4IQaVw5hk+78ARuJ02N/FdGeDfhfYRY
 UU+lZqiZZIIMPFwQ+4cgiLWk8Tk0zPKHvy/qlpglYKu3+jKNJVEzhk9/fJZ8TosfmYlR
 gfVVGri1DGmTcSgw4PlxxZI53W0JRGEw/sykWzyvMlOMUEF97JiM95WJgbt+VGswlAHe
 BVIjlQQJdQ40f+D5CZqXuYGkrEITWZ2gfIhX+cxMybD/AoTb0DLLWj0dUMTGQDX8EuIC
 WurPs/SVcpGessDLGdD8k5y/HtcMVIJFoxcvIphuGfja9WZIytPLzzIerKbZNrp1y0EB
 2zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419569; x=1715024369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OThLtlQLHmt6Xu/dLjE7jt3V84uDU3HgUSM9F2dF2XI=;
 b=xDOUAtBCkcWeHbtUdNL4kEbFLAoI1PG+UvDjQOsEXqReoaKKomML6d81hHeKtHDSfS
 8yRwf0f+DXjeZ/DvaEujsC7HHS4+e4IdM7ILi0ad0fssBOa6S2KAReBGVUAJyxFxSAXa
 t+gVClAzY1J19ZCOCsiOJSCNVzna8Bdk/G3iQ2EyJZhpuPpJ54Kasfb7cE3wzAein2Nn
 yXktQQpiGNZYyIQljx8JNvSQ8mTEClaMSsWD57G6YmPw5B1IkijPpdKOnz+ZSKrNxGYG
 KnNpCibJ1oAbF0WSq9WLtfqhpTtumADHAyGvNHjBpQNYOZGh+cfsCt/QJdGvuavwYmKK
 3Lmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/bWA7z+a4JEEe0/n+gpC8Yzv8GIdFSWWBXR2fyWFarAvAZm4fhdOQMUGg5C9GAZU1FQGThs67+LAfb4fCKXlVkZ18lNotCVwlWr7XothU2bk9E0PIzeSQsyYxebhujxPM1+L97sIXDVG+dg6xGxajG3ZXITeM3m0ySpiGtJCp2YAfvo/A5cMBPNelkLvOT1Pps9KdRHp8Hqpx6D0T+jL/HGRD/iyjBHl2hjlBOL87PPv6fsY=
X-Gm-Message-State: AOJu0Yxj0uFGEXcsRpdGrqdnCYJ+xecLtndx7oPUlQj6lJX4NHK38nVb
 TepuLEFi6GQYfE1RXs1Rskux6HCXAVxAetfU4eNm+te/Jfa1+jdK
X-Google-Smtp-Source: AGHT+IG8SYyWWKZD11FY0NPPG/D9eJB+PcSN6dz+CzhLKof+BDDE1ptiGYSje0vARpyD55y/WCWs2A==
X-Received: by 2002:a05:6602:14f:b0:7d9:6568:144e with SMTP id
 v15-20020a056602014f00b007d96568144emr14013964iot.8.1714419568763; 
 Mon, 29 Apr 2024 12:39:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:28 -0700 (PDT)
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
Date: Mon, 29 Apr 2024 13:39:07 -0600
Message-ID: <20240429193921.66648-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
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

