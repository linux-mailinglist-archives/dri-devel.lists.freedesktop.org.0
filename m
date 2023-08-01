Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C6476BAAA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A41410E462;
	Tue,  1 Aug 2023 17:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7952D10E447;
 Tue,  1 Aug 2023 17:03:45 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-785d738d3feso926039f.0; 
 Tue, 01 Aug 2023 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909425; x=1691514225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dahxVnboO2eOF9q6iQLzZIEkr8U3iWdKsMgzp+Qnxik=;
 b=j/1kM7zqexhktI+SipB+6qY7U25IhR67NAPZkpIwJJc0C24J9OmsYguurxge1Kf6K9
 j6KD5jvPaVDiemtSm8i4M/DzclxIT3a6lm1OSas0jXPDtbx8nOXCC923GboAnILJMS/2
 tyVGYwnY8APqDN5D0MJ/coK5I1jT5qjvF/Qrk7VbraXPxbilkGmrUj5ywMoNEZRg133R
 vp5l8czoQ8IXdK8s6RpsJGgFZGa8yJ8Z6Xy4NJtECY/TfkolNLXC7XdXhmY7YCYwpVs6
 8Mjq2WqaPAdfU3huuKt07+T2ROMTyfcxOL6f7F2ldTIZw9NNCkGMdje4w5s6Z4sk5qiO
 +AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909425; x=1691514225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dahxVnboO2eOF9q6iQLzZIEkr8U3iWdKsMgzp+Qnxik=;
 b=VhU6O7uVo37FL0Uf0XCqJNwpyYQ5HRWwoH9Jn/tqV0Zq+XgTqDKEg0KOu+A6PlVB69
 BIgvAzpUXlStZ1pEZA5iXerTEcSC9moh0mcRBgA+40rgYdTEdGVh+CywAjqEpnzfhnWD
 nZSj9FQaKH9wLuCOAJ0umZvRQQLDG/8KJi3mc12TywW32+SyaJsxmx9IB7QdTQsCjfyd
 8vUlJEUVF563D8mlC7kYT8vjo2TP/+gezQ6mzaDgwrx4Hf/eRKJk415P04zROLERtDVZ
 LTWW1PNQlVIwZ2+f2z5wXDnlu18j3cJI1QHXW2nWFx4qTEmXt8iKDPtBh7c4XwWcVRrq
 +76Q==
X-Gm-Message-State: ABy/qLbJGhMRl+fXqV8dKMZTkwNLzxQ/NGfhCo83SjOVdFzbYcO6lLhv
 C2ZUQEUA5CTK566ErRuZkkw=
X-Google-Smtp-Source: APBJJlFHl4HyyTg5dsaTx1pWuDvPjyQMnLNPIQ9pr69CIT5YBYmj30+ZXlGognp6XZdE3puaMguVHA==
X-Received: by 2002:a05:6602:122a:b0:790:8e61:7152 with SMTP id
 z10-20020a056602122a00b007908e617152mr10226060iot.4.1690909424590; 
 Tue, 01 Aug 2023 10:03:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 21/22] dyndbg-doc: add classmap info to howto
Date: Tue,  1 Aug 2023 11:02:54 -0600
Message-ID: <20230801170255.163237-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
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

