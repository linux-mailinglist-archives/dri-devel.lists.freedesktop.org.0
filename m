Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F109740CAAC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CFD6E9A2;
	Wed, 15 Sep 2021 16:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A806E990;
 Wed, 15 Sep 2021 16:40:33 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id q3so4260571iot.3;
 Wed, 15 Sep 2021 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M39BMLgJoah0hObYW15nhFmqQGYkxGWo//c8+a5nxXM=;
 b=Hxi5qW6FimNnR7uboNkvJjglXp0EIV8F8SQG+TJutCvVa0ejl5j9HaNj5XVfHIHaVe
 3czbqEQcLXR7Tu0QvnP/c7zg1Prb6uLc8paWAOojarZGCs4+Qa8tymFmrf7YfdStSpId
 YkZqZ1WM9GnUwZsTpuwsXqcyoRymQYdj7rIYWgn8mmGomqRKyNjmOyxTeR7CEt7xn+AQ
 ttFyLWvMVKbfiyIYcSKQB76neHLi8Fa7sCW2N7Kq6PTkOhAlZNB+vpV7eKszt/MDQPfg
 hIBoBMmWfGi06KnM3wUxHnuIw40GEIP7VwgbpMsROMrpdplVdIU0UVD3MRA4P0+EqnoD
 pjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M39BMLgJoah0hObYW15nhFmqQGYkxGWo//c8+a5nxXM=;
 b=7wOZpSGniiSAPgGnFElvKlLZwqjaAkCXvvEhDHEx2yLF/PEdWvLhTSZMjKMX3bBCHU
 9A6mffc6MKKI8Q/NgGTCwF0baSGjVnxvHyQDfM5YZ86583/ZeCfScGK0/iq5vbldRMwJ
 5FnzBtuWjBrnsD/I7ewYOhO4/qN01xvAO0YJoxGOhFXMQAkouz3dWMDXumif+RAYHPcx
 kG+uDIrMx4UhQn2gV8y3C8GZtJPnJc7+/C9GptktXYnH553CSoF7thXkmzGDu7kvD6PH
 fYxeSlAO1onMZOjpuliysZPZ4vW13Dy4Vr3GIUoJCa1YuBHQhJtFl/7rJhUXQmys1Z5v
 MmvQ==
X-Gm-Message-State: AOAM533TtW9pNtKLmLjTfbdIQ8GhvGiXNskU6dw//PkEc/fIkb+qZxgH
 43/KJwv1wnvWrv5ssWAPr5c=
X-Google-Smtp-Source: ABdhPJxJ3nPWXnK2kZkI1Ga8fdfydjvdzSBCQA6MdyY6vWK3yiQyYHyy6YkFApdzbxxT8+Lsb6o6Cw==
X-Received: by 2002:a6b:6c17:: with SMTP id a23mr799112ioh.110.1631724033042; 
 Wed, 15 Sep 2021 09:40:33 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:32 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 04/16] dyndbg: use alt-quotes in vpr-infos,
 not those user might use
Date: Wed, 15 Sep 2021 10:39:45 -0600
Message-Id: <20210915163957.2949166-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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

`echo $cmd > control` can be finicky with respect to quoting (mostly
wrt * expansion), so lets not complicate things by adding our own in
debug messages.  Quote as <%s> instead of '%s' or \"%s\"

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index fd5aca157aec..eac6c6877277 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -132,7 +132,7 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 			fmtlen--;
 	}
 
-	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u\n",
+	v3pr_info("%s: func=<%s> file=<%s> module=<%s> format=<%.*s> lineno=%u-%u\n",
 		 msg,
 		 query->function ?: "",
 		 query->filename ?: "",
@@ -279,7 +279,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 		int i;
 		pr_info("split into words:");
 		for (i = 0; i < nwords; i++)
-			pr_cont(" \"%s\"", words[i]);
+			pr_cont(" <%s>", words[i]);
 		pr_cont("\n");
 	}
 
@@ -419,7 +419,7 @@ static int ddebug_parse_query(char *words[], int nwords,
 			if (parse_linerange(query, arg))
 				return -EINVAL;
 		} else {
-			pr_err("unknown keyword \"%s\"\n", keyword);
+			pr_err("unknown keyword <%s>\n", keyword);
 			return -EINVAL;
 		}
 		if (rc)
@@ -449,7 +449,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
+	v3pr_info("op=<%c>\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -531,7 +531,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (!query || !*query || *query == '#')
 			continue;
 
-		v2pr_info("query %d: \"%s\" mod:%s\n", i, query, modname ?: "*");
+		v2pr_info("query %d: <%s> mod:<%s>\n", i, query, modname ?: "*");
 
 		rc = ddebug_exec_query(query, modname);
 		if (rc < 0) {
@@ -1000,7 +1000,7 @@ static int ddebug_dyndbg_param_cb(char *param, char *val,
 static int ddebug_dyndbg_boot_param_cb(char *param, char *val,
 				const char *unused, void *arg)
 {
-	vpr_info("bootparam %s=\"%s\"\n", param, val);
+	vpr_info("bootparam %s=<%s>\n", param, val);
 	return ddebug_dyndbg_param_cb(param, val, NULL, 0);
 }
 
@@ -1011,7 +1011,7 @@ static int ddebug_dyndbg_boot_param_cb(char *param, char *val,
  */
 int ddebug_dyndbg_module_param_cb(char *param, char *val, const char *module)
 {
-	vpr_info("module: %s %s=\"%s\"\n", module, param, val);
+	vpr_info("module: %s %s=<%s>\n", module, param, val);
 	return ddebug_dyndbg_param_cb(param, val, module, -ENOENT);
 }
 
@@ -1030,7 +1030,7 @@ int ddebug_remove_module(const char *mod_name)
 	struct ddebug_table *dt, *nextdt;
 	int ret = -ENOENT;
 
-	v2pr_info("removing module \"%s\"\n", mod_name);
+	v2pr_info("removing module <%s>\n", mod_name);
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-- 
2.31.1

