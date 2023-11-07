Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359AC7E4845
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 19:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594C910E653;
	Tue,  7 Nov 2023 18:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B96410E653
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 18:32:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7IVq3N015312;
 Tue, 7 Nov 2023 12:31:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1699381912;
 bh=avFqmwExvMZTboA6xudv//HHo5yrU/rJv20C0agxdH4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=sR4kDIBmpAAXihN0XtA8jDMaZNsqH1LC13iIGXLAIyCOE3HZyvRqOtHTHv6rnMX8l
 Zl3Xq1qfo5m4cdrABENE2K2U/e+1T/7Fk2qAFURvBGOJaxkhPl13R1aHZbvzqy0B+s
 VnMviSAOtp97xMve3QhqLyMLsH5Iz6+oFkGBim+g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7IVqfM017145
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Nov 2023 12:31:52 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 12:31:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 12:31:52 -0600
Received: from [10.249.132.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7IVih0039685;
 Tue, 7 Nov 2023 12:31:45 -0600
Message-ID: <b642d226-1312-4846-a353-622a7e21939e@ti.com>
Date: Wed, 8 Nov 2023 00:01:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: tc358767: Support input format negotiation
 hook
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20231030192846.27934-1-a-bhatia1@ti.com>
 <20231106123800.GC47195@ravnborg.org>
 <7ddf0edb-2925-4b7c-ad07-27c030dd0232@ti.com>
 <20231107154115.GA100782@ravnborg.org>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20231107154115.GA100782@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jan Kiszka <jan.kiszka@siemens.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Tomi Valkeinen <tomba@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Francesco Dolcini <francesco@dolcini.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 07-Nov-23 21:11, Sam Ravnborg wrote:
> Hi Aradhya,
> 
> On Tue, Nov 07, 2023 at 01:17:03AM +0530, Aradhya Bhatia wrote:
>> Hi Sam,
>>
>> Thank you for the suggestion!
>>
>> On 06-Nov-23 18:08, Sam Ravnborg wrote:
>>> Hi Aradhya,
>>>
>>> On Tue, Oct 31, 2023 at 12:58:46AM +0530, Aradhya Bhatia wrote:
>>>> With new connector model, tc358767 will not create the connector, when
>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and display-controller driver will
>>>> rely on format negotiation to setup the encoder format.
>>>>
>>>> Add the missing input-format negotiation hook in the
>>>> drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.
>>>>
>>>> Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
>>>> the case with older model.
>>>>
>>>> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>
>>>> Notes:
>>>>
>>>>   * Since I do not have hardware with me, this was just build tested. I would
>>>>     appreciate it if someone could test and review it, especically somebody, who
>>>>     uses the bridge for DPI/DSI to eDP format conversion.
>>>>
>>>>   * The Toshiba TC358767 bridge is not enabled in arm64 defconfig by default,
>>>>     when it should be. Hence, I sent a quick patch[0] earlier.
>>>>
>>>> [0]: https://lore.kernel.org/all/20231030152834.18450-1-a-bhatia1@ti.com/
>>>>
>>>>  drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
>>>>  1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>>>> index ef2e373606ba..0affcefdeb1c 100644
>>>> --- a/drivers/gpu/drm/bridge/tc358767.c
>>>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>>>> @@ -1751,6 +1751,30 @@ tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>  	return input_fmts;
>>>>  }
>>>>  
>>>> +static u32 *
>>>> +tc_edp_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>> +				 struct drm_bridge_state *bridge_state,
>>>> +				 struct drm_crtc_state *crtc_state,
>>>> +				 struct drm_connector_state *conn_state,
>>>> +				 u32 output_fmt,
>>>> +				 unsigned int *num_input_fmts)
>>>> +{
>>>> +	u32 *input_fmts;
>>>> +
>>>> +	*num_input_fmts = 0;
>>>> +
>>>> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
>>>> +			     GFP_KERNEL);
>>>> +	if (!input_fmts)
>>>> +		return NULL;
>>>> +
>>>> +	/* This is the DSI/DPI-end bus format */
>>>> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>>>> +	*num_input_fmts = 1;
>>>> +
>>>> +	return input_fmts;
>>>> +}
>>>
>>> You could benefit from using the helper:
>>> drm_atomic_helper_bridge_propagate_bus_fmt()
>>
>> You are right!
>>
>> Upon taking a second look, I realize that the bridge chain works with
>> MEDIA_BUS_FMT_FIXED bus format, when tc358767 is being used in DPI/DSI
>> to eDP mode (because the panel-bridge does not have a get_output_bus_fmt
>> hook, and uses the same helper for its get_input_bus_fmt hook). My patch
>> creates a deviation from that, by forcing MEDIA_BUS_FMT_RGB888_1X24 even
>> when eDP is involved.
>>
>> Using the helper here, will certainly address this deviation.
>>
>> However, for the DPI/DSI to DP mode, MEDIA_BUS_FMT_RGB888_1X24 bus
>> format is required, and *just* using the helper as its get_input_bus_fmt
>> hook, might not be enough.
>>
>> Since tc358767 is the last bridge in DPI/DSI to DP mode, the
>> output_fmt parameter get defaulted to MEDIA_BUS_FMT_FIXED too, as there
>> is no get_output_bus_fmt hook present in the driver. If we simply us
>> the helper here, the input_fmt will also get set to MEDIA_BUS_FMT_FIXED.
>> This too is an unwanted deviation.
>>
>> It seems like the right way to address both the cases, would be by
>> adding the get_output_bus_fmt hook that sets output_fmt to
>> MEDIA_BUS_FMT_RGB888_1X24, as well as using the helper as the
>> get_input_bus_fmt hook.
>>
>> If this seems good to you too, I will send a new version of Tomi's
>> series[0] which incorporates this patch.
> 
> I never managed to fully wrap my head around the bus fmt negotiation,
> and as I am trying to recover from a flu this is not the time to try.
> Your explanations sounds like you have grasped it so I suggest to move
> ahead.
> 

Sure, I will send a new version.

Hope you recover soon! =)

Regards
Aradhya
