Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF432FE8C2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 12:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A672C6E530;
	Thu, 21 Jan 2021 11:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464D46E530
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 11:29:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a12so1365270wrv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 03:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgZatkLwj232Fb+mPnGiz2qP1fwibQwK44jrNSXEHT4=;
 b=SD5bTAG+R8gBfa0+7Xa9WlA5jp8x6jwhSZjuuP7ZVzd/MygYZgMeJ821ErL34aatzs
 OQFbuIcgUT1C/Nlnwc8pgkln9sbwhD2PmhtfYrwyC1GCFluZTb9bI4vw8qOFORU9rphz
 2mHSKuEChFGvAlb4D18+sWo4ANszgWzH3ehKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgZatkLwj232Fb+mPnGiz2qP1fwibQwK44jrNSXEHT4=;
 b=XTMQvzzdOT76HdHEHqKBHyMXoxNnaDVbFTNibDL/ofwnrPMx9zeIz7y4Ss3/iTacDC
 /N3GVPKXGsNB8vASjvSN9on/czwUTM+fgJdLWFcz93PHuADLgJcybAZm7FLBWVKmQsMT
 z/+eM/fS9WXDknj/dHy6xXAZyhEUmtOtVFJPNcqnN3mpvQuI8UdTyUugAngusfFYrP7K
 aLXYBd1OqiDte94lajzH/Xy02J/bd7BURJ2QMKM1YsBcNfAk2jLKxDozYQ/QNaHCYawW
 6thq9LkYlvOtSQW3XgyxZCm8zTLIf2zpTFgH/UxLSOi9t7Qx51pTX918mxe3AIqEAI+E
 E3Eg==
X-Gm-Message-State: AOAM532pXCGyQHBkq524arD5e4e4wfOvEUh4IfVIUghPPZolDwBORJGQ
 pr5edVzTEvksnyrvJ5CXYDnLMj/085OCfL5S
X-Google-Smtp-Source: ABdhPJz5sg3f0yacF+a8asK12VnCpsuksyGy5pdiL9WOJ8d5gxLQXZfGhON+yUakE6V5wox27UNaQg==
X-Received: by 2002:adf:decb:: with SMTP id i11mr13908639wrn.26.1611228574964; 
 Thu, 21 Jan 2021 03:29:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q6sm7448446wmj.32.2021.01.21.03.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 03:29:34 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Update todo.rst
Date: Thu, 21 Jan 2021 12:29:19 +0100
Message-Id: <20210121112919.1460322-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Interrnship season is starting, let's review this. One thing that's
pending is Maxime's work to roll out drm_atomic_state pointers to all
callbacks, he said he'll remove that entry once it's all done.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/todo.rst | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 009d8e6c7e3c..492768dd2fd9 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -577,20 +577,24 @@ Contact: Daniel Vetter
 
 Level: Intermediate
 
-KMS cleanups
-------------
+Object lifetime fixes
+---------------------
+
+There's two related issues here
+
+- Cleanup up the various ->destroy callbacks, which often are all the same
+  simple code.
 
-Some of these date from the very introduction of KMS in 2008 ...
+- Lots of drivers erroneously allocate DRM modeset objects using devm_kzalloc,
+  which results in use-after free issues on driver unload. This can be serious
+  trouble even for drivers for hardwared integrated on the SoC due to
+  EPROBE_DEFERRED backoff.
 
-- Make ->funcs and ->helper_private vtables optional. There's a bunch of empty
-  function tables in drivers, but before we can remove them we need to make sure
-  that all the users in helpers and drivers do correctly check for a NULL
-  vtable.
+Both these problems can be solved by switching over to drmm_kzalloc(), and the
+various convenience wrappers provided, e.g. drmm_crtc_alloc_with_planes(),
+drmm_universal_plane_alloc(), ... and so on.
 
-- Cleanup up the various ->destroy callbacks. A lot of them just wrapt the
-  drm_*_cleanup implementations and can be removed. Some tack a kfree() at the
-  end, for which we could add drm_*_cleanup_kfree(). And then there's the (for
-  historical reasons) misnamed drm_primary_helper_destroy() function.
+Contact: Daniel Vetter
 
 Level: Intermediate
 
@@ -626,8 +630,6 @@ See the documentation of :ref:`VKMS <vkms>` for more details. This is an ideal
 internship task, since it only requires a virtual machine and can be sized to
 fit the available time.
 
-Contact: Daniel Vetter
-
 Level: See details
 
 Backlight Refactoring
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
