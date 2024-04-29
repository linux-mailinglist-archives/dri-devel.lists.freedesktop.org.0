Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A068B6215
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556F810FF76;
	Mon, 29 Apr 2024 19:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qo3jc3Ce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E6E10FF6E;
 Mon, 29 Apr 2024 19:32:15 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7d5db134badso207092539f.2; 
 Mon, 29 Apr 2024 12:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419135; x=1715023935; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDfc87QI/eMI4MzIADapjmb72+cDPF1z6qQEsyJfsGs=;
 b=Qo3jc3Ce54oUTrJMdGCy0VeXHT60rL1VBam0QISJXh7d9lJn1keDRolM3tuF8Un+h0
 SSPcDACuiSTLlRK9fJFqL0xk7oCrZIqi498ilHH/uPln/cUgOvBNRNTu2zEkCkdt2LwQ
 6/88sDJkxSr2JosIOifBLx+8Ha2EQ36tXC5v+o7pg8XAI70CyP/Sanly4vqRIKNpTtV2
 zl3Blm2D2p3NZgD/C/ZlFi7EA54PMy872tUxnvKeT27E3xTjrdSRqMbivtT1wa9XztXk
 gxc4lDPCrOeoSmM0+xTYnCjdnW4ieBSrqfonGAbl9FYWpNSiLSOI5FZZ+zX8lN7pijpd
 Bi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419135; x=1715023935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDfc87QI/eMI4MzIADapjmb72+cDPF1z6qQEsyJfsGs=;
 b=SU0lGI6aw+W83M9gaYsxcY6Nte8jUNdG4s+8H7nwbR3pVsf+NzthuUEELyQMYy1rg/
 jFsNW/DwvTJX2iJGzdjVEdryVEJGUy/xe4ElmCbWfJbbzg95aYpb0iRL6+U+c6reXLAe
 cL332tv20StfpBmYuwcEu5HGx7AqM2LIdMwdtS7Nse18v3Pqoz+NJvMB5UEtL0M4XZc1
 PWQkqHQbANLjxZ1Hyya8kFd2Brac/NY5fuxWS4TnZFh/UE4RHrbczvmZYMxiOs9ORhfG
 HNGZE08ufu8jXt55xT7l208EWes9+4IrMs+klICQmQIHxRIvbzg5LEwKaDHu453jgIuh
 wprg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlxxmcBlQSffobH4qHHGa6SULmX+TnuuZj+WXj0PBwbbY/NmxSROGpsJKZhr7rsdT7qDapC02mo4QxEPkOo5QkLd9alvjt6bw3hZX+10TD8cvofvhnsjlEZAXiV+Eg+Q3KQeA/rqtXMndwQeJfOzCocTLwvuM8EOWuaz17R739kZ+s+QJikDRTmSwoTb1tKfHxWT4MuC3l3zKsOdwcIzMQdZeHeNVATFir6wlGrNgSkpm7bBM=
X-Gm-Message-State: AOJu0YxGN+aXMJfCOx3WwX0aEftWCgdRqV567XGg0ayCGjw3gwajVfnd
 f6rUp4u1ZyU85qIdaq6Li/ud/5cHBn9wCj0o/X1V7GZPdpi+GzOS
X-Google-Smtp-Source: AGHT+IFCpqSCEP95iURCr0k1lU6JUePJS0EaRN/GAVW2aKwBMyed7xyc65n15xF4Y5xyFvKbGHsOVw==
X-Received: by 2002:a6b:f715:0:b0:7da:109d:1b84 with SMTP id
 k21-20020a6bf715000000b007da109d1b84mr13383318iog.12.1714419134673; 
 Mon, 29 Apr 2024 12:32:14 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:14 -0700 (PDT)
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
Subject: [PATCH v8 03/35] test-dyndbg: fixup CLASSMAP usage error
Date: Mon, 29 Apr 2024 13:31:13 -0600
Message-ID: <20240429193145.66543-4-jim.cromie@gmail.com>
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

A more careful reading of logging output from test_dynamic_debug.ko
reveals:

lib/test_dynamic_debug.c:103 [test_dynamic_debug]do_cats =pmf "doing categories\n"
lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, 105,106 have LOW/MID and MID/HI skew.

The enum's 1st val (explicitly initialized) was wrong; it must be
_base, not _base+1 (a DECLARE_DYNDBG_CLASSMAP param).  So the last
enumeration exceeded the range of mapped class-id's, which triggered
the "class unknown" report.  I coded in an error, intending to verify
err detection, then forgot, and missed that it was there.

So this patch fixes a bad usage of DECLARE_DYNDBG_CLASSMAP(), showing
that it is too error-prone.  As noted in test-mod comments:

 * Using the CLASSMAP api:
 * - classmaps must have corresponding enum
 * - enum symbols must match/correlate with class-name strings in the map.
 * - base must equal enum's 1st value
 * - multiple maps must set their base to share the 0-62 class_id space !!

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 8dd250ad022b..a01f0193a419 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.44.0

