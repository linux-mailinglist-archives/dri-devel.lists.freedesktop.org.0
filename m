Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF745924ACD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E42A10E726;
	Tue,  2 Jul 2024 21:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NwTvldGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A8010E712;
 Tue,  2 Jul 2024 21:59:37 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7f3ca6869d1so192060439f.0; 
 Tue, 02 Jul 2024 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957577; x=1720562377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QvF7XGglS4kHqkr9T4qnSlSKUYwSoR5J7DGEbyHu2+8=;
 b=NwTvldGp7M+bDp2kwkGygQF6SNBJhuGbOG2jvsu3EWmIkzJWkI7MrIVjH37i5ANk+k
 KvLHpEWtwElPinWvteX60eN0XueZbR2VcCbSpvh5zo3DBzOIhqy42cZz0oeZvXXjXP3t
 zHQNy7Tyedl2aqLMd0BoqGUNk7I0m0LbRctfF8s4ATWrFuBhMQRjMdrgRlX8dHPzrBNZ
 7tZPBtHkhThYMvW3Tn40vkOj6s5Q9CZVIaI7W/7+ZM1UqeCeiFl6PravfNRAwDJctNlA
 WTHfkwipuf7XJw4TiSGNJybn3sRTrZ+cKWCK8fExblDLNIG7LvOyOlrnjYAUFCTD2A4h
 0uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957577; x=1720562377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QvF7XGglS4kHqkr9T4qnSlSKUYwSoR5J7DGEbyHu2+8=;
 b=WrENujxF6/uda4oM1FCNnwJtsw0RAm4qGq/e0ak+a3njB+GD4FnjIOt0dtuFF1Uwsm
 ArQIGnzyOCD/pBaByNEumsrWPcFROxSYXh3UeFvgu8b8TBaGw8VCZHAyuq79R9BVK7FI
 Glfl8fEdhEvlgQhS5bFgbgJ14xN6idWzndidKPXRPGtm0U9VxEfvLS3Kf8okV1+XS9ts
 2RYskWzUA90aCVR2Ct8XQFJzZwerypBs67YIZTYC3CgzkEErfSRJPlI2vw/b9m9eW1J9
 RI+zj9dvA+9GeoQsBK50W2u5NFlibKvhcEEVWScP/vqeGk5QHosrEAwtOOJXufesysaI
 ZKDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvD6qwthNYajoNBrfA7mxx+CdA7lIV+mKEdMewUfOXxE/B6HXy84voSTIw+nXSnjfnu39ABzJBIruiWVtbo7OYwi4m0qskNcpex26mPiVKV3nNSpqMbxPee9O3hdj/LTQggA5I6QxcAa3yypZp4k2fhCpJ6MTj93reLU0KHIud10jUz08+v8XhcuIZL/2uKWRTr2Ts7AeIbOvrMa/rhQyOTTZ+IQhR0oWWJ+rCet3nAuu3Sa8=
X-Gm-Message-State: AOJu0YxqpnMtNL0fv//eD1ukL6K3rn48DEBkR9bs/UUjJs7ahJVNKar1
 X0bc+cFLkylQgXAPiVX+s1EVrvMWSz7zYypopbh/FINQyrWhXhYN
X-Google-Smtp-Source: AGHT+IHr+XWp6uUkEIN9sTm3FPIKljPJiX78B0Egj7pbRiS24t9LgvM6Rlaa2+c/8txTvNCTHxslPw==
X-Received: by 2002:a5d:8418:0:b0:7f6:2c16:149a with SMTP id
 ca18e2360f4ac-7f62ee6e7c0mr1127312339f.13.1719957577095; 
 Tue, 02 Jul 2024 14:59:37 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 52/53] drm-dyndbg: add DRM_CLASSMAP_USE to the
 drm_gem_shmem_helper driver
Date: Tue,  2 Jul 2024 15:58:02 -0600
Message-ID: <20240702215804.2201271-73-jim.cromie@gmail.com>
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

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e435f986cd13..066d906e3199 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -23,6 +23,8 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_IMPORT_NS(DMA_BUF);
 
 /**
-- 
2.45.2

