Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0EF7528D4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064C310E76D;
	Thu, 13 Jul 2023 16:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDAB10E723;
 Thu, 13 Jul 2023 16:37:07 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-346541baf2aso5038355ab.1; 
 Thu, 13 Jul 2023 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266227; x=1691858227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Hpk91v6S/H4Fewdz/m/7w0Z69KCGXKFXbB7sQFxvns=;
 b=PRuNxpUOgQyHdG8xAb7oyEAQApKzt/OLHL3fYGNizID2VWduiR5u3S3+Wnvy4l+AtN
 frn84bflDdi6dnSNf+aOa81Xl1ZzrzKKLQZIV1IE/2ZGqdkPME6E8eTKz6Dk+6pwdrLe
 01S+bWkFSUjvwEBe7X9t2+oAHaa6XsLAamZi6ucAHAxiUrMkqhxpKEY2085K92Hw2VTI
 sJPPegg/RHBzbDtSCol+ucOtla+ncNYyX53N/jENknto+mTA61ROrAMVZj7yCSs5NP33
 MjbsoMaEmNVeuxk8RALTwFhCbAW4Wv5pOaetIVNa34thAybaO16J7MI7jqNFRBYAPCFs
 yxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266227; x=1691858227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Hpk91v6S/H4Fewdz/m/7w0Z69KCGXKFXbB7sQFxvns=;
 b=fQ6aHjB470vmYdqa/gEJ+fVjV6PmVcp6P4dc0ZgbDMscBP/qFrplO51G3icAeuXMxK
 PNjJWn+uYuYZb5g6ZXglDp5rg2tV7Bv+7Az3yLJqLeQ95U8GNyZThrhHRzBHa5cVisKm
 7RS9Ut7YCIyJ8Mx0dm4E+fwNOyQs8ZA5DxqkQ45s+pQE6H5Mo7HPUAb3kB9nhwr+J3cs
 9Cv6ZTf0Hnb1CxxUII7ECETviL7P4xynO8v9pe/FUq7UmNpTlemEQlxKP/eLIQF+dTaD
 IPLgDUThfHeVxb/YxYtkts3dA1T4ws2xQPbuHWoP6VsqBkk3hZZgaiLwiAFr/k77KCTG
 8qDg==
X-Gm-Message-State: ABy/qLbgxZx4olR8dFl9HBN6sR7sOW/G9ryBfqdq1zI2/h2Jtc2qcvYw
 Hqds9Ab///WEFrp0nEC7Tm0=
X-Google-Smtp-Source: APBJJlE5tiBFK09iMBObOy+YziX4QDegRnmRX3iwsn/S6s5XwYylCDlCasCpS2rPgLy5p+1Cj9b4Gw==
X-Received: by 2002:a92:cccd:0:b0:346:3fc5:93e0 with SMTP id
 u13-20020a92cccd000000b003463fc593e0mr142862ilq.2.1689266227135; 
 Thu, 13 Jul 2023 09:37:07 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:37:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 21/21] dyndbg-doc: add classmap info to howto
Date: Thu, 13 Jul 2023 10:36:26 -0600
Message-ID: <20230713163626.31338-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some basic info on classmap usage and api

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 64 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 8dc668cc1216..878750ce8c1d 100644
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
+- isolates from other class'd and un-class'd pr_debugs() 
+  (one doesnt mix 2 clients bank accounts)
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
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, ala DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative (Verbose3 > Verbose2)
+
+Both these classmap-types use the class-names/ENUM_VALs to validate
+commands into >control.
+
+DYNDBG_CLASSMAP_PARAM - refs a DEFINEd classmap, exposing the set of
+defined classes to manipulation as a group.  This interface enforces
+the relatedness of classes of DD_CLASS_TYPE_LEVEL_NUM typed classmaps;
+all classes are independent in the >control parser itself.
+
+DYNDBG_CLASSMAP_USE - drm drivers use the CLASSMAP that drm DEFINEs.
+This shares the classmap defn, and authorizes coordinated changes
+amongst the CLASSMAP DEFINEr and multiple USErs.
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they share the limited 0..62 per-module-group
+_class_id range, without overlap.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones (__pr_debug_cls(id,fmt..)).  This won't be reflected in
+the PARAM readback value, but the pr_debug callsites can be toggled
+into agreement with the param.
+
-- 
2.41.0

