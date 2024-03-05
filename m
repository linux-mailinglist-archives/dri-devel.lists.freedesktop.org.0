Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB008719DA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3696810E385;
	Tue,  5 Mar 2024 09:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UuViqyXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 63721 seconds by postgrey-1.36 at gabe;
 Tue, 05 Mar 2024 09:47:00 UTC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B4310E385
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:47:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E88A91BF207;
 Tue,  5 Mar 2024 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709632018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3jvJ31UW5g1AteAWnKjkA5Ea0CCYOiyYufsygt7PXM=;
 b=UuViqyXHpmyiPp4V/tHhbWt98t7steNc2d9YJ3j1pxEYOmcx0JzXo0aCcKu16ynreqimG0
 SM81f8iJQHQrzdFsbMSRaNj1TMi9jjniMcy1hLgzPYUa6x8gYm1lLaRsEnNmQcjuolmB9I
 VX041rAp1I6nuvhAXHji/rdEQB/OQOQLa0/cZHm8yLjFpZdJhdGbcoT0TqqihFmnh5w34J
 ZVCxqGGsAjwMHerVXfQs3QfvzieGjuPn0dzp8+66ds5WU9juv15sUrU7bod87gx2rft2ax
 L96KGP6+qgepjgKlh84xNAiOg6qpuftAcbe9vfqgjJX66YD/ceD4PWJu+pXWfQ==
Message-ID: <ee36a60d-5b65-4eb8-ac41-e4b6be1cf81f@bootlin.com>
Date: Tue, 5 Mar 2024 10:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panel: simple: add CMT430B19N00 LCD panel
 support
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
 <20240304160454.96977-4-jeremie.dautheribes@bootlin.com>
 <20240304-inquisitive-kickass-pronghorn-c641ff@houat>
From: =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?=
 <jeremie.dautheribes@bootlin.com>
In-Reply-To: <20240304-inquisitive-kickass-pronghorn-c641ff@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeremie.dautheribes@bootlin.com
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

Hi Maxime,

On 04/03/2024 17:25, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Mar 04, 2024 at 05:04:54PM +0100, Jérémie Dautheribes wrote:
>> Add support for Crystal Clear Technology CMT430B19N00 4.3" 480x272
>> TFT-LCD panel.
>>
>> Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
>> ---
>>   drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>> index 20e3df1c59d4..b940220f56e2 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -1457,6 +1457,32 @@ static const struct panel_desc boe_hv070wsa = {
>>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>>   };
>>   
>> +static const struct drm_display_mode cct_cmt430b19n00_mode = {
>> +	.clock = 9000,
>> +	.hdisplay = 480,
>> +	.hsync_start = 480 + 43,
>> +	.hsync_end = 480 + 43 + 8,
>> +	.htotal = 480 + 43 + 8 + 4,
>> +	.vdisplay = 272,
>> +	.vsync_start = 272 + 12,
>> +	.vsync_end = 272 + 12 + 8,
>> +	.vtotal = 272 + 12 + 8 + 4,
>> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>> +};
> 
> Your pixel clock doesn't really match the rest of the timings:
> 
> (480 + 43 + 8 + 4) * (272 + 12 + 8 + 4) * 60 = 9501600
> 
> So a ~6% deviation.
> 
> What does the datasheet say?

Indeed it does not exactly match but the datasheet indicates that the 
typical clock frequency is 9MHz and when this frequency is used, the 
typical values of the other parameters are those we have defined in the 
drm_display_mode structure. I don't see any information about the 
accepted deviation either.

Best regards,

Jérémie
