Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33D1933116
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925FA10E881;
	Tue, 16 Jul 2024 19:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SJ5oqHMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B15310E82A;
 Tue, 16 Jul 2024 18:58:49 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-8063553b837so4000039f.1; 
 Tue, 16 Jul 2024 11:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156328; x=1721761128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkFYDr1/VaUp9nR5GtDe+QedLaRcp6UcXGPB2Rd9f4k=;
 b=SJ5oqHMHnezQZMA5/iehiJvuBQ6KPcCOOdkSIUuOBk19grC17IodBVllo7rAFENsor
 rGkv0Na13s+gnZaBmGfdYz9/d3+KMW84FyBhWC84VbOnwukNl6PDaDx/8enKEClWlkFC
 AaBQ1ZuUYPdSk9t5J/QJRfHTIiK5isFWLgN0LhVnuwwG9g0TL7URmhjc6GKgPZyYAE/u
 iwP6X3V9jgNy7HLKuoqDZ671+TVNYrNrxPGo6aj/kcohohUNsYH3vnnnN7R04/+G/U9d
 gbzjybGnNfuMHLIAuitu76XefFbP5DD4K4r0UTviuensufvhRW2Ss5ZLkqC3fTlD0iK/
 3wjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156328; x=1721761128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkFYDr1/VaUp9nR5GtDe+QedLaRcp6UcXGPB2Rd9f4k=;
 b=fus+HoD62NxIX7iqLbGpyaDXrhnzXo4AKOz4Xv9CafIkoAUF1R9eygOxX/DbQF8M28
 vYxI7oDVrq7/hBPxCAfzQqaIJWI3uHFuAkBmPBvy1uH+ADGjr7gxVbQCR097Yf6WuXRg
 Fg1FC5dpxqZPyW0mK+uFM0q/itw27dF9iyaWGEQO1IOeaQNwr1zlRr3Uh0sVSRwSaxsO
 nfwY2H9DDeSzJcYLZI5y2mnY8n6qLWdWTVouoFMAId+Gr2ow1aDTLHpS6Y4jnPhoOaBC
 /u6GVv4YLoBvE9p/Dv7b9Bw0xRjpXDDoQ1abUGKgrhoYqXBh/PfLcEoqqkppXGVV/29k
 4gwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5DThk4VZbNfcaFkrvu9Xpac4nIWDFZu2Sb1najq0ws2U///XP4iPo1L8XSEmQBS23tRRTcxnYPwTnSrwe6C2lN1+63sl+jMzUmE1JnykcATtilY4undcrX/F/Uq/yVXf7hZNkK5SM0UAKOjR9wz5Bw5yoThk8rqCK9qAo2G0P4sDAXepZMt9rMHJuLMoMkIMrCkijn0gjIUWRacxFYpc1V8ZT2/qSxxnQzWRFPpOTc6rnffc=
X-Gm-Message-State: AOJu0YxoKK8v3CDm7bTKSCtm0SxWeLTs14aDEAvpTaNcZTonuSMcsTV6
 kt4aZpkXrCco57pT/sn4Rqk78IJqy/tl8dY3PSGEiEMF0jmyPhtb
X-Google-Smtp-Source: AGHT+IEDXU829hTYXjpQpLIXYUbB2ymJ2g2HpirLkcPY0d/I9d3Q+7hGqbny6/SZBNd7qQlx61Y+GQ==
X-Received: by 2002:a05:6602:154a:b0:804:c529:8601 with SMTP id
 ca18e2360f4ac-816c2dfb0e5mr47126939f.3.1721156328275; 
 Tue, 16 Jul 2024 11:58:48 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:47 -0700 (PDT)
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
Subject: [PATCH v9-resend 18/54] dyndbg-doc: add classmap info to howto
Date: Tue, 16 Jul 2024 12:57:30 -0600
Message-ID: <20240716185806.1572048-19-jim.cromie@gmail.com>
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

Describe the 3 API macros providing dynamic_debug's classmaps

DYNDBG_CLASSMAP_DEFINE - create, exports a module's classmap
DYNDBG_CLASSMAP_USE    - refer to exported map
DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5 adjustments per Randy Dunlap
v7 checkpatch fixes
v8 more
---
 .../admin-guide/dynamic-debug-howto.rst       | 63 ++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 6a8ce5a34382..742eb4230c6e 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -225,7 +225,6 @@ the ``p`` flag has meaning, other flags are ignored.
 Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-fslmpt``.
 
-
 Debug messages during Boot Process
 ==================================
 
@@ -375,3 +374,65 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug classmaps
+=======================
+
+Dyndbg allows selection/grouping of *prdbg* callsites using structural
+info: module, file, function, line.  Classmaps allow authors to add
+their own domain-oriented groupings using class-names.  Classmaps are
+exported, so they referencable from other modules.
+
+  # enable classes individually
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+The "class FOO" syntax protects class'd prdbgs from generic overwrite::
+
+  # IOW this doesn't wipe any DRM.debug settings
+  :#> ddcmd -p
+
+To support the DRM.debug parameter, DYNDBG_CLASSMAP_PARAM* updates all
+classes in a classmap, mapping param-bits 0..N onto the classes:
+DRM_UT_<*> for the DRM use-case.
+
+Dynamic Debug Classmap API
+==========================
+
+DYNDBG_CLASSMAP_DEFINE - modules use this to create classmaps, naming
+each of the classes (stringified enum-symbols: "DRM_UT_<*>"), and
+type, and mapping the class-names to consecutive _class_ids.
+
+By doing so, modules tell dyndbg that they have prdbgs with those
+class_ids, and they authorize dyndbg to accept "class FOO" for the
+module defining the classmap, and its contained classnames.
+
+DYNDBG_CLASSMAP_USE - drm drivers invoke this to ref the CLASSMAP that
+drm DEFINEs.  This shares the classmap definition, and authorizes
+dyndbg to apply changes to the user module's class'd pr_debugs.  It
+also tells dyndbg how to initialize the user's prdbgs at modprobe,
+based upon the current setting of the parent's controlling param.
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNDBG_CLASSMAP_PARAM - modelled after module_param_cb, it refers to a
+DEFINEd classmap, and associates it to the param's data-store.  This
+state is then applied to DEFINEr and USEr modules when they're modprobed.
+
+This interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself.
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they share the limited 0..62 per-module-group
+_class_id range, without overlap.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.45.2

