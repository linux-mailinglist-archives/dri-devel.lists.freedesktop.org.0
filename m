Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392964C2C55
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 13:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94D610F372;
	Thu, 24 Feb 2022 12:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25A010F370
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 12:59:41 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id lw4so4101175ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 04:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wlCwHRZWI6fqCrBqATh916lDw0CxOebXEub0NpEWvbQ=;
 b=d/GOruU2xzHT1fNaKMdDaLRG3X6CVxzKxieY7cXTTQ/jE1QSUxncdvyY+ndPadNSuB
 pYZ4/x2YCRRPK44PY92BTxg6+jE4Qq+03VXVn7HNpQkHWIlXd+NXpDOTKb+HcLe/xoyb
 ha1cUsJ0ce1vxOKSvf2a83rO+fH6NvHFJCHU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wlCwHRZWI6fqCrBqATh916lDw0CxOebXEub0NpEWvbQ=;
 b=m76O1YVWvKVOVyEwygNiGfPRQZnDcjr1UVCItCggKC7mEz8iNi0P4a5sULm80SuK/Q
 qJgFbzti3vTvWtbdFOOk6+WIniECFPtz14L6VOihLHmlreCNOL+VGRYvZGOJejZ1ofzo
 sudNgqbi/hb4vQ8Ah/ejMRzcuQXoRRHQrwmJFIeVVZErBPy8twemzzWLnbS2txMIZPg7
 XmDgyeaQfeJMCPH6ZVGgFwLqFbff20QEsrh+B8jlBZrCWcSfYj18884dDGGZRdkBZeYH
 d22xyV6teplmxdso4krP5zzl7OYlYPx59FDEFVOHloj1ZeteS7GIVps/8ArwiojfVyxG
 wqvw==
X-Gm-Message-State: AOAM532VwM3om/PsM3whNs0m8e2fyzjq4RxJ7DcuJ/Tuh9pbs+7Brb5L
 5Bym2qhLWERJWJvdUhL7KRtAs1EojoQAlA==
X-Google-Smtp-Source: ABdhPJxt3V81G6FwcmRvfduujajJT+UkUWGfb9aE9QXiSeN5vIzx6l9WGQgUPJ3Ixd0lJfdQnIyF2Q==
X-Received: by 2002:a17:906:abd4:b0:6bb:8aee:92c5 with SMTP id
 kq20-20020a170906abd400b006bb8aee92c5mr2226886ejb.660.1645707580348; 
 Thu, 24 Feb 2022 04:59:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a6sm1272785edu.22.2022.02.24.04.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 04:59:38 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/todo: Update panic handling todo
Date: Thu, 24 Feb 2022 13:59:34 +0100
Message-Id: <20220224125934.3461478-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some things changed, and add two useful links.

Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: gpiccoli@igalia.com
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/todo.rst | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 7bf7f2111696..283d35a500bd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -475,8 +475,12 @@ This is a really varied tasks with lots of little bits and pieces:
   achieved by using an IPI to the local processor.
 
 * There's a massive confusion of different panic handlers. DRM fbdev emulation
-  helpers have one, but on top of that the fbcon code itself also has one. We
-  need to make sure that they stop fighting over each another.
+  helpers had their own (long removed), but on top of that the fbcon code itself
+  also has one. We need to make sure that they stop fighting over each another.
+  This is worked around by checking ``oops_in_progress`` at various entry points
+  into the DRM fbdev emulation helpers. A much cleaner approach here would be to
+  switch fbcon to the `threaded printk support
+  <https://lwn.net/Articles/800946/>`_.
 
 * ``drm_can_sleep()`` is a mess. It hides real bugs in normal operations and
   isn't a full solution for panic paths. We need to make sure that it only
@@ -488,16 +492,9 @@ This is a really varied tasks with lots of little bits and pieces:
   even spinlocks (because NMI and hardirq can panic too). We need to either
   make sure to not call such paths, or trylock everything. Really tricky.
 
-* For the above locking troubles reasons it's pretty much impossible to
-  attempt a synchronous modeset from panic handlers. The only thing we could
-  try to achive is an atomic ``set_base`` of the primary plane, and hope that
-  it shows up. Everything else probably needs to be delayed to some worker or
-  something else which happens later on. Otherwise it just kills the box
-  harder, prevent the panic from going out on e.g. netconsole.
-
-* There's also proposal for a simplied DRM console instead of the full-blown
-  fbcon and DRM fbdev emulation. Any kind of panic handling tricks should
-  obviously work for both console, in case we ever get kmslog merged.
+* A clean solution would be an entirely separate panic output support in KMS,
+  bypassing the current fbcon support. See `[PATCH v2 0/3] drm: Add panic handling
+  <https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/>`_.
 
 Contact: Daniel Vetter
 
-- 
2.34.1

