Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CF1933148
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6181210E86D;
	Tue, 16 Jul 2024 19:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hgacTuHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B4110E845;
 Tue, 16 Jul 2024 18:59:21 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-80a2939265cso6227339f.3; 
 Tue, 16 Jul 2024 11:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156361; x=1721761161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+Eqreo55RWzciyFbwYCY+bKp2K8wKhzwrrhakb4uDM=;
 b=hgacTuHlcR1Yt7xD5nKRfkStgLBSBjJmrnB4DVub652Rq8MoRyf6v0qbvUbYFjzQ54
 ZqTwF7MFq2NHEZC5yup+/XdxssBl8K5c6M2XKwl4kE9nf5BA8AXR2Ux9eZ0h+UWlKXGS
 BNnWoti0nLZ4v48cAw4a/MnSBn99k3yA+vnpxXm/ZmgFO3SipNC1qTJ2Jn3d9SFTXttA
 ZciAFqeaapIb9kgyBF+3BOeVaKoGiI1LlyHdkr/PoflWUD7vn2u4Aqr9m/0PFrSMKcPW
 lDyT2l0i29k5FMN1ivRlwesLKt8ruUHclYdYVhSUXcwm1M4FQzIwIlpNimxcdSapmMeb
 x8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156361; x=1721761161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+Eqreo55RWzciyFbwYCY+bKp2K8wKhzwrrhakb4uDM=;
 b=cHU2ciMIQe21XxKeozKCTluo+K4+CSQefP0b65Ko8JiDGejEt5Exj5TSbxHVtEmhfi
 blgpligEq6t6DjUdOMby9uRy37J4MG/Pptfz2RCb/AYiV/TZyl+hKn+5PN3kKThXiMTL
 vVSSP0OayYYHhiM8+cU05HA2Uob9Q5WpB52fukg8W4V3XqEQmBvn7V0uxdfYide3Fayh
 s8O8AdVnkvxZVOg8NjU1xPRr/rm5ukWI09rtg8bXHBANOSct4+C4V0T9e4jcXiqAlDxS
 Q4H/dXlKzGWoPdHsP9uX0pV1PpSSQTcBeFsxAEwSKjW2YFaj1YcTlO6SYnvGNJjQdyXh
 aDmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuXV2B3g0FrOXFoDSQX0bWyItl30r1ITiwoVeKBjSwY7npba6az6wGpBDTJnf8op3/ZQkqa/PRS8XfMS/lgZGnely+22J+gJU9mjw0JEWiXOQaK5fkNJQw+IKH6R2oW90l8JuQdKZoGFawOm965iS3uz/DctNU9RqrqNHvr9lQPkOV8EIv9eXkfsBR0P/XC/J/wF2nHK41eIAoyXtiN0CEceANbHO94eJAhHjrNjoN/WEX2b4=
X-Gm-Message-State: AOJu0YyS5eJ9y3ID6TglixlJ0of4/MN4zwbqUvGwHFSL4Er0awlwxeGt
 mHKz1jy1eiYl7ptmrAmCxZc/Wl1KeEaHewymoDCuWMUBZug2BHVH
X-Google-Smtp-Source: AGHT+IGtnYxBzY2m77Nru2t8Ww4iLoER0sn1zlADUp06c3lK5XjVl/QUreG+Vnsvc+0HVrc3CXJwNw==
X-Received: by 2002:a05:6602:1595:b0:803:6699:787 with SMTP id
 ca18e2360f4ac-816c00ab42fmr43054439f.0.1721156361195; 
 Tue, 16 Jul 2024 11:59:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:20 -0700 (PDT)
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
Subject: [PATCH v9-resend 44/54] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Tue, 16 Jul 2024 12:57:56 -0600
Message-ID: <20240716185806.1572048-45-jim.cromie@gmail.com>
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

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7bf08164140e..d22308328c76 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -247,6 +247,8 @@ int radeon_cik_support = 1;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled (default), 0 = disabled)");
 module_param_named(cik_support, radeon_cik_support, int, 0444);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct pci_device_id pciidlist[] = {
 	radeon_PCI_IDS
 };
-- 
2.45.2

