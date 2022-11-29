Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1563C037
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 13:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E4F10E031;
	Tue, 29 Nov 2022 12:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D65B10E031
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 12:38:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DFF14E6;
 Tue, 29 Nov 2022 13:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669725497;
 bh=iiXEMJmYkobicYzVrgEOHcFIFq/zwPSyahHj3ZvZlzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z1AYEEQHuNBEIv74qC8NJz7QelXyaKbA5rVMauu0GsNI9x9jZIlf897I2x7b3OU4y
 nCCMPhp0fPT9Jt3JgYOE0ADHk7+G1Xpahqcto7Ja7mMzFtmua0LMcFvCA2O5+GKEBI
 7IKvlBNAlQTeqGLGMaTIVo2i3mhKD4/cB2Ka97kg=
Date: Tue, 29 Nov 2022 14:38:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 3/7] media: uapi: add MEDIA_BUS_FMT_BGR666_1X24_CPADHI
Message-ID: <Y4X9KY5ZqRUOGnJE@pendragon.ideasonboard.com>
References: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
 <20221013-rpi-dpi-improvements-v2-3-7691903fb9c8@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221013-rpi-dpi-improvements-v2-3-7691903fb9c8@cerno.tech>
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
Cc: Chris Morgan <macromorgan@hotmail.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime and Joerg,

Thank you for the patch.

On Thu, Oct 20, 2022 at 10:30:47AM +0200, Maxime Ripard wrote:
> From: Joerg Quinten <aBUGSworstnightmare@gmail.com>
> 
> Add the BGR666 format MEDIA_BUS_FMT_BGR666_1X24_CPADHI supported by the
> RaspberryPi.
> 
> Signed-off-by: Joerg Quinten <aBUGSworstnightmare@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++++++++++++++++
>  include/uapi/linux/media-bus-format.h              |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 68f8d7d37984..604a30e2f890 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -1023,6 +1023,43 @@ The following tables list existing packed RGB formats.
>        - g\ :sub:`2`
>        - g\ :sub:`1`
>        - g\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-BGR666-1X24_CPADHI:

I would move this just below MEDIA_BUS_FMT_RGB565_1X24_CPADHI. Actually,
could you check 1/7 and 2/7 to make sure the formats are sorted in the
documentation in the same order as in the header ?

> +
> +      - MEDIA_BUS_FMT_BGR666_1X24_CPADHI
> +      - 0x1024
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
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
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
>      * .. _MEDIA-BUS-FMT-RGB565-1X24_CPADHI:
>  
>        - MEDIA_BUS_FMT_RGB565_1X24_CPADHI
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 2ee0b38c0a71..d4228d038b54 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x1024 */
> +/* RGB - next is	0x1025 */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> @@ -49,6 +49,7 @@
>  #define MEDIA_BUS_FMT_BGR666_1X18		0x1023
>  #define MEDIA_BUS_FMT_RGB666_1X18		0x1009
>  #define MEDIA_BUS_FMT_RBG888_1X24		0x100e
> +#define MEDIA_BUS_FMT_BGR666_1X24_CPADHI	0x1024
>  #define MEDIA_BUS_FMT_RGB666_1X24_CPADHI	0x1015
>  #define MEDIA_BUS_FMT_RGB666_1X7X3_SPWG		0x1010
>  #define MEDIA_BUS_FMT_BGR888_1X24		0x1013
> 

-- 
Regards,

Laurent Pinchart
