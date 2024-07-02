Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A52924AB9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC25B10E707;
	Tue,  2 Jul 2024 21:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J19QX6D2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642E310E707;
 Tue,  2 Jul 2024 21:59:27 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7f5f7ecacc0so203302239f.0; 
 Tue, 02 Jul 2024 14:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957566; x=1720562366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0YsvOK5afJ8qV3rkuOU7CKX9HpGcds0hiKx8bDl++s=;
 b=J19QX6D2TcgiODZaNPJbGGTWcntKUhxitmDDibgyNQl6XDa0qrE+5oZode1JP33mCs
 tF5OIhG9y9bWIK6qHaQDviN5Go/RoNWOpwKrLn18BoCKWqXU9sCHLowKxE5XjIQUxYM6
 eCfYt3pLXdXdZlB8Ex71KcSftpPdJ7UYuJXqiruwUmH3To7l/nW0I/wONBvJ2blzJXnm
 tw1wYyUsZA/6TYbd6xD3wn0mAXqveifBhPJEWfKfK8wmuN7WJrUbvvmYEM6iArdzHJ9l
 OUjdiOviGAUug7xSO5b3BJCtzHVtA0ryN1J45AG9peDMjYGzlm8ld5PK0zKA6BjnZvm1
 k/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957566; x=1720562366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0YsvOK5afJ8qV3rkuOU7CKX9HpGcds0hiKx8bDl++s=;
 b=nj7D1yJJnSFOpcp93s4xxBufegWw4VykJO1l0uddKHpXtQpfm+uHWWQv+54AxMI/7F
 Tq0Vu60k/V2icsG+709ulOwzFBEEKHjCpQCfB20szfWyqVe9Ws4NWmwvHZNx3oM6jtyM
 eF7t3h94JEssECrf5qBBph2txKAhARME/P4iS0Ox88EyhT9ujhJ/4B88IdcOazGDEKC+
 hYMwFmfCRTbVGqCNcRN9wcDQwRHOAKmEcuON1u8bzmqKfgADwJipqyKiUfjFqvO6v1jJ
 f/cpe7/ljGGkXmFpligD7i/1iYdKiJofyVE6EL//wSpfqbwlw2XH6VL6g0alcl7y6Tym
 NErg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWo26U9e70eKL7YxUy/7rC0yI2xtjFtnOWY1xyITpiestVHd9gxnKmmd8ajrY1yb4Ho7Z/rlUrM0z7YN/Gz86xosSI66VJdDYtRM8JaqKHyQ4tAloiN6adTsuoaOwAlEVKwW1FoPJ7Y0nqvoSkAcY8b9QwJbMDwiRzzJnXbpY4NJy7Wxy9PGwlwI1zXoDQ8wv71oDzSTAijG/A/kY85v3PktMxGTSFK41TP7Z5YxtA+LDxrLM=
X-Gm-Message-State: AOJu0YysKrjhwkkGbD9wentVg0xxlEPvrKK53/cVx6fluYnktDig9YAW
 vXlIi/HaW87qNhUBl4nb8+SjCWucyela5U5ORMDY08WYkW17ueVT
X-Google-Smtp-Source: AGHT+IGvYws4ZnTk2jdkfQbNphXRfxlVgTR2bSz3FZORd7ias08UfIGbv4urN9er+A1Gk+gnXV2vKg==
X-Received: by 2002:a05:6602:1306:b0:7f6:27cd:b054 with SMTP id
 ca18e2360f4ac-7f62ee17f56mr1125065139f.4.1719957566686; 
 Tue, 02 Jul 2024 14:59:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 47/52] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Tue,  2 Jul 2024 15:57:52 -0600
Message-ID: <20240702215804.2201271-63-jim.cromie@gmail.com>
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

