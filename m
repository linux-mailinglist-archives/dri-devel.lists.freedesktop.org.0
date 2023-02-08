Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31EE68EAAB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8489C10E702;
	Wed,  8 Feb 2023 09:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2885A10E702
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 09:11:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (233.56-78-194.adsl-static.isp.belgacom.be [194.78.56.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F04B496;
 Wed,  8 Feb 2023 10:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1675847496;
 bh=Ta8bFQpGWkTJ41G3VZkbG2hfi/QZC1BErMfsWNZvZDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dozgtUvUUPoq9HqOtCfl/YcpSK84pMCdXVWRaW8cCGNE/KsKns8cbhrmyaYOxLqfq
 i2lJt/2dHMmZFBKxgnw1oraYrmNiCVBqTmHYqPD0BV66jfRdvtDyrLPXoG2vuvXhSF
 0mJcxDQKiB3sxjH/vKVj30pxCxJ6DZ2EwLv01MzU=
Date: Wed, 8 Feb 2023 11:11:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: Fix building pdfdocs
Message-ID: <Y+NnRvQ8X04tuurf@pendragon.ideasonboard.com>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Akira Yokosawa <akiyks@gmail.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Feb 08, 2023 at 10:29:16AM +0200, Tomi Valkeinen wrote:
> Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
> documatation for a few new RGB formats. For some reason these break the

s/documatation/documentation/

> pdfdocs build, even if the same style seems to work elsewhere in the
> file.
> 
> Remove the trailing empty dash lines, which seems to fix the issue.
> 
> Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> 
> Note: the offending patch was merged via drm tree, so we may want to
> apply the fix to the drm tree also.

Sounds good to me. Mauro, could you ack this patch ?

>  Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index d330aeb4d3eb..ea545ed1aeaa 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -868,7 +868,6 @@ number of bits for each component.
>        - r\ :sub:`4`
>        - r\ :sub:`3`
>        - r\ :sub:`2`
> -      -
>      * .. _V4L2-PIX-FMT-RGBA1010102:
>  
>        - ``V4L2_PIX_FMT_RGBA1010102``
> @@ -909,7 +908,6 @@ number of bits for each component.
>        - r\ :sub:`4`
>        - r\ :sub:`3`
>        - r\ :sub:`2`
> -      -
>      * .. _V4L2-PIX-FMT-ARGB2101010:
>  
>        - ``V4L2_PIX_FMT_ARGB2101010``
> @@ -950,7 +948,6 @@ number of bits for each component.
>        - r\ :sub:`6`
>        - r\ :sub:`5`
>        - r\ :sub:`4`
> -      -
>  
>  .. raw:: latex
>  

-- 
Regards,

Laurent Pinchart
