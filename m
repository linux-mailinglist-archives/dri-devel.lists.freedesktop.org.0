Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE08A6ADA5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B6E10E691;
	Thu, 20 Mar 2025 18:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UmsDLuy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3248310E688;
 Thu, 20 Mar 2025 18:53:42 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-85ae131983eso125343639f.0; 
 Thu, 20 Mar 2025 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496821; x=1743101621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iiJ7Gpr92Q6ANZI0grpR2HAyoakBNuE25K03SLq7bv0=;
 b=UmsDLuy1kawwx4II0SxABZmEXenLdHN4aO024ka4xc76ApaP76/KdaZgkR/vp0KfZh
 HKq4LNDciF+jxvDJCBvpj628lGydU36MxTKW99TeEU0A7jHHPxghyokdHF9gBDSULoyg
 a8KjlI+o1+CKx6UXV7tpomF2mYKEVi3A/NZEUCYBCsfevnEtpv7X3iGCeEUXIFYEp3wd
 Lqi1zxo4sqdQ2StWKbLcOaa8eRitUn3l+acc73w3ds1gSNOgsKiga8dWPfeBdyesqQaX
 /WuOoqipAqt7wZmSFQ1n6BcJT1o93pSJWeXYQJmIh1Hu7XRqVYybjXrWrFaon64GAE94
 fM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496821; x=1743101621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iiJ7Gpr92Q6ANZI0grpR2HAyoakBNuE25K03SLq7bv0=;
 b=lBo7NZ1KIKWS9Uv4ZKSK9a0qDMobGIwRL0g/gEwg/B44IYHuVsI2wZE1phPE9rmdvQ
 LOZzG0yamFwW9uQaSkU3/OUgz3ECBFeOgB1vlZymPSGIGY/WsPphSy/an/S+GHEsVB7h
 0JJV9wOPe6CebXIfRXUkzt0hM1r1cf9PlnqBqAv9b29aDWH7AASWvxM8wNtKu8j9Gt+x
 ko6w7B8M1Uk4M9Wq3rSaU/nCFzwPgWAuNY07CtYL7k2+BGBc9RttCPE6KIwoQdUTXTtd
 XXnqTVS92c3KPCmFyoIHdXh0pCTcQfhEU+vuT3nXoD6fVt+ePxQANoj2oYOSJEAZxvJX
 IvUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyhUJ3slRJg7utaBPc0u2M43UFjqMkOTaAMAOhv2++nNsHA+0rwHaMNb8lxiX7uSjFLfPTsDYhJX3C@lists.freedesktop.org,
 AJvYcCVgRVbmbXCM+s+Bfp506NVGf++ADORUudtNdi2bGaVlqIulz8Lr/4jVW+FlU0mJ9vYgjQvQjCqC2GkVWc3eDA==@lists.freedesktop.org,
 AJvYcCVrOU8grvMzmQVavX0eOaa5L54adz6O+yOvxmsOlwoyEdilbErESk1tQhErqGJ46oHN5zMCXUQl@lists.freedesktop.org,
 AJvYcCW0d5Mf4FbZkzdwym8oCfuFuyv7osQOqLejbvTe9IUSp8Ioa/w0yjYiyvwlpRtm1c+D75SpbSOXCyJnBfrXPaEixw==@lists.freedesktop.org,
 AJvYcCWfVpJa/sOZ0mEUFK66+Y6mOBr6Vw7qcrYTloR13DrNIQ9z8KwYhJgqYGh3bEvFJh/qdC2xm2EwUwJw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy947QUAmsBBdTCtIt7W7uwzYAq9PezikgA+eRca+eKqyxTxQ1B
 RT9LORySqgYF45YxE+qy5LOOq0Q+q5j/wOXTX5bNWCT4jfYU5a3L
X-Gm-Gg: ASbGnctU8ZTKax0PcYT1KjAycBSBPGO+YsuFR8hD5V5NY0ga3XCzdRTRn6YYA11fmbX
 AB4bXwijTgoQ4TdP5tKN/e/00uxmuC3k5xUVCAtaDpCjKdjmwYsHCohQXXwOy8LegL94dxHVY5D
 nW0WT6eHyhlVlINnknaxdgm0YCfs3vVke/3oxnEEEocGqiyy/T0cKYqOcvtOLdFeplfokmcSFIz
 i+5jXjS/7StDyx90ISuDciw3EPD2C6iMRR2PvYoL4zlpM5xouRbypVnsg+nxihGhKY+DWSmLR4z
 /98fKwDhY4R8rdGYqVjxbkuEAK1MD754LgR9B4tOo2UJ/AHJjnH7qJs7Ag5iVxnv9CXCdaLULbU
 yWg==
X-Google-Smtp-Source: AGHT+IH4i8LbvrmrRpjy8J+JJRVU0+1Vb1Ug4cLDBgaSWuZTQzWXN+4Vhhh5tVc2tWWaiXCHMDRfQg==
X-Received: by 2002:a05:6602:3786:b0:85b:5869:b5b with SMTP id
 ca18e2360f4ac-85e2ca899f5mr52693339f.6.1742496821278; 
 Thu, 20 Mar 2025 11:53:41 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>,
 linux-doc@vger.kernel.org
Subject: [PATCH v2 33/59] docs/dyndbg: add classmap info to howto (TBD)
Date: Thu, 20 Mar 2025 12:52:11 -0600
Message-ID: <20250320185238.447458-34-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

DYNDBG_CLASSMAP_DEFINE - create & export a classmap
DYNDBG_CLASSMAP_USE    - refer to exported map
DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

TBD: some of this might be over-specification, or just over-talked.

NB: The _DEFINE & _USE model makes the user dependent on the definer,
just like EXPORT_SYMBOL(__drm_debug) already does.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5 adjustments per Randy Dunlap
v7 checkpatch fixes
v8 more
v9 rewords
---
 .../admin-guide/dynamic-debug-howto.rst       | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index d2928884c92b..9422dc4917d0 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -243,7 +243,6 @@ the ``p`` flag has meaning, other flags are ignored.
 Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-fslmpt``.
 
-
 Debug messages during Boot Process
 ==================================
 
@@ -393,3 +392,82 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: class'd prdbgs must be named to
+be changed.  This protects them from generic overwrite:
+
+  # IOW this cannot undo any DRM.debug settings
+  :#> ddcmd -p
+
+So each class must be enabled individually (no wildcards):
+
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+Or the legacy/normal (more convenient) way:
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
+
+Dynamic Debug Classmap API
+==========================
+
+DRM.debug is built upon:
+  ~23 macros, all passing a DRM_UT_* constant as arg-1.
+  ~5000 calls to them, across drivers/gpu/drm/*
+  bits in /sys/module/drm/parameters/debug control all DRM_UT_* together
+
+The const short ints are good for optimizing compilers; a classmaps
+design goal was to keep that.  So basically .classid === category.
+
+And since prdbgs are cataloged with just a DRM_UT_* to identify them,
+the "class" keyword maps known classnames to those reserved IDs, and
+by explicitly requiring "class FOO" in queries, we protect FOO class'd
+debugs from overwrite by generic queries.
+
+Its expected that other classmap users will also provide debug-macros
+using an enum-defined categorization scheme like DRM's, and dyndbg can
+be adapted under them similarly.
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
+classnames onto class-ids consecutively, starting at _base, it also
+maps the names onto CLASSMAP_PARAM bits 0..N.
+
+DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
+var _DEFINEd elsewhere (and exported).
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those classes.  "class FOO" queries are validated
+against the classes, this finds the classid to alter; classes are not
+directly selectable by their classid.
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
+refers to a DEFINEd classmap, and associates it to the param's
+data-store.  This state is then applied to DEFINEr and USEr modules
+when they're modprobed.
+
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself; there is no implied meaning in names like "V4".
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
2.49.0

