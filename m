Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27569345A00
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 09:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E2C6E863;
	Tue, 23 Mar 2021 08:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B008F6E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:45:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x13so19847793wrs.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVmj/JgXHiOknipjFzQEKiQ+vNpvGhie2Jf7GtdWuRA=;
 b=RHmqlDskazU4hnG1lgqVnlGvOcZOMpDn/IKsdvG6La5G1DZXFzNVKfzyYy1rOq7wxg
 +tUYom2c/yVs3rHXoT/1jDGPI680NetGWbkcpgC7cYy2UBZa76jAjQhHtSYPaW5G1UsS
 +l6QIecnq12Irl/uvoVRFvJuOs2Ug/UTk6R28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EVmj/JgXHiOknipjFzQEKiQ+vNpvGhie2Jf7GtdWuRA=;
 b=DatX9AYcMENEolnp5271/APbsTXIEWA+Ws8l8v05gbeHv1Jp+NcuYp+F4eTXEjDjWR
 eYoWg+kfocHRHEayXW9vKZmfPhHwnTnPHtp+eEgnHtnh4ysQBg9guYhf6NAhm9pmkby2
 4ZbeDroRLmniqWVxrpu+k7L/SJcOonJ6IP3Hd1G4pDG78+wFCWpR58OfRDBZnU2j6+TU
 EWh1Ko2S9FRaGkM6qnxp5+D1fkUfGkbrDG8a8J7D8c7RZkyaTh+SeE1D4HPBsuu1OepB
 B0GhGlALqq1+GvPULCIN9fRNDnIp1gLA9F6rvcckdsj/PgAI2AMvwPT1TK1S607POFQt
 Mohw==
X-Gm-Message-State: AOAM533AVvlyZTASyFBu8N+hRy6u73ifIek18X5ie47bIuyZApOvdnqr
 CqnHXawTYFksA7WFTakLddRu+sgq5TsYD9A+
X-Google-Smtp-Source: ABdhPJzaRTtncl3Um+eFvF0cNs1yuH1tPrvlYSdvrYKJptlvFpjSEOk9fZQm+CwM8xOIJ4BqcJmJAg==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr2827113wrq.41.1616489101966;
 Tue, 23 Mar 2021 01:45:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g202sm1772835wme.20.2021.03.23.01.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 01:44:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/doc: Add RFC section
Date: Tue, 23 Mar 2021 09:44:53 +0100
Message-Id: <20210323084453.366863-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Motivated by the pre-review process for i915 gem/gt features, but
probably useful in general for complex stuff.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/index.rst |  1 +
 Documentation/gpu/rfc.rst   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 Documentation/gpu/rfc.rst

diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index c9a51e3bfb5a..df58cb826d68 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -16,6 +16,7 @@ Linux GPU Driver Developer's Guide
    vga-switcheroo
    vgaarbiter
    todo
+   rfc
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/rfc.rst b/Documentation/gpu/rfc.rst
new file mode 100644
index 000000000000..9d0ff2921af8
--- /dev/null
+++ b/Documentation/gpu/rfc.rst
@@ -0,0 +1,16 @@
+===============
+GPU RFC Section
+===============
+
+For complex work, especially new uapi, it is often good to nail the high level
+design issues before getting lost in the code details. This section is meant to
+host such documentation:
+
+* Each RFC should be a section in this file, explaining the goal and main design
+  considerations.
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
