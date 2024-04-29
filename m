Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E258B6296
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F9310FF9A;
	Mon, 29 Apr 2024 19:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g6wLd2xR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4B710FFAC;
 Mon, 29 Apr 2024 19:39:43 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7dedc577011so3530439f.3; 
 Mon, 29 Apr 2024 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419582; x=1715024382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ie5rZ4dsMUbEYAulp2798W3AJ6+dgFCJhLzBPJXIbz8=;
 b=g6wLd2xR6V9IewlgLy3LyRp28Rv7A04Xw0q8Q03WqmLM10VrmTHvbBkU00KU7rKp8r
 xy5ucQ0x3s4wG1zQF0L6EgFt4+sSoXkdkRFfApLmvSahuk4Go4yIRgwPuIBWsrG7nhHY
 msOPKZRHBPo7C4pnlBKhhgUweBfve4YC3iu+erhhgjHfjfML/Zlsfy8ww35zZB63n58t
 a/wrZHhTuSQr4QCG4BRR+kpo3xEQWTrynHxp01z7wOXcFDCVv3ycAMs0IbWKjHgUb980
 BQm01aNBuku5fiEfuLmEDk8+//5C2rVca5wPfPNn7jjoVOzD7W0i5J43Vqem1xEWL2HX
 PAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419582; x=1715024382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ie5rZ4dsMUbEYAulp2798W3AJ6+dgFCJhLzBPJXIbz8=;
 b=Csy9jO5KF14tSVDfxBOK0F2CDVYFDIhDdmrJ7pWKN733LoIV/SYM3xr2Be6sqJazzO
 XWluNbR6homHJZEgygerEbGNf+37FhYO4gnL1KDjwSvjytKyPi9LnHFaOOxPyBH0FBnp
 ufb0hBl3r8EgF08NkGZAK8kBwpktN+K65SFHmtSNBFy+PpMWBSlVS7tC2nt9pw176vtu
 f+yhq5jQxpJ4Gt0efnqSr8Kr9iovPks1WEPYLnG2M4aBpfoiBX9NIRR0/PwDX9bZ/UTv
 ZYBdnGD9WtI0GRujTWpMUBqqnLlHhUdHAN2GWtEFPmZMKcAnNsVLvPBaruzzkMbnd23L
 AhiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVakxKi732kmpQWRfdF4Igb/RKvCNXulhd4naT6l4+GibvyPrJRvZvbA7XhGz9zaflEk0KtonkGo8Le6vRf+EMg99o7/tjn988GipAYKl5HYyMw4Az8hSm6k1jsYSPRaCdau+kqYnDDNc/Na9iotK9mUbJTSfI8/G6X2tVndaIbrRNNaQInTw7iI1Kdu3hmdjhSKaj28ZcBapa88uNWh/4Btq78WsTC4dtWHC14m8w66xLTWDE=
X-Gm-Message-State: AOJu0Yyhja8DjXACSxSkr3MmfMmlQQwDM2vHuQSGeMrTceOiRh70GLWD
 1Lbg1EHMKYwBRlxocyZAhfd3gzAE6MTeI8jC9zytbbAhE+x5nn9v
X-Google-Smtp-Source: AGHT+IGrQCUh7NJG66NLfClNiBakmvFViipsgTmeiMMctP+y/nuBqnI1oha451gFi7fkgh3cY29+VA==
X-Received: by 2002:a05:6602:2759:b0:7d5:c987:3239 with SMTP id
 b25-20020a056602275900b007d5c9873239mr888946ioe.16.1714419582384; 
 Mon, 29 Apr 2024 12:39:42 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 32/35] drm: use correct ccflags-y spelling
Date: Mon, 29 Apr 2024 13:39:18 -0600
Message-ID: <20240429193921.66648-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
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
2.44.0

