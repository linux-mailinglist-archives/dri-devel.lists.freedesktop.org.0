Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121658411A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E76811A866;
	Thu, 28 Jul 2022 14:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C20511A7D4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:28:41 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id b11so3433572eju.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gvXbeuK/nDPmsZZTRnDVNdv3SfvIgHhFwFU2kIzHG68=;
 b=UUn+zotXHe6ND+iqyztenRNM6eQqekQZejLSPdmR7TqJ/qPLS7+rJB6KdPHJxTiZK+
 q3BotwxEHcUR0oxFWmR8c3559LeGfizKqWvCE/alvuJctwxRL+0/gyKCu9GT2leHLrOY
 x6tXIjp7tGWh5atJIbhoXTGnFxQq658fGLd3SHG4ZCyiHaQh+hZLHXksYqUzfQJzK2cv
 Y0LACEGoBZWEGxcBTk5kV+NcgEpQ30wdddhf+ysl1YBNQjYAYClayxzS9uXCs2IkNZnR
 OOT27cxCpxgBMtOTuQyLc9fuI8ymnflO2gnBwmGQSNljurU5u2C3BQ7S9PDmoZyfO6h9
 e0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gvXbeuK/nDPmsZZTRnDVNdv3SfvIgHhFwFU2kIzHG68=;
 b=X2BbR7l4jqEBFtrccKRI12imjY38kFkC8PpSDk/h2w883mBu05Cpyhg+EF5ldkqWb3
 k5BGJgva3I+jhzxT04ob7pBJxXbMhVFylsu21lFHBUQ/S5VFW9ZAzQDzSi3dX9jAOrWC
 Vwtzpr+eXQjcQV3TWFocjXpBjivjjtHyfb7+D6vk6EHDKgFYB6KBf3s4RojblGBdZFc4
 hUGnaospj2Jr4mQxGkmbDetVZMPpgAvdupkO7Z0mr7gAHKnFeBoN9Wni8srTTkx9dNoe
 fAqQR8lgoON2S04lpYYeGwvzIeB9hkA6cctbdc4GdmtIkavy5MqeLdQnh/E9q6Vsd8HJ
 x5xw==
X-Gm-Message-State: AJIora8Wx5wo2dAoxUs9PB1CpFunYhWIZjKg3vh0DecsLN1Rd7eiDZAl
 u2wwNZYRHAIpE0TAklqfbeU=
X-Google-Smtp-Source: AGRyM1usb4SPM3cGqtqin0Wwas0cy7iM0Lq2zERxvCAmcTEakP2TyeXIbIB/uwiXZ00pIE3dJWi/UQ==
X-Received: by 2002:a17:907:6d01:b0:72f:53f:7a25 with SMTP id
 sa1-20020a1709076d0100b0072f053f7a25mr20932970ejc.126.1659018519713; 
 Thu, 28 Jul 2022 07:28:39 -0700 (PDT)
Received: from nergzd-desktop.localdomain ([23.154.177.9])
 by smtp.gmail.com with ESMTPSA id
 y1-20020aa7d501000000b0043cce1d3a0fsm755949edq.87.2022.07.28.07.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 07:28:39 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add generic framebuffer support to EFI earlycon driver
Date: Thu, 28 Jul 2022 17:28:17 +0300
Message-Id: <20220728142824.3836-1-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.37.0
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Markuss Broks <markuss.broks@gmail.com>, linux-doc@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the EFI earlycon driver be suitable for any linear framebuffers.
This should be helpful for early porting of boards with no other means of
output, like smartphones/tablets. There seems to be an issue with early_ioremap
function on ARM32, but I am unable to find the exact cause. It appears the mappings
returned by it are somehow incorrect, thus the driver is disabled on ARM. EFI early
console was disabled on IA64 previously, so I kept it in EFI earlycon Kconfig.

This patch also changes behavior on EFI systems, by selecting the mapping type
based on if the framebuffer region intersects with system RAM. If it does, it's
common sense that it should be in RAM as a whole, and so the system RAM mapping is
used. It was tested to be working on my PC (Intel Z490 platform).

Markuss Broks (2):
  drivers: serial: earlycon: Pass device-tree node
  efi: earlycon: Add support for generic framebuffers and move to fbdev
    subsystem

 .../admin-guide/kernel-parameters.txt         |  12 +-
 MAINTAINERS                                   |   5 +
 drivers/firmware/efi/Kconfig                  |   6 +-
 drivers/firmware/efi/Makefile                 |   1 -
 drivers/firmware/efi/earlycon.c               | 246 --------------
 drivers/tty/serial/earlycon.c                 |   3 +
 drivers/video/fbdev/Kconfig                   |  11 +
 drivers/video/fbdev/Makefile                  |   1 +
 drivers/video/fbdev/earlycon.c                | 301 ++++++++++++++++++
 include/linux/serial_core.h                   |   1 +
 10 files changed, 331 insertions(+), 256 deletions(-)
 delete mode 100644 drivers/firmware/efi/earlycon.c
 create mode 100644 drivers/video/fbdev/earlycon.c

-- 
2.37.0

