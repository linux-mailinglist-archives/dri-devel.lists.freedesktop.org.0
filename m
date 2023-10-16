Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350807CA4A5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D15910E177;
	Mon, 16 Oct 2023 09:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726AA10E177
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:59:14 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-d857c8a1d50so4283548276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 02:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697450353; x=1698055153;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i9GLVUGKessKoslJIZpAI7+l//jryIRXWw3bJSWd/JU=;
 b=RvpslWr1RrkD7XICLM5fkASeb8vka3loewJFpkfFugNMZDt3Dvd47cthwAR9qqmrjy
 nN9S33/RW4PuYCDdBrog9F14NtpvDpmz5CRwcmZ5O3xHdzUghpoBoyv0Sw2B+Y5Yniwe
 l/IER2LvMPieWSA9RUJVJ++kpvgBKU0VN229j5LXBGhsmAqO/OAb6WcrIhnMIYXlqYo2
 7aR/N86zl/wfiqdIaABuyAKdxMHhJNiMGexyUiSfw2KB/MShvLAyfOSE3xEwY675yjpI
 mxo2Yr1k64BdbdB8lVks3Ks/hzlqLvs+PVoJ2mOxsdQb0+BGjQt+K1BbiwEfae3n9jqu
 ZAEg==
X-Gm-Message-State: AOJu0Yy5d3ZtRt92b5X0JdueA7/L97jkAHVS7UfCDESPhyb/HSlYilJ/
 1KZ5qWTlyWMDJUnZnkHd1ty6P9+c9RFd7A==
X-Google-Smtp-Source: AGHT+IHbVisQLV0Bdri4XSX/r/Kvqlqm/OB7attBLe0bflBYGrTsi9wCYV7KkEudpA6/nRkZ5gEPxg==
X-Received: by 2002:a25:3c9:0:b0:d9a:d894:7b51 with SMTP id
 192-20020a2503c9000000b00d9ad8947b51mr10023795ybd.57.1697450352837; 
 Mon, 16 Oct 2023 02:59:12 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 d7-20020a258247000000b00c64533e4e20sm2506086ybn.33.2023.10.16.02.59.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Oct 2023 02:59:12 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5a7b3d33663so58208767b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 02:59:12 -0700 (PDT)
X-Received: by 2002:a81:b661:0:b0:5a7:b9b1:c0bd with SMTP id
 h33-20020a81b661000000b005a7b9b1c0bdmr19215902ywk.11.1697450352391; Mon, 16
 Oct 2023 02:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694767208.git.geert+renesas@glider.be>
 <CAMuHMdWfBTKdXvZutg4LvWqBjuz-X=ZjzX0LKPqD=JxYuLoPRw@mail.gmail.com>
In-Reply-To: <CAMuHMdWfBTKdXvZutg4LvWqBjuz-X=ZjzX0LKPqD=JxYuLoPRw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Oct 2023 11:59:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUF61V5qNyKbrTGxZfEJvCVuLO7q2R5MqZYkzRC_cNr0w@mail.gmail.com>
Message-ID: <CAMuHMdUF61V5qNyKbrTGxZfEJvCVuLO7q2R5MqZYkzRC_cNr0w@mail.gmail.com>
Subject: [GIT PULL v2] drm: renesas: shmobile: Atomic conversion + DT support
 (was: Re: [PATCH v4 00/41] drm: renesas: shmobile: Atomic conversion
 + DT support)
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

        Hi David, Daniel,

The following changes since commit 389af786f92ecdff35883551d54bf4e507ffcccb:

  Merge tag 'drm-intel-next-2023-09-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-10-04
13:55:19 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
tags/shmob-drm-atomic-dt-tag2

for you to fetch changes up to 1399ebacbf590dfbac4fbba181dd1595b2fa10ba:

  drm: renesas: shmobile: Add DT support (2023-10-16 11:47:48 +0200)

----------------------------------------------------------------
drm: renesas: shmobile: Atomic conversion + DT support

Currently, there are two drivers for the LCD controller on Renesas
SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
  1. sh_mobile_lcdcfb, using the fbdev framework,
  2. shmob_drm, using the DRM framework.
However, only the former driver is used, as all platform support
integrates the former.  None of these drivers support DT-based systems.

Convert the SH-Mobile DRM driver to atomic modesetting, and add DT
support, complemented by the customary set of fixes and improvements.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/cover.1694767208.git.geert+renesas@glider.be/

Changes compared to v1:
  - Rebase to drm-next,
  - Add Acked-by.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (36):
      MAINTAINER: Create entry for Renesas SH-Mobile DRM drivers
      dt-bindings: display: Add Renesas SH-Mobile LCDC bindings
      media: uapi: Add MEDIA_BUS_FMT_RGB666_2X9_BE format
      drm: renesas: shmobile: Fix overlay plane disable
      drm: renesas: shmobile: Fix ARGB32 overlay format typo
      drm: renesas: shmobile: Correct encoder/connector types
      drm: renesas: shmobile: Add support for Runtime PM
      drm: renesas: shmobile: Restore indentation of shmob_drm_setup_clocks()
      drm: renesas: shmobile: Use %p4cc to print fourcc code
      drm: renesas: shmobile: Add missing YCbCr formats
      drm: renesas: shmobile: Improve shmob_drm_format_info table
      drm: renesas: shmobile: Improve error handling
      drm: renesas: shmobile: Convert to use devm_request_irq()
      drm: renesas: shmobile: Remove custom plane destroy callback
      drm: renesas: shmobile: Use drmm_universal_plane_alloc()
      drm: renesas: shmobile: Embed drm_device in shmob_drm_device
      drm: renesas: shmobile: Convert container helpers to static
inline functions
      drm: renesas: shmobile: Replace .dev_private with container_of()
      drm: renesas: shmobile: Use media bus formats in platform data
      drm: renesas: shmobile: Move interface handling to connector setup
      drm: renesas: shmobile: Unify plane allocation
      drm: renesas: shmobile: Rename shmob_drm_crtc.crtc
      drm: renesas: shmobile: Rename shmob_drm_connector.connector
      drm: renesas: shmobile: Rename shmob_drm_plane.plane
      drm: renesas: shmobile: Use drm_crtc_handle_vblank()
      drm: renesas: shmobile: Move shmob_drm_crtc_finish_page_flip()
      drm: renesas: shmobile: Wait for page flip when turning CRTC off
      drm: renesas: shmobile: Turn vblank on/off when enabling/disabling CRTC
      drm: renesas: shmobile: Shutdown the display on remove
      drm: renesas: shmobile: Cleanup encoder
      drm: renesas: shmobile: Atomic conversion part 1
      drm: renesas: shmobile: Atomic conversion part 2
      drm: renesas: shmobile: Use suspend/resume helpers
      drm: renesas: shmobile: Remove internal CRTC state tracking
      drm: renesas: shmobile: Atomic conversion part 3
      drm: renesas: shmobile: Add DT support

Laurent Pinchart (5):
      drm: renesas: shmobile: Remove backlight support
      drm: renesas: shmobile: Don't set display info width and height twice
      drm: renesas: shmobile: Rename input clocks
      drm: renesas: shmobile: Remove support for SYS panels
      drm: renesas: shmobile: Use struct videomode in platform data

 .../bindings/display/renesas,shmobile-lcdc.yaml    | 130 +++++
 .../userspace-api/media/v4l/subdev-formats.rst     |  72 +++
 MAINTAINERS                                        |  13 +-
 drivers/gpu/drm/renesas/shmobile/Kconfig           |   3 +-
 drivers/gpu/drm/renesas/shmobile/Makefile          |   3 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_backlight.c |  82 ---
 .../gpu/drm/renesas/shmobile/shmob_drm_backlight.h |  19 -
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c  | 650 +++++++++------------
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h  |  27 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   | 179 +++---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h   |  18 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c   |  77 ++-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.h   |   9 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 326 ++++++-----
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h |   5 +-
 include/linux/platform_data/shmob_drm.h            |  57 +-
 include/uapi/linux/media-bus-format.h              |   3 +-
 17 files changed, 860 insertions(+), 813 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
 delete mode 100644 drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c
 delete mode 100644 drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.h

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
