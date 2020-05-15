Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D21D49F9
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6146EC35;
	Fri, 15 May 2020 09:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5956E132
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:07 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g14so16401300wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhU0WAgVuh2mQLezKk0xjB0ftL5UowR2T8i3Pd0JNi8=;
 b=gFmeOSl0SMHJGLGXFEt1OT8JsDbDt8B4qrVEoDE2rNvnuNjv4xxYaIkPQQxnYYwdor
 PMIAfEFf2zVGcb9KmhqU8+p038xv6l2moO1F7+MRpVHHvXzLYd++fgyT8hrob6I9Zehd
 B1YcOzcK4V/jC2r5F6WmixgE0hhuDk+GL5nuieTM+L//XSz9l7jO7j9YHhCLY8fNZ/+i
 uqeIeV3qiOedu+VZLnN5x5B2E+RKmMn/H8VhDBpuP21mWdaY7xHMu5NdMy9oSCSJVQG7
 1I0in6K02jBtimcPCnqD05E7ffqkTn+56hI19PQJzyqE/37AP+Wjm2jHJCkY8c0PwAWh
 Fong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhU0WAgVuh2mQLezKk0xjB0ftL5UowR2T8i3Pd0JNi8=;
 b=prLx27CbcobC9I3TAziYQqikiX66qadePRedcRO0OpoqOMQkHs/hi/iqoeYZCf9PSZ
 T+hi5mI1AmUs1pFd11ph8rMrul0A46f5Q++dMPSDsdRoNP1PGHvqV3693RCEpIZZ3+eH
 tqwsz4pgyEQWDLACynyJ/MLvQOG5uOlGcW2D9wZXJBlquPqyWkLl2Q3gTbKL7/NbbPqy
 0NicSN+0XoPdn3izAh129GYOHR7xrHwNZ/62KxFlRwcewH1NO0moXawmPz5zsA5tWZE7
 YzkhFXTfOy5z/YQlCxgStqiEQgqmxsWNbWf9vwYMQrClrS3gNp2T6R3XF50+0yn8o/DC
 y2gQ==
X-Gm-Message-State: AOAM533b18lqvbzo8zBvhL00TqrbHmGkfiCcFcyEp+giUrApHvrHT3jv
 Rg4Sl0dmxhycp+Wxyjs83H/7Z8lL
X-Google-Smtp-Source: ABdhPJz3YoIEm0CHD9omBfww6Bd+gPKdMg1Qlva8xvDgz7lgFjx1dEw4X5L68CT+SfQqCXNvmqa/fQ==
X-Received: by 2002:a1c:a54c:: with SMTP id o73mr3077505wme.74.1589536446335; 
 Fri, 15 May 2020 02:54:06 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:05 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/38] drm/doc: drop struct_mutex references
Date: Fri, 15 May 2020 10:50:44 +0100
Message-Id: <20200515095118.2743122-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

There's little point in providing partial and ancient information about
the struct_mutex. Some drivers are using it, new ones should not.

As-it this only provides for confusion.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/drm-mm.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 1839762044be..5ba2ead8f317 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -178,11 +178,8 @@ GEM Objects Lifetime
 --------------------
 
 All GEM objects are reference-counted by the GEM core. References can be
-acquired and release by calling drm_gem_object_get() and drm_gem_object_put()
-respectively. The caller must hold the :c:type:`struct drm_device <drm_device>`
-struct_mutex lock when calling drm_gem_object_get(). As a convenience, GEM
-provides drm_gem_object_put_unlocked() functions that can be called without
-holding the lock.
+acquired and release by calling drm_gem_object_get() and drm_gem_object_put_unlocked()
+respectively.
 
 When the last reference to a GEM object is released the GEM core calls
 the :c:type:`struct drm_driver <drm_driver>` gem_free_object_unlocked
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
