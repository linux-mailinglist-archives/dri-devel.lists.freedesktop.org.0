Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3719B08E71
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 15:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48AB10E16E;
	Thu, 17 Jul 2025 13:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="RgiTEf8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76B410E16E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 13:42:18 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HDfXeE484011;
 Thu, 17 Jul 2025 08:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1752759694;
 bh=xSAR2EjXWOeZuEtb1fBm3vkaOZIvPb6WES8+6wq2SV0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=RgiTEf8BO80EhPHbWcsjJEEtBOgj4rOtbgCHk1eGCaZCEJkzp7GZUlQXTwfRJL0F6
 f99okFjp35qURiKPo2WAwmHmd53+GLHXKbGVBRfBFJwkXGixzfeRYxkfIJqxr7bmEW
 uHfU/73/7kh3m7hhwuWPr2zE4suCWpRpFbN1QOM0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HDfWit2224308
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 17 Jul 2025 08:41:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 08:41:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 08:41:32 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HDfPkV2253146;
 Thu, 17 Jul 2025 08:41:26 -0500
Message-ID: <187d6072-55b1-4402-a2b5-82afb45a3345@ti.com>
Date: Thu, 17 Jul 2025 19:11:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/17] drm/bridge: cdns-dsi: Don't fail on
 MIPI_DSI_MODE_VIDEO_BURST
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, Francesco Dolcini <francesco@dolcini.it>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Parth Pancholi
 <parth.pancholi@toradex.com>, Jyri Sarha <jyri.sarha@iki.fi>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
 <20250618-cdns-dsi-impro-v4-17-862c841dbe02@ideasonboard.com>
 <8728de80-f154-46fa-a8a6-da40cb5fdc65@ti.com>
 <5377d377-2822-4d35-981e-45e7352ade17@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <5377d377-2822-4d35-981e-45e7352ade17@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Tomi,

On 17/07/25 15:59, Tomi Valkeinen wrote:
> Hi,
> 
> On 17/07/2025 12:36, Devarsh Thakkar wrote:
>> Hi Tomi
>>
>> Thanks for the patch.
>>
>> On 18/06/25 15:29, Tomi Valkeinen wrote:
>>> While the cdns-dsi does not support DSI burst mode, the burst mode is
>>> essentially DSI event mode with more versatile clocking and timings.
>> I don't fully agree with this statement, DSI burst mode and DSI event
>> mode are two different things having separate requirements. DSI burst
>> mode maps to MIPI_DSI_MODE_VIDEO_BURST. I don't see a separate flag for
>> event mode but I guess,
> 
> Well, what does DSI burst mode mean? Signal-wise it's the same as DSI
> event mode. "burst" just means that the DSI TX is allowed to send the
> data much faster than the pixel clock. But there's no strict requirement
> that it _must_ be faster.
> 
> So, DSI burst mode is basically DSI event mode with more freedom on the
> timings. Thus, afaics, DSI TX in DSI event mode should always work if
> the DSI RX expects DSI burst mode.
> 

Yes this is true, although there are subtle differences between event 
mode and burst mode and I guess that's why DSI specification 8.11.1 
Transmission Packet Sequences mentions for video mode lists DSI event 
mode sequence as differently then burst mode w.r.t packet sequence viz 
listing 3 different sequences i.e. non-burst with sync pulse, non-burst 
with sync event and burst mode. But seems like we do not have 3 separate 
flags for each of those.

And I see most drivers using MIPI_DSI_MODE_VIDEO both in context of 
selecting video mode as opposed to command mode and also subtly 
inferring it as event mode in case MIPI_DSI_MODE_VIDEO_BURST and 
MIPI_DSI_MODE_VIDEO_PULSE are not set. So there is no accurate way to 
differentiate between the three or for the bridge driver to enforce 
burst mode over event mode and I guess decision is left to host driver.

So, I think this patch looks fine considering these aspects.


>>> Thus cdns-dsi doesn't need to fail if the DSI peripheral driver requests
>>> MIPI_DSI_MODE_VIDEO_BURST.
>>
>> MIPI_DSI_MODE_VIDEO_BURST is currently not supported by the cadence DSI
>> host driver, so only if DSI peripheral driver is saying that burst mode
>> is the only one it supports in that case only we should fail.
>>
>>>
>>> In my particular use case, this allows the use of ti-sn65dsi83 driver.
>>>
>>> Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
>>> Tested-by: Jayesh Choudhary <j-choudhary@ti.com> >>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

>>> ---
>>>    drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ----
>>>    1 file changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/
>>> gpu/drm/bridge/cadence/cdns-dsi-core.c
>>> index 114d883c65dc..09b289f0fcbf 100644
>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>> @@ -1052,10 +1052,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host
>>> *host,
>>>        if (output->dev)
>>>            return -EBUSY;
>>>    -    /* We do not support burst mode yet. */
>>> -    if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
>>> -        return -ENOTSUPP;
>>> -
>>
>> Removing this check also gives a false impression that burst mode is
>> supported by the driver and can also lead to failures too in case device
>> is only supporting burst mode.
>>
>> I think it makes sense to fail only if burst mode is the only one being
>> supported by the device, something like below should work I believe,
>>
>> if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ==
>> MIPI_DSI_MODE_VIDEO_BURST)
>>          return -ENOTSUPP;
>>
>> Regards
>> Devarsh
>>
>>>        /*
>>>         * The host <-> device link might be described using an OF-graph
>>>         * representation, in this case we extract the device of_node from
>>>
> 
