Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2DC577B3D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131F2A9C8A;
	Mon, 18 Jul 2022 06:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1451A9C7E;
 Mon, 18 Jul 2022 06:38:27 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id c16so4317003ils.7;
 Sun, 17 Jul 2022 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/u3pzpNzNChEPNWjqUZH0DBLx6ctPNr/Z8rp47SNdY=;
 b=cMOqknqZRdoKMsxzpen8KrJU9GQo/J0NfoM4oAmUu+6OWP9rMZ8fBGy5NqXBQRn/5R
 /zxURRfW05yXhAscj3tk9e/DuQ192B2tDTqRWpgsMUTABb39F2ixkRwjh4Y3v03qXuAs
 ExFFTXrLFsPQOBZAoys36aHRBFuL9q3rQnGlks4lMxy3WOmhEQCkUDx4Uz94p38JW7r5
 kg+/IP59aO2RtaiDz5c+ZZTx5bELzTO01+3LilGDtvXIB4lihLvnFR45Jxt/FQvDhOAV
 cNxZsbUuGA26mSmXXtiYugGQ0GtWiWC5t5rC8ribVxD7czkDMvcTDD75xKtn8oTqjYFO
 EfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/u3pzpNzNChEPNWjqUZH0DBLx6ctPNr/Z8rp47SNdY=;
 b=XsuQznHi7WWcOMpay0i1IFfrDcagorb9gVESpLR0QQbAwHoiRPWUDuJgsdxD0tlyEI
 wMfs3g/NQ6enDIIcqyn/VidBhUP4al85Wj8CHdSt0Hg+4v/qRG5WeEceddLoJ1b+YfOU
 zSgOF3nuLbtCO46M7VqbUaj2AROUGRDGP3sXnwxyGc05MNhfe1idqfaCWu7Gjo97WBdU
 eGe6GyW6cnMbq8jsqd8viGGc+HyuwkLUMdGvTXlK0O/0TFXr1GJsvsjxBwVQdTEq47o4
 1nmD63cyJ9Bm3TBf0FWQeZbW2UDScHpciGWdqNzn1h425CVKYYkbmoWVgR+KaoWvTx9h
 jbPg==
X-Gm-Message-State: AJIora8GHiMac20wZ9w/PF8NK67DwCOQGPqNvzHcrBbZYkmQjWprGR6O
 EgYag68gK0s96EEuTWCXwFI=
X-Google-Smtp-Source: AGRyM1tmk2IYTGmmCyuInvDO9Ilrz54HX4rYzpu8nO1JcM/9dFE6e7lGZ6/DhdHBFgtC43rT1Gh1Ww==
X-Received: by 2002:a05:6e02:12c8:b0:2dc:98f4:2de with SMTP id
 i8-20020a056e0212c800b002dc98f402demr12831942ilm.57.1658126307400; 
 Sun, 17 Jul 2022 23:38:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 09/41] dyndbg: drop EXPORTed dynamic_debug_exec_queries
Date: Mon, 18 Jul 2022 00:35:53 -0600
Message-Id: <20220718063641.9179-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

