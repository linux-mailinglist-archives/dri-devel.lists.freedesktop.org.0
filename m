Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416E1924AA6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CD010E703;
	Tue,  2 Jul 2024 21:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TnWnYqE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252D110E6FF;
 Tue,  2 Jul 2024 21:59:16 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7f63db7a69cso142358539f.2; 
 Tue, 02 Jul 2024 14:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957555; x=1720562355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pIsdMzCagTnPqkjtDJJFzcS6RuUfrVRwKo+d8V5q9yk=;
 b=TnWnYqE7yJxfkvIBySFFG2GA662t3a4jA645cUlz3bUMXYJttCdnOXij6XN59ek0u4
 e4omDOzZfRnHg18qAAjxz1fT1jook/nY3VjK6TIx+gJcmaLE8RPoTB8fX4o6jaV1NChy
 8pw2lnbWxz9eGJALJjFOhb9ogU8COP4pMmWqKBQUpDiRmk6HYWa5QtHGO+VaJtbnKRff
 jEwg/WAb/Pw3c1XQ5YDtsOQNiKlU7ddp+K/SptlX0Gujt46prHN5HnmGYhHiSzXyeCVi
 Q89pdHbWAetOuY1A2o8DGinBznlFLPuNi4v+air+H2Fn+/TRbMcpLnWe7e5J7aTTiWkx
 nv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957555; x=1720562355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIsdMzCagTnPqkjtDJJFzcS6RuUfrVRwKo+d8V5q9yk=;
 b=XgHc6DAcJJ1H9KIVwXl5mI9Wlr01Pvg7bnTlIXY0CV88GCZz/c9gjmMRoYBSxqKPVg
 YJnOqU+mmR0mRcGvgEDnFp32Yj7LunEWBDFVGLdoKVPwP3BQfab4Pnid0SgqoKmwMlJC
 VSIDu/wrJ8Xc1Ui+KHLvbPuT0xSCMvfZomjOvMN93vBkDLvuizXkMHz94ojRz0BTAhiO
 5K3YqCvCN7lxxJ2YFsuriW9C7Td8zTbXNfk0SZQQBT6OMegahL0LvuL6Qxu1EhSbwlND
 3KLp30XdqfR0++RAjzZV5sGe1ZHGh1IAc4BSX8CD/WU6vEwoaaPdm4c6ny81NvtANEjW
 Lnmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtyrxqqOj4+n2SCtuTtsrG23DTyqxGaFkGuH91lQLX3WE1EG1kj9hdqFZdJ6A69XOE8/nkQZwW7VIwgDttf7ftmv/0pDL73q7g82kyEgKp94PMLwbVvRiPk10qt+80yXYn2GUuYOaVWGFaGTKfopWobzF3s/SqQGUhVv3FuGzt6zNeVE9p2KJ2y+wkvJAQF/C8O4wq5FcrO6WgkKOy4zc/E01AtXnIb0vd5RYSDokhC2cAsxs=
X-Gm-Message-State: AOJu0YzbevcEjoxcdCr+Uyf/tGBvrxftYYxo/ALRhStWmY70aNTnUK0y
 o+SCMJSx07HstafxiHdfh0YJh6yhpYStprjzToR2049Wkg8IlUlk
X-Google-Smtp-Source: AGHT+IFdYfSSGOVrNg8Fii4KNPEZjcEw1XtdTCCtZkWFk6OqEpHnTijp+0TjJsgDqve7B+0xLFhnQw==
X-Received: by 2002:a6b:6113:0:b0:7f3:a7d9:5922 with SMTP id
 ca18e2360f4ac-7f62ee0c850mr1132473239f.8.1719957555439; 
 Tue, 02 Jul 2024 14:59:15 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 42/52] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Tue,  2 Jul 2024 15:57:43 -0600
Message-ID: <20240702215804.2201271-54-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..1d1ddbedcb5a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -25,6 +25,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.45.2

