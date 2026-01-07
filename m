Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978ACCFBFF0
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 05:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B2610E041;
	Wed,  7 Jan 2026 04:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ri1PFgfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F51F10E041
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 04:43:13 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7f89d0b37f0so187192b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 20:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767760992; x=1768365792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WslmtEFTWEHvFrP3QiD87NaWkQaTvkUfKeQGZcqLgCc=;
 b=Ri1PFgfIy92clt2TgZXbbb8Anqgd4F6nvJ/SV/aQdyq9428uAsYO++oZVE5cZ0ELGZ
 C4FHfHGI90mxUkThCCik7/lu8BFbtAu98R3LAV460dS4tDvw3B2xOocjdmIgopDkjjFh
 ENIm2Z0KNgHygpKp0ucLcDSvTwri2GAAxyYNavb0cvCT+49yogNdJtYi/jefYAQu/YP5
 5mUYemYPutX7YQkCgWnYkRc7TTioJcI7JtTGOpK3n1LIdJZveo+ZqM71DsuXlVTy80fA
 1YCzFkc5vxMxU+9sTADYpWVDBQWy6mex0UeYTDvekcZJLhnQRRWBADTBRDQAbj5YrQuz
 fxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767760992; x=1768365792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WslmtEFTWEHvFrP3QiD87NaWkQaTvkUfKeQGZcqLgCc=;
 b=YXEFuVsVz3RdjYomGj1g0Ea5U4zo5mUYO4nt6k1WCZO1c5n6Hjp95MSjcay9I5d59m
 4rq+lRTktKL/+wW3cHGPaD2hyuKgXaq4p8wVFvDoJz2Jnw1sTCa2cWIsu0o7TPPM6I7x
 sadcc3DcnpSSJtzRSRrvwR3D/OIIQ336jMxiQ0LWsB1Qi9HwzAEVvu1vjDmnGb2/jULh
 TTKi6stASIMRx+1d/DV2g49W3Vj/CbYL7aMLmBvzXuwaquce24JC3pQzFI/+dC/BWeWH
 1JRqMxrLdE60uRveEHTxukg99KCs2gp/gl/QY856XN5xhBO1lIpMq6CLmDb4YUBEbXms
 8iOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmS8qvDL8NrWzFPVrUvknYQbrhd/4RcKnImzq/DL0jv0dn6ESiuUuW4UxkWYnc32CMi5fNrGP5o3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMYiE1jnQsT+xTyhVaODzggO15Be9j0gIpHrbZOwqgB4KAk2f7
 CZ0QXqLo+HaQptRZ/AlUllpqkQJhFCfqD+V5abrRa7aGaY/IoTs3yYRt
X-Gm-Gg: AY/fxX5GCdAzntbk+OcCf1QZqYpkg7hciDAfEbmxSj00jEmREd8dfUKvA1EJIoIDkRg
 9KUvEoo1pkGgPLpgABx+KSy++58kieodKWKGqSIjAxrDgRLwTh3IgKgctDzYsuvLlhpUw/xGwdo
 UwyTxiyIolEPt9uThuO1TZex3B3M2MW9YYuCuUV4ehRahvb3Q6c/GP+XDPgnIQqtNgvTsCyyyi4
 d/FpPaTRZXyV4CF230VZt9uPPQAmYirhaQZ5AUM5m2/GmG6q0GO6LxMk/FoC73Ys2plOCZW+yWE
 H5wMHrilweZn/tLcdclK+Lt7sskruNuhNKiDYzi56PMfs9W9iEyCIpfB8kEJ30s4czbouCRzy78
 5XxHnKQ9irMZgW0sexBalJvUFdDyuGNSF0nQAnQUNhG8zuPK62tR44cSqoHv27xC7BbCNZbO7FI
 NZ/b6Rhv7jZ8DbU8dYzr9Q2AhJdYXVEYzzKNjrZwT/tlA=
X-Google-Smtp-Source: AGHT+IHvMYshChHPS/SvCPXJOds/HFiMhuycAJvqKdORLFBZ5x1SeAE0yuJFjXTcwpdgt59hPsI5hw==
X-Received: by 2002:a05:6a20:548d:b0:366:14b0:4b1a with SMTP id
 adf61e73a8af0-3898eb23fe7mr1504437637.37.1767760992455; 
 Tue, 06 Jan 2026 20:43:12 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 20:43:12 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v4 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Date: Tue,  6 Jan 2026 20:42:53 -0800
Message-ID: <20260107044258.528624-1-chintanlike@gmail.com>
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

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
Changes in v4:
- PTR_IF() was removed and overlay sysfs is now optional via __maybe_unused 
  and #ifdef CONFIG_FB_DEVICE (suggested by Helge Deller)
- Decouple variable definition and assignment in 
  omapfb_remove/create_sysfs (suggested by Andy Shevchenko)
- Added Reviewed-by tags:
  - fb: Add dev_of_fbinfo(): Helge Deller, Andy Shevchenko
  - staging: fbtft: Helge Deller

Changes in v3:
- Use PTR_IF() to conditionally include overlay_sysfs_group in 
  overlay_sysfs_groups(suggested by Andy Shevchenko)
- Decouple variable definition and assignment in 
  fbtft_sysfs_init/exit(suggested by Andy Shevchenko)

Changes in v2:
- Add dev_of_fbinfo() helper (suggested by Helge Deller)
- Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
- Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

---

Chintan Patel (4):
  fb: Add dev_of_fbinfo() helper for optional sysfs support
  staging: fbtft: Make FB_DEVICE dependency optional
  fbdev: omapfb: Make FB_DEVICE dependency optional
  fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional

 drivers/staging/fbtft/Kconfig                 |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c           | 20 +++++++++++++++----
 drivers/video/fbdev/omap2/omapfb/Kconfig      |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 18 +++++++++++++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  5 ++++-
 include/linux/fb.h                            |  9 +++++++++
 6 files changed, 49 insertions(+), 11 deletions(-)

-- 
2.43.0

