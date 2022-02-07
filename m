Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB404AB681
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 09:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE24310F1DE;
	Mon,  7 Feb 2022 08:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7298810F27F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 08:22:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i15so847478wrb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 00:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BFte/N73anufCY2L87ftPOVSU+tJUPZA2b1mVMi04m0=;
 b=Mbh876zYnjjHrxOynXr+Nj75Jw2lyrzd5iAanX1bxuFZzKgj7ChmEnefO66IyihPvV
 tQBQdKkP2mavDMm+qDG/vlcL66p3mWzsWMqPKjAgFMLgQvORJjY+xi1Rjx/51YROfskG
 3K0Z94IQe7UM7o7FwXIRAIJDtzH1CJVjv/Qzks4FdNKWj4rXair+q8hR+CNcsWQk37pb
 0xqDtWf8v5VuHWwvFAll7tTIla6kKlTLTINw0+wvPyHlJCSf/wHPOi/jUvFVyjqo0ivh
 rDfmIScFCl/Ra6AkdT5cPNzyboHca44CW0uwE+Z2z+o9WElcDo84LY8h8aW+Nm9/aafT
 L99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BFte/N73anufCY2L87ftPOVSU+tJUPZA2b1mVMi04m0=;
 b=HWipEy/KGTq91bx2SF80xGjNGjQu3Yh861ZRc+vNJxRLFsQbmPCpm1EV2TlLlOqvn9
 YAet6nld1ZLAS/6fNs9nwb64s7hOISHjpKBGuOUK6qUNTZaA0H6krrS2dmPnMHV5qIlJ
 TuaX5mM7rqcg0kr4rVg+Kyre6+PNXiaeuhDkuVLwp5RQoru6DuRIpswsaSBIZjnHI3zo
 iNxU5mwSqFTFS9llNo5MKGqqaUp3sEmChfqKXsRj3WuClmWzUNQi3DRsRlAY/+maHtAG
 wPj9SpRcg4BcjFQcVXpLURJT6K+1MpZRcX/DAFeE26UuHk71FzonwJLl7OpY+tq27MSG
 jk+w==
X-Gm-Message-State: AOAM530S8v5qgDwQwSHUFP5qqiDVvwIHHmkZT/jDmfI4TWMP7WmLCGCZ
 cXgFMdeBAh1D8qRR10OcjfWKaet853pLAcCZ
X-Google-Smtp-Source: ABdhPJxz9gW41n0pkig+OBH//ze20WA6UazsXCaba4FC/dE8g7lFgLCHMEy218v1gS11sx4XSGVbjw==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr8980991wrp.80.1644222147863;
 Mon, 07 Feb 2022 00:22:27 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:b2bb:1b67:73da:334d?
 ([2001:861:44c0:66c0:b2bb:1b67:73da:334d])
 by smtp.gmail.com with ESMTPSA id a1sm9277401wrf.42.2022.02.07.00.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 00:22:27 -0800 (PST)
Message-ID: <4171ca35-3d82-eaa3-5812-9c038f1c0415@baylibre.com>
Date: Mon, 7 Feb 2022 09:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] drm/bridge: dw-hdmi: use safe format when first in
 bridge chain
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220204143337.89221-1-narmstrong@baylibre.com>
 <YgA+lcSNaQ2x4Wef@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YgA+lcSNaQ2x4Wef@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: jonas@kwiboo.se, robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kieran.bingham@ideasonboard.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 jernej.skrabec@gmail.com, biju.das.jz@bp.renesas.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 06/02/2022 22:33, Sam Ravnborg wrote:
> Hi Neail,
> 
> On Fri, Feb 04, 2022 at 03:33:37PM +0100, Neil Armstrong wrote:
>> When the dw-hdmi bridge is in first place of the bridge chain, this
>> means there is no way to select an input format of the dw-hdmi HW
>> component.
>>
>> Since introduction of display-connector, negotiation was broken since
>> the dw-hdmi negotiation code only worked when the dw-hdmi bridge was
>> in last position of the bridge chain or behind another bridge also
>> supporting input & output format negotiation.
>>
>> Commit 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks")
>> was introduced to make negotiation work again by making display-connector
>> act as a pass-through concerning input & output format negotiation.
>>
>> But in the case where the dw-hdmi is single in the bridge chain, for
>> example on Renesas SoCs, with the display-connector bridge the dw-hdmi
>> is no more single, breaking output format.
> 
> I have forgotten all the details during my leave from drm, so I
> may miss something obvious.
> This fix looks like it papers over some general thingy with the
> format negotiation.
> 
> We do not want to see the below in all display drivers, so
> I assume the right fix is to stuff it in somewhere in the framework.

The main issue is there is rule about the encoder in display driver having
a companion bridge to support format negotiation.

To solve this cleanly, the first bridge tied to an encoder should register
with some caps or flags.

For now very few bridge supports negotiation so the rules yet needs to be defined.

Since we are getting into a better support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
clarifies the bridge chain, we should have more cards in our hand in a near future.

Anyway, in the meantime there is no fix in the framework for this case.

Neil

> 
> Or do I miss something?
> 
> 	Sam
> 
> 
>>
>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Fixes: 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks").
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Reviewed-by: Robert Foss <robert.foss@linaro.org>
>> ---
>> Changes since v2:
>> - Add rob's r-b
>> - Fix invalid Fixes commit hash
>>
>> Changes since v1:
>> - Remove bad fix in dw_hdmi_bridge_atomic_get_input_bus_fmts
>> - Fix typos in commit message
>>
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 54d8fdad395f..97cdc61b57f6 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>   	if (!output_fmts)
>>   		return NULL;
>>   
>> -	/* If dw-hdmi is the only bridge, avoid negociating with ourselves */
>> -	if (list_is_singular(&bridge->encoder->bridge_chain)) {
>> +	/* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
>> +	if (list_is_singular(&bridge->encoder->bridge_chain) ||
>> +	    list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
>>   		*num_output_fmts = 1;
>>   		output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>>   
>> -- 
>> 2.25.1

