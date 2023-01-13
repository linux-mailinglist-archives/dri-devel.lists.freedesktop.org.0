Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B599668FDD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B0F10E9A1;
	Fri, 13 Jan 2023 08:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334E110E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:01:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-5-15-nat.elisa-mobile.fi
 [85.76.5.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64BE84D4;
 Fri, 13 Jan 2023 09:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673596863;
 bh=cznkdyRGPN+MgO59A5w6zSqYoDDyC4/o8zwGoYFpT/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X3sDjCHvncH8nOCQqph3lRWmzA+o7ZBGUupBaWsIqvlyia+dSiapzD4cCl/9rmiPJ
 B4jr8NUwZemj7FrJVUMSVm/jr/syT5jAqqHnHz/VIkiEeZojpijB4wyQF8mSckYAYI
 I5Uhh6NRqZJYChzv/4ySxybQmm9DouIDL6rp5RZU=
Date: Fri, 13 Jan 2023 10:01:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/22] media: remove sh_vou
Message-ID: <Y8EPvllOwhODRUiP@pendragon.ideasonboard.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-21-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-21-hch@lst.de>
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

On Fri, Jan 13, 2023 at 07:23:37AM +0100, Christoph Hellwig wrote:
> Now that arch/sh is removed this driver is dead code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/media/platform/renesas/Kconfig  |    9 -
>  drivers/media/platform/renesas/Makefile |    1 -
>  drivers/media/platform/renesas/sh_vou.c | 1375 -----------------------

You can also emove include/media/drv-intf/sh_vou.sh. With that, and the
corresponding MAINTAINERS entry dropped,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  3 files changed, 1385 deletions(-)
>  delete mode 100644 drivers/media/platform/renesas/sh_vou.c

-- 
Regards,

Laurent Pinchart
