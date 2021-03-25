Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C84349C93
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 23:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52E56E0E9;
	Thu, 25 Mar 2021 22:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8326EE52
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 22:59:07 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so2051361wmj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 15:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EYLAWqcsMKDolKIh91LZ+I8bx1uPc3WQVcxAOCVSz0Y=;
 b=KFqy/DGLzDjuFj0f1M+Y/xrOiDMrkKVyMmO5QcV9vKb+rEY33Gl+Y+y5RB4uZ0W3jx
 IyHptOPH+h8owlKH6lv3aLQhMvev7/ugdMHvARscdxriDVSmbEFhm2WPdn6eqybHjTwX
 c6tF/3dvRN66vjwWTmnbde59D/+Kb8AeWMLBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EYLAWqcsMKDolKIh91LZ+I8bx1uPc3WQVcxAOCVSz0Y=;
 b=pZbAdPYY0wrMTY8rrvrmpgKfzop3b0UQrw5NseARuzHQ4uZz+lewyeVjZiDcLI43ms
 dH31T5un3/Gnv6SkTfw3cGFVxh7LrP2R2fIavppL+SDix1GIPyQ+DtNZm1mAik1yDZxX
 UahKx6m6gK/xvAnXtkFV4FHWHeUbqyLRXsen/OvWmWEtXjOUTR+6ySmlkEw4yAjGzrdi
 A9rqFOKKq+yY0hLqKHew4Pbu32zilYMMiyzb2SEbxG6nWzdoBIyYrgerEnpfRINlrpdU
 64MkwChHqxWfOhrn38E9yvdD+gJdEtRVyLvr5Uq8XBDrIqkSGrh2Rd8zYQ2zEjd6jSnb
 aqvA==
X-Gm-Message-State: AOAM533f58sfiKs1umoCguvH4mML8qdFeThz+J3cf5mejnDaONessOyL
 y1oYIzZCt7i19yVtasDUZpHjGCU06S25YLK/
X-Google-Smtp-Source: ABdhPJyyicXQnz93qvCTMUfXLPa6Gl52zpEX47MiJTDo36jyJysWZj3OvJmmxloStIQmm4TBYvCZNA==
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr10080667wmf.144.1616713146219; 
 Thu, 25 Mar 2021 15:59:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q4sm7814842wma.20.2021.03.25.15.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 15:59:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: Add RFC section
Date: Thu, 25 Mar 2021 23:58:59 +0100
Message-Id: <20210325225859.1684116-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324211041.1354941-2-daniel.vetter@ffwll.ch>
References: <20210324211041.1354941-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Motivated by the pre-review process for i915 gem/gt features, but
probably useful in general for complex stuff.

v2: Add reminder to not forget userspace projects in the discussion
(Simon, Jason)

v3: Actually put this into a folder, so we have it all (.rst files and
headers for kerneldoc) contained somewhere separate (Jason)

Cc: Simon Ser <contact@emersion.fr>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@redhat.com>
Acked-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Simon Ser <contact@emersion.fr>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/index.rst     |  1 +
 Documentation/gpu/rfc/index.rst | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 Documentation/gpu/rfc/index.rst

diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index c9a51e3bfb5a..ec4bc72438e4 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -16,6 +16,7 @@ Linux GPU Driver Developer's Guide
    vga-switcheroo
    vgaarbiter
    todo
+   rfc/index
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
new file mode 100644
index 000000000000..a8621f7dab8b
--- /dev/null
+++ b/Documentation/gpu/rfc/index.rst
@@ -0,0 +1,17 @@
+===============
+GPU RFC Section
+===============
+
+For complex work, especially new uapi, it is often good to nail the high level
+design issues before getting lost in the code details. This section is meant to
+host such documentation:
+
+* Each RFC should be a section in this file, explaining the goal and main design
+  considerations. Especially for uapi make sure you Cc: all relevant project
+  mailing lists and involved people outside of dri-devel.
+
+* For uapi structures add a file to this directory with and then pull the
+  kerneldoc in like with real uapi headers.
+
+* Once the code has landed move all the documentation to the right places in
+  the main core, helper or driver sections.
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
