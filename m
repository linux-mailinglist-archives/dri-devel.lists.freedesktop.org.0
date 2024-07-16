Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D9933149
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D5510E871;
	Tue, 16 Jul 2024 19:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Je6fm/HD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7468510E841;
 Tue, 16 Jul 2024 18:59:18 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7f70a708f54so6569739f.3; 
 Tue, 16 Jul 2024 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156358; x=1721761158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVVliFbCcRiwMu0SQpi190huBei8IpcPa+B6oudggrw=;
 b=Je6fm/HD6CBreDfcngkvHy0dRJwdQKKPlLfkh4rmj4ws4SFl4CemWl3SGOzB41Zb+A
 BjueVL6FVwaxAOkr6AHUnRsc1o+XqG79tRP1R8EX6rYr9Bxnq65rMeb1AIP+w3CJY5bm
 jH2L1zF5SunDmpWCvwXUeEvIDKFEpDgi+GxvpFPFL+6sobSIxfN3mMycwGhBeFg8idHY
 k8wmvOoSqNyjkG7s7vf2BMUbuBW2+wKF4GsIbH0cNCIq/79z6YOXYYJQ1rs3METLCOdo
 1owRYOb9dqTPvY4gn3MYQjJ1tO5hK/izb3UIa2CTkZJmsiAcxK2o+VuhmemJfm0D/EBZ
 iSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156358; x=1721761158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVVliFbCcRiwMu0SQpi190huBei8IpcPa+B6oudggrw=;
 b=YZhCqRPcaoMuyMkIRunhU/xOyxdtSKuPvtSDAeZ4rMGWo1hb04ER7QFDMivmVDff9O
 KqZ3UqGVnDUzrZgvVZidoMd/9mDaptcdfyNIQRgoo75sbThTe12SC/uki3PiveQF/Tjp
 qOGqpCT6ESLkMjUy8NAd3HvrPLndwGZo8jRobZETn6566kvehtpBQulN9Xz44W2H8Tav
 m6+Q13wXgTWnhJ6rR03Ah/yLphyhdOxWQHTW9DGUDvKyUc4Y3k6HJ12vsuu57Hfwgssa
 xfxf/gHv2/TD7Mfqs9eTk0BnUl0pxDyhbIJkOExHJMBwYvuMQX2OijuONCJciDLLk2eq
 1zAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1+oNu0GKg2laj1oYImW3SFqzVH/5p8yxms1Wha0fRRSMT2usKePIDBasibY56TLJ+Uq/G5Q/3trGY9SZPC4T5OdEVFqO3yZmKbKn/yRMXgvh1wRFY45vVe20R5NS1VNSHFlfhin/AGIK19MlZ4tKaminBgmScQ6paPPZ6AHJKgyqH/sfBaI/ZOao0mLfBP8JxD0pwdFSv3fhAq5i0bFoQHERvNnCxy1p4BDEoLnViUEqz01k=
X-Gm-Message-State: AOJu0Yxp9jgfg//eEZwrk02/N0Tij605X3g25sOgSFYaoSLIfJPgknPv
 DqM3jNgW27p2/REN1TA39xTepSekrDV/oGWGkfM6+pcAzQhBn390NpK4mpOC
X-Google-Smtp-Source: AGHT+IG55r3J/+WPjmFCfm4i2FdKqBFiyLji83RgakUJ5UGwMl7NPkDm7WMlJ0D93dK102jpqkJ71Q==
X-Received: by 2002:a6b:ee19:0:b0:7fb:87d6:64b with SMTP id
 ca18e2360f4ac-816c51c78f3mr33599139f.17.1721156357639; 
 Tue, 16 Jul 2024 11:59:17 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:17 -0700 (PDT)
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
Subject: [PATCH v9-resend 41/54] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Tue, 16 Jul 2024 12:57:53 -0600
Message-ID: <20240716185806.1572048-42-jim.cromie@gmail.com>
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

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index c23c9f0cf49c..ee98fab5597e 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -54,6 +54,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.45.2

