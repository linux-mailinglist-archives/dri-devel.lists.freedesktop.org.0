Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F64A9AEB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 15:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9F910E25B;
	Fri,  4 Feb 2022 14:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A8C10E25B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 14:28:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j25so10977464wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 06:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+Lp/u9TyqWGi8tCfXYQsoeJPT8Udd/ptviv++KOZSUU=;
 b=LsUGi2nQVyaZowh+9qGjI90V+JaTfSH7TlMvyQdkd79C3DnYZ8eFgm5y9GVhgcwhXj
 N5zvIWvdV1iH5oAdjMxrfwzgkVdq+hxWEiCyUblvJw4Fqj0bZ5suNaT/wjPzpwyP1swM
 akSDRwdfiFkK0egXRe6WLWYYuMnvOSyfKh3giu5qg20tZOCGZdYIhK70Ke11VmOqQU25
 NkpEl39PW92FOPW9ezbjXE1k297b0IRF2Od6ddBQagZXgVVA8K3Cm6mpeab2XautNFOs
 2s68eIC0XKN8z7dHZqG7Zoia/w/nOnFEMfMU9A9wfzdceOSZ/qYfCVWg7kGv9bGmppO3
 QkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+Lp/u9TyqWGi8tCfXYQsoeJPT8Udd/ptviv++KOZSUU=;
 b=sB8vF5WdfB2ReWtoCGaEtYwYgnPHANAl/BLZBdGqLATM8pMajH0XM/04o1P+cNHpgF
 bYfSOVH30YEU/ZP+tDwGFHkpv0f4uNloZRKyHY0VB5EE5NhIXDMHXZcpgWf+dpBPRUVZ
 v713GJFC92WI+6W+BAUWjhmbN4VlTm0U2piTel49E/2Tc79kvhASMCthflBNuy5jGirc
 BfpUZhoCPwCQcbX3+zRgC+ZiJ3kMAKG9vq/jbIfCqBNiSU2X9oNeAQTCn1A80sFgBu6Z
 +2jl+dCjvSP2OOaBEJ3oSzyn4fGr3nUXms3HGowJQ2Qi2w4F8OnzWd0ez5+xeFNIQIY8
 ltRg==
X-Gm-Message-State: AOAM533itpBOwTRBou3k7C1rHF6cmrnfrQMjDyEwLdD8EzwPxuL6BswV
 sf9q9cHg0umM91JQoZNJFHzEiw==
X-Google-Smtp-Source: ABdhPJy7Li0UNWsO6whzeL5dHok9dh+9kNxX27ptjlz33GG9ZBo3V+oYd6fDWens/mdeSBuJqRTzBA==
X-Received: by 2002:a05:6000:1292:: with SMTP id
 f18mr2682399wrx.133.1643984889385; 
 Fri, 04 Feb 2022 06:28:09 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:3fbe:ff10:110:739?
 ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id y3sm2324801wry.109.2022.02.04.06.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 06:28:08 -0800 (PST)
Message-ID: <71bd653b-0703-d34d-7da3-84a7088d02b7@baylibre.com>
Date: Fri, 4 Feb 2022 15:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: use safe format when first in
 bridge chain
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>
References: <20220119122843.1455611-1-narmstrong@baylibre.com>
 <CAG3jFyv15AhfZP0HTAt73U0yvKHNAMLmKzFu-9AfX9v76h7s6g@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAG3jFyv15AhfZP0HTAt73U0yvKHNAMLmKzFu-9AfX9v76h7s6g@mail.gmail.com>
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kieran.bingham@ideasonboard.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com, biju.das.jz@bp.renesas.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 04/02/2022 15:05, Robert Foss wrote:
> On Wed, 19 Jan 2022 at 13:28, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> When the dw-hdmi bridge is in first place of the bridge chain, this
>> means there is no way to select an input format of the dw-hdmi HW
>> component.
>>
>> Since introduction of display-connector, negotiation was broken since
>> the dw-hdmi negotiation code only worked when the dw-hdmi bridge was
>> in last position of the bridge chain or behind another bridge also
>> supporting input & output format negotiation.
>>
>> Commit 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks")
> 
> I think this is the wrong hash. Is 7cd70656d128 the actual hash?

Wow indeed, thanks for checking...

> 
>> was introduced to make negotiation work again by making display-connector
>> act as a pass-through concerning input & output format negotiation.
>>
>> But in the case where the dw-hdmi is single in the bridge chain, for
>> example on Renesas SoCs, with the display-connector bridge the dw-hdmi
>> is no more single, breaking output format.
>>
>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Fixes: 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks").
> 
> This hash too.
> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
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
>>          if (!output_fmts)
>>                  return NULL;
>>
>> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselves */
>> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
>> +       /* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
>> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
>> +           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
>>                  *num_output_fmts = 1;
>>                  output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>>
>> --
>> 2.25.1
>>
> 
> There are two checkstyle issues apart from the above mentioned hash
> issues, and I think we can ignore those. With the above mentioned
> issue fixed, feel free to add my r-b.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Thanks, I'll fix & resend with your r-b.

Neil
