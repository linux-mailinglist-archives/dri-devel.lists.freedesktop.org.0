Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B3F924ACB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41EA10E724;
	Tue,  2 Jul 2024 21:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MqwYo8iL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47C610E732;
 Tue,  2 Jul 2024 21:59:36 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f3d3919a4aso177958539f.1; 
 Tue, 02 Jul 2024 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957576; x=1720562376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3JTbEivvcQUwAcXrAriYcuJGP77J1qAidh1sZIrKRVg=;
 b=MqwYo8iLGylUJ8LwniuiRgPW1CwkvEFTys4YEFcSDhZu3sY2nK9V8fJnnunK/xdtxr
 Zu45MMj6CPNvV780w6JeEQTGcGU54AAcKTQV4uBUtqlOqOEXyLfKr6Fxaw8rQEhcuEBW
 AnbDWs9uOnnnVa3sIvf6XmX2tzLbYW63xKcIh0Yv18/LRt2UW9ZjaiU0sbpyTarMC9+v
 lhwYbe54i3qJ1zJ55w62i+jAQ/NWZPNiKSr5HpFZKtPVDuujZI144WABla4YPGl7JX0m
 s/5P+6nV31BVg77k1hy7WoIiId1ke6A49uD7b5K+Sh9dhewiFKkJ28LqiP3OmbqqZePd
 W/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957576; x=1720562376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3JTbEivvcQUwAcXrAriYcuJGP77J1qAidh1sZIrKRVg=;
 b=XBd8wvw2Ei6nrU9OoteQYyGHtJx4cOfwx+hPLxQhRBCX8nbjoAda1NOPEEoo56fbZ8
 NflkyGT0rFi4m1RHztsnmhqkki6C1tTyRei5+KAgFVwBqw7zy7p/LdU6rYuVeGfAGpVh
 3XbDZkSv48QBEl4vmRrlU/E8ndaozi01Bn39OuylhOpNGqtDqgWHLZvOm05EXS31vsvd
 9JTXuxQXNljL55MsqoErXvwJrwdv9dPJBU8XTXROCpiyHvz9iw8qvRF3jYV7Xar+guRR
 D1GISfnRuyOZr1P7sS7Gwcf3U2mhIpw4H8IQ3WWlpv7ow06FLSiRgDtYhHgKHoSu987M
 wOUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw7eCgE66PgTUTCVQvDd6GOuHxBxhBC+6wlSsu+r1O7GsEdktxgygSqN5NB2bAc+dCLJXtrHbMqefokXRT4tcwnd9vqb5Rc+scd0PO6ioBMVCsYxIvwMt1WLklw3EOoEQV62DNdncdQ/GHfnNnXIYeQbBx6B6PgsLmp7rWC1Lp8BgRqIsGVnRBuK2qINZ08QYbDvWfuCfWImpJopmt2gDXWjTjhRWYaiBEwIkrs5mhsgHogUs=
X-Gm-Message-State: AOJu0YxwT9mKLcK4yWwJjpcM7VZS9O39lGG/UJJWWTiEeutDLlkxTHeL
 mVVnhPDVdOUdTr6rUlDcFBp6OfRC4iLBwTGc7uIwnqWwCih7X+hT
X-Google-Smtp-Source: AGHT+IGZ5ru0Gbzul6gBrJZ696v99JPj2evs0BxHq6ZuGzyQecQi/AACVhwVexMDvP0Uufc1BvrHMA==
X-Received: by 2002:a5e:c60c:0:b0:7f6:5143:34ba with SMTP id
 ca18e2360f4ac-7f65143367cmr343431839f.16.1719957576037; 
 Tue, 02 Jul 2024 14:59:36 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:35 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 51/53] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Tue,  2 Jul 2024 15:58:01 -0600
Message-ID: <20240702215804.2201271-72-jim.cromie@gmail.com>
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

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index beee5563031a..1971bfa8a8a6 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -65,6 +65,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.45.2

