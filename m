Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63D2D06B7
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD936E4CA;
	Sun,  6 Dec 2020 19:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E276E4CB
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:02:56 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e7so2429574ljg.10
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gOK5EsUnBK6I0SB14+NAG+xJwYrELRFSAKPeWrBBqm0=;
 b=F5B/Dk2Vkp1/cK20z+ZEyqFMI4MhCOK1at24ue0UjfUbKVxXzUto9EPpBz17r9aNxb
 DQ+iCsfg16Ld/0BdlTVRJNUUBu/KoAZWu9eHkNiITsc3fUwfAXS3AE1WbkqIsVlhVZTz
 e228UaP+a+H4XJJ6fclx3ZCzVrkeqzV8iToa1GWcc3fxpT5EkwRuTlrenhEX2CfUisdz
 LFd7aVe8D3edJSf+5+ODMl8qKNBfWwChQzsHZrOPSq0cj+SQsAL3lLaIbzyzrQhxToV/
 2k5Zv+Gfrl9Dah/SGX98ZRI7J/Qvy5bdprVwcTTtwFyKIDcQUxeGexXpSTIe0k5AqJHw
 94Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gOK5EsUnBK6I0SB14+NAG+xJwYrELRFSAKPeWrBBqm0=;
 b=kBJ1F2cVzW26jqNkhZ2tm6GoLgLUXSjnyJHOLlY+CcparuHS+zkYg69Tax8pPvkUV9
 hALl5QmFkmPMKum1P5pqINd9Qe/IR2G+qX46wKxOvyVRiZV8wqeu0JdAooGl57dVh47V
 kn/dCowTmlXTgekRaLn5n/6B01Ni8AJJtPjK47dtkElXvCrzY80eMrdkYyYzTb/aUmSY
 SgD8mCKUdMSqoVOvepDqc7BKdcmOM5s/FDPD+GyUcEXMgTBNgR8V2ENNxFgzjQVJpUCq
 QE6K5GR2Iw4l9Slp4V+tbaY7kVnDoB2L3cDPcWp/mVCVO6LEPxk3eSwoiE+WsR7R7kne
 7tGg==
X-Gm-Message-State: AOAM530aXQRjsIr/dxqSU9bJCtwfS7Bo8haFNuhyPxTTyEJa5sEQS5BT
 IWlLxrdYN/QdJQlw7z+eaAU=
X-Google-Smtp-Source: ABdhPJyqzMYmJv7+YC6fIUFr0DLw7ne5V1xvD/3AheCOymxXwONczk9HXcZoCzmw03frYFQO64dxOA==
X-Received: by 2002:a2e:5750:: with SMTP id r16mr7150233ljd.61.1607281374626; 
 Sun, 06 Dec 2020 11:02:54 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:02:54 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 0/13] drivers/video: W=1 warning fixes
Date: Sun,  6 Dec 2020 20:02:34 +0100
Message-Id: <20201206190247.1861316-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the great work of Lee Jones in other subsystems
here is a set of patches that address all remaining W=1
warnings in drivers/video/.
Lee Jones already fixed all warnings in video/backlight/ so
this is mostly fbdev related fixes.

The general approach used were:
- Fix kernel-doc, this is often very trivial
- Drop unused local variables

Build tested on a set of architectures with various configs.

The patches do not depend on each other and fixes for one driver
are kept in a single patch.

v2:
  - Updated subject of the patches to tell what was fixed (Lee)
  - Fixed build error in one patch (kernel test robot)
  - A few editorials updates to the changelog messages

v3:
  - Applied patches that was acked - thanks Thomas!
  - Updated patches after feedback from Randy and Thomas
  - Added several new patches to cover warnings that triggers
    with other architectures than the one I used for v1 + v2
  - Included one sh specific fix that handle a corner-case,
    let's see what the sh people say to that
  - One fix to previous set of patches to fix an issue
    reported by Coverity (By Colin)

	Sam

Sam Ravnborg (13):
      video: fbdev: hgafb: Fix kernel-doc warnings
      video: fbdev: core: Fix kernel-doc warnings in fbmon + fb_notify
      video: fbdev: omapfb: Fix set but not used warnings in hdmi*_core
      video: fbdev: uvesafb: Fix set but not used warning
      sh: Fix set but not used warnings with !CONFIG_MMU
      video: fbdev: sparc drivers: fix kernel-doc warnings for blank_mode
      video: fbdev: mmp: Fix kernel-doc warning for lcd_spi_write
      video: fbdev: wmt_ge_rops: Fix function not declared warnings
      video: fbdev: goldfishfb: Fix defined but not used warning
      video: fbdev: gbefb: Fix set but not used warning
      video: fbdev: efifb: Fix set but not used warning for screen_pitch
      video: fbdev: controlfb: Fix set but not used warnings
      video: fbdev: sis: Drop useless call to SiS_GetResInfo()


 arch/sh/include/asm/io.h                          |  2 +-
 drivers/video/fbdev/bw2.c                         |  2 +-
 drivers/video/fbdev/cg3.c                         |  2 +-
 drivers/video/fbdev/cg6.c                         |  2 +-
 drivers/video/fbdev/controlfb.c                   |  4 ++--
 drivers/video/fbdev/core/fb_notify.c              | 10 ++++++++++
 drivers/video/fbdev/core/fbmon.c                  |  2 +-
 drivers/video/fbdev/efifb.c                       |  3 +--
 drivers/video/fbdev/ffb.c                         |  2 +-
 drivers/video/fbdev/gbefb.c                       |  4 +---
 drivers/video/fbdev/goldfishfb.c                  |  2 ++
 drivers/video/fbdev/hgafb.c                       | 10 +++++-----
 drivers/video/fbdev/leo.c                         |  2 +-
 drivers/video/fbdev/mmp/hw/mmp_spi.c              |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c |  4 ++--
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c |  4 ++--
 drivers/video/fbdev/p9100.c                       |  2 +-
 drivers/video/fbdev/sis/init.c                    |  1 -
 drivers/video/fbdev/tcx.c                         |  2 +-
 drivers/video/fbdev/uvesafb.c                     |  2 ++
 drivers/video/fbdev/wmt_ge_rops.c                 |  1 +
 21 files changed, 38 insertions(+), 27 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
