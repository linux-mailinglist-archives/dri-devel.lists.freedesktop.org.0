Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1464C2CE6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 14:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666F310E155;
	Thu, 24 Feb 2022 13:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842A710E155
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 13:24:31 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id vz16so4418988ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 05:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alfPJoJ2lpQMy7GyV5GIkRGO5hFrLyMHRmmQh62LRlI=;
 b=SZX1UsyXsZ55iCmaWj1avilJ5e6FDQaBBtdHRuqKTJBAGrr9NwSmxCumQ7qjuB2zkJ
 qX28moK16Lwehi9O1RtZmsOSB4YK9pNoHX3kUUNpae7ivjlZqHCLDejHvu/hVihCBb9c
 xzxTEbJjqSbiNM+OI+DSWDkib3MX5L/zU/tis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=alfPJoJ2lpQMy7GyV5GIkRGO5hFrLyMHRmmQh62LRlI=;
 b=JGn5AKJtjvi07mgS+nErh2cCPfJlpttWqfZWzaLuGJn9RwRpUoQC6qVgzL+44lrhi8
 rNaYC3lM02wpemnDujrlg6fRz5H2ZkeiGzYhPTnd/K4wzzs0I7XP3Nc50qOfgIHe1RoC
 YEp4reSHPNryHCOTfNWcZgGguRGd4wQcLfBpTysLMSI1bxSQcLGztTOssoqXMRh2VnoT
 O8yjR74ohBDV1pNcgezHqkxZZUBcpkUAJlHxlXoDxkwg0WojDCi7zwKB8oTajiJPULzb
 zqf07MqkNRwYfSUpOI59eyYbhHr9JwUM5Ds0o26FfRgSuTY75BS20yv6hmeQxO6jsBqB
 Wuew==
X-Gm-Message-State: AOAM532kERRlWnlJ4dW22k2umG19//RP9K6Z9jNtqoEq624r7P/HTtTO
 AzK1A5e0RruN0kAtlA5TzTpJJrrGZqqIIw==
X-Google-Smtp-Source: ABdhPJxA83YAFq9B/5sIO9ARYugrmhRjPFdDkvi3VVrEqWFQzrayQltUwoU6KIGGEcqxIWzIC2+bww==
X-Received: by 2002:a17:906:7e52:b0:6cf:cf1a:17f with SMTP id
 z18-20020a1709067e5200b006cfcf1a017fmr2237436ejr.251.1645709070003; 
 Thu, 24 Feb 2022 05:24:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id dz8sm1374788edb.96.2022.02.24.05.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:24:29 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/todo: Update panic handling todo
Date: Thu, 24 Feb 2022 14:24:25 +0100
Message-Id: <20220224132425.3463791-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224125934.3461478-1-daniel.vetter@ffwll.ch>
References: <20220224125934.3461478-1-daniel.vetter@ffwll.ch>
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

v2: Also include a link to the QR encoding work. Plus review from
Javier.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: gpiccoli@igalia.com
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/todo.rst | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 7bf7f2111696..2b1e7fa45603 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -475,8 +475,12 @@ This is a really varied tasks with lots of little bits and pieces:
   achieved by using an IPI to the local processor.
 
 * There's a massive confusion of different panic handlers. DRM fbdev emulation
-  helpers have one, but on top of that the fbcon code itself also has one. We
-  need to make sure that they stop fighting over each another.
+  helpers had their own (long removed), but on top of that the fbcon code itself
+  also has one. We need to make sure that they stop fighting over each other.
+  This is worked around by checking ``oops_in_progress`` at various entry points
+  into the DRM fbdev emulation helpers. A much cleaner approach here would be to
+  switch fbcon to the `threaded printk support
+  <https://lwn.net/Articles/800946/>`_.
 
 * ``drm_can_sleep()`` is a mess. It hides real bugs in normal operations and
   isn't a full solution for panic paths. We need to make sure that it only
@@ -488,16 +492,15 @@ This is a really varied tasks with lots of little bits and pieces:
   even spinlocks (because NMI and hardirq can panic too). We need to either
   make sure to not call such paths, or trylock everything. Really tricky.
 
-* For the above locking troubles reasons it's pretty much impossible to
-  attempt a synchronous modeset from panic handlers. The only thing we could
-  try to achive is an atomic ``set_base`` of the primary plane, and hope that
-  it shows up. Everything else probably needs to be delayed to some worker or
-  something else which happens later on. Otherwise it just kills the box
-  harder, prevent the panic from going out on e.g. netconsole.
+* A clean solution would be an entirely separate panic output support in KMS,
+  bypassing the current fbcon support. See `[PATCH v2 0/3] drm: Add panic handling
+  <https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/>`_.
 
-* There's also proposal for a simplied DRM console instead of the full-blown
-  fbcon and DRM fbdev emulation. Any kind of panic handling tricks should
-  obviously work for both console, in case we ever get kmslog merged.
+* Encoding the actual oops and preceeding dmesg in a QR might help with the
+  dread "important stuff scrolled away" problem. See `[RFC][PATCH] Oops messages
+  transfer using QR codes
+  <https://lore.kernel.org/lkml/1446217392-11981-1-git-send-email-alexandru.murtaza@intel.com/>`_
+  for some example code that could be reused.
 
 Contact: Daniel Vetter
 
-- 
2.34.1

