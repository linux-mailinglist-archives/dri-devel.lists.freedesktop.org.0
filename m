Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5A3933136
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD12610E867;
	Tue, 16 Jul 2024 19:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cGOEo7qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3944810E845;
 Tue, 16 Jul 2024 18:59:31 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-80a2939265cso6233539f.3; 
 Tue, 16 Jul 2024 11:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156370; x=1721761170; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SFMpYtWIMdGDFXAXC7/EjtlRd2ef06a7BB52SDKmgM=;
 b=cGOEo7qy0Iee4aSduEpKXyiai24aqo/958FG7PCTGDYZePJiFhAfVSm7s4PmZIW0W8
 Sx0j0JezrYYKl12cGge1TUd9ACywTV1+dPEVLKE/9NM9apOASmT2TEfG4qd0ki5f9Zn+
 9hsKoaIRduP+0LtVOCSVtiCQf7PWWLApXsIVgopVAUK/yc1kP+Tv7OeBYginLA6+pXPz
 qImh05qAQJx0up9tPyAS7CYkbKipr6e7kHXZDLE9DYMt11vZdPsnAH6ekVwfdZ1SqgJH
 GshkDj9FYbVJL+IyH7FEwDZXO9B87ENMLl14t6CJZHgOKUePXNp3Hc9MMiGr3TJ7XXyn
 TMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156370; x=1721761170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3SFMpYtWIMdGDFXAXC7/EjtlRd2ef06a7BB52SDKmgM=;
 b=PbxOe+7VWeSm2qObVZH8Nbu2LLhZhBF8o8W4QKlP32mGk19jqpt30SZLJQC+p2ohRG
 oz0CTUoZiYnsK9qQG0M2GSPMFIjuTQYFewywPDdfQYaOKua0lBmSF+K/LW1IHckWUTDx
 nRL0Oa8XanENjrzb8crUmW69JCmOOutRgMBX/AqHzKIS4ONTd1INS8tBCbDvos8KFzlH
 ZrZWDmSZO2wGhcTmkuFq3OsBneihMa7AKMi6GBreNiJ/kJaJ4ATeJO+c+fLQ1c8lXFPN
 KPR63uN1Nq5WOUkdRkXzHbR9P9eESb9AS+rSaofWFQX9gVuT+aFJDIjzMXuxTru6MZml
 XkUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYgv43l1hb3qzoUliU7yRnNKZgs4811hZUhidbf1dZTsMkB33VWpnexlXeTLtI3z4y97bEzfV0tCvUN+GcwUsFlzOgYBScvrvOB6uu/Nxc4izx4vSeMzWPEyiWTyCdKyImJwbO6WwAaXvAG/aSRmZVnLnEGEv53c9EUHyPtHO985gooi6Q6qVH/3HfQMBxVYcUjm3+GsY3I8g9sof3jS9FQiHuirtZfNO9W15x0gy7zr0aXmA=
X-Gm-Message-State: AOJu0YyyZOCkmrYOD4w81sd6rOOfp43lNavwo81h966tWpaGJI7nFFFE
 rVeADibxTqneF7hVzGL/h3mksYgBBMef3TS+CeJlgFWT4bz6u62p
X-Google-Smtp-Source: AGHT+IFNNv9vS+/MrWaSGvQuA7wRhxc0WqtmfqfwoM/4kcX2nyGI9RecReeel4bYcF/zOW5GGLx/pw==
X-Received: by 2002:a6b:7c4c:0:b0:7f6:8303:ba80 with SMTP id
 ca18e2360f4ac-816c3aabedcmr29885939f.11.1721156370398; 
 Tue, 16 Jul 2024 11:59:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:30 -0700 (PDT)
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
Subject: [PATCH v9-resend 51/54] drm-dyndbg: add DRM_CLASSMAP_USE to the
 drm_gem_shmem_helper driver
Date: Tue, 16 Jul 2024 12:58:03 -0600
Message-ID: <20240716185806.1572048-52-jim.cromie@gmail.com>
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

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 53c003983ad1..2b269ae9ea18 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -22,6 +22,8 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_IMPORT_NS(DMA_BUF);
 
 /**
-- 
2.45.2

