Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010EC58B6F8
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 18:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D60F10F685;
	Sat,  6 Aug 2022 16:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5302F10F475
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 16:34:01 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id g14so2722670ile.11
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Aug 2022 09:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=CrJZA7OyrjgVNT2yluOnXy9DkAQBVd94845d/Gv6tLM=;
 b=BBnD1fZYV9L2qmB93O8uuBM7b56i/6rpHB39Gt4NkxShp0AsrpWMBGl/hy/vBshktb
 uqT7gsS2icCt8SfpYN2cW6sPvBtB/02bOxI5UVcvvsI/8/XBDUx7U4iufh68Zr1Vyx0U
 XvNmYYOCkUDsh5TTrbb9bEEjDI+H/1OLOc0H1OlLUGHf9BtWfGLsiDMZMr/jTUTb0gmn
 yGOy1qm7kpSH4/DUDZ1T6G81Bd6zON/uxEygpVzX3b1VL4aJi8ob277QNJZpYb1V0xo0
 pf/bRHA4vutnBu8e7AerEFWX2zS+hrsbt2OeIkRRfDjTTVllZumPKga35ZYUcjwZIZp7
 aOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=CrJZA7OyrjgVNT2yluOnXy9DkAQBVd94845d/Gv6tLM=;
 b=QYsVKoSZl3iZI7cnU/q8m4whbQb2pxCnzd1EsjI3Ml21t8vCLKqKx8fLIpvqd7FBDY
 xefLj+ca5hhHnK2T76jSNRR1jUkZM1bibfXKWiDerppUh2pqAXPTCBisVYHYtUhscmpp
 kpHHTZ8KByVsCUSyanFKRtp5PBKKr+Zku0+LGGvxsbLk6gA5b8ZRCakvB9z317R61HJV
 yHym1GSMFL3vhrC2tDfp7OFlBtjn4Lot3zpuyuPuEnJaqjjNtgi0RimQm60JL4QxwD9B
 w5q7NT/FMb6IUPOeUXk4Snf2p1gSjCPmnICAjJNsrvbQLyKorObetqIma+i29DgbQ4d9
 LO8A==
X-Gm-Message-State: ACgBeo0Pyc6whfyz8dkNOOv1tL+CXWjJhlxxMovtkVuoI5uxT0Io5Z5q
 aRXLXjV9Y/Zp5SLqNEmHd4Q=
X-Google-Smtp-Source: AA6agR4ik2yLjyl4JGzH05jPebblOZOGEbVYo9YxyJpbB8q+HpxUbT/8PJmzG5GbANnhrZXBdyKDhQ==
X-Received: by 2002:a05:6e02:1a61:b0:2e0:c417:4cb0 with SMTP id
 w1-20020a056e021a6100b002e0c4174cb0mr1025014ilv.186.1659803640515; 
 Sat, 06 Aug 2022 09:34:00 -0700 (PDT)
Received: from nergzd-desktop.localdomain (tor-exit-50.for-privacy.net.
 [185.220.101.50]) by smtp.gmail.com with ESMTPSA id
 a20-20020a056e020e1400b002de6fa0d0c0sm2908009ilk.63.2022.08.06.09.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 09:34:00 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add generic framebuffer support to EFI earlycon driver
Date: Sat,  6 Aug 2022 19:32:21 +0300
Message-Id: <20220806163255.10404-1-markuss.broks@gmail.com>
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
 ~postmarketos/upstreaming@lists.sr.ht, Michal Suchanek <msuchanek@suse.de>,
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
console was disabled on IA64 previously because of missing early_memremap_prot,
and this is inherited to this driver.

This patch also changes behavior on EFI systems, by selecting the mapping type
based on if the framebuffer region intersects with system RAM. If it does, it's
common sense that it should be in RAM as a whole, and so the system RAM mapping is
used. It was tested to be working on my PC (Intel Z490 platform), as well as several
ARM64 boards (Samsung Galaxy S9 (Exynos), iPad Air 2, Xiaomi Mi Pad 4, ...).

Markuss Broks (2):
  drivers: serial: earlycon: Pass device-tree node
  efi: earlycon: Add support for generic framebuffers and move to fbdev
    subsystem


v1 -> v2:

- a new patch correcting serial/earlycon.c argument name to "offset" instead
  of "node"
- move IA64 exclusion from EFI earlycon Kconfig to earlycon driver Kconfig
  (IA64 has no early_memremap_prot)
- move driver from fbdev to console subsystem
- select EFI earlycon by default
- fetch stride manually from device-tree, as on some devices it seems stride
  doesn't match the horizontal resolution * bpp.
- use saner format (e.g. 1920x1080x32 instead of 1920,1080,32).

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

