Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C038924AC4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF6110E727;
	Tue,  2 Jul 2024 21:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cXF680gt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93DA10E720;
 Tue,  2 Jul 2024 21:59:33 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7f64f66fdd7so60644739f.0; 
 Tue, 02 Jul 2024 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957573; x=1720562373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LdxS3Fv+DdtdyD/OX9RwYgW//DQBvhU2TaujYV4igeo=;
 b=cXF680gtH8SYwWoblbmHFkURxwlp8Xxtf6YFagCu//SKEyFQkBpJcbiGDhSkOewRJ/
 4kFDpfGxbGFpGNDOTrbySwjUjKw1Z2HwkDLQHrRRcP06KEmgXNRAM5vBH4tN5olw4bPG
 9y/iYJLWjsrpiRXOok7EcDw0vyhjszk98pgsRj4d8iWdMJ1W+aO8bjtajfVjx1EwaC/T
 YA1zqDDaFPwHfBZnqC+o3u3iTVlgwWbTp0hqLWkiK9w3QU4VJNXB6lQqkRHUxIt2Kk0e
 7jHxz5Ux7mA9p55fwiYFK+/tepQabDbGqTwmZp3uL9w2WhZ3hNiDSKch8BRheEhG2G6x
 gEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957573; x=1720562373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LdxS3Fv+DdtdyD/OX9RwYgW//DQBvhU2TaujYV4igeo=;
 b=OXJesDAf8bs2y/MIYtMPMLf7he9IivMWwHcgplUn3HXZONBvOH6o/pj2sl2/Fv470y
 F+ZzUr5N0evnsZe6HGt2T46JoHrfGw2aENTleE3DhueUq4gW9n1lPUD6ZtZI9nhHFxLW
 keIZpeGXiqradk4wU4Sdg92W5WgwW9XJqqjmAvkUdoyamOzMCfuv+RRcWSdcDklHVXee
 kpjH/Och31n3GALVjDo6vT98P8DMAlV1kfGD38mEAWZn1e9JJzynyyb4e6E9cHDwIWuE
 ZTGCCJbVzZU/uo2s6ZvvPDNi5uqXVTpSPe3Y41gzWHMsh9Q5T4FVDKIURg/YNYrF64C8
 A2Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDJdEFIfAA/G1EOEJ/1AEGZdrEkr8kUF6ZiMXyEU6ldWpdR6EXV1op0JwXjSM1aoTJmY83tlTCZF/UV3qP5xds8feTRf79fxS4IHZQ8Da6f7OQlIIln0BPCrNo9vaS1RLwhUUWG+vgKz3DTJnCsOSdn0uLdPVZPUUezvaYOlcWBuRKdRw/GqdUzMxBKqPlwST2MAQfO9/zpL8DuFJbYKDietuzgxkX7cn5C/y3cgPBhw2dXJ0=
X-Gm-Message-State: AOJu0YyU4B3IH6P+OgO47hZl5LzqWARmtYYxFsDpiDLPvnrfTKFhs0XP
 QqhIPgzqIgakVRGZEpAhMhdaBeCI1mOn1BbJ8cxlZ6H5N2VgLaSk
X-Google-Smtp-Source: AGHT+IFp5rzNQzwb9sgT1JzgctraTYuaU8bCdfBAOCqgX/PcOHZ/BlCJIM7oWH0DudtrdomfiUMnhg==
X-Received: by 2002:a05:6602:600d:b0:7f6:5035:1826 with SMTP id
 ca18e2360f4ac-7f650351c42mr444974339f.11.1719957572948; 
 Tue, 02 Jul 2024 14:59:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:32 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 50/53] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Tue,  2 Jul 2024 15:57:58 -0600
Message-ID: <20240702215804.2201271-69-jim.cromie@gmail.com>
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

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 9d7bf8ee45f1..5b555045fce4 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -31,6 +31,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.45.2

