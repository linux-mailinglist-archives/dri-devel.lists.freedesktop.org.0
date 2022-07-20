Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282257BA17
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6A78F080;
	Wed, 20 Jul 2022 15:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB3A8F1E4;
 Wed, 20 Jul 2022 15:33:07 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id l11so7321786ilf.11;
 Wed, 20 Jul 2022 08:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/u3pzpNzNChEPNWjqUZH0DBLx6ctPNr/Z8rp47SNdY=;
 b=h/fgtCJTtRbAXE+dLj7QlqKj0sKW7IDEIMmoGXVX6ngfgQVk1VgBxIiDi4O1i6kmxU
 DvFiIFbNHteZbINYV2zKyiv/yiU1grfH7o3k5EMkWtrSzDVguzcjp8FfJc6FRc0ddLfJ
 geVIHZxp/0McZL7skTAscUokpZ0OKQK1J/8kxlwAi/fT/Q1k89GWv31wgILZ8BN8pzon
 tdbRi0oFxmhdntxJDUKlyXioEwh2m9YdG06zumjB8VHpj1rbi59YlspAYJQqGnCGZgSo
 zAU3kP56UWMB3T7Wkv1Qyjxe0s+KQgafjuPAKeFpxcP/1vedBOU8mOeHyQw5pwouFfmj
 0liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/u3pzpNzNChEPNWjqUZH0DBLx6ctPNr/Z8rp47SNdY=;
 b=rInXLI/5W/YbADPoaKK6kM86wfFFLZU6+6Sx62wMrHsXyycQyllZYhfsT/+M5HuDTJ
 qrhltheb3XkHxvmtmf6sPNGsVG8ef7cbbmxx5AD39BIC8859uI7B34es+X5xuKVE2uCT
 W2/K5gRgMyZ3GsMU/R8OXbnoUIZ5HTAY432KE2q9S53huKV0ACM1wfe9CxkHMXfRZPP4
 oAqgljAhdJnqMFPRSUaudpK8WExuLH6hrbRjceyxQVFI52oTf49ANlTP6I0RI5hdx0sG
 Th74eTR+AKAUbOmnX+Jx4h/gNMYxkLI6ftBH3WHVqHUqmDUJBE16U7gyQNKqNllkdeMj
 WxBQ==
X-Gm-Message-State: AJIora8W19O9Gvrn4SnQLcfELwh6/O+BPIf1CBXoS8FbPiLWuv3Rndtv
 pQBY666PLHo9GYcicxKy+5IMkEpNh5LXcg==
X-Google-Smtp-Source: AGRyM1uJEe74QzEYr9HdOGSIXLPagTB7IKsTxO7mzYMiP5Ry926uMNSDSVrJuIT0rleTJW8rMEYd5Q==
X-Received: by 2002:a92:c267:0:b0:2dd:678:8688 with SMTP id
 h7-20020a92c267000000b002dd06788688mr3658270ild.278.1658331186253; 
 Wed, 20 Jul 2022 08:33:06 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 09/41] dyndbg: drop EXPORTed dynamic_debug_exec_queries
Date: Wed, 20 Jul 2022 09:32:01 -0600
Message-Id: <20220720153233.144129-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

This exported fn is unused, and will not be needed. Lets dump it.

The export was added to let drm control pr_debugs, as part of using
them to avoid drm_debug_enabled overheads.  But its better to just
implement the drm.debug bitmap interface, then its available for
everyone.

Fixes: a2d375eda771 ("dyndbg: refine export, rename to dynamic_debug_exec_queries()")
Fixes: 4c0d77828d4f ("dyndbg: export ddebug_exec_queries")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  9 ---------
 lib/dynamic_debug.c           | 29 -----------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index f30b01aa9fa4..8d9eec5f6d8b 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -55,9 +55,6 @@ struct _ddebug {
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
-/* exported for module authors to exercise >control */
-int dynamic_debug_exec_queries(const char *query, const char *modname);
-
 int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 				const char *modname);
 extern int ddebug_remove_module(const char *mod_name);
@@ -221,12 +218,6 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 				rowsize, groupsize, buf, len, ascii);	\
 	} while (0)
 
-static inline int dynamic_debug_exec_queries(const char *query, const char *modname)
-{
-	pr_warn("kernel not built with CONFIG_DYNAMIC_DEBUG_CORE\n");
-	return 0;
-}
-
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a849716220a..e96dc216463b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -558,35 +558,6 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/**
- * dynamic_debug_exec_queries - select and change dynamic-debug prints
- * @query: query-string described in admin-guide/dynamic-debug-howto
- * @modname: string containing module name, usually &module.mod_name
- *
- * This uses the >/proc/dynamic_debug/control reader, allowing module
- * authors to modify their dynamic-debug callsites. The modname is
- * canonically struct module.mod_name, but can also be null or a
- * module-wildcard, for example: "drm*".
- */
-int dynamic_debug_exec_queries(const char *query, const char *modname)
-{
-	int rc;
-	char *qry; /* writable copy of query */
-
-	if (!query) {
-		pr_err("non-null query/command string expected\n");
-		return -EINVAL;
-	}
-	qry = kstrndup(query, PAGE_SIZE, GFP_KERNEL);
-	if (!qry)
-		return -ENOMEM;
-
-	rc = ddebug_exec_queries(qry, modname);
-	kfree(qry);
-	return rc;
-}
-EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
-
 #define PREFIX_SIZE 64
 
 static int remaining(int wrote)
-- 
2.36.1

