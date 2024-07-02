Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C357924A9C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B2F10E6E7;
	Tue,  2 Jul 2024 21:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bYaRLu8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CA410E6F5;
 Tue,  2 Jul 2024 21:59:10 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f61f41eef0so205093239f.3; 
 Tue, 02 Jul 2024 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957550; x=1720562350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wzxAaDu6jznCkYGTIESxKGj+agIaj+uEvHm/3W7k4f4=;
 b=bYaRLu8bRvedLrNBl13wFrRm6W7dHu5+oj6WI7hLTcECxpZX5NyAjS3N5oSaRCpl2X
 2vgkMGKl4T2LFauOht6qeW7YemC1Rtsf6uL4RHUdP57rKb0z7yE3+UhPODNnnp6CM7KH
 9n4jt4wvaNXk30c6DXHSBYfVOO21DJMDoulqHdppYUFVjWhzHtNJFDfKz2ZmDFAbzX+k
 cixP6FE0WomND8Ni3iStJeEOcX4x7OGEiuq9p0c6AhH+XOGU2SNUjJXFUZQ+mWjotyuD
 rK6SWLGAEuEbZ93y/sayFl5TyCeeM4pk8HqCK5nUG/UsR4zGBBpXzlvWIdrrpp20j/MS
 caTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957550; x=1720562350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wzxAaDu6jznCkYGTIESxKGj+agIaj+uEvHm/3W7k4f4=;
 b=SSeMf4g6p+9lGtcx1Q0n99kqVBJLIqnicsUb7vZB9u0JsnOYsdjVHudaLtYPP0/ve6
 t46YeX5SEjNUFtpMZAAYufM8CNiMgfBvOTrNyNL/Cj0tP1+kPZ3+WrhSBcHUtdN394PW
 Pt2kBNoHpwXtobRX7DiLXsRK6wkFn7NbtZne6yr/gDVW676ATic1OqjhfK1f3fDempBj
 iLWlekIaDw2Npp13FPsal4LQWPfCOLgaeXgegD5qLDcfNEqdKe0maKcfmOSTYX2eThvZ
 wSO9FB8/eiKeUSzYrkmQc2pemYOfjYHjVxFGzpJ94zIcoHw/HfJ1bDjYNwKDpX6YtldI
 2viQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXnQjZlO0LKwnRzXw/SYl2LFfX6HXM0MsjNVH68ixVHhvKJnvNmbAmMD0a87Qt2a06S+pzUS0p5Dfvgt2X0l81wKHIt/WkhLVxW0GPw4pgNa1DfAu+wgS2fA9Ft32QnjYPCuEmWxjyVIM8Axj72atS5rs1NF3TOn/+N4pBzT31+DyhLSoCTm73cSmdqvWHoE8ssoPx441f2flpNpHAd0eysBc4e86VSNaYvvKPf+/z5HgThyI=
X-Gm-Message-State: AOJu0Yy0t2XTU5Kf/rMQXzEgYHSmytUbNv7Yea8uJ203WWqhGqBCA7n3
 06CswTVEoD6hGRzGtTSwywaJ7NOubBKnIsIbpbQG6ubDQOk+Pu3f
X-Google-Smtp-Source: AGHT+IH6FgmYtruVie6MYmI+39/gsTLr9f9UoNDdF0ISkmNJ1lHfdTSInJOZogzQSQ9dyJk1hbdfQA==
X-Received: by 2002:a05:6602:600b:b0:7f6:4f7e:b87e with SMTP id
 ca18e2360f4ac-7f64f7eba13mr445681639f.21.1719957550253; 
 Tue, 02 Jul 2024 14:59:10 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:09 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 40/52] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Tue,  2 Jul 2024 15:57:38 -0600
Message-ID: <20240702215804.2201271-49-jim.cromie@gmail.com>
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

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7ce1c4617675..9cab48bd0581 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -33,6 +33,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.45.2

