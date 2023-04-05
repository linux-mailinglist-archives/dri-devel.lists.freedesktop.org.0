Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF736D72D4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 06:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E6C10E0D3;
	Wed,  5 Apr 2023 04:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488B810E0D3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 04:02:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFD7A905;
 Wed,  5 Apr 2023 06:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680667324;
 bh=7QQDxqe+YDf+wcgyso7uXaGVWNtOHPLCCDx8Kq5oRPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J4LaNJo70yb3M8uoeuL+zQ6JGPo7Ch6tGE1Yu2oprxSDCUFd4LLsNZWnMZ5yXytcG
 WYvSQSR1rs3Z6Chl35GTseuLDBQ4nSUQz5sTbMm3FLqRaWzxybj2TV5rWQVaefRmtC
 c4BzssfIhGdaRT+3Xrq/Cza7AZaSerTuLkjhNs+8=
Date: Wed, 5 Apr 2023 07:02:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 5/5] drm: shmobile: Make DRM_SHMOBILE visible on Renesas
 SoC platforms
Message-ID: <20230405040211.GK9915@pendragon.ideasonboard.com>
References: <cover.1680273039.git.geert+renesas@glider.be>
 <972e66cd36e9173ea6817d41565f708cb84bc2f4.1680273039.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <972e66cd36e9173ea6817d41565f708cb84bc2f4.1680273039.git.geert+renesas@glider.be>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Fri, Mar 31, 2023 at 04:48:11PM +0200, Geert Uytterhoeven wrote:
> The LCD Controller supported by the drm-shmob driver is not only present
> on SuperH SH-Mobile SoCs, but also on Renesas ARM SH/R-Mobile SoCs.
> Make its option visible, so the user can enable support for it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/shmobile/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/Kconfig b/drivers/gpu/drm/shmobile/Kconfig
> index 4ec5dc74a6b0b880..719d4e7a5cd75aad 100644
> --- a/drivers/gpu/drm/shmobile/Kconfig
> +++ b/drivers/gpu/drm/shmobile/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_SHMOBILE
>  	tristate "DRM Support for SH Mobile"
>  	depends on DRM && ARM

There shouldn't be anything ARM-dependent, could you drop "&& ARM" while
at it ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -	depends on ARCH_SHMOBILE || COMPILE_TEST
> +	depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
>  	select BACKLIGHT_CLASS_DEVICE
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER

-- 
Regards,

Laurent Pinchart
