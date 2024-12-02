Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF359E0A01
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77C110E7E1;
	Mon,  2 Dec 2024 17:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YdtO8Nbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19FD10E7E1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 17:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733160767;
 bh=yw+iNGGUwDa0/UmWNpxi/ueecAQMEr0e7vBRD2y045I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YdtO8Nbomdme2pM8vkYAOPanqVsOinis40tIGPpOaC3a8gr7nmClKvdBaksshoXsD
 WaW90kGGYVJ0UtLAjQjlsK+HexVIJet4TSVRK2Gx7CYo3dvWA45vTXv0yDNNYBv++R
 hMy+UZtkFeK2SHzfbnrn59ZBIb4GU2m4TCKzkp98p72B+bPfJjabotdW2VzYFWDJjU
 /Z6rdwFyY6qoCn+Gh+0eheoDew1JOiaUo+Vz07qIjLWCEOEmi0anIyxhy5Ywl7NIJR
 wos2UXpd+y4ZaKBX+SWyQhfhaR/6MueTzXJj9ouH5eX5NwzG4Hx0CItZFkBeNUv92c
 RZTLVsJoRlsFQ==
Received: from [192.168.1.90] (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C76E317E37A9;
 Mon,  2 Dec 2024 18:32:46 +0100 (CET)
Message-ID: <9c890d1d-b25d-4b88-8560-1c3081e79eff@collabora.com>
Date: Mon, 2 Dec 2024 19:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Sync comments with actual bus
 formats order
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
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <5bbd44dc-cbe8-4906-afa2-6866f5d39341@linaro.org>
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

On 12/2/24 5:45 PM, Neil Armstrong wrote:
> Hi,
> 
> On 30/11/2024 00:04, Cristian Ciocaltea wrote:
>> Commit d3d6b1bf85ae ("drm: bridge: dw_hdmi: fix preference of RGB modes
>> over YUV420") changed the order of the output bus formats, but missed to
>> update accordingly the affected comment blocks related to
>> dw_hdmi_bridge_atomic_get_output_bus_fmts().
>>
>> Fix the misleading comments and a context related typo.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/
>> drm/bridge/synopsys/dw-hdmi.c
>> index
>> 996733ed2c004c83a989cb8da54d8b630d9f2c02..d76aede757175d7ad5873c5d7623abf2d12da73c 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2621,6 +2621,7 @@ static int dw_hdmi_connector_create(struct
>> dw_hdmi *hdmi)
>>    * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
>>    * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
>>    * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
>> + * - MEDIA_BUS_FMT_RGB888_1X24,
>>    * - MEDIA_BUS_FMT_YUV16_1X48,
>>    * - MEDIA_BUS_FMT_RGB161616_1X48,
>>    * - MEDIA_BUS_FMT_UYVY12_1X24,
>> @@ -2631,7 +2632,6 @@ static int dw_hdmi_connector_create(struct
>> dw_hdmi *hdmi)
>>    * - MEDIA_BUS_FMT_RGB101010_1X30,
>>    * - MEDIA_BUS_FMT_UYVY8_1X16,
>>    * - MEDIA_BUS_FMT_YUV8_1X24,
>> - * - MEDIA_BUS_FMT_RGB888_1X24,
>>    */
>>     /* Can return a maximum of 11 possible output formats for a mode/
>> connector */
>> @@ -2669,7 +2669,7 @@ static u32
>> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>       }
>>         /*
>> -     * If the current mode enforces 4:2:0, force the output but format
>> +     * If the current mode enforces 4:2:0, force the output bus format
>>        * to 4:2:0 and do not add the YUV422/444/RGB formats
>>        */
>>       if (conn->ycbcr_420_allowed &&
>> @@ -2698,14 +2698,14 @@ static u32
>> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>           }
>>       }
>>   +    /* Default 8bit RGB fallback */
>> +    output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> 
> Why did you move this ? the following comment mentions it

Before d3d6b1bf85ae ("drm: bridge: dw_hdmi: fix preference of RGB modes
over YUV420"), this was the last format added to the list.  Hence I
interpreted the comment below as referring to this particular last entry
as a fallback, which is not the case anymore.

If you still prefer to keep the original comment, then maybe we should
simply drop the "Default 8bit RGB fallback" one, as it's pretty
redundant now.

Thanks,
Cristian

>> +
>>       /*
>>        * Order bus formats from 16bit to 8bit and from YUV422 to RGB
>> -     * if supported. In any case the default RGB888 format is added
>> +     * if supported.
>>        */
>>   -    /* Default 8bit RGB fallback */
>> -    output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>> -
>>       if (max_bpc >= 16 && info->bpc == 16) {
>>           if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>>               output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
>>
>> ---
>> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
>> change-id: 20241130-dw-hdmi-bus-fmt-order-7f6db5db2f0a
>>
> 

