Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0603F3F78
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 15:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA5389F4F;
	Sun, 22 Aug 2021 13:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B224989F4F
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 13:25:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D3978F;
 Sun, 22 Aug 2021 15:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1629638711;
 bh=LxxbasYrCWGdWlnOcfK+wlh0ECWGBJoEOIsPab3+2H8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g9utVhAbCp+H043vEwQzAbjNPcpbKxGvf6thitHMbL/lv1RXcIeH6nKpSZzuc+C41
 T4G36zpx4vM/QY5CtpP1n05K9NiKXm6bDA3cnLJ4lIn+WAcxPtGqzPTT10gVLQK+hh
 oqESWUUqn9PFwpykXPTQZaCSX3aV8sA+sHOs6hYs=
Date: Sun, 22 Aug 2021 16:25:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: adv7511: Convert to SPDX identifier
Message-ID: <YSJQLtj7dknOXNi0@pendragon.ideasonboard.com>
References: <20210822072111.628-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210822072111.628-1-caihuoqing@baidu.com>
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

Hi Cai,

Thank you for the patch.

On Sun, Aug 22, 2021 at 03:21:11PM +0800, Cai Huoqing wrote:
> use SPDX-License-Identifier instead of a verbose license text
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> index a20a45c0b353..28d9becc939c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -1,21 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * adv7511_cec.c - Analog Devices ADV7511/33 cec driver
>   *
>   * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> - *
> - * This program is free software; you may redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; version 2 of the License.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> - * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> - * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> - * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> - * SOFTWARE.
> - *
>   */
>  
>  #include <linux/device.h>

-- 
Regards,

Laurent Pinchart
