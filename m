Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C293314C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B23210E86B;
	Tue, 16 Jul 2024 19:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LL7U5mG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4164C10E841;
 Tue, 16 Jul 2024 18:59:26 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-8076708e8ffso5048839f.0; 
 Tue, 16 Jul 2024 11:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156365; x=1721761165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0YsvOK5afJ8qV3rkuOU7CKX9HpGcds0hiKx8bDl++s=;
 b=LL7U5mG6zEUZuSmYcrIK30HR60bqorOB5wdFy1+PFERL8lyH7hEFH3B2WqAI27Clu1
 setCSf0Gb3S6pLJ7SJaeKlVmWMKJ829myVqRNCtjTfXQV2QF1GGyTlSb6AeaKmjvaCVc
 M00Aw+Ye1X2ZaCIPhAtNgQMGsBq+4tiX0w5imUar9Hc5LH23JYLSyUCSvlVguYjA410t
 /2L1N0mp7Vd/MTiWAKUmoNByVLSdSy4oYYENao3D2B0AT56hDUGDQZooP4Z5ss1/+oBW
 vS/rcxMSbgI3tBZxVe2Cyij61jlZKvyEbDC3Hm18fa01LLGv/V2RkbutwPGWAXj1r4uH
 WvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156365; x=1721761165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0YsvOK5afJ8qV3rkuOU7CKX9HpGcds0hiKx8bDl++s=;
 b=M6tIlyxMOB+hwHMaX5rJZfwbsoOcjUjqUr18xY0In0ux31w0luJEDHgi2RnvHJT972
 ea+DaUMydOHK+Q1ZcqaCZZwnIwiMa0LRY/g0fSFu9qYCxuUG4o9G8/e2dRSt7F6uOhU/
 gOC52Ldsho3NKxhno/xfwSXkQGcjo4Ff/EMoiGFWgXF8V9Hyoy75G3z240A399GxJ2me
 M7SNX6kirW4ERafw7n6QyrnvO/qyuxyUtXrhDozjr2h5/KYh9Je+0faIVIm0KtFhUC9i
 hchlDHSThK0zJVCfSKoPHxoBNTwJ1EjUlKA9/WZELFFh1bRu0Rh5hPQjqLBvExirkLU+
 hJOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJBv6DQ+P0PsPxIF/IcE4qgllJGOigdGWH8XIkAbB4QoLoEZ8Y7RI8e+NxQlF6ZjQFmiqb8R+tUor0vLTt/J0M0x8Ht7Nndt4w+dQGHD95OYWD+XV0miIVHx454wZXDoGlFO8JaCQM2zyJXqJEwlF9SV1cly7AiJFeiZ5T6TECMjSjdQdiiFcDIjVaaIBr47PXIdBV9gegDxByrM74slMh635lePWw3Q67QuFHxVcKCiawM4A=
X-Gm-Message-State: AOJu0Yx6Nrn6JWw4sPUOyj9jZEyECTmwIKyOB+K5vc/1lsMwc1KTkm/x
 5xoSz+F29aemWRux+Dq47RR7pbVLsYJP6c35kfSHPdpDyw5Vr7cd
X-Google-Smtp-Source: AGHT+IFqBmnPojKGoLSqJ/fbhD9h9vqlD9OR7+D3gArRQ5jLMYdMb3YLCZRkAWmsE4QPVuPM6u7NJg==
X-Received: by 2002:a05:6602:3ce:b0:7fb:790c:a317 with SMTP id
 ca18e2360f4ac-816c32c9ademr48084039f.6.1721156365415; 
 Tue, 16 Jul 2024 11:59:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:25 -0700 (PDT)
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
Subject: [PATCH v9-resend 47/54] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Tue, 16 Jul 2024 12:57:59 -0600
Message-ID: <20240716185806.1572048-48-jim.cromie@gmail.com>
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

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3ebe2ce55dfd..ba57c14454e5 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -19,6 +19,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.45.2

