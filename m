Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89615B191CE
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D078810E4A7;
	Sun,  3 Aug 2025 03:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jEAYq0Nx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739A810E1BA;
 Sun,  3 Aug 2025 03:58:48 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3e3fcf5b150so25030595ab.1; 
 Sat, 02 Aug 2025 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193528; x=1754798328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OuNmIbrdZwfa0pVSTeAraA+TCM/HhXLg2Msu1oHrhfo=;
 b=jEAYq0NxCw0qXom+EPpPrFKJLP9km07ebndhEX670BTIkfQthloKBgkxfrDxIrOtxM
 olAGopsRvRR/ZlI3ydxXF1LdOaAoa4kBU+k3Q4AHo8H55mEckWqchi5uiqerD4mp1laV
 DUwd+ajN8qe/L31LI81w+UwWVH+sD+e/yR/LSA2XybLmILg+LdMd76BtbtRGIcAfBToF
 MPLKbi24JpwISKZ6f8phjKbNbS+5PT2/H7oY2KyNidfollAgMEwcp4ALf7+M2qjgjDuB
 9ZcyWxSAMYwv3RRUCz4b6vpr0orXdxEiASDv0qrAW19mPcu5E1lAPa0OWyxkFNtoX4Ul
 Rrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193528; x=1754798328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OuNmIbrdZwfa0pVSTeAraA+TCM/HhXLg2Msu1oHrhfo=;
 b=KO9AY8aD9PkFP3SQSsjsx5qeoeEZCRueJASXgXRAwdeTmNQ9dRliDrSoAAULuCjTcg
 v3qSLXda+jlA3BZcLHLKj/xtsboWyji45qqAFAfUq5+awU4srRxnNE5kL6Iq0nXz9w5Y
 m58o0LMFTi2ylSi+mM0V/EH+GClT6ChO0RUWDiT6YYUOvQKQewFBcbLgey+gJx4RWRUN
 3Fsz+ahWrirGOzhXgZuw9AYp1iQmsFmiQm3dDm2rqvAe5L+HFTlB2uc2BGR1LwC7GBEr
 i98fzXA6j4KhKbNOGK+jdiU2+7VIs1CaG7Ze7YXgWmiPj+PnKq3dwFAWexlBHr0OkuTP
 c47A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw9kYkTyE1QaaqQ4/WUq61cdSXoL/RFZmSFSa9ET66WGvkCd+srUJ1Q+MHjboENfgvpzjWhPrL@lists.freedesktop.org,
 AJvYcCWFKB9ewX9QRrizrUAIpjfOKmDqIOuZz7/yiVDBFi9h1Kal4nc+05qriOtDWyz5pR9y6TtFZMzlVHdg@lists.freedesktop.org,
 AJvYcCWcLWbg0I+n1tHACOHqO9vC1PP/lMsIMz0+KlyQbH/NLdcwIcMkzpIUed6h6q6Xy0q9Bq4Pf3HJEGC2SI8PDg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVsiNgrp7wNxtDwG0ii5x5nlxOLuX276aGkUyIPyhNpi0WiuPq
 MVN/gk+5U4KVx4jXmHBlmvV1Tif43VYCA+OuCjlRgSCHNXecM6HbVuVc
X-Gm-Gg: ASbGncvSiKXNdvK5z9LXrlOVy8wxO6Ydn/fdQjZ69icrDYwfsiDVRTcIy15MtEm2j54
 u4DucRY/JHNTw2WGuCACTGcMx3rJAE12aR+9W3yDWuVCKfiifMCeoaJZETB7gFfL3Bnbg/NQJnn
 1hF1SBEGd417A3Rmh4ryTZZ98JXRWSo4ROVclFN5gsPmt5FrasEstK9o17teDag7izt1y5eA+Q6
 EPhQ+GNnvZKex4glFzzcfTlcQ+9e/O67E9Hes+weQfAdw/buw23IKwlby2sU/GTbdrP0Gup9DEU
 5yE3y8A06ZxJ6xpkQPcJziwLZi1CS2egCZtbxC56LTujqlKzOruV6AVQ4o51w8uw2Vk45ua9ugk
 YkOQaUoiRmkKi1n7+IbaJMgR/v6v2q4XpyyW1TkioOhvWUpogvLrG6XYhCo29vk1Gh8w/4X0AQt
 GGZA==
X-Google-Smtp-Source: AGHT+IGcflxY2xQddxU8v/rmDKw+QE+rWz5yIjaVEFD/GSKgriVLCHdPf305K8rfqYkhIJesD2M8sg==
X-Received: by 2002:a05:6e02:17ca:b0:3e3:ccfe:d597 with SMTP id
 e9e14a558f8ab-3e41610a07fmr100947485ab.1.1754193527658; 
 Sat, 02 Aug 2025 20:58:47 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 10/58] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Sat,  2 Aug 2025 21:57:28 -0600
Message-ID: <20250803035816.603405-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
index 96cd31c457e2e..08d095dd19ef4 100644
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
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -756,7 +757,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.50.1

