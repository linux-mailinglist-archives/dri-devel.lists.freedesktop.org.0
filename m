Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2C79AC69
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D06610E373;
	Mon, 11 Sep 2023 23:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DBC10E361;
 Mon, 11 Sep 2023 23:09:03 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-792975085b2so181217539f.1; 
 Mon, 11 Sep 2023 16:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473743; x=1695078543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxV5EwVeeWXpJX0Hrevj96jd4dTd0GlqOcLeKugsmAo=;
 b=ppnZN7octROShenDnlxshoTWoHEtaA2UZFzAQ96H9nQTcx55Ulbt9Cy53q3MNOFof3
 gEP8ctDfZWtvzwdCnYsGyRO/8p3d/ZQ2Nq0JZoiTmi/z0vLGra8b/yKaVqIvJNoK2+lR
 pnOP0nx5P6pLZQkN6fIrpd5w6JsRsbrrn4ajmDIYc7sxC+j3pqfAsVt0ZjzR3cqPhmW2
 NtOYsEL9fNRi5lKAzShHL1LV6+l2TQOtE00BZlcK0BI1YZqY+4EP9wUmIF/OVR6BzC12
 2U0ypMqwEDJGiGUz8tiLoUrpUlrYflcfqsK6O9Vv1Pon1Rzbt01BHwr2nuWiALGlksTF
 nexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473743; x=1695078543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxV5EwVeeWXpJX0Hrevj96jd4dTd0GlqOcLeKugsmAo=;
 b=OAAc9TUWHqS+ngcPRrvPMUAod37PQChUcfmqCDF+rWVbjLmeb/9SGUtmkZLI00sIzz
 ROtLZAkwzyLH0ZY0kuUG7QPLV5/3fkjNJmEq+29D5WmR0vxrS4Ry3ockwX9WUrfUVJlA
 nx+4jQg9N9NEJBn0lg47cE6b1JEBDQ9zqOCLZVfWqYEWX9QBjpEvH2JmJAcshALfg4cs
 886AS3D3yF0GhaS3rQKlGOeZ5rgGbvPC2sLv+x5wnMDVd02a9mPeZit00kjVz/9+2c4f
 Mpbx6jYhMLUsfiZ/LxomMenir4nRZVyvo/UiLl5pMkFxQvnpTcHDsQJgnDz5zn3yt/Ml
 bjCg==
X-Gm-Message-State: AOJu0YxHZHxY8j9AYcpQwFVns+amKRXbfKgDT6fQDTp15YtoJKuBAfTP
 NrglhqhRzF09cA6CcbCdWq8=
X-Google-Smtp-Source: AGHT+IGToB+JhZTwISt0CgVORoAeQuEFbPe5m0BPaNkuKCYxWUyirqBpKKg2RS9ogJTYNrxKH1TaXw==
X-Received: by 2002:a05:6602:3352:b0:787:8fc:75d8 with SMTP id
 c18-20020a056602335200b0078708fc75d8mr13398981ioz.9.1694473743182; 
 Mon, 11 Sep 2023 16:09:03 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:09:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 17/22] dyndbg-doc: add classmap info to howto
Date: Mon, 11 Sep 2023 17:08:33 -0600
Message-ID: <20230911230838.14461-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some basic info on classmap usage and api

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5- adjustments per Randy Dunlap, me
---
 .../admin-guide/dynamic-debug-howto.rst       | 60 ++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 0b3d39c610d9..4ad7d184ed9f 100644
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
+info: module, file, function, line.  Classes allow authors to add
+their own domain-oriented groupings using class-names.  Classes span
+the kernel, so DRM can define DRM_UT_<*> classes, and helpers &
+drivers can use those definitions.
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
+class_ids, and they authorize dyndbg to accept "class FOO" for modules
+which declare that classname with the DEFINE macro.
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

