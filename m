Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3889330EB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E2B10E832;
	Tue, 16 Jul 2024 18:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9jDOf9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3FE10E2C5;
 Tue, 16 Jul 2024 18:58:28 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f684710ff5so2495239f.1; 
 Tue, 16 Jul 2024 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156307; x=1721761107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6xZzQ/E3vZK+E5MMlKfK/qTb5+sylxnNOul573hVp9Y=;
 b=I9jDOf9DnytO0NjwX2RgESoK0axdTzCFVQ+b0+ixWlxXaHThGKnJfYtw+80V1kBKEC
 Cy7TuHDUBwfAlLEuwqQ+EBbk5KfRQwcZzQ9LXH6MqMVetGx40kRMZJguRqW/iQqromuq
 x4Q0xJ7h4Vp5C+T0P4dVRsIHZtNspQpUoJugKMuO2/T4icCKFgfsQP5bLN4BeygjXE4w
 vAbMxvCjgrvXxQapk33RvSea50HMq9Lmg/7x9IUAzh0qs9JdzPFZhVDFCIWqqEVtG6L5
 Q6TWnyvpnrVfCmXCNj/RJCnsIIKCjwnjyBRcGakQ46J9/KU2+Sp/f4IVvzW4mjHuTuZf
 zsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156307; x=1721761107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6xZzQ/E3vZK+E5MMlKfK/qTb5+sylxnNOul573hVp9Y=;
 b=a/d89qvJ1rmBvp4LXPC15gW8Kp00P7j3iS/gVAHjpnAOY7V5RgsQnaLJzkssmpe0kE
 eFOK54wh2kH1FQFUNcKb4T7tFeGaEFl/0dgsgKj9hXn6vIp/VKiRgtM9gbSEdTF415ic
 LIQ1Sd8BXcswZFKIkWpNaEqTDoQ5xaGbOEnJbp1Kp+WBGWh+TNyzx4pcaVChQ2QLEd7d
 WGDgsUsQsOicJbYwpN0alAfR9trjvtuVqZahyUOoerjXzjZBLeYFROCCaIoYi3k3yfcF
 pqNOiBJeVoxqROM1/rHQasx+XbaBuCsvf4IjpE/yYNqZeJPIWI/t/W7q0nhL+31IFgdf
 sWUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJtYKKEk1rLzi2g3hbpKjAJW5mtQx5XmyH/A3100xSBVoLstq0c9o8qPYOam0BZ5ol5aFhQY7qv7SKE0Py+IWptpMoro/c7zCfTr+asNRIec68N1LpbHmiTNfvlFp1cY+7G3Rh+SGU9BVjsU4/BOrqZ7GT6JUPIrjl21+X7U7TlZhRQxDPo6Z1BzoeR4ZpjmvAkeULlmqBzXbvvTWCosdIQK6fcXK0xCA7xXuSKV5BeXpQedQ=
X-Gm-Message-State: AOJu0Yzy6HRI6ZyjiRU9bcxO+iWLnw+QBupC5z8X1Pvnm0NZ4UUiSECI
 UUq6ti3/5cKuyxJuezM29t7vQf0RJdD7FNpTUEEbMqdzz4JqBTEVNb6Cun2e
X-Google-Smtp-Source: AGHT+IFfuMTN+7knhkikS57P3DNV4ZeL623SZbQUXOKpXKyMTTpxm4y3uLOsfAj4qttEd3VwZMrCFQ==
X-Received: by 2002:a05:6602:314e:b0:7f9:c925:24cc with SMTP id
 ca18e2360f4ac-816c2926c09mr24652139f.1.1721156307440; 
 Tue, 16 Jul 2024 11:58:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:27 -0700 (PDT)
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
Subject: [PATCH v9-resend 07/54] dyndbg: split param_set_dyndbg_classes to
 _module & wrapper fns
Date: Tue, 16 Jul 2024 12:57:19 -0600
Message-ID: <20240716185806.1572048-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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
2.45.2

