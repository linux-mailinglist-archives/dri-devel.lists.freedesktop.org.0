Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1D8B622D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A248A10FB77;
	Mon, 29 Apr 2024 19:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XqQ+c4KM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B753210FF7A;
 Mon, 29 Apr 2024 19:32:22 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7d6ad896c6dso215362039f.1; 
 Mon, 29 Apr 2024 12:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419142; x=1715023942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ri83bb6oyLyojLzmXoS5Sm7yzWutd/S2ODfs8cE/PMw=;
 b=XqQ+c4KME5Dbthwwo/myOHdR4WR87uUmdNLUJ+qKWtA7QIafaCF7C3DobZsvAL6Atp
 fvucvBjv/axwjsuT5kOotfaAhg53aOE9//FeoASkcH5kC/hYiQFtI074+2QfJ/NEz9kd
 /1uIcEJZz9AxBz1pTnbhb8HS9YtSRp2T83HqVgFzAH4Or/XfG2dVZSw43IBeENWjHtUM
 2ySf1318dgOoXNor5r+2/2YEonOa+ZdldLPPdQXlLobN73YfYLj1+dVmLiQGnwQUKEom
 ey5y7eW256NELpHjYcpl21yhbXnU8Vi3SwdMOpZ6fhB8d2aIYVMUiEaIHsuPPFeohxH3
 7Lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419142; x=1715023942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ri83bb6oyLyojLzmXoS5Sm7yzWutd/S2ODfs8cE/PMw=;
 b=eC22WEvurdXUkJoMUx7re1kelFisJA4Qsy8FXBp1jiA8Q0tZxbFFpgG5CppJWNmdl3
 FrOP8UrwcqIRgBUkhipiB0bKzBY1Wz29BahHMKNcEK5sEN8t5SNjdG70hraMEQPnTwuP
 iDSf2YeGbEQcK6VlecEHLqVQLEWKXjNkwyRixeycIgPQkx+LnezEsnaVOyadwyQwP2rw
 MpQJDi3uxkLRK2z44t88P60Rrgiu0/czI6cBzc4Mrg1gRwBqje6tT33aJVl1OdRBxE6G
 o/5/Bx0S7ROKyKY1AByg+UFtXzPaGV2dMQJkxYUNMpS710QwCciXWz4uIL+rrbtheGMs
 Gy+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYQrxwc0Gd6H3WYx6RAZvrnE3zqhqPQbOEFWrQE96K4EFwycO8YCfEbebVjtXL2aGWIMP84i6ONdj73RQ2TomEqAJdVDN1Jncnjr/3zJVO30c7kTaFP5U2iMa4qzyxMOZN57MuhrPdYMm+4Ot/zSraA/5TMGko9rrQDeSlKqFuwO033f+DbzHK5bAmfWr3d+5pMNpP7KFR6GZvMQGKl0HeNfMEIXPmMpKijF9QHFLZZiX3vU8=
X-Gm-Message-State: AOJu0YwjMrs2Kqtn6w4oErGs/7nHjT7i2jnzZ8qaEoh33cxu2kJ0SiYC
 lsCzJniUpE825C2sZEHwnIvGAOphYJ/a3eUol0d/HPEdzqAjHZI5qshbM7Nt
X-Google-Smtp-Source: AGHT+IH7L9iz/DEu5n/0SdbAq8tqvCL5guAdpohYvgpP3KLiQ+nIg6zPIVZaEFBq7zLzebD/k1+gdw==
X-Received: by 2002:a6b:7414:0:b0:7de:ba89:afb4 with SMTP id
 s20-20020a6b7414000000b007deba89afb4mr8711060iog.1.1714419141923; 
 Mon, 29 Apr 2024 12:32:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:21 -0700 (PDT)
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
Subject: [PATCH v8 08/35] dyndbg: split param_set_dyndbg_classes to _module &
 wrapper fns
Date: Mon, 29 Apr 2024 13:31:18 -0600
Message-ID: <20240429193145.66543-9-jim.cromie@gmail.com>
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

Split api-fn: param_set_dyndbg_classes(), adding modname param and
passing NULL in from api-fn.

The new arg allows caller to specify that only one module is affected
by a prdbgs update.  This selectivity will be used later to narrow the
scope of changes made.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a1fd2e9dbafb..4a48f830507f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -711,18 +711,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 	return 0;
 }
 
-/**
- * param_set_dyndbg_classes - class FOO >control
- * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
- *
- * Enable/disable prdbgs by their class, as given in the arguments to
- * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
- * levels by bitpos.
- *
- * Returns: 0 or <0 if error.
- */
-int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+static int param_set_dyndbg_module_classes(const char *instr,
+					   const struct kernel_param *kp,
+					   const char *modnm)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -759,8 +750,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, NULL);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, modnm);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -773,7 +764,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, NULL);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -782,6 +773,22 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+
+/**
+ * param_set_dyndbg_classes - class FOO >control
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * Enable/disable prdbgs by their class, as given in the arguments to
+ * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
+ * levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	return param_set_dyndbg_module_classes(instr, kp, NULL);
+}
 EXPORT_SYMBOL(param_set_dyndbg_classes);
 
 /**
-- 
2.44.0

