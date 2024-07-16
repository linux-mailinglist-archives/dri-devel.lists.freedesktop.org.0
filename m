Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC193313B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DA010E86E;
	Tue, 16 Jul 2024 19:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HTHPzqPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAAF10E841;
 Tue, 16 Jul 2024 18:59:34 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f70a708f54so6584139f.3; 
 Tue, 16 Jul 2024 11:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156374; x=1721761174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02GQEyQ8Fgm4yEF+9D4Fm23zLJa07LslS1GKZkXapgQ=;
 b=HTHPzqPq+4ko6CRDqc5KGGx9IfaOE+I7SKV/lti/ZKc/jaUS4xHepzZHymfE+qNdo8
 oDCDrRo31Xm7LTaQtN6H6DX/6EcJPRl475h9368yW8jtPcy7k2nYDogrKJTZb4JoHokd
 NE6gm906Ch9g6rl4K+b5a00iDheLqEjz7uQarnfWgGLSwJEAitmssz6m+ftPTT3gjs0R
 ukdtnNasdshybU8NZQxZTXSf/EmXrfoGEi+ZiuZK++Z542uYGr/qgWA0JHEbXdEtniE9
 jCwXnZQ7h6ouhzRllJofWb5VNXiPCYQBwwIicajAhWECFm0dZi9S1+J6+HY1dKi6Dm4n
 8ARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156374; x=1721761174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=02GQEyQ8Fgm4yEF+9D4Fm23zLJa07LslS1GKZkXapgQ=;
 b=LU6KBLRc5BbfjEdqW8rAUkcXN82mJ/lHPZJxBmGEVxmi/C5yST0/Mc4ACjRxN2QFHF
 77Y2dMbZbT0BESSJMDznx4ZF9b7hry3jIPIxZHy/gcRJBQph4ftWUoUvjjqgIpEWAN0b
 l7rertgA4nRSs1aqG8hy7tVSKBzGiCxnwByogkl/CGmEv8Z0Z9dOx90xbTbOQ5CxPnCf
 t9aAytUqVhdlenLCjy9HULRmYcfqqTC1jkWT32pY8mbYXMYMChgKo0QCdiAWp7nifGy/
 5mfqIdYjkwlF1zgb3qHTHNty6yWd7DcmiQZLjTQjFxmnL3aOAAf4eUGoYtUpnc90uzv+
 la/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF8zQRaIldkH/2bzeSldeq2Pu4KrcmClP2wYWHcKRXBU0oR6UxbsN68DCQRte1WqZYe9Tjf/30C1ihH8RsbVNNzgQTIfDoE6UsZB/UcwfWfHNiniTQkhJVBBvptYdvlDYuELYhqQHCzACdXJyfJwfpFzsRj4ha7WDVvNHjG9zXqc5nRydIDhUwdbz389VROW5cWohGGQzT8Fz75wfyPh0AiI42NFDmQSehjS4MM3us2vC/s+0=
X-Gm-Message-State: AOJu0YxoGjWSYBt4/DSPYm4q37wRFwkFx/jpv5Rzmx7Pu/hwijjIID6W
 tlOZ33XbLoqlUhqiuIhJ1AU/nxVjfKKgmW7ZqaB+G9bK4Jd+qAuE
X-Google-Smtp-Source: AGHT+IH2P7UQSoQkuUq22B0bjuKA/ngzw01JbZNtKHx44WAJD4WRstjL+48jrY+j0JQqgWF+0C1c2g==
X-Received: by 2002:a05:6602:1548:b0:804:f2be:ee21 with SMTP id
 ca18e2360f4ac-816c2c0d633mr43164039f.3.1721156373964; 
 Tue, 16 Jul 2024 11:59:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:33 -0700 (PDT)
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
Subject: [PATCH v9-resend 54/54] docs-dyndbg: improve howto classmaps api
 section
Date: Tue, 16 Jul 2024 12:58:06 -0600
Message-ID: <20240716185806.1572048-55-jim.cromie@gmail.com>
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

reword the classmaps-api section to better explain how it supports
DRM, and (a little bit) to steer clear of designated-inits in the
_DEFINE description.

probably just squash this back in

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 64 +++++++++++--------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index ccf3704f2143..1ffab6be07fc 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -390,42 +390,56 @@ in case ``prefix_str`` is built dynamically.
 Dynamic Debug classmaps
 =======================
 
-Dyndbg allows selection/grouping of *prdbg* callsites using structural
-info: module, file, function, line.  Classmaps allow authors to add
-their own domain-oriented groupings using class-names.  Classmaps are
-exported, so they referencable from other modules.
+Classmaps adds the "class" keyword, which selects prdbgs based on
+author supplied, domain-oriented names; this complements the code
+organizational keywords: module, file, function, line.
+
+The main difference from the others: class'd prdbgs must be named to
+be changed.  This protects them from generic overwrite:
+
+  # IOW this cannot undo any DRM.debug settings
+  :#> ddcmd -p
+
+So each class must be enabled individually (no wildcards):
 
-  # enable classes individually
   :#> ddcmd class DRM_UT_CORE +p
   :#> ddcmd class DRM_UT_KMS +p
   # or more selectively
   :#> ddcmd class DRM_UT_CORE module drm +p
 
-The "class FOO" syntax protects class'd prdbgs from generic overwrite::
-
-  # IOW this doesn't wipe any DRM.debug settings
-  :#> ddcmd -p
+Or the legacy/normal (convenient) way:
 
-To support the DRM.debug parameter, DYNDBG_CLASSMAP_PARAM* updates all
-classes in a classmap, mapping param-bits 0..N onto the classes:
-DRM_UT_<*> for the DRM use-case.
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
 
 Dynamic Debug Classmap API
 ==========================
 
-DYNDBG_CLASSMAP_DEFINE - modules use this to create classmaps, naming
-each of the classes (stringified enum-symbols: "DRM_UT_<*>"), and
-type, and mapping the class-names to consecutive _class_ids.
+The classmap API is closely modeled on DRM, which has:
+
+enum drm_debug_category: DRM_UT_* // 10 independent categories. 
+dyndbg's .classid encodes that directly, allowing 0..62 classes
+
+DRM has ~5k calls like: drm_dbg(DRM_UT_KMS, "kms msg");
+these are unchanged, even in argtype, since classid === category.
+
+DRM controls the classes together via sysfs; bits 0..9 control the
+classes independently.
+
+Its expected that other classmap users will also provide debug-macros
+using an enum-defined categorization scheme like DRM's, and dyndbg can
+be adapted under them similarly.
+
+DYNDBG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
+classnames onto class-ids starting at _base, it also maps the
+names onto CLASSMAP_PARAM bits 0..N.
 
-By doing so, modules tell dyndbg that they have prdbgs with those
-class_ids, and they authorize dyndbg to accept "class FOO" for the
-module defining the classmap, and its contained classnames.
+DYNDBG_CLASSMAP_USE(var) - modules call this to refer to the var
+_DEFINEd elsewhere (and exported).
 
-DYNDBG_CLASSMAP_USE - drm drivers invoke this to ref the CLASSMAP that
-drm DEFINEs.  This shares the classmap definition, and authorizes
-dyndbg to apply changes to the user module's class'd pr_debugs.  It
-also tells dyndbg how to initialize the user's prdbgs at modprobe,
-based upon the current setting of the parent's controlling param.
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those classes.  "class FOO" queries are validated
+against the classes, this finds the classid to alter; classes are not
+directly selectable by their classid.
 
 There are 2 types of classmaps:
 
@@ -436,9 +450,9 @@ DYNDBG_CLASSMAP_PARAM - modelled after module_param_cb, it refers to a
 DEFINEd classmap, and associates it to the param's data-store.  This
 state is then applied to DEFINEr and USEr modules when they're modprobed.
 
-This interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
 amongst the contained classnames; all classes are independent in the
-control parser itself.
+control parser itself; there is no implied meaning in names like "V4".
 
 Modules or module-groups (drm & drivers) can define multiple
 classmaps, as long as they share the limited 0..62 per-module-group
-- 
2.45.2

