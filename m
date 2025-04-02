Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41597A7944B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9B610E8A3;
	Wed,  2 Apr 2025 17:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HCq1V/zk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93DB10E8A2;
 Wed,  2 Apr 2025 17:42:56 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3d45875d440so608125ab.0; 
 Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615776; x=1744220576; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mR3GZQ988EXrhdMWSVSfrBHjk8VugzTeXVmkAtrRrJY=;
 b=HCq1V/zkgDeioQL94AI/5A/igYvkwgyEjW5qYBtHrucDCVnAlpJEQcNjByKmafgLWB
 jS6teYOprhEbYvmAimSXozZqGqiofZlQtRxwDA63Kb/RHbptggQsnEE8WNokS2wfhSja
 T7/rz6cwlNcSowBqTfK9vwr1P02zUhGC7ncyPupZB+ZJuqCpLWbXBjEpPlUQX9t8arrw
 6jj2CohtyeP4tikT7irhqmOqKvbRfkUttUNIk3xCH/ITr7dZtXKD/ztomNfv5MDSp7qc
 4X9N5bLcMfFiC8EVnEB8VvojNrdGwgW/CTeEdHOToZgYWjWMvl1FDgLxJM9p/+YgtJ+4
 M7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615776; x=1744220576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mR3GZQ988EXrhdMWSVSfrBHjk8VugzTeXVmkAtrRrJY=;
 b=rrxpYEqux6DoYbfkunY6pxIEpt38l6cbTo7ebNTerdq1Z9P+1/z04Gx/fdiOYitjdC
 Ha1DL+1k590nCBdW9BRaIGInir8Vp8305IY3DhvnUd/G8kntpuH32kRxgmJjvOWHdiwK
 lw9sPd4Knx4QTyi5YcZ5bgA754Bmj90MzeN999j0nXs6crcoca7R433M7kTNpnfgSTM+
 PrXp2JuspNovzDWn6/O07w4b0heMXA+DYQg+rxgW7XBrJCeS8FzhO5paStiavnkQkXT5
 h6fZnfOZ1Pk88tW6nTr80pWORwuLhm50Bm6ooE8SnXchh2eTratJjW8XbVBsFOxtuLaw
 JrHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1DgFT+hPTzyYzFliafzfnWvQ8nMc3SQPOtAr8P0uB+jmnrKs/IUtoFSyiIlwCyg3d/47pXwQWRoWM@lists.freedesktop.org,
 AJvYcCWxKkeI+IikTgmGzgpp4yKQwlFpplp2RONhZLUi9PpaGuJfIOcewdNiH0vK08WX7QhrRkMAj5KgPjig2A1Ypw==@lists.freedesktop.org,
 AJvYcCXxTnEFVrLC71n08pEAuK4kvd9T0EeW0Of5YDTcHRSuxL+Q6coTF8s/779vB2JbegtFvyaqPpJ0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjWf3gY4DikQffqgsRGU0iIHYvkAjRJMMsfl5gpzbblju5O138
 04MOZ5XZbj3ZkmSqbKA6sbhFuZXywm2Kimyn9PmH0HTGBkXlcA1q
X-Gm-Gg: ASbGncs+rCEFDVyWwXCzvCkdi5K0bHFhOPtBCCuqkP2ep+dTZk7JSkAr/aJKJYEaTvF
 Gi1oCPS2QwPgg5hkKafjC3gXxAzG6qXky/fxbG4UMh7rW13n+9QKjWvWAifzA4lKAwPF3jjshji
 mNZ2agOl1U9QVRTFXrzt83o+jgLWbRdf/1Odq5zWCHt9WWUsJ7V4O/kFPitA2HI+wz7bbZ5TlR0
 rLaL275ej8VygYTt8uYT5Wz9iuroUFFcFEmbrPxFJ4eT6mh+++pRWnaU8jUTkKsq3gEG+QrfXqV
 G8Wq4wu+UwQK4SGsZnu6bOcOV7Har+NOOkXDb4GobU1i8TuptxMmL9pt2J/oDcr76aQslzx69kn
 9XQ==
X-Google-Smtp-Source: AGHT+IGz0mzs+hYYK7NGp1ygOapy1Xtg2pb7btBR9FttZE3xaY/IeRPzMzWa7VzATtwuhacGo5/EtA==
X-Received: by 2002:a05:6e02:c:b0:3d1:a34b:4d01 with SMTP id
 e9e14a558f8ab-3d5e09090famr201390495ab.8.1743615776107; 
 Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 43/54] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Wed,  2 Apr 2025 11:41:45 -0600
Message-ID: <20250402174156.1246171-44-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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
index 3e91747ed339..70759b7d338f 100644
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
2.49.0

