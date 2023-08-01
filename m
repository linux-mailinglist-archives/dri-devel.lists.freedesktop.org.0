Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C4B76C11B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0710E46A;
	Tue,  1 Aug 2023 23:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95CD10E46D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:53 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-786bb09e595so10007539f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932953; x=1691537753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dahxVnboO2eOF9q6iQLzZIEkr8U3iWdKsMgzp+Qnxik=;
 b=pvU7ugjuzEJLawEbeUP00B8UI18YQT/B4kWcI2YK9vv7iQms/H2JEVv6KVIC7vZ6Jf
 PM8l+KompBGlLKLZpL4qKKFLlbUNxhKBUzexGrJRhCvm+bwNZMRhtMlAfvW7jwawid2R
 cWIyLzp6VXgHeRcA6QHO/U2h9wWVPyLjaNChEJ1tHxKXwuaMfPoop6tMBzgeaTAEdSfY
 ytLANKW6LHBme98hZq2t2H2X8k70v1lnUtnIJO89FXzqxYAwMXujCqH6AYNaES95pED5
 TstIS4jvJaZgg70jnF0QqnqEurVbPf5OepaEnXyiNssAKk5t2YKbC4pWPGK7rJp0JzWp
 uYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932953; x=1691537753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dahxVnboO2eOF9q6iQLzZIEkr8U3iWdKsMgzp+Qnxik=;
 b=h2EHiOqSrjfrXIfbmSv5MyZrNYz1NXf2ViWibHfLNed8SGh8W9+ap4/M7ORpn/eefu
 gW9vKWk27qlDacR+neatn7ln6koKnGXHDB7YSB6Ww7OB86Xwn6rbRJmEPHfRWmdojqbD
 +CkKUsF0JhNZCX5Vr5d+u+vMueFjBsZ+HYFVM5q+/jY1BOFYoHUa19GyWVMUElrpnlS6
 RxAqO6/K+NQbYFbhXXhcaiqRhnhT/xeWPgLH7I3RQOIt88cApgVRIKiBBnp8KZzUpPwY
 EhqADd1nqao6s0ilugNdX18q72GfY7h1IOgJb4hS7t6C9d0hkUvE5l2FfAIrXqUp7dZg
 EPSw==
X-Gm-Message-State: ABy/qLYQ9HiLga0d33A2IwlfOADcgS5g1hFpoQ8VvQSjRVUY7jle0rKG
 XiJjzmfheJYdR6s36nF7C/UyRhINure8BA==
X-Google-Smtp-Source: APBJJlEscyF9Ct6xSDhimVKwYBJuNxoqlQyenT244EcZE4HhGsZ3bUN36LcqK18+vjKFyv4dJTEGeA==
X-Received: by 2002:a92:4b01:0:b0:342:28f1:75b5 with SMTP id
 m1-20020a924b01000000b0034228f175b5mr12205916ilg.5.1690932952904; 
 Tue, 01 Aug 2023 16:35:52 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 21/22] dyndbg-doc: add classmap info to howto
Date: Tue,  1 Aug 2023 17:35:12 -0600
Message-ID: <20230801233515.166971-27-jim.cromie@gmail.com>
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

