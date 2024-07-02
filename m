Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467CF924AA4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2164610E6FE;
	Tue,  2 Jul 2024 21:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H1lwlLqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EEE10E6FB;
 Tue,  2 Jul 2024 21:59:15 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f6309e9f29so165202739f.0; 
 Tue, 02 Jul 2024 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957554; x=1720562354; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVVliFbCcRiwMu0SQpi190huBei8IpcPa+B6oudggrw=;
 b=H1lwlLqrblkCrQ9Gw3kT52IynwuEGUAZOLvCis4ITaYgM+CIb5RPQ1OeQtcGkO0isI
 NGPVN3ie2m41cWVZvv8MhjFQgnUxi9Vk6SN2QAFM/r3Xstlqvr5x4W4Voi4IysgsFRF+
 iBEUez0oD8d1S8Delot2Xx5x5UhLedNYlx1w0huJiA39UnY+dDzaKZ8jdo4rVEKpevRt
 oatXGwkt+5K1zh960BDKtGT/JhKJn6U3h5smBOMGDJvgniCJcVqWdvIdQPr59OtYmYf5
 7frQo69F/m4zdMaYUUXPFb1wRfFcLPdLMLVTRbxL8xxSijv/z8NcAGYlcz40s5jPg50z
 3hGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957554; x=1720562354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVVliFbCcRiwMu0SQpi190huBei8IpcPa+B6oudggrw=;
 b=qo5d+BfnfxziX2j3neZgSR0EJlo56q1XJff3Ox6PV9JPZN8oBVIbS6mPo58RF2zbHh
 c6ABpaZUgTbIqkHkIrv+m/vsmbPAPV1LK9zu3SrsPRgqNOO9giUs2m0D8AgIqSURNmdp
 bmuUYrSJWIzGMURWKgo+U1fUmhXKsgS7gSd+cb0obd0gjAIod5Q85rd3ZBjVYKzUe16M
 arI9wMo9aStUIMTSh+RtmKNWIP0eSYjKrQYXZ0ys64Y6ZY0iXHVltE5AtLOJu8b08IHl
 ArsOuXkjmB4TSEi+53D789ny1dGE/nCGGQhgxxOsEiGi2qV0Cs9tJQDu0aGzzBUx0zcw
 5xbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpbcwGLydHaiQxgl0rZPoTZ90wgGNQr05+sXic9Q1BvS4pXWjH8iiPn/fy5Foe/pGL1kjEN7Rupi13Gf7x8K0nTL8xK/Qb439/N78VUzTIJIzKnV4JeL9Uj7zHQb9/j+EEKcEjjlNAEcb+lD+/DpbkJHxJk5SxF58HwdWQPuQoGvDIZFsIaktdb2QCoY2u7vhqTm/hYuwesDVSKV1PMtCvLg65+xjz9lzLopAPeC4S52rrc5s=
X-Gm-Message-State: AOJu0Yz/3e3pVTA8AWRkRljnQRhdMVsgdN/Gly+TZ/Omdocjsn8l3YPP
 NJuN5jOYgsA0yz1L3JK8lzgG7Hf5zKXhLWSV+1WDe3cYyC6IXp/D
X-Google-Smtp-Source: AGHT+IFZ62yf97Gt7+RArnHZHhfQvkUmAT8LPZ/RRX0mXtYibWBEHGPj0AQZKFILtjlHvXFtoqdSew==
X-Received: by 2002:a5e:8c05:0:b0:7f6:2b2d:8ad4 with SMTP id
 ca18e2360f4ac-7f62edff929mr1067144439f.4.1719957554487; 
 Tue, 02 Jul 2024 14:59:14 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 42/53] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Tue,  2 Jul 2024 15:57:42 -0600
Message-ID: <20240702215804.2201271-53-jim.cromie@gmail.com>
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

