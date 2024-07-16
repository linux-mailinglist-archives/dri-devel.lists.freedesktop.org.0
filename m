Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D8933131
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D5210E866;
	Tue, 16 Jul 2024 19:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NeYo48qe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30010E845;
 Tue, 16 Jul 2024 18:59:27 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-80557928673so6067739f.2; 
 Tue, 16 Jul 2024 11:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156367; x=1721761167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oC5iipR2BEVxGSl/++A4yY4qqMQYODae2mcnPNjxpHM=;
 b=NeYo48qeXvZb1rN4HdxWI4lKwm98RCi+k8EZ6nHkL1wOIDJ/ZFatphk1jiNCswo4In
 KO3keLvqT/qwFwqpPJe+jx8X4OAgfHZp42hbREB2AuIwAvINW+GM3Jbrr5SDdJ3Bk/Z6
 JVYoxjU9VA5+GH4BBoawsODopZXthSCpyGO/dO+8e948zUP2jFHDml2xwFS80u23L/At
 7weSAzQU4vF70s5sa6qpy4dzhdYYsvwMwf9Rgnnar9QQMEWMY8xml/HJP+5a8A7ZmkDU
 Y8ueoYdePsLuDEu6eq1ZkyzsES4fA6NnoQAp00qT4DXdcXqKzDoBppE6jNgBTsM0tPvI
 DK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156367; x=1721761167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oC5iipR2BEVxGSl/++A4yY4qqMQYODae2mcnPNjxpHM=;
 b=nEUsImSzyCPmgkS1wwUU5jWxwNovS6xt35dhEPXtTB8s1Med2EMnLiWk/RnEaDppbU
 LdZCe3Ap3Ndnls9kPZu3S9FB1LEdeYcxzYAUKMWoMfKGIVKtbKCfcZ4CAkCeZPAawssy
 w/DqA6F0dVW7raW158bW1oolDewTnVHltW1R60gN+hTpjzgZAc07aK6Alkvm1AOkFBCz
 tz62SvPQFkmcs6p4e3q9xZyKP+LPVJSkki+IzBA33tBfo0SjiuGFmeqSjMLUmsiMsnHl
 TOlhXBc6DEUn4WJrU+KGKvQ8eW9jcGKyBBu4K3XyXGk0r2bqumT56DhdrEzF2IVwi451
 exzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj7d3p0mJXvUFABZlP2sgpbUf2b199VMKMr12W3nSKrhPmtGrQ0oh3QFdQxgcvBwQo8UiyTZJffUPTAi4hgEjegGyn1wJ0zz/wt2Tguq7X5uPV0Ake3DmjTqL1kO2+roZpLpGb/fulsXOhFmhqrr0wsEII3h2zcWnciqTlBMJ5VkEEgSOo/Xd7n3dhAgLyXFPzf2bDB764PoiH13ezrhQNYGjcb0+xx467GdWj+ec5uIbXz9c=
X-Gm-Message-State: AOJu0YxsupXDyzJow/nsJ5Dd/J+A3e6yOR5St4+BicOhQlJ/CalFN63V
 qLHEXlGzn6WKccKNwiXoDbLa3MOVRJ9+Rm8nQS6+6oXdGpgWDAND
X-Google-Smtp-Source: AGHT+IGMFr+WRvPUWShhESRsbZEGA/7YjF6pB7FvYBPrtixRbfhiQCet+WIVbY4uyS0xlTwYTUKheQ==
X-Received: by 2002:a6b:e60a:0:b0:814:65dd:8cdf with SMTP id
 ca18e2360f4ac-816c39b7267mr38223039f.10.1721156366976; 
 Tue, 16 Jul 2024 11:59:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:26 -0700 (PDT)
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
Subject: [PATCH v9-resend 48/54] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200
 driver
Date: Tue, 16 Jul 2024 12:58:00 -0600
Message-ID: <20240716185806.1572048-49-jim.cromie@gmail.com>
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 573dbe256aa8..88c5e24cc894 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -25,6 +25,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.45.2

