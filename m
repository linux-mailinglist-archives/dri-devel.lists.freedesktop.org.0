Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA61F9330F8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EAA10E845;
	Tue, 16 Jul 2024 18:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GNluKCK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A7610E832;
 Tue, 16 Jul 2024 18:59:03 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7fb93b2e2a3so4683539f.1; 
 Tue, 16 Jul 2024 11:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156343; x=1721761143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BKKrQEnQvZmCWcaogVUFAqXRidWX9wMTYH0GRy1A0go=;
 b=GNluKCK97yjfLpnxdhbhyM0iTnd1yIJYay27W2NS+mb4c76VXwZNpyF+5GLldwsClo
 Ib/EuYmvpEgjC+qLwi0GyTQL0t8chl9bLEaYBXK+oKdS9Yw1xhNPgORsIVbNVZOXA7zd
 QSlMulGhUcXKPMsdvPON1YCP1y37A4CoDXlBZxtf/C/1mKUkvdFxLk21bF4j8k35A9TZ
 rnOrPB5HsKnptvrm5FjPeaWGVI/Ha9nn3zB+Pk/vwk/ux14tNiZvQ1fCo1gnNwPA3+/u
 K0ybjCYKGdV+Ht2N1ehQjmP4ip02tAhIS6WXZLjgxFSigJzGAjUS3Zy8p0nLj84L84cU
 HWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156343; x=1721761143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BKKrQEnQvZmCWcaogVUFAqXRidWX9wMTYH0GRy1A0go=;
 b=lUEteElYzgdP0uWzpvCeW9oZWgAAXgOwUFK8lg7A8LkXpAEH4LgQrx8ZFfeSbIkffP
 r/glyOR3cSn9qBYDdL0n1LoC4R0y3zkrjr/B5nu7ey9Xzu96t3QFXDmyqzik+lC0xByk
 2EHLB+72UZCxfrRmfwkOb863HJw4zJMuwgzansLWgrh1YHS3hHkVVkeZWPLB2A2VDtXi
 1FkTuGnGQRUCQ1jmcTVvyuy3Oge9KaKI8OglAsDbEeuLEUpcdtavLCeQWaZ+KClhgMHO
 E1ucHLoybKFPaqCgEZO8YfxentmLnZBHsnpHYLNF2tEA/pkqHDt9f/3lP0OvT5oGwVO8
 DVSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvYWhYVaAAXq/p7nGKhmD9wBV5Jldqx86kiQzDyU6Vmn/XHFGQqvcO3qdCqPdRUsCaiP2xFYgJu+V52BFfMs+dyZrCS37ZKrvfOGaJQmRusXxWP1g6pLJZcMUPck3uUpKENSFGOc1AmV1RDTkyC3e5kPe/cd7y0FsCIW1Rn8tvjnjsMnrNLnyzF9Juy7NIJokhATVp09pMZ4d3rD124824vImmmWagzAxnsgToe0YFSnW/HWk=
X-Gm-Message-State: AOJu0YwUTRZuaqsgg4jmRxDyzZIHwlg1nbA+M3KQl49GxdfUMt+4J3Yw
 JthcS9X4ORaNlOHnL85GnwPLMJ9IAOZb5MCZ6+wV9diSUTefGjSQJ4vcFiZ0
X-Google-Smtp-Source: AGHT+IFR9EqMqI1TrHKs8IZsHfJ5cpqX4KLoCBbhGhwmA4IXulbHvDMqbNpb4AouVkB3s3rT9DekFw==
X-Received: by 2002:a05:6602:1602:b0:807:aebc:3bdd with SMTP id
 ca18e2360f4ac-816c2fe92e3mr41453439f.5.1721156342762; 
 Tue, 16 Jul 2024 11:59:02 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:02 -0700 (PDT)
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
Subject: [PATCH v9-resend 29/54] drm: use correct ccflags-y spelling
Date: Tue, 16 Jul 2024 12:57:41 -0600
Message-ID: <20240716185806.1572048-30-jim.cromie@gmail.com>
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

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_DYNAMIC_DEBUG=n

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f9ca4f8fa6c5..78b464cd4348 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-- 
2.45.2

