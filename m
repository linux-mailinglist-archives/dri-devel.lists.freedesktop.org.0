Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC593312E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8969710E85C;
	Tue, 16 Jul 2024 19:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JjGWFg7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C5210E847;
 Tue, 16 Jul 2024 18:59:28 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7f70a708f54so6578939f.3; 
 Tue, 16 Jul 2024 11:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156368; x=1721761168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LdxS3Fv+DdtdyD/OX9RwYgW//DQBvhU2TaujYV4igeo=;
 b=JjGWFg7DL1MCp72/hg3E5VkmidgQTDlQcf4pIujN9Y6XmVuG4cgG5KRYv/LbKaxmgI
 L72NbuqRPc9xfEu5AAA1DWvP4jPAL++tnJtp1kyBnFPPgPPkLh9J/UkQg75SjgAwkpbV
 Im3QVnR74j+bL4V+3Fi9EKU52KAjnDC421iXwM/N6LFa7YobKRjHCLK/WNcoXcC0M0bW
 1n1bxghnJhk4HWmFaJyj7NdlT/VI1CGfZP4UGSj6ty4kncoqfKi06SHXfO8yhjje8436
 MUJIX7Ri3eVtW875vW1iaXKMJKTpHpXlp8VMcT11T0jmTbR490KZBKY7L6jxTjyOKvzx
 Pn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156368; x=1721761168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LdxS3Fv+DdtdyD/OX9RwYgW//DQBvhU2TaujYV4igeo=;
 b=n2rSF3G2oJ3qW84vFdiWlCmyNVyJ78afExSU/Gf+bENVeKZuVCKVj1tXHY5AN3nYyg
 ajz4BT00pdQTWv9fg8War3wX3+z+r7yStVJPg0n50miiOUVOUoCGJleQ3c8ipyu67BfW
 jcIf+ERzvd/UdmMv55C2uxv31n+YogLodMkVvIJDjT21MXXP24uIzvHNp3nbNmLFc01j
 cQ8ff29QPVscOfA4sdRSR3ZqaqHaxKP/U+4GErLFz2ekmTe1xe4nZmQ32lImrrDt0nut
 BLCjfP0p199AzM0sw9xF3nLBjuIKKCJrtQW0i5aRtGn9L06vn6sey8c8me5XPaEbzF+S
 dxcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoE4sAi+kqbjWdBUvUh0gXGt95dPeC9bnAAecgmbgDQ4+jnn9rxclZDQaPh+nqrezM9xaIjOVpMcWlm6WLygvUn6Fwy9+X8XhM516oN2CoUcVwCCEq3OVacfRGImSnBxkeaRhpJCO3Rh0m46jZjZ3lSK9RkRHEcLZSd47vCeAEHdCeZ+4S6joftRlPloZ4UOd2zlaLnufDsVAadBNzj9yktZxNfI7paRkdxP2v1gVyxPp52xM=
X-Gm-Message-State: AOJu0Ywf8UcAoZ11uscVe6P+ATVX++gbZUhVP6HetuiOhafsiGu4zZcm
 UVs7WADa72mYS1Wg5hmzo1wU0+yy6/tzwWGzrKuHeAczuGGwd10b
X-Google-Smtp-Source: AGHT+IH6IKw5JArubE44ma76RRQ/D8ylu5XLCUV75AdBLcATiRJS8BMkgjWPefk5pTs0a712LpVuig==
X-Received: by 2002:a05:6602:341c:b0:804:b27:82c with SMTP id
 ca18e2360f4ac-816c4a1aaa7mr36704139f.12.1721156368121; 
 Tue, 16 Jul 2024 11:59:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:27 -0700 (PDT)
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
Subject: [PATCH v9-resend 49/54] drm-dyndbg: add DRM_CLASSMAP_USE to the gud
 driver
Date: Tue, 16 Jul 2024 12:58:01 -0600
Message-ID: <20240716185806.1572048-50-jim.cromie@gmail.com>
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

