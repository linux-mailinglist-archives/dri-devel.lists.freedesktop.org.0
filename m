Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F27C90EE
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD96610E65E;
	Fri, 13 Oct 2023 22:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4F510E67B;
 Fri, 13 Oct 2023 22:48:52 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3512efed950so9927265ab.2; 
 Fri, 13 Oct 2023 15:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237332; x=1697842132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xt5GYS9mXBsgXWCKjkvZOfiO8j43yK6Z0bFknFJi+ls=;
 b=QpNd1UDX2oHF5jBE43mEFmPBNnYQxAuITgVTwd1BlP+ZCDAgSnyyMC9vl7nHqTXW0u
 JnIQegLpDslkuFozQsAZNV6TwdrGbnVgBu0kknL3q8dwH2cAYfJHe2EdYy5KaGX+cryY
 nrrQNoV3Rx6UEXouL7qjlabqcq9SPjeII1JzdL7INCHXMuEzR+iSSxFV0y/pRn5AnGtY
 hNgTuG+LEOfqD6bO9JZWrfRvJ8Cs7vMLxKIzfUb7OT/eB/f4fnMk3GeV2CbWzUCs8VEi
 c1Pof2YFptDqOoVod7UxKfNfL+wLCTq7h31Pem+E0jfCquKbmITPZ3VYVf2ifL9E5rhA
 nWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237332; x=1697842132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xt5GYS9mXBsgXWCKjkvZOfiO8j43yK6Z0bFknFJi+ls=;
 b=mmMoSUw6ZsOYaafIEBPWK4hhM9uOOr4/6Mn9n0qA2kOwXByQWL1xQDtCMHJmI6UjRI
 6bSYLJ3aIGk0EMW8ZYVYMyv1mc2aNa4WLR5OZHC8m7DlNnJ/KKCnPKr+/7/ySxM7v9RQ
 jDvqlFbP9k8+FN7LuAYRydJxj2xUyvZQ+irBm8ns4CNDJvPNhQgv3EAiEyfb5aMvUCmz
 Js0GrY2v0Hno9zXMyGcqdf82+fv6unrywTB+KDc4CBFCwtNZn+ej2/1M2OTadnle2F1P
 nuxRd3MRLrfylX49OVSKQwjggSixG8lJJ0JnQ6ipLNHzZIToCBAO6J+64I9J1cVJk8gy
 IqgQ==
X-Gm-Message-State: AOJu0Yy0WhbnPvcH4FKhRBzTXbhyBY2dsU58Jh1eO8PW8pvwFZxqfxQk
 5HlVZmmO3NR3pXXsIEvTkU4=
X-Google-Smtp-Source: AGHT+IGqQ1iwV3rhmpHdu75VZNFfcZihQtqNSLpY33tZ2e3fX8O3LgvYIt+m1LEyZYRdn0zTAq8rIA==
X-Received: by 2002:a92:cdac:0:b0:357:4a69:60d8 with SMTP id
 g12-20020a92cdac000000b003574a6960d8mr10470030ild.4.1697237331792; 
 Fri, 13 Oct 2023 15:48:51 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 18/25] dyndbg-doc: add classmap info to howto
Date: Fri, 13 Oct 2023 16:48:10 -0600
Message-ID: <20231013224818.3456409-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some basic info on classmap usage and api

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5- adjustments per Randy Dunlap, me
v7b- checkpatch fixes
---
 .../admin-guide/dynamic-debug-howto.rst       | 60 ++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 0b3d39c610d9..028c2cb5b4c5 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -225,7 +225,6 @@ the ``p`` flag has meaning, other flags are ignored.
 Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-fslmpt``.
 
-
 Debug messages during Boot Process
 ==================================
 
@@ -375,3 +374,62 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
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
+By doing so, modules tell dyndbg that they are have prdbgs with those
+class_ids, and they authorize dyndbg to accept "class FOO" for the
+module defining that classname.
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNDBG_CLASSMAP_PARAM - refers to a DEFINEd classmap, exposing the set
+of defined classes to manipulation as a group.  This interface
+enforces the relatedness of classes of DD_CLASS_TYPE_LEVEL_NUM typed
+classmaps; all classes are independent in the >control parser itself.
+
+DYNDBG_CLASSMAP_USE - drm drivers invoke this to ref the CLASSMAP that
+drm DEFINEs.  This shares the classmap definition, and authorizes
+dyndbg to apply changes to the user module's class'd pr_debugs.  It
+also tells dyndbg how to initialize the user's prdbgs at modprobe,
+based upon the current setting of the parent's controlling param.
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they share the limited 0..62 per-module-group
+_class_id range, without overlap.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the pr_debug callsites can be toggled into agreement with the
+param.
-- 
2.41.0

