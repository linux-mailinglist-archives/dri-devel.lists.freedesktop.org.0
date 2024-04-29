Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1045E8B6275
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9366F10EB6D;
	Mon, 29 Apr 2024 19:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tbj67/dY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BBA10E479;
 Mon, 29 Apr 2024 19:39:28 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7d5e19d18fbso202241039f.2; 
 Mon, 29 Apr 2024 12:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419567; x=1715024367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JIz+6Oy1eqH41GGZgxlPQbWfghUp3j8MpQZmEvPSsQ0=;
 b=Tbj67/dY2GhTTyWpGUvXbIw0IKVoZOTdtwt0CJAxjDJotSPQWe+hnOI8cZd/2BKB5V
 z5SDBCk/dElUOPjVUonvXeUS4uX0jRtB9WJJUIRSow5PhC05d9IpMAwJuyWu0stmNKp5
 y7AkAvCrax9fC36oXscuSeDS8oVPecH+IBtb/rsTaxjD2qErXBFC83QMQnNWLMAjbar0
 wZD+kiBnTEpJnPxwBSRVzbJssBw/WOKMKYRmn0aSmhLKcli1ckGfAzWlBAs15Io/u7FO
 Q1efOIZI1cL5II/ich9rFmgAsvCfkRCpdWRbaPQ+FZgjGAKBagPtC6erhMj3bRLV9uuN
 eoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419567; x=1715024367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JIz+6Oy1eqH41GGZgxlPQbWfghUp3j8MpQZmEvPSsQ0=;
 b=xHkUzWvgdO56H4uQy85qCb0fSQeo/rlyNjcARumr/Pzs9gJ2UkvS1mB1RjrQvRb264
 Y5urZKCqLFt366JZz5wsI2gWQkPTQVnV7mraIcMewnPf7zFqTwh+IZmj9OhE3U087DbX
 gD4WK06zmaLBITMrKd/tnpUQ2brurTb098Sd0m2TnA6FFEDkDvUxUacmKrVFrlW7VoiL
 YqrovvEorvGuQEUOQYOdVnETOtZX/mFkzXg46paiTyR9xGDkJAuxxa38KP7DJdDoohz3
 vHuTddoQ1glTFhv8wD5sviW616TsAYrdPTICaUTX6WgKNoDP3h5GySEuk5KpE/Go09VU
 s+tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Jy39mbAm6V7j6lnWl8gdaCcM+AVjoDm5MWGRIFkWQfNP7PU24LXV2s7u7MoJ1yuXTrwVHEMXwsMkBvfpBMcVWXcf84yui8+ZbO1IGGqqWIVT7WjVra37uBAelQTDT1k65jUvFG0W2Ztw6l/spCX0dJ/mHEixr0GT64IhHhPn4EF+PlAtLzhpfnxZ1K5xW59hWVcQk7PBhav37WiVzq5uflDXlJAV8b5CKbgC5Zh2wCao+Q8=
X-Gm-Message-State: AOJu0Yx2arlYNcTRW3eucjNONt85YBiL4wmBC1CAR877LBmBTtrei03f
 ScLu6SeS6IrLLCx9tpxAxsRV5RfsFGe/n33nqOlEOF/EMzUiJ7zc
X-Google-Smtp-Source: AGHT+IFThzWVB3vIE8LFgGpixsEhbHUun9+9i1vLB9kJbGTkJx0mvT+Q90khSTqWjq6hpXuEXvfcOQ==
X-Received: by 2002:a05:6602:1cca:b0:7de:8d0d:8836 with SMTP id
 hg10-20020a0566021cca00b007de8d0d8836mr9390488iob.7.1714419567644; 
 Mon, 29 Apr 2024 12:39:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:27 -0700 (PDT)
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
Subject: [PATCH v8 20/35] dyndbg-doc: add classmap info to howto
Date: Mon, 29 Apr 2024 13:39:06 -0600
Message-ID: <20240429193921.66648-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
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
2.44.0

