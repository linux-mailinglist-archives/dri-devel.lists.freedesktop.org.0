Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D369330D7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A9510E846;
	Tue, 16 Jul 2024 18:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UOBeey8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CBB10E82A;
 Tue, 16 Jul 2024 18:58:27 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-7fedb09357aso5196139f.2; 
 Tue, 16 Jul 2024 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156306; x=1721761106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mgKlPNiKWVnT1pPVJRogWWF3tyIXWVHBmJ5ag9aE+c4=;
 b=UOBeey8P94mimQC177jMpQS2c0QqSPufjTR9z7LHjr/zgnTtqOHAVPFy0SLF81573I
 +r0y1c0u8+iiCDh3WLw/34sx3iAUSpiCgTaaqQYUd39nxY/l7eW3kgBQbgJsP+0cBpDy
 tBO2gwXBef4HBCyEZXL9N+6NS2LnbVtV7i9FNjhZgpqCwOls4v55EHMcTqwQtVuorJAb
 mOfHZ4cxkHgf7lUbNG8SIxDUH7t0cnaoGBXCbXnVQNTUZTOGsxob1kfwix78IIPqlhvo
 whXdq+83LDvYNhceNteNoY/gvcLjKBKNbDLuZpXQKQpjSQcbjJjP6IoyVRxAG5tB1vSI
 rXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156306; x=1721761106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mgKlPNiKWVnT1pPVJRogWWF3tyIXWVHBmJ5ag9aE+c4=;
 b=uGz7pnWNFhtCUFlsEhEnkmYTcLnqiNhjyBZStqOLHARIRchKNSmsvZWzVI2Xc6A5Tc
 N9lNGCbKxON3ykvw5FHo0q7uxfampQPz0I0MOb83KleghZ1GYRVCuHTLRxAp0QrdyoQW
 SfLSw1IQwpPjOxHt9k9EpfCF5R7flvUq8hXTZTGotrGndJLoh1HBXvrZJ62CytfnVkl6
 LlNNohEqwene9oTUns7WN9z0qM8QVqyleQXKEBrHXE96q2HZdmaIqAPUKciSIqEmIQp9
 8wYyMmEZvIefKBrpgc6V4lXicizyRZD8tpMiID9SX86L4wNmgNU9jH/p3+eMn2vXyj64
 C2pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2fHvCGGcUu2W8V1B422JljmSpjsubmsMVAr4QJpoIq5E692x1mmkWTwa1O4Qrl6TloR9lId2m3rleYJKIajMvvYNBIM/bcpawUy/Mf7oXUkjAUsPkjxItpOGJ2hvqVrZMwkX0bUNJsCRhldxLoVp4A1U4N1fXcgKw14ijKdXPJyUU+rlYmRz/HFFW9f7h95WPPxm9iaq/TolLDc/nY6j1eFzsmoFG4LP1Xl1jqaDtilde8fM=
X-Gm-Message-State: AOJu0YwOV0pv2m8j1euFj3mEy495xebByHG/iqIP77cMdMkwMv2zJg/v
 wiyVpkrjMyrm58KmlWIQClWGjqbv73pztBW5It9rnlZtyX2d914R
X-Google-Smtp-Source: AGHT+IFRmNckkjQyPTVfVxjCsaJMm6za2ny8WaaVkqbSQmHgJS9XbrIwtq9t8iiqyHlZ74DkBNTv6Q==
X-Received: by 2002:a05:6602:26c1:b0:7fa:8178:d672 with SMTP id
 ca18e2360f4ac-816c2a1fd63mr52960539f.4.1721156306300; 
 Tue, 16 Jul 2024 11:58:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:25 -0700 (PDT)
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
Subject: [PATCH v9-resend 06/54] dyndbg: ddebug_apply_class_bitmap - add
 module arg, select on it
Date: Tue, 16 Jul 2024 12:57:18 -0600
Message-ID: <20240716185806.1572048-7-jim.cromie@gmail.com>
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

Add param: query_module to ddebug_apply_class_bitmap(), and pass it
thru to _ddebug_queries(), replacing NULL with query_module.  This
allows its caller to update just one module, or all (as currently).

We'll use this later to propagate drm.debug to each USEr as they're
modprobed.

No functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---

after `modprobe i915`, heres the module dependencies,
though not all on drm.debug.

bash-5.2# lsmod
Module                  Size  Used by
i915                 3133440  0
drm_buddy              20480  1 i915
ttm                    90112  1 i915
i2c_algo_bit           16384  1 i915
video                  61440  1 i915
wmi                    32768  1 video
drm_display_helper    200704  1 i915
drm_kms_helper        208896  2 drm_display_helper,i915
drm                   606208  5 drm_kms_helper,drm_display_helper,drm_buddy,i915,ttm
cec                    57344  2 drm_display_helper,i915
---
 lib/dynamic_debug.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 46e4cdd8e6be..a1fd2e9dbafb 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -605,7 +605,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new bitmap to the sys-knob's current bit-state */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits)
+				     unsigned long *new_bits, unsigned long *old_bits,
+				     const char *query_modname)
 {
 #define QUERY_SIZE 128
 	char query[QUERY_SIZE];
@@ -613,7 +614,8 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
+		  query_modname ?: "");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -622,12 +624,15 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
 			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
 
-		ct = ddebug_exec_queries(query, NULL);
+		ct = ddebug_exec_queries(query, query_modname);
 		matches += ct;
 
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
+		  query_modname ?: "");
+
 	return matches;
 }
 
@@ -682,7 +687,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -692,7 +697,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -755,7 +760,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, NULL);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -768,7 +773,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, NULL);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.45.2

