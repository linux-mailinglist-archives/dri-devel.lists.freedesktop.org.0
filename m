Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C714CCE903
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 06:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B11010E9C6;
	Fri, 19 Dec 2025 05:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UAcuaTO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ECD10E9C6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 05:43:39 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a0d67f1877so17101095ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 21:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766123019; x=1766727819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sEjpRHuoUQuSNfpUTp6o9J/plYbBOC8VgnoTelGo6Ag=;
 b=UAcuaTO6Y5qDaGMImXQqfPN18n0yB1DsNrPlazUUA73mxcCt9Kpu9j2AW8lUpFEExr
 fi8gVftHLzmwlI+rWxxa09UniugcR0HDM6czRJDV5osGXQKefK5fEVGflRfYi3GYa43l
 kBNGe2/CMbnPyjPlVa/6FUdekaFCoqTy+Wt1S/mUwTB628P9horoxZIz5KLQkMXN1v7O
 2CedKHNW5a+Ym1WgpbWGzc61mMIsfE5zaa+ZowMeXQIVL5QLtchON9aw2lkt7D4jwJh/
 wuHD71WmjUSZJrIFCV4xKl+7gMvupjt53Ip4FMhfJZPygFKZoXBRDv7Yx7COnZweEWyZ
 gEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766123019; x=1766727819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEjpRHuoUQuSNfpUTp6o9J/plYbBOC8VgnoTelGo6Ag=;
 b=U1Mjh/8SYe8OkR+GViPhKOnt6kP1Bt6pUcn5yeh6FyBD89QO6B//8SeunQ5U7h6BRc
 SkMNgio5aAGc5jt9wi/+zuNGFFyGi6waha5Kh2qDUxYLhwWLQJELSxnNgPnqcPxBB5K5
 U8Tc+uEr1HBD6ZcWUK8RKfaqU7/x/i9YQpd9kBh2aeAQyrmghkhxgonguy9fhFo1uUnT
 VQ43V4daWJJvFNwlMVfGGGHE9Jw2YLekaYK1rbT4agoKD4opfrYCG7Go4WrvIeTjbrfm
 oRCWFjgOrRNgSeHwhgK2En/i3ByZKAskjUO6s78Z6ittWmv3x1iU4d2AB8UbVoC6QMrL
 zqBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Iivnxh3I2/fw59WlBE7Ed3lWTmmwrdDutz7NdLDLaNM6meEDXz1wTf4diZGSbQ5CHhdHIeSd83g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ+wZ/VDUvdpo9xbXcF2jdKatjL3af2cuCw2mjxDP5PH4oorWX
 y9O3x1bsfhwHoXwQ28rMLWnauwciH3BoqimANA+L72udcJWR4HpNarCR
X-Gm-Gg: AY/fxX7HQkJeMaDUhkHb1uJZTv1hL6mmWAjDL0A9f1EgaoHSjW2/6DNpAdiA76wBxo7
 RNAMKCN1EVpgGbHvYYnVdFuFFmjRNB2mq6K0OFeWI7RbPqU78ppuR7t0sfR3YMCvOi9nibIwRC9
 53zGahCjxnki4nM1T0ZGlZFAM2eBqTmzVXoUqy82IjmEqcv0cPQ4b9oU+9KRguiBjxWYJCBK/lR
 CZnYflx+svPLIqOS2CGd4bhkLDuJ2DaEvN8lZRJyF0YumE0W8e/2XqTS5BPieyan8wg5wRKm/Eb
 wtQel4IJlsL9fW+aiQVb8YT0Uhm1y/tae6O4cIKFmsuOsYWV2p6cvVOIIVVTi88eAU2/4FP24oI
 A1SFJmSF8gf59Fj4dg2R7uGGu+yprXKt+uAIbkIzH8ctFdTDcKP8JeQQ42jfnZ2s5WZeFfbmV4c
 1mTTQ3sUXduAfnOVN81EfDFt8zgx7/ilQPkVtPM/Gj9Mg=
X-Google-Smtp-Source: AGHT+IHctISdxJ6hWwW5bBx0NwJSgL9qDkTNsgriPOBWh2QM/6lUZdbbSRVd/mE4FUYhXiJRoQ1jPw==
X-Received: by 2002:a17:903:2301:b0:294:f6b4:9a42 with SMTP id
 d9443c01a7336-2a2f21fad06mr14413895ad.9.1766123018955; 
 Thu, 18 Dec 2025 21:43:38 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 21:43:38 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v2 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Date: Thu, 18 Dec 2025 21:43:15 -0800
Message-ID: <20251219054320.447281-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
remove hard FB_DEVICE dependencies.

The series introduces a small helper, dev_of_fbinfo(), which returns
NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
full compile-time syntax checking.

Changes in v2:
Add dev_of_fbinfo() helper (suggested by Geert Uytterhoeven)
Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

Chintan Patel (4):
  fb: Add dev_of_fbinfo() helper for optional sysfs support
  staging: fbtft: Make FB_DEVICE dependency optional
  fbdev: omapfb: Make FB_DEVICE dependency optional
  fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional

 drivers/staging/fbtft/Kconfig                  |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c            | 18 ++++++++++++++----
 drivers/video/fbdev/omap2/omapfb/Kconfig       |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c    | 16 ++++++++++++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c         |  9 +++++++++
 include/linux/fb.h                             |  9 +++++++++
 6 files changed, 50 insertions(+), 10 deletions(-)

-- 
2.43.0

