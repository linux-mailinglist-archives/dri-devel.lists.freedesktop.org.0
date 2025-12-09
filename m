Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DFACAEDE9
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 05:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E2C10E459;
	Tue,  9 Dec 2025 04:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c3PNTa4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D410B10E459
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 04:28:08 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-343ee44d89aso6276172a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 20:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765254488; x=1765859288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OlS8NGZoUAbx3WVREmoqnUjbjOgDJ/P+b1vdg2wt/Bk=;
 b=c3PNTa4/aO3PwfDQP4ZwDGfXKBK1P7KY2aq8ufNu/e6p6gZixAzOKeC1YWagrl6OZq
 6iGU3SIuKploGlGELvYJLgmXHVvmN0v1Oj04q/NRh7b0kzyj/oJKkVOlD9So8rLa0+gc
 kBzapf44QUPksoLKfd3uceH+zSifX3cWDIQ73G6cCR6l/ZS64mtMdnL4UQ6Rva/7nSFt
 G/q62jlX88aKkZ6Co8Ps5U89Tzsymi6d34PfJg0cfVMy0cvQsEMbvngZBtg5hsqhv2mP
 2jO3RrCmdqO0qGsxm935KTLfh5dv582XVZWWz5bSNxkGfJvceKEbQK05gXuql6l4w7AF
 78Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765254488; x=1765859288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlS8NGZoUAbx3WVREmoqnUjbjOgDJ/P+b1vdg2wt/Bk=;
 b=LZrA8CFfnJeUVv5dSBr812eXOntVKPMCcD5e1V/UEsu3TCqFit/XuXPMl/MzYfG9v6
 qAe3MyjN8ksKq5H9J2krVAiQ67LRnxkLnY+scMt59k5TkahrZ97JkMum6AjVQVGKNpYr
 usbrwnPyEwPt/4Ktr39tLciBpaEryu8YSl0XpFhaG8M6H6lzcAWtzJPQT6UY/UzYQWiR
 d/5NtMe2oFIlZ5hVVm+EMKQvCq17kp5YFzoQvuNMdwXrD7kaOX2is1gyjMGSrmECALoj
 QaejRPHCPSkL3m6PHA5rVejwQQoHOW+OBM0IgbiRUe8Jh2Im3KcEgofsdRumZx66owaL
 EYow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8P1wb+bd/j0kzfJ/3iNi0lhyG27jBXnC+5Pkn22SSY4Mcfno/u62rPQa0oEtTIQ1bmaPETmiLWNc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7BpAeRWGnTkyp5gA3QfF8FaMWcMMkcH1x4W5XBPiurbR+ym3S
 il7AGKYpV7hgK6IsfGrlHTwEp0ycNzibm4EuzZRL5C82JEg1cYNct5sv
X-Gm-Gg: ASbGncvnCqOp81NJ9l7irwkOVLhba90TRGgQ14m1y1W1wOfOeNw/xoc+o7TqH1XBe4g
 PsN7QziEA2HbwqWmf76FLPYwhSuaFP7BraaWBaDF2ccSajcQJU2S/1R8GdPFxosKWFWDGOOPRbp
 pZjXvyxdDbxTiqWUIIYGuwRyPK9qAUn7i6MJQfQxT1FBh80SmfRtJjgZ+/lh5YCwXEYbKRcmC0/
 fZtpEpK0DYJ6cTrIHWBYoRqnyLUfveW5KKyDWQ5hsA9B1WIAdnhTE23GZ1sATH9qwyJmidLhjEo
 wbAWSOHL0PfMI/Q4XTJh1hX4aCikTq0AQG+nJqtGI02anrr96KtoKAxsbAVBNhsu/0nbDRPEAUt
 3f9zqhUoiesSUqz4PesAj8HiygnWnS8n4MZdyzkXhSFvyveKu8GA/aObiTcH+ezwIC9ydxITQQe
 TdX29xaL9tHA8Pt8z2YNKGLahEeVCh4Nk1X75yq/IgrBj8QqdIml0iZQ==
X-Google-Smtp-Source: AGHT+IFg1iIMyFLucr9uOHmmv9GE122UxHPeUmvBUIJroW50FItL/tqkSaQEcjZrl0Un6zQJ6OWfHQ==
X-Received: by 2002:a17:90b:1e07:b0:340:c64d:38d3 with SMTP id
 98e67ed59e1d1-349a2511cbdmr10578046a91.12.1765254488312; 
 Mon, 08 Dec 2025 20:28:08 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:b455:298d:48bb:1784])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 20:28:07 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:41 -0800
Message-ID: <20251209042744.7875-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi all,

This small series makes several legacy fbdev drivers buildable with
CONFIG_FB_DEVICE=n. Currently, multiple fbdev drivers rely on fb_info->dev
and sysfs attribute registration unconditionally, which leads to build
failures whenever FB_DEVICE is disabled.

Thomas previously noted that FB_DEVICE should eventually become optional
and that drivers should not depend on sysfs or fb_info->dev being present
unless the Kconfig explicitly selects it. This series pushes in that
direction by tightening the FB_DEVICE dependency boundary without changing
any runtime behaviour when FB_DEVICE=y.

What this series does *not* change

- No functional behaviour changes when FB_DEVICE=y.
- No removal of sysfs interfaces.
- No changes to fbops, memory allocation, or display update paths.

Build & test coverage

Tested with the following combinations:

1. **FB=y, FB_DEVICE=y**  
   - Baseline configuration; no regressions expected.

2. **FB=y, FB_DEVICE=n**  
   - Drivers build successfully.
   - No sysfs attributes are created.
   - fbdev devices operate normally (where applicable).

3. **FB=n**  
   - Drivers depend on FB, so they properly do not build, unchanged.

Motivation

This moves fbdev closer to supporting FB_DEVICE as truly optional, helps
reduce Kconfig entanglement, and clears several long-standing TODO items
as suggested by Thomas Zimmermann around legacy sysfs usage inside fbdev 
drivers.

Feedback is welcome, especially on whether the guard boundaries around
sysfs are placed correctly or whether more logic should be pulled under
CONFIG_FB_DEVICE.

Thanks,
Chintan

Chintan Patel (3):
  fbtft: Make sysfs and dev_*() logging conditional on FB_DEVICE
  omapfb: Guard sysfs code under CONFIG_FB_DEVICE
  sh_mobile_lcdc: Guard overlay sysfs interfaces under CONFIG_FB_DEVICE

 drivers/staging/fbtft/fbtft-core.c            | 20 +++++++++++++++++--
 drivers/staging/fbtft/fbtft-sysfs.c           |  8 ++++++++
 drivers/video/fbdev/omap2/omapfb/Kconfig      |  2 +-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 11 ++++++++++
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  4 ++++
 5 files changed, 42 insertions(+), 3 deletions(-)

-- 
2.43.0

