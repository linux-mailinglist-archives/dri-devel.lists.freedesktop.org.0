Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D66076C11E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F00E10E475;
	Tue,  1 Aug 2023 23:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FA110E46A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:55 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3490eacf4d5so19772515ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932955; x=1691537755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ze9i2qKARfE+n/TtH/NPRyQgFJGgqGvUPk5SLhnzcWg=;
 b=q51jBeeZrtoJQb8aQCjw0HjL2B2GU9Jjjr1FyWz0vTSgJltC2FiU9oEFR264hJhVt0
 hXcFVOdHCnQDfbyUmLw9XbrZThD90Ulfb89m4H682+cj54Xw8Tcddl5wywkEKeSEAxOa
 owXvz+rTvz6aHyMBHGxez7GFKKKz16gsiUhp5hh34ideIPAy4/fmsVI5KHMXX4/B2ExJ
 zryqQvAo8aruhcYIKxC3GMtqOmuYKGoIWJORNjNb/qYDB8mvi28UV+vdaoke0ryeb9DD
 h9rR60wtWH2LyH8mCAB6/whQFsVJ3YQ9e6PxMjlZmku7uIULFhOma7G6043SGTRy6CSw
 mTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932955; x=1691537755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ze9i2qKARfE+n/TtH/NPRyQgFJGgqGvUPk5SLhnzcWg=;
 b=aeIDpbRNML7K+1GF+o5XzQjzWiP2vlJWjwxWrBxdzxOgQ4NUhFy5gahIwTbk3gKQJo
 EhEbSHKEwKVMkGg7QgdHP/F8fJnnzBVXlgN509TO4eTH/Z9D9oAb+5rzuVCXRIG1TtGL
 edDjTzPiMRF5GSjUkMEinVmjDt8JlclPIVlFgjR4LhfE9Sa2zCWR+mpVFhVioQJs2eIP
 4hT4yLn+srcnrq8W1GzI8IULbbRpkM1admYQmzYm827spCbXWbEz9BsrLrlQ1opHTeGY
 lzmS9afRjfwZvgPblgXCL4WPAW9er/OWMJsSTsSL9lzKl5dO5ym3RHFSYMTf2KFhKAJr
 uSEg==
X-Gm-Message-State: ABy/qLZWZZknsFv829eJDnq5/L1nae2861GvtGi7Fli+2Zybq5wIh6KV
 BxlCfoj245m/RqKAOiL552+NbYH+LUorDA==
X-Google-Smtp-Source: APBJJlGS0UYOukG3GmmXvkib5TfequaDgmnbkr55aJOCyPgElnAx2cmvhso1x0q3xHS9+VP2WuAGkQ==
X-Received: by 2002:a92:cda2:0:b0:349:2f69:3045 with SMTP id
 g2-20020a92cda2000000b003492f693045mr5296481ild.26.1690932954957; 
 Tue, 01 Aug 2023 16:35:54 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 22/23] dyndbg-doc: add classmap info to howto
Date: Tue,  1 Aug 2023 17:35:14 -0600
Message-ID: <20230801233515.166971-29-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

Add some basic info on classmap usage and api

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5- adjustments per Randy Dunlap
---
 .../admin-guide/dynamic-debug-howto.rst       | 64 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 8dc668cc1216..b8d2a7235cbb 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -224,7 +224,6 @@ the ``p`` flag has meaning, other flags are ignored.
 Note the regexp ``^[-+=][flmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-flmpt``.
 
-
 Debug messages during Boot Process
 ==================================
 
@@ -374,3 +373,66 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug classmaps
+=======================
+
+Dyndbg generally selects *prdbg* callsites using structural info:
+module, file, function, line.  Using classmaps, user modules can
+organize/select pr_debug()s as they like.
+
+- classes coordinates/spans multiple modules
+- complements the mod,file,func attrs
+- keeps pr_debug's 0-off-cost JUMP_LABEL goodness
+- isolates each from other class'd and un-class'd pr_debugs()
+  (one doesn't intermix 2 clients' bank accounts)
+
+  # IOW this doesn't change DRM.debug settings
+  #> echo -p > /proc/dynamic_debug/control
+
+  # change the classes by naming them explicitly (no wildcard here)
+  #> echo class DRM_UT_CORE +p > /proc/dynamic_debug/control
+
+To support DRM.debug (/sys/module/drm/parameters/debug), dyndbg
+provides DYNDBG_CLASSMAP_PARAM*.  It maps the categories/classes:
+DRM_UT_CORE.. to bits 0..N, allowing to set all classes at once.
+
+Dynamic Debug Classmap API
+==========================
+
+DYNDBG_CLASSMAP_DEFINE - modules create CLASSMAPs, naming the classes
+and type, and mapping the class-names to consecutive _class_ids.  By
+doing so, they tell dyndbg that they are using those class_ids, and
+authorize dyndbg to manipulate the callsites by their class-names.
+
+Its expected that client modules will follow the DRM.debug model:
+1. define their debug-classes using an enum type, where the enum
+symbol and its integer value define both the classnames and class-ids.
+2. use or macro-wrap __pr_debug_cls(ENUM_VAL, "hello world\n")
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+Both these classmap-types use the class-names/ENUM_VALs to validate
+commands into >control.
+
+DYNDBG_CLASSMAP_PARAM - refers to a DEFINEd classmap, exposing the set
+of defined classes to manipulation as a group.  This interface
+enforces the relatedness of classes of DD_CLASS_TYPE_LEVEL_NUM typed
+classmaps; all classes are independent in the >control parser itself.
+
+DYNDBG_CLASSMAP_USE - drm drivers use the CLASSMAP that drm DEFINEs.
+This shares the classmap definition, authorizes coordinated changes
+amongst the CLASSMAP DEFINEr and multiple USErs, and tells dyndbg
+how to initialize the user's prdbgs at modprobe.
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they share the limited 0..62 per-module-group
+_class_id range, without overlap.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones (__pr_debug_cls(id,fmt..)).  This won't be reflected in
+the PARAM readback value, but the pr_debug callsites can be toggled
+into agreement with the param.
-- 
2.41.0

