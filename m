Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5A347555C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AD610E291;
	Wed, 15 Dec 2021 09:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE79A10E291
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:43:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C284B292;
 Wed, 15 Dec 2021 10:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1639561379;
 bh=SmJr5+arJ4L5EhJ8ZOy8lxRl/nWuYCIFNU3k4t6xjL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lCe0n0Y4JYi8fkv6+HTVo5tlEe0ELAcbJcug1BK0OMg6WDCKNiNdb0F86QH7RuIoK
 RPIA+cBmGo9cdjQ7OsMPA74Ncq/i4/F039KnDHeMAcNUqmzzSrIc/whIA08SKn26IH
 HMFwYyzWSf0SycXXYC6luEYOnlngJV6L5R03yPgs=
Date: Wed, 15 Dec 2021 11:42:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 0/3] drm: rcar-du: Add missing dependencies
Message-ID: <Ybm4oFaYgtl5+MRk@pendragon.ideasonboard.com>
References: <cover.1639559338.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1639559338.git.geert+renesas@glider.be>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patches.

On Wed, Dec 15, 2021 at 10:27:44AM +0100, Geert Uytterhoeven wrote:
> 	Hi Laurent, Kieran, et al,
> 
> This patch series adds missing dependencies to Kconfig symbols related
> to the R-Car Display Unit.  These dependencies prevent asking the user
> about R-Car display drivers when configuring a kernel without Renesas
> SoC support, or when the answer wouldn't have any impact on the kernel
> build.

Won't this have an impact when someone will regenerate an ARM64
defconfig, given that we want to keep those options enabled in
arch/arm64/configs/defconfig ?

> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>   drm: rcar-du: DRM_RCAR_DW_HDMI should depend on ARCH_RENESAS
>   drm: rcar-du: DRM_RCAR_USE_LVDS should depend on DRM_RCAR_DU
>   drm: rcar-du: DRM_RCAR_MIPI_DSI should depend on ARCH_RENESAS
> 
>  drivers/gpu/drm/rcar-du/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
