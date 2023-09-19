Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3D7A66B1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 16:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D6D10E27B;
	Tue, 19 Sep 2023 14:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F249810E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 14:28:53 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-59c0b9ad491so41513997b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 07:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695133733; x=1695738533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XNgTqTzP+DNN14ddNBvAXkG8Xk8uIXpLMonsvHM2PZ8=;
 b=nPFXxKKM511fmIPB4DROvyRYT/OYSE+QMyHkWPgwhoD/Ohox5YEx8FpYOR3Q83a6rI
 2tZOI94cgYG3+1Qk1GGcW2x87iwwcdFNqDxmjLpQOgga0BJKmdk/X4kK2IrrTTAqksPM
 pSFcwdr5QkEuL/zX48H3C7pUwckYfPFnZIBa1T5lp9G0SzrfbSWw7jzqW1IioTCk6CX9
 CJDkD2g9aaWC04LAixj+soq1vuEPs5z0eGqX/6sZ6UT8Ay1IlaBZEkOygb07VBJTI/ep
 Xp8ysKaHysvyaz6NSG8MSIyFs2dcXUFTHICZsUVHSzwKbzcJ66AbjQj9WeYBuy74t2Iz
 8WZA==
X-Gm-Message-State: AOJu0Yz5CAcWyFJEE/NH6zz69ksfgIrRSccBQTRpXKcXhSEll/TsAosV
 uovtuydjLWRNFtDLhUpQPE7+oW5uGYAaOg==
X-Google-Smtp-Source: AGHT+IFgQS8/gARqzrsDT7u5RqhVq7AANG1v8yZq/BMn/bdlnKt6iP7AyLEgXRxAkgsOoKrQSgN4Jg==
X-Received: by 2002:a81:6506:0:b0:595:8e80:30ef with SMTP id
 z6-20020a816506000000b005958e8030efmr10321102ywb.51.1695133732816; 
 Tue, 19 Sep 2023 07:28:52 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 l187-20020a0dc9c4000000b005773ca61111sm3211460ywd.42.2023.09.19.07.28.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 07:28:52 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-d776e1f181bso5447015276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 07:28:51 -0700 (PDT)
X-Received: by 2002:a25:ac84:0:b0:d7b:9bd7:f280 with SMTP id
 x4-20020a25ac84000000b00d7b9bd7f280mr12340757ybi.0.1695133731633; Tue, 19 Sep
 2023 07:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694767208.git.geert+renesas@glider.be>
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Sep 2023 16:28:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfBTKdXvZutg4LvWqBjuz-X=ZjzX0LKPqD=JxYuLoPRw@mail.gmail.com>
Message-ID: <CAMuHMdWfBTKdXvZutg4LvWqBjuz-X=ZjzX0LKPqD=JxYuLoPRw@mail.gmail.com>
Subject: [GIT PULL] drm: renesas: shmobile: Atomic conversion + DT support
 (was: Re: [PATCH v4 00/41] drm: renesas: shmobile: Atomic conversion + DT
 support)
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

The following changes since commit 0663e1da5ba8e6459e3555ac12c62741668c0d30:

  drm/dp_mst: Tune down error message during payload addition
(2023-09-18 16:38:21 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
tags/shmob-drm-atomic-dt-tag1

for you to fetch changes up to bfea0fa9052aa8d235b24957eb84d9ff20cb87b7:

  drm: renesas: shmobile: Add DT support (2023-09-19 15:58:04 +0200)

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

Link: https://lore.kernel.org/r/cover.1694767208.git.geert+renesas@glider.be/

This PR is based on today's drm-misc/for-linux-next, to avoid a
conflict with commit 775b0669e19f2e4a ("drm/shmobile: Convert to
platform remove callback returning void") in drm-misc/for-linux-next
.
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
