Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38E93315D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F2010E87E;
	Tue, 16 Jul 2024 19:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="esE2N+ZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614110E844;
 Tue, 16 Jul 2024 18:59:33 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-8036ce660e5so6279739f.1; 
 Tue, 16 Jul 2024 11:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156373; x=1721761173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgAqMd3+iIWmYMpud2tAag7fU0ZRfIKBjcu44k/UC/A=;
 b=esE2N+ZBjMzyLkYgsrZ9SZH9Lf26A2IyUyzqj+1WccOUg92THGUt4j28LiYjOQgGUO
 z08jgXsvGYmCy4p9FWmaTQnGym2VM/wf31Hpa24P55y9yyhSkBP+IIeOt6sfDjDA1lu6
 byzaRe52ty3zQipZoKmdwhOAD0D8ATcYij7IDnbn3HN/B6b8QAz2bhE1UueXZURaHSQK
 6xOI3X71bM/eZUoxTrDEhSgcYRWTPpqwLNSqDXDwtLHceLaB1WfOgSMxQdhVrO9ACCrI
 HpHQUZAWr0qgIXN8IkMsPbLxwbSrDkaqxRxsUP836hg5ukB69B0YfzC/UDE4wvXiu5p8
 qImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156373; x=1721761173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wgAqMd3+iIWmYMpud2tAag7fU0ZRfIKBjcu44k/UC/A=;
 b=VgAdgeG6oZHFUvSQSezbzxIsj0v+q6731LmBLUZmgyG7wheriyqTnsDp6DXOd/YrZ4
 nquCqRDVW/Ibfvi/H+NfG1zj+kXbWOca6rT4OJ2uzzwCkB/LbxECtabxA1NBrQr/xvJG
 cfatoAUQU5LkUKbYjyQSI2nYD3wFE1g0xK/URXSYBrsFGkrXntvBtStv6veEe6z3PDNi
 f/jVeZ8tobqkF0YoNpd2HBHSZmxUQFa/QWbJeGhdHcMxJFMKW4uSjmlicaqYVncnoJRk
 ELbP2qlzrhvbg0c5UMrL2mGO6Gy7SCz4JraDytWowMnb6hPX942EIAG46GNN+7uE/oQa
 7obA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpBEFAiNahMYIIKjtcmHOMpUX3Gb5IaWSNHvecLwQo1YtowvcKtWYaRKginUQgl4VST7DhTs5ZIFOxu0Ubat4/Xi2SSuoV5HNEWTUIkSQZXCzBr30BwN2b96ZNMnJRmETvxY6/ghd3QcDIk1mQIOXdUVu5L0oKPRL9Uwxk9R1otJVqXjRWL6Gb7r/Wu/zKdNF49Xgg2KQuiBbBzXdVQAlA/Sg9zNOY+J534lduSuUJKlHGn6Y=
X-Gm-Message-State: AOJu0Yxl28h0AUQdvCd7gn2+hp4kxp6+XtnLf8z+VIKH2K3VYRfSISke
 vESOa4bfhHwNLmPUZ0zsy0j2tv6/GKAqC3skvcF4LYAiKA5V5TQ8Ft+0JsvA
X-Google-Smtp-Source: AGHT+IFni6bIdZqwUH+Scyf8+nuvN3S+CKoCazA0MHSZb6wujlaADABqWvB5L9YjT5+rHUGh02BCbQ==
X-Received: by 2002:a05:6602:2dd2:b0:7f9:c953:c754 with SMTP id
 ca18e2360f4ac-816c45417e8mr42533539f.3.1721156372732; 
 Tue, 16 Jul 2024 11:59:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:32 -0700 (PDT)
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
Subject: [PATCH v9-resend 53/54] dyndbg: tighten up kdoc about
 DYNDBG_CLASSMAP_* macros
Date: Tue, 16 Jul 2024 12:58:05 -0600
Message-ID: <20240716185806.1572048-54-jim.cromie@gmail.com>
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

The DYNDBG_CLASSMAP_DEFINE expects a list of classnames, and
maps them to consecutive classids starting at _base.  That
1- list-of-classnames can be syntactically replaced by a
2- designated-initializers-list/map.

But this creates ambiguity. The 1st thing the macro does:

   static const char *_var##_classnames[] = { __VA_ARGS__ };

This construct accepts either list form, cannot distinguish between
them, and they place data differently.

1. puts the string values into array[0..N-1]
2. puts them into array[_base..N+_base-1]

2 wastes 0.._base-1 indices, and more importantly, also spec's _base
twice: as a parameter, and then in the designated-initializers-list/map.

Further, the code is written for a contiguous range of classnames and
classids, and passing a map allows casual violation of this reasonable
design choice.

In particular, DRM_UT_* is a contiguous range, and each maps to a bit
in drm.debug.  The macro interface shouldn't suggest a sparse map is
possible.

So reword DYNDBG_CLASSMAP_* macro kdoc to more actively guide reader
away from designated initializers here.

TBD probably squash this back into the patchset.

CC: ville.syrjala@linux.intel.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 52 +++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index c958085e0df4..d75a5d3ae388 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -80,15 +80,22 @@ struct ddebug_class_map {
 	enum ddebug_class_map_type map_type;
 };
 
+/*
+ * modules using dyndbg-classmaps must invoke either
+ */
 /**
- * DYNDBG_CLASSMAP_DEFINE - define a set of debug-classes used by a module.
+ * DYNDBG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
- * @_type:  enum ddebug_class_map_type, chooses bits/verbose, numeric/names.
- * @_base:  offset of 1st class-name, used to share 0..62 classid space
- * @classes: vals are stringified enum-vals, like DRM_UT_*
+ * @_type:  enum ddebug_class_map_type: DISJOINT - independent, LEVEL - v2>v1
+ * @_base:  reserve N classids starting at _base, to split 0..62 classid space
+ * @classes: names of the N classes.
  *
- * Defines and exports a struct ddebug_class_map whose @classes are
- * used to validate a "class FOO .." >control command on the module
+ * This tells dyndbg what classids the module is using, by mapping
+ * names onto them.  This qualifies "class NAME" >controls on the
+ * defining module, ignoring unknown names.
+ *
+ * The @classes also name the bits 0.. in any CLASSMAP_PARAM referring
+ * to the classmap.
  */
 #define __DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
@@ -131,9 +138,9 @@ struct ddebug_class_user {
  * DYNDBG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
  * @_var: name of the exported classmap var
  *
- * This registers a module's use of another module's classmap defn, so
- * dyndbg can authorize "class DRM_CORE ..." >control commands upon
- * this module.
+ * This tells dyndbg that the module has prdbgs with classids defined
+ * in the named classmap.  This qualifies "class NAME" >controls on
+ * the user module, ignoring unknown names.
  */
 #define DYNDBG_CLASSMAP_USE(_var)					\
 	DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user))
@@ -165,27 +172,30 @@ struct ddebug_class_param {
 };
 
 /**
- * DYNDBG_CLASSMAP_PARAM - wrap a dyndbg-classmap with a controlling sys-param
- * @_name  sysfs node name
- * @_var   name of the struct classmap var defining the controlled classes
- * @_flags flags to be toggled, typically just 'p'
+ * DYNDBG_CLASSMAP_PARAM - control a ddebug-classmap from a sys-param
+ * @_name:  sysfs node name
+ * @_var:   name of the classmap var defining the controlled classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
  *
  * Creates a sysfs-param to control the classes defined by the
- * classmap.  Keeps bits in a private/static
+ * exported classmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in a private long int.
  */
 #define DYNDBG_CLASSMAP_PARAM(_name, _var, _flags)			\
 	static unsigned long _name##_bvec;				\
 	__DYNDBG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
 
 /**
- * DYNDBG_CLASSMAP_PARAM_REF - wrap a dyndbg-classmap with a controlling sys-param
- * @_name  sysfs node name
- * @_bits  name of the module's unsigned long bit-vector, ex: __drm_debug
- * @_var   name of the struct classmap var defining the controlled classes
- * @_flags flags to be toggled, typically just 'p'
+ * DYNDBG_CLASSMAP_PARAM_REF - wrap a classmap with a controlling sys-param
+ * @_name:  sysfs node name
+ * @_bits:  name of the module's unsigned long bit-vector, ex: __drm_debug
+ * @_var:   name of the (exported) classmap var defining the classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
  *
- * Creates a sysfs-param to control the classmap, keeping bitvec in user @_bits.
- * This lets drm use __drm_debug elsewhere too.
+ * Creates a sysfs-param to control the classes defined by the
+ * exported clasmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in user @_bits.  This lets drm check
+ * __drm_debug elsewhere too.
  */
 #define DYNDBG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)		\
 	__DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
-- 
2.45.2

