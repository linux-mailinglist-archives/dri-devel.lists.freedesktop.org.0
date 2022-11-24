Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE69637C89
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 16:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327D510E12B;
	Thu, 24 Nov 2022 15:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74EB10E12B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 15:11:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36622621B1;
 Thu, 24 Nov 2022 15:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1ED8C433C1;
 Thu, 24 Nov 2022 15:11:11 +0000 (UTC)
Message-ID: <de9a3c5d-b8e3-07fa-0ba5-6e77261b7fea@xs4all.nl>
Date: Thu, 24 Nov 2022 16:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RESEND 3/6 v2] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220519162935.1585-1-macroalpha82@gmail.com>
 <20220519162935.1585-4-macroalpha82@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220519162935.1585-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 emma@anholt.net, airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2022 18:29, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the MEDIA_BUS_FMT_RGB565_1X24_CPADHI format used by the Geekworm
> MZP280 panel for the Raspberry Pi.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  include/uapi/linux/media-bus-format.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 0dfc11ee2..a7b765498 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,13 +34,14 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x101e */
> +/* RGB - next is	0x101f */

This would be 0x1023

>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
>  #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
>  #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
>  #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
> +#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x101e

and this 0x1022, based on the latest media tree.

>  #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
>  #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
>  #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007

Otherwise:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

It's an old series by now, but as far as I am concerned this can go through
the drm subsystem (after updating this value).

Regards,

	Hans
