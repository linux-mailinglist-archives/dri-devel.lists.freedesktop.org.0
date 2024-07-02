Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84269924AD0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15A810E723;
	Tue,  2 Jul 2024 21:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kzKazdgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA05B10E733;
 Tue,  2 Jul 2024 21:59:35 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3815eaa136eso3417055ab.0; 
 Tue, 02 Jul 2024 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957575; x=1720562375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QvF7XGglS4kHqkr9T4qnSlSKUYwSoR5J7DGEbyHu2+8=;
 b=kzKazdgE6OeTs2efN3k67U8Htca9kBwFujR3gaKuQbIQnNoX9HbezkeKTU7+q3DQ+0
 raZBDV1whYNgFyWEjyG+52RXfu4dBfpIj0+2AgQuHWWat5E5Vko8z7YOvJ/9msUuRLpC
 dsrGMxcai66ImeaL4jhYIym7kV64HzRD/LzMAvWzBONTGKOaMwXahiEzr5LQoCYClBhq
 LPg/eyvajkUIsIVQ/oczLG7A3L/hSiyTeWtGdUnjqBKq96LoXjA3bXRzQRuhFnW9aMjU
 KC+wfYkK7gOOm/LPZcuiSe2j6LdKSI0gi8fIrO4hW3xMmnHBaEF9nbDeW2IobLPET0ko
 FVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957575; x=1720562375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QvF7XGglS4kHqkr9T4qnSlSKUYwSoR5J7DGEbyHu2+8=;
 b=rCrDYCng7isB/U4zuSDS24xgmfkrCPh8G84dfanJhApBXAOhvc0hYBAduKbUXFz6V7
 unl1TLlWInZIHRKJ62bs9GwkXSnsTGYp47+BZ3CXB/1gtwzt+bWJvUWcXcSP3YVANdGg
 XwJjJXe8+GmuYK8pSmcw/7WonZGVD4XqKo1KLRQrXhUIo5YVGCJ13oyvtwdhSUO6prMn
 VXEkdfZGvfMZejj/9PHBcWZXQyEdIyd3tyEhpb6F7yGpgAVqEVdF8UoOBnzioDmRad8t
 4L9LfcafCF9FdsBxDFXFxggx138xV1OL9BP4h2DJINDCQaWCPS8r398+PawDy19/OSeO
 ITcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOM1CotRvR0L+t+DJ5Qf79q2TnPs8qhUf+gS/mMKAlWArIU80/Ycklpri4RzyRXnJhPZVhUZzo+pla8ZcMfrzzYgmZjWN3Gb/Xsw7TYpMgkSePDtfOdHTxlGco3xwpL1KeXAeQlmn7RtL6/5htdFjHrxZDV089QgUWrRj+RAlTUIgH1i9SCg+oSe4CV586JzD5XsbtbSe0ZdIrGcP6P61Hk0sfdTo153unEi4UgvG4kw37Lwc=
X-Gm-Message-State: AOJu0YxLEx/f0UEIdvLmFEr8+ALNXJ0v+zRkUM/VoAT1FP/cnCdz8v+3
 xxDPMeheJqEyfPXWIQG2mJhI5E1TAmwBWaOFXUuLaU7eL4CI3tf0
X-Google-Smtp-Source: AGHT+IGZOevniVKgdZW5uEHvGIJ0Kpl5IPSqNwolDmOHxjI93GBuoaqkl3SY5q74c9J2pIm9X5kn6w==
X-Received: by 2002:a05:6602:178b:b0:7eb:776f:d963 with SMTP id
 ca18e2360f4ac-7f62ee1db5cmr1186035939f.8.1719957574846; 
 Tue, 02 Jul 2024 14:59:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 51/52] drm-dyndbg: add DRM_CLASSMAP_USE to the
 drm_gem_shmem_helper driver
Date: Tue,  2 Jul 2024 15:58:00 -0600
Message-ID: <20240702215804.2201271-71-jim.cromie@gmail.com>
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

