Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D084AADC56
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 12:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3763010E781;
	Wed,  7 May 2025 10:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="OXelZtoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1E710E781
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 10:16:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547AFwKh1482916
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 May 2025 05:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1746612958;
 bh=MSoKZLDtkshAQiH9jnNrWiWdA3sNLQE3PRL9Jx3E6hQ=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=OXelZtoOtf0UShakv84/pHsvPpibNLdx3CWDgOBsXz2ctR7m43AzdUklY5I76O7JE
 6LPyiJwSboj2yqmGIfD7CfpcHzoRE8uXRZ7pXwRG2+SuLyaYQUkifthflGaA80fSB1
 6A3lSiLU/Omf8YX5rCt995yFhRXuD8bM5XZskjKc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547AFwq7020259
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 May 2025 05:15:58 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 05:15:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 05:15:57 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547AFq2r105573;
 Wed, 7 May 2025 05:15:53 -0500
Message-ID: <68f0c5ef-ac51-4652-b829-2bc56c5a75c8@ti.com>
Date: Wed, 7 May 2025 15:45:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Use HPD in a DP use case
To: Max Krummenacher <max.oss.09@gmail.com>, Doug Anderson
 <dianders@chromium.org>
CC: <max.krummenacher@toradex.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250501074805.3069311-1-max.oss.09@gmail.com>
 <CAD=FV=W=NjbM9ZXLw7gH-_4CnpU7QU=sKCVQVxgmgP-Qpt-3hg@mail.gmail.com>
 <aBo8elFPYgPleK5n@toolbox>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <aBo8elFPYgPleK5n@toolbox>
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

Hello Max,

On 06/05/25 22:14, Max Krummenacher wrote:
> On Thu, May 01, 2025 at 08:38:15PM -0700, Doug Anderson wrote:
>> Hi,
>>
>> On Thu, May 1, 2025 at 12:48 AM <max.oss.09@gmail.com> wrote:
>>>
>>> From: Max Krummenacher <max.krummenacher@toradex.com>
>>>
>>> The bridge driver currently disables handling the hot plug input and
>>> relies on a always connected eDP panel with fixed delays when the
>>> panel is ready.
>>
>> Not entirely correct. In some cases we don't have fixed delays and
>> instead use a GPIO for HPD. That GPIO gets routed to the eDP panel
>> code.
> 
> Will reword in a v2
> 
>>
>>
>>> If one uses the bridge for a regular display port monitor this
>>> assumption is no longer true.
>>> If used with a display port monitor change to keep the hot plug
>>> detection functionality enabled and change to have the bridge working
>>> during runtime suspend to be able to detect the connection state.
>>>
>>> Note that if HPD_DISABLE is set the HPD bit always returns connected
>>> independent of the actual state of the hot plug pin. Thus
>>> currently bridge->detect() always returns connected.
>>
>> If that's true, it feels like this needs:
>>
>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge
>> connector operations for DP")
>>
>> ...and it would be nice to get Laurent to confirm. Seems weird that he
>> wouldn't have noticed that.
> 
> I retested by adding a print in ti_sn_bridge_detect().
> With the HPD_DISABLE bit set the HPD_DEBOUNCED_STATE is always true
> resulting in reporting always connected.
> 
> When one does not set the HPD_DISABLE bit and is in runtime suspend
> (i.e. detect() enables the bridge with its call to
> pm_runtime_get_sync() ) then the HPD_DEBOUNCED_STATE is only set
> after the debounce time. As it is immediately read here detect()
> always reports disconnected.
> 

I have same observations on my end.

>>
>>
>>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>>>
>>> ---
>>>
>>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
>>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> index 01d456b955ab..c7496bf142d1 100644
>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> @@ -333,9 +333,11 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
>>>           * If HPD somehow makes sense on some future panel we'll have to
>>>           * change this to be conditional on someone specifying that HPD should
>>>           * be used.
>>> +        * Only disable HDP if used for eDP.
>>>           */
>>> -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>>> -                          HPD_DISABLE);
>>> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
>>> +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
>>> +                                  HPD_DISABLE, HPD_DISABLE);
>>>
>>>          pdata->comms_enabled = true;
>>>
>>> @@ -357,6 +359,10 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
>>>          struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
>>>          int ret;
>>>
>>> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort &&
>>> +           pdata->comms_enabled)
>>> +               return 0;
>>> +
>>
>> I don't understand this part of the patch. You're basically making
>> suspend/resume a no-op for the DP case? I don't think that's right...
> 
> That is what I wanted to do as nothing else worked ...
> Probably there are better solutions.
> 
>>
>> First, I don't _think_ you need it, right? ...since "detect" is
>> already grabbing the pm_runtime reference this shouldn't be needed
>> from a correctness point of view.
> 
> Correct, it shouldn't. However if the bridge is coming out of
> powerup/reset then we have to wait the debounce time time to get the
> current state of HPD. The bridge starts with disconnected and only
> sets connected after it seen has the HPD pin at '1' for the debounce
> time.
> 
> Adding a 400ms sleep would fix that.
> 


While adding this delay fixes the detect issue, it could lead to other
problems.
Detect hook is called every 10 sec and considering that, 400ms is a
considerable amount of time. And it could cause performance issues like
frame drops and glitches in display.

For 1920x1080@60fps resolution, when I run weston application, I see
around ~24 frames being dropped every 10 sec with visual glitch in
display. This seems consistent with 400ms delay for 60fps or 16.67ms per
frame (24*16.67ms).

root@j784s4-evm:~# weston-simple-egl
libEGL warning: MESA-LOADER: failed to open tidss: 
/usr/lib/dri/tidss_dri.so: cannot open shared object file: No such file 
or directory (search paths /usr/lib/dri, suffix _dri)

276 frames in 5 seconds: 55.200001 fps
301 frames in 5 seconds: 60.200001 fps
277 frames in 5 seconds: 55.400002 fps
301 frames in 5 seconds: 60.200001 fps
277 frames in 5 seconds: 55.400002 fps
301 frames in 5 seconds: 60.200001 fps
277 frames in 5 seconds: 55.400002 fps
301 frames in 5 seconds: 60.200001 fps
277 frames in 5 seconds: 55.400002 fps
301 frames in 5 seconds: 60.200001 fps
277 frames in 5 seconds: 55.400002 fps
301 frames in 5 seconds: 60.200001 fps
278 frames in 5 seconds: 55.599998 fps
^Csimple-egl exiting
root@j784s4-evm:~#

>>
>> Second, if you're looking to eventually make the interrupt work, I
>> don't think this is the right first step. I think in previous
>> discussions about this it was agreed that if we wanted the interrupt
>> to work then we should just do a "pm_runtime_get_sync()" before
>> enabling the interrupt and then a "pm_runtime_put()" after disabling
>> it. That'll keep things from suspending.
> 
> The HW I use doesn't has the interrupt pin connected. So for me that is
> out of scope but should of course work.
> 
>>
>> Does that sound correct, or did I goof up on anything?
> 
> If I remove disabling suspend/resume and fix detect() to report the
> 'correct' HPD state in both runtime pm states I now get another issue
> after disconnecting and then reconnecting the monitor:
> 
> [   50.035964] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read lane count (-110); assuming 4
> [   50.212976] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read eDP rev (-110), assuming 1.1
> [   50.389802] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read max rate (-110); assuming 5.4 GHz
> [   50.686572] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Link training failed, link is off (-5)
> 
> monitor stays black without signals.
> 
> So it seems the bridges internal state is not completely restored by
> the current code. Looking into that now.
> 

I have seen such link training failures occasionally when the
display connector is not connected but the state is not reflected
correctly.
Maybe it could be attributed to long polling duration???
Are you observing it even on re-runs?


>> -Doug
> 
> Regards
> Max


Warm Regards,
Jayesh
