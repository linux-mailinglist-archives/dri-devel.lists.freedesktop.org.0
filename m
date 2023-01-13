Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD2C668F71
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 08:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DBA10E99F;
	Fri, 13 Jan 2023 07:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8AF10E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 07:46:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-5-15-nat.elisa-mobile.fi
 [85.76.5.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CD9D4D4;
 Fri, 13 Jan 2023 08:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673596008;
 bh=wltYQdcEAMz3UcFF0QVHXXUKY2mcn2dIbJ+Vsno/G9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LPk9GDnJb8yIAG/qZw7j85ZzRhjxe0eUQN+NAsK+9uT/7opY3bx+SaNPEdtJt/mLy
 7ehj3skE2f1g4W6IvOyNfZJFjCDi/ZIYJt389ghohYbhf6hpvDv0vqO0a1KKztGEE2
 l1/4JdyjqER4jRCS7n87hgkuZ+xUKmlP2i0l0lNc=
Date: Fri, 13 Jan 2023 09:46:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
Message-ID: <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-2-hch@lst.de>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

Thank you for the patch.

On Fri, Jan 13, 2023 at 07:23:18AM +0100, Christoph Hellwig wrote:
> This driver depends on ARM && ARCH_SHMOBILE, but ARCH_SHMOBILE can only be
> set for each/sh, making the driver dead code except for the COMPILE_TEST
> case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

No objection from me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/Kconfig                       |   2 -
>  drivers/gpu/drm/Makefile                      |   1 -
>  drivers/gpu/drm/shmobile/Kconfig              |  12 -
>  drivers/gpu/drm/shmobile/Makefile             |   8 -
>  .../gpu/drm/shmobile/shmob_drm_backlight.c    |  82 ---
>  .../gpu/drm/shmobile/shmob_drm_backlight.h    |  19 -
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c     | 683 ------------------
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.h     |  55 --
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c      | 303 --------
>  drivers/gpu/drm/shmobile/shmob_drm_drv.h      |  42 --
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c      | 150 ----
>  drivers/gpu/drm/shmobile/shmob_drm_kms.h      |  29 -
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c    | 261 -------
>  drivers/gpu/drm/shmobile/shmob_drm_plane.h    |  19 -
>  drivers/gpu/drm/shmobile/shmob_drm_regs.h     | 310 --------
>  15 files changed, 1976 deletions(-)
>  delete mode 100644 drivers/gpu/drm/shmobile/Kconfig
>  delete mode 100644 drivers/gpu/drm/shmobile/Makefile
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_regs.h

-- 
Regards,

Laurent Pinchart
