Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CDAA1C16D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC89F10EA6F;
	Sat, 25 Jan 2025 06:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iXII6+lG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6A610EA68;
 Sat, 25 Jan 2025 06:47:09 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-844e1eb50e2so75449939f.0; 
 Fri, 24 Jan 2025 22:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787629; x=1738392429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CxerCwCa32SuNvijTSel2H05zJGPetjkTO/3X/VldcE=;
 b=iXII6+lGR+3VeR0rV8Y9szZKX5nLKqfFNtCmdt8vL9BUsG9G4DRJ0UJEj8+rPha7PF
 9GS0O0dSHbgu5njS4/BID7iCh1wx0+Q93WSklzpMKmDC4SoCu8j6MXAZBG0GgLEQnIQX
 I+74TMugS3Pqb9ihJDmH5rEP64hf1tZQMCJUJ7jZ61yRvLnwe3AsvB9XZaCVmvcCXSim
 DUGxglfhFlWzuaFib0B5lpn9gzWUms1PfBCRovwBOj8x184BeIgArBCxpEeJ3gb+uLQm
 PLfnQMDw4okJp/Y1qncK2/aZd9/zwpLQBpB/wwnNNfJbPia+9McuwxGvss4+ldiZHmFi
 +e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787629; x=1738392429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CxerCwCa32SuNvijTSel2H05zJGPetjkTO/3X/VldcE=;
 b=alpzMwlUjlTTXSOOn3u/sZ0KdXOsjAjOT8bUayhGZazlSgLkrqevV/5sHgUGpb8IB1
 SOD/9+CTsHo/Rp9C6AC3yuoqERWexuMFHTxOZeILIvU9v/uT08jJQUyBX0HEmKkA7IWg
 bo6L51+R2zgWkkh4BTOzs135zchXBTXd5Yx/d8HdEa8oWM4Pq2WiMYJNp+x3PYPFSF7G
 ce+zxvmWZwAbNgWkzRW6v700GM34cDh+Jnw2hWMaewDR3gRGnNyi5D7SnCtIuKDFw2Wr
 6b3Q/ITH4rnxTLCu2K+8tHKNhvAvK+xmf7muBgJok2DnSmx+TWDSjs0G2Uy3Q0VhnFhA
 oUgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvuWKMk3FbGIazU5ipmOQeA0By41BfKhJzeiotsZo9LEn0YWBtbqr1YH9jLAacR95bhOUhRgsnUrmQ@lists.freedesktop.org,
 AJvYcCVP08RBtq32pmPJjylvjlrnOqxqA4CI9YmzI3XYec+dMdZAlzO5FcdB22LlPxxxVboN0s9WaEdpt5LE@lists.freedesktop.org,
 AJvYcCWKpw02l6NaXdRGps8vmgfy0e6mYPp+2U9f4avYnTi9z+941f+FH/OzAI6uaKmjWHgyUwKGqON5@lists.freedesktop.org,
 AJvYcCX4sk3FGenaIwn9mbx49Z2kaEkTJYnWBuPg6/SP+c5QqKhgX62PUxsNXh5VyIxkO6iM01/frgiP7RwuUaQZvA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3mJGAuJ0vhP1X32jRAVJKeRkiLaCTv8EJOhk3GjNswoB4q+ui
 Vnkr1nrWARA8rWGB578h+PJlZA+lcVKGLCbA1Z617K65R8+6F+wv
X-Gm-Gg: ASbGncvVgB5Li2BQyEpLlJ3AEXHIyKoydmTnVK8D7ib16k7+JokaGJoytuUXMrmbjuy
 zJouQ6LahwwqIgxTcEXIJ3juE4Oqoh7ofA7EldjTQbnwllz1OCRFDZXTWb+uRWeXwSct0NR1Q9d
 p3aDhJhCwIW78o9xeGaBq9OsYBTEOXE2LFx0UR45ykYxcCWaEyTSM3CJbsbygR5hHUBQVOk4Jnd
 PDjeXf+8+TCbY1xc0UgjeBSqCUhli3h0OqnCJIteEJbYMuzPpoPXUvXOI+sTTfYhAmTO2TSVD7n
 ds+3LXpEpiZWMSUS9u7tTb8x8kTQQSk6iNX2mg==
X-Google-Smtp-Source: AGHT+IFeP81OrrwZYyhERt8IWjWebpncl5LYjvFIJ2Zw2ef9M59/qZvRErXREgk6q+sIWkS/LYegPw==
X-Received: by 2002:a05:6e02:16ce:b0:3a7:6566:1e8f with SMTP id
 e9e14a558f8ab-3cf7447bb26mr253694305ab.16.1737787628880; 
 Fri, 24 Jan 2025 22:47:08 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:08 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>,
 linux-doc@vger.kernel.org
Subject: [PATCH 29/63] dyndbg-doc: add classmap info to howto
Date: Fri, 24 Jan 2025 23:45:43 -0700
Message-ID: <20250125064619.8305-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
v9 rewords
---
 .../admin-guide/dynamic-debug-howto.rst       | 79 ++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 691e0f7d4de1..391e40a510c9 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -230,7 +230,6 @@ the ``p`` flag has meaning, other flags are ignored.
 Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-fslmpt``.
 
-
 Debug messages during Boot Process
 ==================================
 
@@ -380,3 +379,81 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
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
+DYNDBG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
+classnames onto class-ids starting at _base, it also maps the
+names onto CLASSMAP_PARAM bits 0..N.
+
+DYNDBG_CLASSMAP_USE(var) - modules call this to refer to the var
+_DEFINEd elsewhere (and exported).
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
+DYNDBG_CLASSMAP_PARAM - modelled after module_param_cb, it refers to a
+DEFINEd classmap, and associates it to the param's data-store.  This
+state is then applied to DEFINEr and USEr modules when they're modprobed.
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
2.48.1

