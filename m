Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F96491FB5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 08:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D76112AE3;
	Tue, 18 Jan 2022 07:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04D8112AE3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 07:16:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so4903292wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 23:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQlMCAcARMG5FZb81MNJqivPJJioAm6mST3VLIgQHo4=;
 b=w13nMXKuBBBdeS+i26nmMjhAWRhH/ujBlUHnXn/tQNnXae/VTHb2qvO2cMKk8Ded55
 zpsoCUq5wgV41tQ725NEP4MDZr0E9c+BQar8DiNkXgjvz+n0u2a9XgB7RUtJiYydUxmt
 iKQLngsap/85QG67ppWGPT1b8qvuPdr8ejicf17/tg9IvNM7AOQ7E/tsAQHAgJ0PaqBK
 ww2wc+iJ50uwrUJl2LsPhA64ZFXR/EK05N4e9KQg+CY+kkH18XiFp2dEc/EOZ0/p5Kri
 2gENv9JA1CQ0qHKKJI2Q/NQZ1cNyS2he4/H9PC41Nvag5HQ9o9817+mcHQdz/LWPMbJa
 dA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gQlMCAcARMG5FZb81MNJqivPJJioAm6mST3VLIgQHo4=;
 b=HklISmkkSCXix8sGy5qRXfl6ORJZsOs4w43ITkGXkjaxpaNl8KZoewuZIuMdshWJm9
 NX5XmrSH4z+z1RwVe203MQG9SQIPThXtZWEXpuYvqFibxIUFcbqrcXocmFc/XqrtYOba
 coBsDpkSSYfk8HnIjCVc4ArMfwG4jI9qdu5Mh+RjSv2GagN3LyoYM4aO59YrZBucYZaw
 FBgLLI9jb9A3UTj+2ejKDT+tFwiGd2hVwsMgrjt7EzfTOS2cjIGE/9yqwsxcHF8AsGMF
 uJlrUeEoQq+Q22nZcRz9H2KTDdIh0Naz+8+DtcakqCk4H3lqe6xQ5wo1vKfdZdhISrta
 CoqA==
X-Gm-Message-State: AOAM530n+hsZmDf9nVzBZGezvuGgUbLA+GfoYiZX2c5xG5bD2EecmGvu
 aqEXii8F7UFGOf9+WAkMn4yoPg==
X-Google-Smtp-Source: ABdhPJxKc+ZC2Ld6AKfixfKo46o7GzpW/fBRbf7XtLwAgiclXSvE7816Dx7jzlhdzKg7Ogrm83MWJw==
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr6369451wry.261.1642490214958; 
 Mon, 17 Jan 2022 23:16:54 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:2b9:c814:ff2f:49bf?
 ([2001:861:44c0:66c0:2b9:c814:ff2f:49bf])
 by smtp.gmail.com with ESMTPSA id d200sm1422663wmd.28.2022.01.17.23.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 23:16:54 -0800 (PST)
Subject: Re: [PATCH] drm/bridge: dw-hdmi: use safe format when first in bridge
 chain
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>
References: <20220117141750.1182223-1-narmstrong@baylibre.com>
 <cdc8dd0f08aea5f8a32a6da7ec087c8d48d627f5.camel@toradex.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <6558973d-8d16-9e41-44ca-4e8cde5ce049@baylibre.com>
Date: Tue, 18 Jan 2022 08:16:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cdc8dd0f08aea5f8a32a6da7ec087c8d48d627f5.camel@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "biju.das.jz@bp.renesas.com" <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17/01/2022 17:53, Marcel Ziswiler wrote:
> Hi Neil
> 
> Sorry, just some trivial spelling fixes.
> 
> On Mon, 2022-01-17 at 15:17 +0100, Neil Armstrong wrote:
>> When the dw-hdmi bridge is in first place of the bridge chain, this
>> means there is now way
> 
> no way
> 
>> to select an input format of the dw-hdmi HW
>> component.
>>
>> Since introduction of display-connector, negociation
> 
> :%s/negociation/negotiation/g
> 
>> was broken since
>> the dw-hdmi negociation code only worked when the dw-hdmi bridge was
>> in last position of the bridge chain or behind another bridge also
>> supporting input & output format negociation.
>>
>> Commit 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks")
>> was introduced to make negociation work again by making display-connector
>> act as a pass-through concerning input & output format negociation.
>>
>> But in the case were
> 
> where
> 
>> the dw-hdmi was single in the bridge chain, for
>> example on Renesas SoCs, with the disply-connector
> 
> display-connector
> 
>> bridge the dw-hdmi
>> is no more single, breaking output format.
>>
>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Fixes: 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks").
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 54d8fdad395f..9f2e1cac0ae2 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>         if (!output_fmts)
>>                 return NULL;
>>  
>> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselves */
>> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
>> +       /* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
>> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
>> +           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
>>                 *num_output_fmts = 1;
>>                 output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>>  
>> @@ -2673,6 +2674,10 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>         if (!input_fmts)
>>                 return NULL;
>>  
>> +       /* If dw-hdmi is the first bridge fall-back to safe output format */
>> +       if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain))
>> +               output_fmt = MEDIA_BUS_FMT_FIXED;
>> +
>>         switch (output_fmt) {
>>         /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
>>         case MEDIA_BUS_FMT_FIXED:
> 
> Cheers
> 
> Marcel
> 

Thanks for the spelling fixes,

Neil
