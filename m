Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD293AA5E22
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC9810E049;
	Thu,  1 May 2025 12:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="y1UxYlaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCA610E049
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 12:11:48 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 541CBUv03609279
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 May 2025 07:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1746101490;
 bh=W/es5kXjus6Ekazfj83lp0bz1sYjjqkTHx/HVlsYj6I=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=y1UxYlaXzCGL1G2FPgzgWKAf4Dm4z5Lwh/lBIzn8EJfh88T5ssPpWciuyRVqL1XUa
 semLOIUZsH4k0gA506mSlsZc0ft4OkKaWRRkvOBHDypiuNPKn9pol8wTtuhiPK5aJx
 3E2ngGEMQxSAOYA0QCjdVGvFMt8AIwKzk/0rdLhI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 541CBUGh094941
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 May 2025 07:11:30 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 07:11:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 07:11:29 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 541CBOx9052473;
 Thu, 1 May 2025 07:11:25 -0500
Message-ID: <01b43a16-cffa-457f-a2e1-87dd27869d18@ti.com>
Date: Thu, 1 May 2025 17:41:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
To: Max Krummenacher <max.oss.09@gmail.com>, Doug Anderson
 <dianders@chromium.org>
CC: "Kumar, Udit" <u-kumar1@ti.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
References: <20250424105432.255309-1-j-choudhary@ti.com>
 <3f44ec0b-216c-4534-a6de-7b17929cb9e1@ti.com>
 <CAD=FV=WytPZCF-jcWFgXoAOoXOV61bw2_ftJbdbWZviHQqap5w@mail.gmail.com>
 <aBMs0ubSip7MAtMQ@toolbox>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <aBMs0ubSip7MAtMQ@toolbox>
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

On 01/05/25 13:42, Max Krummenacher wrote:
> On Mon, Apr 28, 2025 at 02:15:12PM -0700, Doug Anderson wrote:
> Hello Jayesh,
> 
>> Hi,
>>
>> On Thu, Apr 24, 2025 at 6:32 PM Kumar, Udit <u-kumar1@ti.com> wrote:
>>>
>>> Hello Jayesh,
>>>
>>> On 4/24/2025 4:24 PM, Jayesh Choudhary wrote:
>>>> For TI SoC J784S4, the display pipeline looks like:
>>>> TIDSS -> CDNS-DSI -> SN65DSI86 -> DisplayConnector -> DisplaySink
>>>> This requires HPD to detect connection form the connector.
>>>> By default, the HPD is disabled for eDP. So enable it conditionally
>>>> based on a new flag 'keep-hpd' as mentioned in the comments in the
>>>> driver.
>>>>
>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>>> ---
>>>>
>>>> Hello All,
>>>>
>>>> Sending this RFC patch to get some thoughts on hpd for sn65dsi86.
>>>>
>>>> Now that we have a usecase for hpd in sn65dsi86, I wanted to get
>>>> some comments on this approach to "NOT DISABLE" hpd in the bridge.
>>>> As the driver considers the eDP case, it disables hpd by default.
>>>> So I have added another property in the binding for keeping hpd
>>>> functionality (the name used is still debatable) and used it in
>>>> the driver.
>>>>
>>>> Is this approach okay?
>>>> Also should this have a "Fixes" tag?
>>>
>>>>
>>>>    .../bindings/display/bridge/ti,sn65dsi86.yaml      |  6 ++++++
>>>>    drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 14 +++++++++-----
>>>>    2 files changed, 15 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
>>>> index c93878b6d718..5948be612849 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
>>>> @@ -34,6 +34,12 @@ properties:
>>>>          Set if the HPD line on the bridge isn't hooked up to anything or is
>>>>          otherwise unusable.
>>>>
>>>> +  keep-hpd:
>>>> +    type: boolean
>>>> +    description:
>>>> +      HPD is disabled in the bridge by default. Set it if HPD line makes
>>>> +      sense and is used.
>>>> +
>>>
>>> Here are my suggestions
>>>
>>> 1) use interrupt in binding as optional instead of keep-hpd
>>>
>>> 2) use interrupt field (if present to enable of disable HPD functions in
>>> driver)
>>
>> Officially we've already got a "no-hpd" specified in the device tree.
>> You're supposed to be specifying this if HPD isn't hooked up. It would
>> be best if we could use that property if possible. If we think that
>> using the lack of "no-hpd" will break someone then we should be
>> explicit about that.
>>
>> I'd also note that unless you've figured out a way to turn off the
>> awful debouncing that ti-sn65dsi86 does on HPD that using HPD (at
>> least for initial panel power on) only really makes sense for when
>> we're using ti-sn65dsi86 in "DP" mode. For initial eDP panel poweron
>> it was almost always faster to just wait the maximum delay of the
>> panel than to wait for ti-sn65dsi86 to finally report that HPD was
>> asserted.
>>
>> I could also note that it's possible to use the ti-sn65dsi86's "HPD"
>> detection even if the interrupt isn't hooked up, so I don't totally
>> agree with Udit's suggestion.
>>
>> I guess the summary of my thoughts then: If you want to enable HPD for
>> eDP, please explain why in the commit message. Are you using this to
>> detect "panel interrupt"? Somehow using it for PSR? Using it during
>> panel power on? If using it for panel power on, have you confirmed
>> that this has a benefit compared to using the panel's maximum delay?
>>
>> -Doug
> 
> I'm working on a similar issue where the bridge is used to provide a
> connector to a display port monitor and hot pluging would be needed.
> 
> Related, but not the issue here: We have two display outputs and the
> reported connected display without an actual monitor to report a
> video mode then confuses the system to also not use the second display.
> 
> As I already have a solution which fixes my issue, hopefully not
> affecting the eDP use case a proposed that here:
> 
> https://lore.kernel.org/all/20250501074805.3069311-1-max.oss.09@gmail.com/
> 

I was also planning to use connector type for conditionally setting the
HPD_DISABLE bit. But I see that renesas uses sn65dsi86 bridge
(arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts and two more
platforms) connected to mini-dp-connector which also had the connector
type DRM_MODE_CONNECTOR_DisplayPort.

After your changes, their platform will also get affected.
I would assume that even their platform needs HPD functionality. They
should also be getting "always connected" state for that connector.
But I don't see any reported issues for their platform.

As Doug proposed, we can use no-hpd in other platforms and not keep it
in our platforms.

(I will test your patch on TI platform.)

Warm Regards,
Jayesh


> Regards,
> Max
