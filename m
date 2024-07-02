Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC65924A74
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB6210E6D8;
	Tue,  2 Jul 2024 21:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JZwEcyue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1719D10E6D6;
 Tue,  2 Jul 2024 21:58:50 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7f3cc78afb6so165124539f.0; 
 Tue, 02 Jul 2024 14:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957529; x=1720562329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kydKHLvNbnZg3PNir0Er7pU83Hek2HX1+Oh0xgNXyIg=;
 b=JZwEcyuejXEaIxW+gBF1Q7d2tRtoNY6J71kjFOfGFc0bWyxdfaXBODF5NASfbQUo1O
 7qtsqLzLTYxYMcNnjZe5bPwn4xa5g7LfqyKKRlfhJz03bMBhWex0Pk6iNP+f4Tkk/6/H
 xGUJeT26tJG7oLS5WP9QZQUDXnLsUvxoHHRSuQ4PV0WdmMMMLLwhyuXpQXqLwVKPplZG
 WNyD+DsywFBen65cE+WWy7hUqwKHlEyh3AUaKPqpUktDdTaZf51Bbf1HLvfCN40bRysK
 vHHrDUY9eRLAQbAtVC1yX3b0tv8qQomcBcVzm7yj0HrxyGa67ohUjjSL6XSGBiacV8GS
 VWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957529; x=1720562329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kydKHLvNbnZg3PNir0Er7pU83Hek2HX1+Oh0xgNXyIg=;
 b=pUqT0gbp0K9pdTClYmhbc2F1ZMLhJP33lljI3auMmlBKU2tX2BwyFYzIH1S3r9sbul
 ZOA1o32dsskgxxle478TjY8cgRstvWsHJDphb/Yty7+Ba4RXBUw5JW5+rl4tAuWN7neD
 K4NCw/zef6wrNe0dvbofd1qnuMwRhgoD8VbfD7jATGVftVaN4zE71ZNpPhxEl3/gU8ce
 WEnYggEPSroS0lm/krBmgZHsW8brK8QkS2FGOa6uAisVMPbHMoESpKOpZGR8lOv8yArE
 9/8gZkGaauup6coHtXJL/76sdVu+5fkDSQmvPG5Wmcpxg6H5wP41YfW6OmOTrGnY+zLk
 raBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGBy7aWN21W1hjGCZSOHfIKQZOEVtAHiMukvEgAXJX8oZ9qhUsLofg+VjOWb857bFR8H0ucYyj2mZCLrYYImNfrCfrbC/Wcldko/qz7NrafxocPQZtBmX2BsGoJYgLqNwe4h0WdhZ2Oar1935MtvxZSG8GXj+qTxiNrAc9pAJXG+wmpllO+AAF7jIaYqp/J57AhgUYNNMrRhoCk82wU/aS4W5E7rT+5mlZKa6CGr7t6eJYtzs=
X-Gm-Message-State: AOJu0Yz6tdI0NEkMEiH5+QjaYGKcxpO1/AD8ultiZX+LpdgWKtlv+4DS
 ftpb63dj+uZAII4VxYvwmBwzZ+z06TahIy4zGsJri8xkEi7cgYCW
X-Google-Smtp-Source: AGHT+IHiT4qyllY61e86gEC6NbmhhO5i7DHIdNJWIww0KazUvs2igsL+Uh2C87ePfk+pKL5jlhS9Bw==
X-Received: by 2002:a5d:8455:0:b0:7f5:bd0c:b532 with SMTP id
 ca18e2360f4ac-7f62ed69020mr1001616339f.0.1719957529366; 
 Tue, 02 Jul 2024 14:58:49 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 29/52] drm: use correct ccflags-y spelling
Date: Tue,  2 Jul 2024 15:57:19 -0600
Message-ID: <20240702215804.2201271-30-jim.cromie@gmail.com>
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
index 104b42df2e95..313516fc2ad5 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.45.2

