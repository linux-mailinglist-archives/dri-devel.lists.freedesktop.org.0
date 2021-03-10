Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE5333DA0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 14:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBDC89DB7;
	Wed, 10 Mar 2021 13:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F83089DB7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 13:24:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DB7A9E7;
 Wed, 10 Mar 2021 14:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615382687;
 bh=Jbzzq9e1ey5tdMEkoKKaMbLAWYr9uSrkXwsnfH3Y8Ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zxe5zClTQlTnZrtTrK6rcslc+2yfonjdCjp5CrAUXDApbKWShepL1SIo3sSXc9vhU
 l4op5JFOzdiahNUHO3S4/XYgplAMWFNfZzlWYw57VPtSf+95iCOUfx2wizHq/bMKlJ
 VAmtkGscQI/dAKfCGLwr8NTMeiO45+uO+1gKbPY8=
Date: Wed, 10 Mar 2021 15:24:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v5 02/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Message-ID: <YEjIf//ouB1wZss3@pendragon.ideasonboard.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
 <1615370138-5673-3-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615370138-5673-3-git-send-email-victor.liu@nxp.com>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, lee.jones@linaro.org, kishon@ti.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, vkoul@kernel.org,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Thank you for the patch.

On Wed, Mar 10, 2021 at 05:55:26PM +0800, Liu Ying wrote:
> This patch adds documentations for RGB666_1X30_CPADLO, RGB888_1X30_CPADLO,
> RGB666_1X36_CPADLO and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp
> pixel combiner.  The RGB pixels with padding low per component are
> transmitted on a 30-bit input bus(10-bit per component) from a display
> controller or a 36-bit output bus(12-bit per component) to a pixel link.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4->v5:
> * Add Robert's R-b tag.
> 
> v3->v4:
> * No change.
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * No change.
> 
>  .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++++++++++++++++++
>  1 file changed, 156 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 7f16cbe..201c16d 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -1488,6 +1488,80 @@ The following tables list existing packed RGB formats.
>        - b\ :sub:`2`
>        - b\ :sub:`1`
>        - b\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-RGB666-1X30-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB666_1X30-CPADLO
> +      - 0x101e
> +      -
> +      - 0
> +      - 0

I count 32 bits here. Should these two 0 be replaced by spaces ? Same
for MEDIA_BUS_FMT_RGB888_1X30-CPADLO.

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +    * .. _MEDIA-BUS-FMT-RGB888-1X30-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB888_1X30-CPADLO
> +      - 0x101f
> +      -
> +      - 0
> +      - 0
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
>      * .. _MEDIA-BUS-FMT-ARGB888-1X32:
>  
>        - MEDIA_BUS_FMT_ARGB888_1X32
> @@ -1665,6 +1739,88 @@ The following table list existing packed 36bit wide RGB formats.
>        - 2
>        - 1
>        - 0
> +    * .. _MEDIA-BUS-FMT-RGB666-1X36-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB666_1X36_CPADLO
> +      - 0x1020
> +      -
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +    * .. _MEDIA-BUS-FMT-RGB888-1X36-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB888_1X36_CPADLO
> +      - 0x1021
> +      -
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
>      * .. _MEDIA-BUS-FMT-RGB121212-1X36:
>  
>        - MEDIA_BUS_FMT_RGB121212_1X36

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
