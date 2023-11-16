Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A87EE8B4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 22:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D1F10E2D1;
	Thu, 16 Nov 2023 21:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10704 seconds by postgrey-1.36 at gabe;
 Thu, 16 Nov 2023 21:15:39 UTC
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFE910E2D1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 21:15:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2E15F86D85;
 Thu, 16 Nov 2023 22:15:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1700169337;
 bh=MwU3+pWOWSmQIKMWGoVKhaLIosd3hZl8I6WoFiEMAuk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ieok1Biu9ZRs0Pr9AyH/W+XHD7GIeZrxWdScS+hlLI8OEUKZN0KsmdqoVcEZfJ23U
 AaGM1MZ13/XNvtUMGabuaLFIev1Q1zn0h1mt8uYFAR13IKoL+1kRzRDa15y3RYouUP
 6jrb1DZwbvDhQsW0LiTh5kXIWmkR6mMlLN+n8fa3VA9vP9rtKmpxuoGX+yXPQFykP3
 suKM3RatUygftBqZ00r3vLHnN2JnvDRgSUEVjRWfE8qJr06IwM94hoGWEH1ulmXgT3
 iSOAZgy1g3ykfWEtSKtzKxYMhlb9MJabgwQXILZJNf3kttneLg6jxRITYrz9XbVdap
 DU7egSluUsD9A==
Message-ID: <5481d74f-4b58-4527-987a-562e1b213a6b@denx.de>
Date: Thu, 16 Nov 2023 22:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
Content-Language: en-US
To: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
References: <20231008223315.279215-1-marex@denx.de>
 <ea0e3550-83ca-4006-819a-64780589d687@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ea0e3550-83ca-4006-819a-64780589d687@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/9/23 10:58, Neil Armstrong wrote:
> On 09/10/2023 00:33, Marek Vasut wrote:
>> Add missing .bus_flags = DRM_BUS_FLAG_DE_HIGH to this panel description,
>> ones which match both the datasheet and the panel display_timing flags .
>>
>> Fixes: 1e29b840af9f ("drm/panel: simple: Add Innolux G101ICE-L01 panel")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c 
>> b/drivers/gpu/drm/panel/panel-simple.c
>> index 44c11c418cd56..8e4ea15f0e1e5 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -2318,6 +2318,7 @@ static const struct panel_desc 
>> innolux_g101ice_l01 = {
>>           .disable = 200,
>>       },
>>       .bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>> +    .bus_flags = DRM_BUS_FLAG_DE_HIGH,
>>       .connector_type = DRM_MODE_CONNECTOR_LVDS,
>>   };
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Maybe it is time to apply ?
