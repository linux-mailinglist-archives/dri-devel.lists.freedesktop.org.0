Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCCC924A9F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED2E10E6F5;
	Tue,  2 Jul 2024 21:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ps0Lg4fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B45910E6FB;
 Tue,  2 Jul 2024 21:59:13 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f649f7868dso113938839f.2; 
 Tue, 02 Jul 2024 14:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957552; x=1720562352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVVliFbCcRiwMu0SQpi190huBei8IpcPa+B6oudggrw=;
 b=Ps0Lg4fyMYhXlMOE43XInYOvlidYm6bHkRTwG7b1DH+vdOClX7y0mmxwXJuOubZQ3L
 xUIwellnjXSM9DkHHlporRqN0Ffe9Ck7R19rZlMfLhQxRget8vmgGAlfcdru3wtIP3nq
 FCCCD8pY5+fndH/updnGU6Zk+V6qP657MIbt9V0AbQaHMnW3QMPrjPTsX6Yz0Xtjeq8v
 Gg8zCgqBCUho0R9qjSLJHZ0kd8adX6BXKLjrPgDjUlyX9AizsUH/Pg7DFRqwMzTBAH7j
 liTPlB8ZnohdIXn3NeOX4NSHQ2L1ghvB5r4+ht/E1lC/Nkrh+v7lai4z4GOcPKeUAJHW
 Oo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957552; x=1720562352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVVliFbCcRiwMu0SQpi190huBei8IpcPa+B6oudggrw=;
 b=iDf+JE0Gj42Kh6AbVGeuo38xo5rzRjw8eBwvjH42/ZJhs9tFNixtRjjy5HoWdQjhis
 e2cG6jMweuHYVEyupqZsmrVbLvcYNi3nNbz/zr6peXFBqYLQZ2T0det4HQMKRI9U/TiS
 m0T8PM4HB7TCB20nY7Syr+jlXXKrlMh6Gw/J4mRB75HKk8cDm5UNaHGu/0xbrgrN2eI5
 YttEE9afRxQi5C8IL86JFFIh0IaGG/Qj2wrD23FJI/MgyfTZm4NLowjCJl56J29GuSdk
 QtRQMKyxvn25uGXopnanGdYWUF4lUEM6bQAVq3t2pmZVJO+K57oZk0ig+yGjekgwhol8
 PXDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQzjyQvJrRMRxkoUGFWqON+GYaqBydtKKNzxwAr8tT0oaQPcIw2uAHQB/uRRFJuI7tC0szbJoUX2c+CQm2hnVoHgnWppkiibj3GN4CfJ7K8F6an5v99NlSdUWdK9kDN8bQ06KlvOEIIIYPoGwokNQJLd4F+et3hT16DY+qMSNCXxCXNNk/6LIBSfvrN2lLqgCwoTU54qozwD8HDndu6AWAfWM32RQNCqeIkFyoLHJU3q0OxoA=
X-Gm-Message-State: AOJu0Yyh9sleqCT9WeNnpR45l6sfyrUnPpkmnwpBqTborzl0nPyBAKgl
 xNQl2YwWdw16iFPmBl0LgtB13QsmM75/PCU6DaULoeT2YIPn87z+
X-Google-Smtp-Source: AGHT+IGEAKvO56UJsUl2ag28O4BHU8pNps2SJqU5SLk78nG5JzHSvTWkp76KWdlSdUH9XcNNV90+ZQ==
X-Received: by 2002:a05:6602:718:b0:7f6:1cd3:9660 with SMTP id
 ca18e2360f4ac-7f62ee647f7mr978614539f.13.1719957552546; 
 Tue, 02 Jul 2024 14:59:12 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 41/52] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Tue,  2 Jul 2024 15:57:40 -0600
Message-ID: <20240702215804.2201271-51-jim.cromie@gmail.com>
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

