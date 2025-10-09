Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62EEBCA7D1
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C902A10EAF3;
	Thu,  9 Oct 2025 17:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pr4cV79q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826FA10EAFE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:59:19 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-42e726431bdso6886785ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032759; x=1760637559; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJonn1UQmdMquLncDUtZUHutcCuWRZij3zF+8bzYpyM=;
 b=Pr4cV79q9KSDyEl1Z8ear726se1VKpiVD+3vc411BP31rh5DY18MhfPozsktsr3CJb
 JhEQylfm0BmTa/dVCpX2Vo4MW6aOHf5ScWEDhOrNUlQOZK7BQB1YLrcL9a6df9K7LKBb
 sjiEmvFId3HPdv18yMriBZftBJbWqW9Ka61kBF+NazxC5JZTpSOmU2RJiCufJQioS+pu
 xSfw0I5ib68oh+U2+G3wSclge6+v8emryPDerd9MJpecarjltZqHxcE/fh+2cGAoK5Eb
 u5cyQ4lX7UHaewBesGd/Nl5vJ4+TDtVWcDOA7xI9Kg8yKBvpKPZG5EJKiH8WGs7035bv
 VexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032759; x=1760637559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJonn1UQmdMquLncDUtZUHutcCuWRZij3zF+8bzYpyM=;
 b=hbDpnH+vutsyGP2MLnuzeSR06sZ3pG7WMY3VplavMWpM3oDsSYfOjLs8Qh3biQe/7O
 a98+Jedz6tLgytcBlX9z+74rfO4P/3CiPblcfPcx4UQq5j6lj/taE9VYcrM74x6ZqlOA
 ay2NVzHfqPMi9Jio1IsTljpChDxzEu1++VG00502STzHSpLoVkULMJzj3wu1v7pQQtww
 3MFgqAFGZM54xHnJVqr355tLadfhPQvRlLnD3+alKiaS1o7KMk6siSwr5BP8S8aRWGIJ
 Zo52xMS7xhdskJbG+p1cvA4QYjHOd3rGI1yiYMiQiCdSLpJrODO92lUXvjDjzqZPQzip
 4J3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq8/tMPSzouoosuMhb1eTc7pzzuU63D+3k7oxpeyJdiZO9FnoV2a0SVDGxIXHC4GsPQWME6wleVgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGeJlGE6Od0+5+tckWT7mX5VjZKTVI04puWC8NO1DZxkas5Hum
 yp+sKlFYC6H2O8uyvZjs41MTOvztOAAeEhz8qK6pQa82V0D3arayDSWX
X-Gm-Gg: ASbGncvGlGZJeKpDAN5wlfCeQpOVfQ07t1N5ZulmBFoKGK6skIADMFCulHfhHssRBoZ
 w0oCDmNYJVSVIIU/hI1bTu8VhvixNorO7/onAaa6y+tDcKKcu35oUNioJm8bzv+JkJQa/rWKiaK
 PEt0HMRL80rnNNEue3gZOX+qH6YLtS6lkHJgEphi2uDB5bM0mTw49FUPtEcAXtDUY6AEqjIJZLV
 XcR8AZJSzT3g500zPw/zM4UGzqposEEQ5JglpLemfk7se4dtojZVhWXRWAt8B0S3hJwxBfBJJMG
 Zego75CqRTImISGr9rrw+TLYIm6wC8+XTtJA80fvn+5Fd4p4o8rFvD1AuMLHwZ2mp6PgWqc8lJX
 ITxXw1bYWXKx1xcopynuxMrFTWCAl2JJ96nJcgpeHiWbuT/o3GAfsElr6qiuoiYjSqDLb3DDQgq
 yRb3Ozu44Itix+sRTrTh/4o0eb8+sZRI1Epwf5vw==
X-Google-Smtp-Source: AGHT+IHVKXFMusdqiPmDW/wzqUDYexOwse+E0pYDfFVpPjytm/THWwTC1XlwfHUx8Qo1uHRSZGwKQQ==
X-Received: by 2002:a05:6e02:2489:b0:42f:9649:56b4 with SMTP id
 e9e14a558f8ab-42f96495934mr16480345ab.13.1760032758628; 
 Thu, 09 Oct 2025 10:59:18 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 29/30] dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(clname,
 _base)
Date: Thu,  9 Oct 2025 11:58:33 -0600
Message-ID: <20251009175834.1024308-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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

The @_base parameter in @DYNAMIC_DEBUG_CLASSMAP_DEFINE exists to
de-conflict a second classmap definition from a first, by setting
different .class_id constants for all of the second map's pr_debug
callsites.

This gives the same _base param, and thus more flexible usage via
@DYNAMIC_DEBUG_CLASSMAP_USE_(clname,_base).  So now 2nd classmap used
can be deconflicted from the 1st used or defined.

1st the range-checking logic is refined into two distinct macros,
@ddebug_class_map_in_range() and @ddebug_class_user_in_range(), which
are then applied to the lookup functions: @ddebug_find_valid_class(),
@ddebug_find_map_by_class_id(), and @ddebug_class_name().

@DYNAMIC_DEBUG_CLASSMAP_USE* macro API kdoc is adjusted accordingly.

TODO: This is just an api placeholder, it anticipates a possible need
that may never arise.  The normal way to add a new classmap to a drm
driver would be to define the enum to avoid DRM_UT_CORE..RES vals.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 28 ++++++++++++++++++++++------
 lib/dynamic_debug.c           | 21 +++++++++++++--------
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 588e03e8d157..d1e38158c485 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -87,7 +87,7 @@ struct _ddebug_class_map {
 struct _ddebug_class_user {
 	char *mod_name;
 	struct _ddebug_class_map *map;
-	const int base;		/* user offset to re-number the used map */
+	const int base;		/* offset .class_id range to share space */
 };
 
 /*
@@ -235,15 +235,31 @@ struct _ddebug_class_param {
 /**
  * DYNAMIC_DEBUG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
  * @_var: name of the exported classmap var
- * @_not_yet: _base-like, but applies only to this USEr. (if needed)
  *
  * This tells dyndbg that the module has prdbgs with classids defined
  * in the named classmap.  This qualifies "class NAME" >controls on
- * the user module, and ignores unknown names.
+ * the user module, and ignores unknown names. This is a wrapper for
+ * DYNAMIC_DEBUG_CLASSMAP_USE_() with a base offset of 0.
  */
-#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)				\
-	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0, __UNIQUE_ID(_ddebug_class_user))
-#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _base, _uname)		\
+#define DYNAMIC_DEBUG_CLASSMAP_USE(_var) \
+	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0)
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_USE_ - refer to a classmap with a manual offset.
+ * @_var:   name of the exported classmap var to use.
+ * @_base:  an integer offset to add to the class IDs of the used map.
+ *
+ * This is an extended version of DYNAMIC_DEBUG_CLASSMAP_USE(). It should
+ * be used to resolve class ID conflicts when a module uses multiple
+ * classmaps that have overlapping ID ranges.
+ *
+ * The final class IDs for the used map will be calculated as:
+ * original_map_base + class_index + @_base.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _base)			\
+	__DYNAMIC_DEBUG_CLASSMAP_USE(_var, _base, __UNIQUE_ID(_ddebug_class_user))
+
+#define __DYNAMIC_DEBUG_CLASSMAP_USE(_var, _base, _uname)		\
 	extern struct _ddebug_class_map _var;				\
 	static struct _ddebug_class_user __aligned(8) __used		\
 	__section("__dyndbg_class_users") _uname = {			\
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6e0c978bc7c4..68bd2dbdacfb 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -169,6 +169,12 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  _di->users.len);					\
 	})
 
+#define ddebug_class_map_in_range(id, map) \
+	((id) >= (map)->base && (id) < (map)->base + (map)->length)
+#define ddebug_class_user_in_range(id, user) \
+	((id) >= ((user)->map->base + (user)->base) && \
+	 (id) < ((user)->map->base + (user)->base + (user)->map->length))
+
 static struct _ddebug_class_map *
 ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class, int *class_id)
 {
@@ -189,7 +195,7 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 		if (idx >= 0) {
 			vpr_di_info(di, "class-ref: %s -> %s.%s ",
 				    cli->mod_name, cli->map->mod_name, query_class);
-			*class_id = idx + cli->map->base;
+			*class_id = idx + cli->map->base + cli->base;
 			return cli->map;
 		}
 	}
@@ -197,8 +203,7 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
 }
 
-#define class_in_range(class_id, map)					\
-	(class_id >= map->base && class_id < map->base + map->length)
+
 
 static struct _ddebug_class_map *
 ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
@@ -208,11 +213,11 @@ ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (class_in_range(class_id, map))
+		if (ddebug_class_map_in_range(class_id, map))
 			return map;
 
 	for_subvec(i, cli, di, users)
-		if (class_in_range(class_id, cli->map))
+		if (ddebug_class_user_in_range(class_id, cli))
 			return cli->map;
 
 	return NULL;
@@ -1146,12 +1151,12 @@ static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (class_in_range(dp->class_id, map))
+		if (ddebug_class_map_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
 	for_subvec(i, cli, di, users)
-		if (class_in_range(dp->class_id, cli->map))
-			return cli->map->class_names[dp->class_id - cli->map->base];
+		if (ddebug_class_user_in_range(dp->class_id, cli))
+			return cli->map->class_names[dp->class_id - cli->map->base - cli->base];
 
 	return NULL;
 }
-- 
2.51.0

