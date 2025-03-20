Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14925A6AD74
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9875310E6C8;
	Thu, 20 Mar 2025 18:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FW4+qqHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FFD10E698;
 Thu, 20 Mar 2025 18:53:12 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-85b43b60b6bso41386639f.0; 
 Thu, 20 Mar 2025 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496792; x=1743101592; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTvJV6QS5TSCdXLFqdRdaWDLgeOVU3a+oqnRdZ34+Qg=;
 b=FW4+qqHPRW2ggQcQ57ukRpLXzAmEgx560MjpoMTR7hl+beivKZDCsU+Z1g4hJSLVlq
 1GJA6GdakbdkCOhaEmGq/XzavnHCAiL9KmgJDenKaCNcMNyB/MU8zV50A+wk6WqQ0qEi
 dum0zLqhLqVGbEaES+XOGf2gfDhOEeSSVBmN+BPCGKDPR3llC7osH0tnR022PlS4kgy5
 oO+rFK9n86jQkIhCMZRWAnlVr7lAYcs0MttBHPaWAM1cBGa4WabZToFCbdoNz/f82teV
 jvPiYDlyv1kZ9dAwE/EkJeOPpZMvlIbwAM1zuuvfiQ9BVaDYHu8v+ofjiK+SkQkhpNbl
 g46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496792; x=1743101592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTvJV6QS5TSCdXLFqdRdaWDLgeOVU3a+oqnRdZ34+Qg=;
 b=BanBhRP6gwox/3U5Kn0lK5NwpYAvpRQvA51kHC/wDYF0492x/gDjaFrRlmEk4opov3
 izyUh+Nrp4cEOaWB16GCWM0LmKCTsbyjQ+6NrwAWMvGmF/FmPG83n6xFDnOuKI5VEbpP
 OE+cqb0ktz43TLRTFLXelpYXzrCY6gJPi4mTYJLQ2M3gstPih03QGkQbfNN7KcpIAUOX
 6Z3y1bU4faNVE+nlbDA/8QXJfOXPiSifA06OCOrtu5Vuk75Shp3ALhizHwDO9EJm/Cqa
 DDUP0Imi2YX2prTPAnUacPvHpra1PG2NT1/dayu0cDovCnZ2BFqCJqgJOA6hFjxxQRCD
 L6nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJsOCzjSBVd9l0Z4C3QCgOVIdQyv0x22iPPJfGNpSBIQcw0bNWhIf6PlytS43KdERwugmHNN0m@lists.freedesktop.org,
 AJvYcCWBolmzwO4iLGfpQBjTE2cjF4n3n3SRi2jUCQDd/5QkkRoWLO0D1EEoRBIMBsbv63UT2LTmXnEdz9gU@lists.freedesktop.org,
 AJvYcCWSLB4X/dy4XJ9YMyXBqW0hS09zQL2KP74unSXT6dnyyHtkgLJ3ZoQvP30DLZRwoo9GVecps0RtEH1pGNqdeQ==@lists.freedesktop.org,
 AJvYcCXXvOUq2U6eTkTuQfjqQ6V5KfrRFbS9wFS9Kdr4cAnMh8lRaNsTkUap15xIqgB/jrO8mt7YNzIQA2Kf@lists.freedesktop.org,
 AJvYcCXhEtPcuv2/sFOTgD7ZPynl86z77CkL1K8tsLGkeuUfw86ftjJBvlli8280faYIWpdVxuZH+o6d1L1PWHB2dyJIgA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ4rHQsP6AI8il1lRXZSXN9Gt4qM7NCjErgdD1BJThPhqVxqUK
 Lhtm/6odo8297b7xZca8+RRViLUdV2rNkKdrfYriaajrbg/A8fWn
X-Gm-Gg: ASbGncvNuDN8j0gT5hOSWXxUUQzpJkw2u1XG52BEWMhxoWqnw04P/tW/Ubzc4xSmUom
 S6WRdL9Onz9E7OcWCYV5MvF+nEb4glbgRc/K+WIYBMxywC3JInuioIBqfs5Eh48bq19EVX8zoYJ
 IpV8P4Y3GyYxTSvkFkvyphU7N0CkDX7k7z/lZy0nOzl2Q8SQGjB2JvP1+NifpqIl/2T6g/REtaU
 rvsyKHaIPyAgZGZbTfgw7oHgxyO5pnSrD8CQ1L89cildee9cLEvShzTvc3uVYPqa0CKEI91XskS
 nUw7IJqKoZu4F/tNV3eCbfKmj8HMac7oUsGloOf2TPvODqa4sOkqgNiInlgxu6mKATm/eEYhQBT
 NuQ==
X-Google-Smtp-Source: AGHT+IFTm9Zlgpvi08G4P5p/+bcibqVl4sDZN0j3q0oWcNr2hmLwfea3pde9nvTR9c8Y2yKOoouONg==
X-Received: by 2002:a05:6602:3a13:b0:85b:4d78:cfe7 with SMTP id
 ca18e2360f4ac-85e2bec5c71mr92422239f.4.1742496791700; 
 Thu, 20 Mar 2025 11:53:11 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 09/59] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Thu, 20 Mar 2025 12:51:47 -0600
Message-ID: <20250320185238.447458-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 4b001309bb6a..dd7320b9616d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -595,7 +595,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -604,12 +605,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
-		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
+		if (test_bit(bi, new_bits) == test_bit(bi, &old_bits))
 			continue;
 
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
@@ -621,9 +622,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
@@ -679,7 +680,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -689,7 +690,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -743,7 +744,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, modnm);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, modnm);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -756,7 +757,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, modnm);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.49.0

