Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B78924A5D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AB710E6D9;
	Tue,  2 Jul 2024 21:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aOHQBi1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24E610E6D4;
 Tue,  2 Jul 2024 21:58:38 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7f3d3919a4aso177934839f.1; 
 Tue, 02 Jul 2024 14:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957518; x=1720562318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xowWZ+ekpberKm26oOQ15iL0A2hZa3GfKHRI1+lg3PY=;
 b=aOHQBi1XFsD765qBQ6eQhFteMLwMbeImg+FrDeSzAepr9dSlhkkEBQLopwYca5kmCq
 QpNVVMd1XWgFG4mI8NYk+hqJezXA2+IvxB6Z1+hQekNKHrQXR8pHJcsjIX1ezdDKn3g/
 Frlrl/tFgKnDE+rjA3dgrLFGMoEJppN6a94a2I4rZlSROrfaIpSqncSivNFb/xSp2T5q
 You/34fq8WAmSzMcWNvdwU9da3Epo8KArwWe8LlGAvvlA+AQ1m3tprlTV3jWcWlxt1BN
 /7vT7PvzUSpqCOY+Dr0BMg0nvLA5hmsuRH1jB9PFYT+Ht/AwDwY51Rxi7WzNJVL/ZOzP
 Wkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957518; x=1720562318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xowWZ+ekpberKm26oOQ15iL0A2hZa3GfKHRI1+lg3PY=;
 b=KoYGBZWVJuQ7UftFN/d9wwYogKyJ/lrg0y5xfsgnnp6HmitpJlEcnGfbV0iJKAOc5p
 17AEJPLz1B8FY2qAULGSYr6dP5hUog7mdLOXuW649K7050sIa1zZCUGRcO03G+7nGSWb
 DJABOgOLfcsk1FuWngxAJ6okEL9KkKt6CtrirAF5oMnHraQjBgxLaPo3wCG6/4M0yZko
 XujPObKEOmCGjpKhO3mGpn1ZotlGybCScr6nN6Ys4+paiCeUZZn++MjCl44hQ1+h0xmS
 7H2uhQfr404fHsJmYD0ca/x550/tplTQnkgLipnHWywECWt+FvTVhvBrVmKbtgJNLp4f
 gtBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVANsTntpZOnyrFYf0tzjIaJ2p75FsDrCeD9AoXpjAuKksw8BqsYQjVeduEIhS9i/qpBrCyWWAbpuNI62fu+Fy9/r+K4nb4qZdjtcRzByT8q7FtLA5gcKBu61GkT3vTaczxLd7HK6qdtC2UbRWkPL70eqB6mFpx64EkV/FPBc1SV3tXt1uV6P4D9s4XC439u4PvM9ex0mwh8eoVDYKAw7sSi3k3j+HbpwkF39x4+iyU9P8eTEY=
X-Gm-Message-State: AOJu0YxOWwiroMt5ynKDV4N0aohAUoboKGTJauEvIQa/aiqzql2JEr9R
 WfcF5cCIQY9TMfSMBgS63MW/zZoqP7YGpWAX9I6xxM7Xdiz2UGg/
X-Google-Smtp-Source: AGHT+IFEGPMJ0Jh14wpvUFc2djetIH1c1nAPVR9FTMSLomEU1MSc3gn/62MyPuGbMB621f76l28FXg==
X-Received: by 2002:a05:6602:2bfa:b0:7f3:d731:c6df with SMTP id
 ca18e2360f4ac-7f62ee501eamr1142864839f.10.1719957518165; 
 Tue, 02 Jul 2024 14:58:38 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 19/52] dyndbg: treat comma as a token separator
Date: Tue,  2 Jul 2024 15:57:09 -0600
Message-ID: <20240702215804.2201271-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

