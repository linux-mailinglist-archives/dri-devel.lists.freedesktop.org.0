Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DBE924A49
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A01410E6C4;
	Tue,  2 Jul 2024 21:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XLCuaEgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C7110E6BE;
 Tue,  2 Jul 2024 21:58:23 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7eba486df76so855839f.0; 
 Tue, 02 Jul 2024 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957503; x=1720562303; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6xZzQ/E3vZK+E5MMlKfK/qTb5+sylxnNOul573hVp9Y=;
 b=XLCuaEgn0PUAp4oi4bkAMvDJFVGgFu99WviNuaOjHHFrWM98ZFhDsiaMFaGwfDb9it
 ApwGmtO7EeyNzNk0lJQgu8WexVMFuli+3AnlmlHESdoI1PkesFX3DJChQ11B6nZBg736
 7wLAzLUZuerQ8hc9CazOGH4h/Jx3zhkD9cEYot5xVeBjYySDPOV57iagu0W7VRrpt9Ad
 gckXnLAaZbjwaGk+LtcZ3fHRsIXlh9oN8c8221darDTHKJTM/W2HLV1ct9nuGIVmm1gt
 qM027z1lvddfzHTRWtxB3GIqXyECaWvMx/XAM2ILAeL9ItpF+CAs1huZKL3Uo4a1IJUS
 s7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957503; x=1720562303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6xZzQ/E3vZK+E5MMlKfK/qTb5+sylxnNOul573hVp9Y=;
 b=NQ8ws/eiWrTrK6/Ox3TKFQqzC4Bv6H9w9/K+ounScahT71xKpQo3ugTyGUyMQyNfnJ
 i19zxZ2AY9j4tngbtC6ieVCzVQpK7p+21IAGCoPJfWXOMDAUNCFrK0XtjbcsHKvuYA76
 mPHUniTo1fc9eERAOjzN1yYJ6O3aCcq2W6EOU3elnw9HtirFApspGfYPgiFYKOD7ezZ2
 1LGqIHqsmoxsPOKwYjJZQH8cIxYc41UnrrZw5IhdcTRUBqV8F6mn9qWWhIoIliT/z7bN
 llp8Alu8BOwHB+NlgT5+SZq6WoEc3J0dgAGTM9SHu4Dz6hP2ZvwrIZmw+5MFGTg99QB/
 ecHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT4knVmZzxYxt17LsCf/XjRpfCpzGNuH7rbwuseEInLMyt3D1ZfGwvetx2efdFUAvxLxRdePmDbix5Vmk6rmjssPQ/RmWYHjvGr+OdUlORB06hOqpTC6wRor7RVrQBtDQk6pozbTowol+LiFzccpAUmt/ucBZHjVyEuKYNRa/q08N93udA1XQi48Q58A3xeZroxCwjA8hMjTZG04WRvsN9GXI6xgrfcmeln1iEMgWHeB8MioA=
X-Gm-Message-State: AOJu0Yzfd8EvaPCTTGNhJXHJHgbBMcB+wtu1ieIZarB9CbSUK/Xd1Iae
 ZjQtrMJp+/0jLcKNmNefuMrKa2wGat+Gzf6q2hoHXrzsYRC5DUOS
X-Google-Smtp-Source: AGHT+IGYdWlTTC7TRfqgE6BZNMFEtFIymMFnXp3OmPzaWNa0nuspcltmmeqiu/SmLsP4XIoxiBNboQ==
X-Received: by 2002:a05:6602:178e:b0:7eb:eeba:5e83 with SMTP id
 ca18e2360f4ac-7f62eeab155mr453600539f.9.1719957502788; 
 Tue, 02 Jul 2024 14:58:22 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 07/52] dyndbg: split param_set_dyndbg_classes to _module &
 wrapper fns
Date: Tue,  2 Jul 2024 15:56:57 -0600
Message-ID: <20240702215804.2201271-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

