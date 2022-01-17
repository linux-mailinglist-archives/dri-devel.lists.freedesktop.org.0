Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34AA490B36
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852E088EB4;
	Mon, 17 Jan 2022 15:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3E188EB4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:12:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso25089533wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iobZ9nIGQYOcCvMsLNiuSueXQIR4Q93XXCRE5G/Gobc=;
 b=uBbnoT68ad0CaZ2z4c+QV0CuII+8J3rnGOJVehC4ySqxyK+ZWJj6ihSWXZhrEmH51E
 24OHvfLpL0HjzFVLZvrDuS/fFnvQx74Uy2ZU0Z3UUsfOG2Dz08cB6KybWUvIeK5eDTxS
 phOal6YFDo8zXfOgYjULbSGpF3f2EtKSdgZMuq9JUJSzDHgKTZriArJHisUOk6/0U11e
 +jK3NfFEfW8GTVIIjSQ6/afnFAfcxP0bCfRKQFunIM2lJkqzcenA/nSnMLjho+hP+KfV
 0euUq3vrdA2vZ+lnoNpvD+5AI2JJHRnhcFRwptzKPsqG8AtVikmwB3dcO2x7JVZBAUbs
 QCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iobZ9nIGQYOcCvMsLNiuSueXQIR4Q93XXCRE5G/Gobc=;
 b=firR88Db5Ou0TYJoMNnNc4TAEwd34lLXkj3Z4znGBSURVOJaGVp1f/wFaCfqQfRu7J
 CojkgNYOj2RXu8stIaEQXd3/e9PlpBOHcOs3gPoUyLwwZU7e/nFuKZ8CASk8BV4v+E6H
 WZpdHBmA4cYQOIr3fIZwDxVbEjo980RAICTiJC34pEe9gASFSl00IG7FQlUJNHLq/r0V
 pP8Gdfd9oBkNu7mcNhe/qEbJtge2RKBN5DYO//0pUfWrtBSsAC4L685EJVc8Q9EUUEAD
 NXI12/OWAlahMguMwWBVC9rz41f3jyU4UbG86YiFu58tyePZ31LAWhK9Oak6mgCW1/vF
 FJiA==
X-Gm-Message-State: AOAM532vxPOgJFB/JUg930uKDpnkueem6EnaqYkO0ZkLCr7c0h9fWdXJ
 ct3zLqB4bZ3pkEZ1e9HVj8bdeA==
X-Google-Smtp-Source: ABdhPJzkNeQEobN5QpybM3e8obvxhbFXFSFUTDbbVh1vK9voBPPmlRJxDdyzSsnY0+lrrKtC1xP+8w==
X-Received: by 2002:a05:600c:3b9a:: with SMTP id
 n26mr14317988wms.88.1642432321271; 
 Mon, 17 Jan 2022 07:12:01 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id p62sm13589984wmp.10.2022.01.17.07.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 07:12:00 -0800 (PST)
Subject: Re: [PATCH] drm/bridge: dw-hdmi: use safe format when first in bridge
 chain
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>
References: <20220117141750.1182223-1-narmstrong@baylibre.com>
 <OS0PR01MB592290D81CE917A0125C519E86579@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <89d47094-e23f-7c36-7cc8-c261a921c2ab@baylibre.com>
Date: Mon, 17 Jan 2022 16:11:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB592290D81CE917A0125C519E86579@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2022 15:27, Biju Das wrote:
> Hi Neil,
> 
> Thanks for the patch
> 
>> Subject: [PATCH] drm/bridge: dw-hdmi: use safe format when first in bridge
>> chain
>>
>> When the dw-hdmi bridge is in first place of the bridge chain, this means
>> there is now way to select an input format of the dw-hdmi HW component.
>>
>> Since introduction of display-connector, negociation was broken since the
>> dw-hdmi negociation code only worked when the dw-hdmi bridge was in last
>> position of the bridge chain or behind another bridge also supporting
>> input & output format negociation.
>>
>> Commit 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts
>> callbacks") was introduced to make negociation work again by making
>> display-connector act as a pass-through concerning input & output format
>> negociation.
>>
>> But in the case were the dw-hdmi was single in the bridge chain, for
>> example on Renesas SoCs, with the disply-connector bridge the dw-hdmi is
>> no more single, breaking output format.
>>
>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Fixes: 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts
>> callbacks").
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 54d8fdad395f..9f2e1cac0ae2 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2551,8 +2551,9 @@ static u32
>> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>  	if (!output_fmts)
>>  		return NULL;
>>
>> -	/* If dw-hdmi is the only bridge, avoid negociating with ourselves
>> */
>> -	if (list_is_singular(&bridge->encoder->bridge_chain)) {
>> +	/* If dw-hdmi is the first or only bridge, avoid negociating with
>> ourselves */
>> +	if (list_is_singular(&bridge->encoder->bridge_chain) ||
>> +	    list_is_first(&bridge->chain_node,
>> +&bridge->encoder->bridge_chain)) {
>>  		*num_output_fmts = 1;
>>  		output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>>
>> @@ -2673,6 +2674,10 @@ static u32
>> *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>  	if (!input_fmts)
>>  		return NULL;
>>
>> +	/* If dw-hdmi is the first bridge fall-back to safe output format */
>> +	if (list_is_first(&bridge->chain_node, &bridge->encoder-
>>> bridge_chain))
>> +		output_fmt = MEDIA_BUS_FMT_FIXED;
>> +
> 
> Based on my debugging, this looks redundant, as get_output_bus_fmts already sets output_fmt = MEDIA_BUS_FMT_FIXED,
> And *num_output_fmts = 1, so the function parameter output_fmt in input_bus_fmts will have MEDIA_BUS_FMT_FIXED
> And no need to override output_fmt value.  I may be wrong here.

You're right, I added this in case another bridge than display-connector is used, but in fact it should instead
check if first bridge of the chain and output_fmt == MEDIA_BUS_FMT_RGB888_1X24 || output_fmt == MEDIA_BUS_FMT_FIXED
otherwise return an error.

I'll send it separately since it's out of the scope of the issue fixed.

Neil

> 
> Regards,
> Biju
> 
>>  	switch (output_fmt) {
>>  	/* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
>>  	case MEDIA_BUS_FMT_FIXED:
>> --
>> 2.25.1
> 

