Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98D9FB2DE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E705010E57E;
	Mon, 23 Dec 2024 16:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZlrmcXAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5A410E57E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734971447;
 bh=BI00dLOzAXumz8bqcSWyJWsd12/HJ1Wc6GIh58CIkpE=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=ZlrmcXAuMkZ6Cx5+2Hm3glbxKtG37v2YSzjfGMmeoaixPiPaUC+n0oLo//eaHqdIS
 QcyPccx6ggPWOY/U8wYfK161PussrCJ/r1EgAvJq5SM2GaINh2sV8nCj1pWgP2Si33
 zZ5u3qB8JntwS5UP9CY7XzcGzwPaL8bfwHwhrFRfpHFZZrv6fuy9N/5BV59OtoufdZ
 GHCNaOY4u9EgFpYpIO4KLcCuvA8+Qp07vQc4zaFxlBzynyNSmQs4uU8mgh7yyasCaF
 6R+FKDGjKK3aAwkNufwwqXRF0L8ANzj83mRPmyKWtrLLoJDnll3+sSX/4P9Lc61OhV
 A7VDB0ltoCtJg==
Received: from [192.168.1.90] (unknown [84.232.140.38])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 496F517E0E9D;
 Mon, 23 Dec 2024 17:30:47 +0100 (CET)
Message-ID: <a215731f-7edd-4662-9c67-420c4e60b039@collabora.com>
Date: Mon, 23 Dec 2024 18:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Sync comments with actual bus
 formats order
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241130-dw-hdmi-bus-fmt-order-v1-1-510b5fb6b990@collabora.com>
 <5bbd44dc-cbe8-4906-afa2-6866f5d39341@linaro.org>
 <9c890d1d-b25d-4b88-8560-1c3081e79eff@collabora.com>
Content-Language: en-US
In-Reply-To: <9c890d1d-b25d-4b88-8560-1c3081e79eff@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Neil,

On 12/2/24 7:32 PM, Cristian Ciocaltea wrote:
> On 12/2/24 5:45 PM, Neil Armstrong wrote:
>> Hi,
>>
>> On 30/11/2024 00:04, Cristian Ciocaltea wrote:
>>> Commit d3d6b1bf85ae ("drm: bridge: dw_hdmi: fix preference of RGB modes
>>> over YUV420") changed the order of the output bus formats, but missed to
>>> update accordingly the affected comment blocks related to
>>> dw_hdmi_bridge_atomic_get_output_bus_fmts().
>>>
>>> Fix the misleading comments and a context related typo.
>>>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/
>>> drm/bridge/synopsys/dw-hdmi.c
>>> index
>>> 996733ed2c004c83a989cb8da54d8b630d9f2c02..d76aede757175d7ad5873c5d7623abf2d12da73c 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -2621,6 +2621,7 @@ static int dw_hdmi_connector_create(struct
>>> dw_hdmi *hdmi)
>>>    * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
>>>    * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
>>>    * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
>>> + * - MEDIA_BUS_FMT_RGB888_1X24,
>>>    * - MEDIA_BUS_FMT_YUV16_1X48,
>>>    * - MEDIA_BUS_FMT_RGB161616_1X48,
>>>    * - MEDIA_BUS_FMT_UYVY12_1X24,
>>> @@ -2631,7 +2632,6 @@ static int dw_hdmi_connector_create(struct
>>> dw_hdmi *hdmi)
>>>    * - MEDIA_BUS_FMT_RGB101010_1X30,
>>>    * - MEDIA_BUS_FMT_UYVY8_1X16,
>>>    * - MEDIA_BUS_FMT_YUV8_1X24,
>>> - * - MEDIA_BUS_FMT_RGB888_1X24,
>>>    */
>>>     /* Can return a maximum of 11 possible output formats for a mode/
>>> connector */
>>> @@ -2669,7 +2669,7 @@ static u32
>>> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>>       }
>>>         /*
>>> -     * If the current mode enforces 4:2:0, force the output but format
>>> +     * If the current mode enforces 4:2:0, force the output bus format
>>>        * to 4:2:0 and do not add the YUV422/444/RGB formats
>>>        */
>>>       if (conn->ycbcr_420_allowed &&
>>> @@ -2698,14 +2698,14 @@ static u32
>>> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>>           }
>>>       }
>>>   +    /* Default 8bit RGB fallback */
>>> +    output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>>
>> Why did you move this ? the following comment mentions it
> 
> Before d3d6b1bf85ae ("drm: bridge: dw_hdmi: fix preference of RGB modes
> over YUV420"), this was the last format added to the list.  Hence I
> interpreted the comment below as referring to this particular last entry
> as a fallback, which is not the case anymore.
> 
> If you still prefer to keep the original comment, then maybe we should
> simply drop the "Default 8bit RGB fallback" one, as it's pretty
> redundant now.

Please let me know what is your preference here and I'll send a new
revision if necessary.

Thanks,
Cristian

>>> +
>>>       /*
>>>        * Order bus formats from 16bit to 8bit and from YUV422 to RGB
>>> -     * if supported. In any case the default RGB888 format is added
>>> +     * if supported.
>>>        */
>>>   -    /* Default 8bit RGB fallback */
>>> -    output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>>> -
>>>       if (max_bpc >= 16 && info->bpc == 16) {
>>>           if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>>>               output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
>>>
>>> ---
>>> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
>>> change-id: 20241130-dw-hdmi-bus-fmt-order-7f6db5db2f0a
>>>
>>
> 

