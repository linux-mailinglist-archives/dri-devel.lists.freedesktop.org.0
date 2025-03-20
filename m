Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED5A6ADCF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1984210E6E7;
	Thu, 20 Mar 2025 18:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FFMp1xqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2833710E6D1;
 Thu, 20 Mar 2025 18:54:10 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-85b4170f1f5so31715739f.3; 
 Thu, 20 Mar 2025 11:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496849; x=1743101649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=riXSD1tORrHtkttiQwAlqFF38I5b7O133kwF8VYREw8=;
 b=FFMp1xqjgEXoSse4NMtw226TiXaYam48oHv87a+LrLugU2jDm5Cv+Ph470xI95q/Q4
 UTfZoqdrMfpawKMHGcS2EHN+gddORBGgUsg/X854XsmauMUJo+1pVA3emEHBWMLbyWBq
 BnUK1Jb6p5COQteYAxnLCoMC9aVhstc35gAPOvVmGDoxIleuJK+4F1V4eecUmWmq59OD
 /NKj9ytuHZMySPEjRXCIvXmOu4MEGHfhjXUAMQxBgVNNhjIo9pZrrrp8dw37NK+mWHI6
 tJECK59QQ309niN9cnON1qyNsu4PfDcZhFsJjdZb+YHvsWAys6/VB/z3OUlJYvKyTuUG
 nxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496849; x=1743101649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=riXSD1tORrHtkttiQwAlqFF38I5b7O133kwF8VYREw8=;
 b=cCtrGpc1eorCfxTPPjGts0SYMQYJcUB1DNZ0gtucB/xLklASt3TV0kTkpm4oLG7S68
 CiecZ0ICORlAATtOP/dAKGl2FbTsrGyBx9e7itrKpuL3a2SWaQYcYfNdE2/Mpms57FoI
 +giiFZC4DFpLgCx6Zc/J1p8iK2pPPBO3JZp+d4NCTN08XWBLp9WXnW9K655Te8pcEEDG
 jpwCBjS1l9HsvY3HVAFizwEcDpct4lJ1aD6C+az4+Ytznr66AvKDZdnrDVjrDZBnOpT8
 6PhbDyqW7xgoElP8onswNVPF2GieMHNdXx8HV7NpEJKtn6OcHWVlfGBLL+oywdfYTqkr
 qgnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/vGyoy8zDc8uRl7Xn9Llj/IhQfEbvFt5KymweXrFmbvoJXUT64lkWrissmzREGxfzGETFwwLJus1z4f/Rag==@lists.freedesktop.org,
 AJvYcCUiHX6Gu6diVVP0Q3uM1vgD1o41oeoDS3YWZN+3HlZnq/c1cLfYkpOUBkjr3zifDcwDHbK0KZAuNkFDHNu5kE9P4Q==@lists.freedesktop.org,
 AJvYcCVjxRYQSUW/z0+0Nv0XPq7aiVrPybZ/rp1T0KYbbAd3X80hz7a/6bDakSmwo60k3v9yN6yhp8n77BBh@lists.freedesktop.org,
 AJvYcCWrUIB/8cbBjQLL9eXyIwllXKZwumdgs3Dp28dkzcYkk+70J02/siwKJUrOil/XjBDwilzJ6rLmozQK@lists.freedesktop.org,
 AJvYcCXXMUNqmQBg3x0XHt8ONNqjCoSN6J+a2CRle8QV/y/dISDO2CDjRHwnBy5Q4C8ucGdwXCk6Vtn1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKcO52mk3K85P8Ax3IRWMhwD1tjTsgRvEpsW8ZFyFzIkuw6f2A
 2pNprUv3Izz4B9KNQIvfjOs8QR4qxfoUTJ6qwntf5rXScjgVFVOo
X-Gm-Gg: ASbGncuxdXlwHi+lbfJRgxL6z2ocKHxZlQ3aYtyyHAv1wptdD7mvfWDYesvowaVUcU2
 Ve1TR4GWl05GQmWK+IebUPCQWSe1tzYA/zkx8oxiSvk5asvtWkBNw293JWyHqXAlOEHPM5/1Y0T
 ClfDNL4Iu4NN80DwQTB/P8/VL4ooEESybsiWIDXvZ3fprmHclGyUh6l6cr025rPew9q+uHsGzx2
 3CcavYBQxM2cQYPqVZhWIGXr1ZMHHUDo4/A9hIYaxQ1BpQDKTKCSNUQL9o1i5OaSDPNkdqINyYd
 4ZaD3pPzeer8Vfup2/lSzfempvxxX+gWigd/H+yKeI5AFocpBx2xOBhghc/8EpRlwvCCyUtl3Mh
 wOA==
X-Google-Smtp-Source: AGHT+IF1oSBpmraBX8zPImUtfNnxyTPneTMK46EMc6j1uPXohNjQQHHeHYBBNbkda865fA0ElyE4Lg==
X-Received: by 2002:a05:6602:4145:b0:85b:37eb:f466 with SMTP id
 ca18e2360f4ac-85e2ca19f85mr41137739f.1.1742496849336; 
 Thu, 20 Mar 2025 11:54:09 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 57/59] drm-dyndbg: add DRM_CLASSMAP_USE to the
 drm_gem_shmem_helper driver
Date: Thu, 20 Mar 2025 12:52:35 -0600
Message-ID: <20250320185238.447458-58-jim.cromie@gmail.com>
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

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5ab351409312..481d18561688 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -23,6 +23,7 @@
 #include <drm/drm_print.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.49.0

