Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019DB4A9525
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 09:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A3410F3D4;
	Fri,  4 Feb 2022 08:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F6610F3D4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 08:32:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l25so9807120wrb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 00:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g4ZJpPhwpQl7h33ISIyrKDAF+HsmMexwbuW8LO0FMoY=;
 b=VDoZ3k7YLzFp9sL16l3v+G5LmlEOh5BNTxqlRWLSmAzAq0WBt6qiZ06KtVy8Z1oUZz
 XYWuYCEWI8n9h/KeueJZnWf5PArPrmOUz9URbT5DnW833vVMkZ5LmRB3mtLZzyQvI8nt
 M/+nNivfNV8QOhjLBKo+4WSnKp1nz/NFAoLjzqcLDe24mz0U/9jq+0Exfzu1vz916Us6
 h2haOl203RDvJg92e76mIsrZ8aB2NCHVYJF7i0RvpmccrkXgEBphEGbUVBxgSPO8Ilg8
 nUEzaH9sLZFliEaLykulK4Lansxj6kZUJtfUk/9WwFfmfO8nLn1FkFUJIZTUabmQRsju
 +xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g4ZJpPhwpQl7h33ISIyrKDAF+HsmMexwbuW8LO0FMoY=;
 b=mfjQojvvOaXyxmtCD3oz9jptMsHD1E05TRcaAdRZnND29x9T4sYdTqcvQK4i7r9r2A
 WQJFlPMb7KCfCxtMVhvSsrrNv+w214JaQTP8Jb5WO6MbPdw2JYEwzfjKUHXHKTH5Lx9m
 /8PUOB0fLyTY2soVj9p4cz5nudNG8x9ppiA7hkvoTZjKAgsu0cZRZ6GZIlaibB3uR56w
 0NzwI6rr4en57pThlWhlMOYasaZ0PwE/4BhdKorKo2pIr7bCtEDVbu9WuMifYH1HfsKs
 qCRo/L/JQ0zYCM65I7jEDf3F0sOV7Ot5R0oHoEAiydMnbqDB6rGyzFQd8OKg0/fIiwYo
 CTmA==
X-Gm-Message-State: AOAM531CPgzs/HUtRS42ondGNhAcDR/PzGP0/VuZGcZ0V0h2bJ0L1i0z
 GoaGV+ydTXDNV+vL42ChUWzwBkkigHWjrJIB
X-Google-Smtp-Source: ABdhPJx5AY77tNGTZGnEpY2lyqsvv2LLpqPDb9/EXMqDaz9yU0P5+8tiE0BG56ydUrFuRN4VVZEVlA==
X-Received: by 2002:a5d:5103:: with SMTP id s3mr1523764wrt.360.1643963551226; 
 Fri, 04 Feb 2022 00:32:31 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:3fbe:ff10:110:739?
 ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id j13sm1245036wrw.116.2022.02.04.00.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 00:32:30 -0800 (PST)
Message-ID: <9b98f2be-ed07-c956-adc8-51251b3432ee@baylibre.com>
Date: Fri, 4 Feb 2022 09:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: use safe format when first in
 bridge chain
Content-Language: en-US
To: robert.foss@linaro.org
References: <20220119122843.1455611-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220119122843.1455611-1-narmstrong@baylibre.com>
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
 Laurent.pinchart@ideasonboard.com, biju.das.jz@bp.renesas.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/01/2022 13:28, Neil Armstrong wrote:
> When the dw-hdmi bridge is in first place of the bridge chain, this
> means there is no way to select an input format of the dw-hdmi HW
> component.
> 
> Since introduction of display-connector, negotiation was broken since
> the dw-hdmi negotiation code only worked when the dw-hdmi bridge was
> in last position of the bridge chain or behind another bridge also
> supporting input & output format negotiation.
> 
> Commit 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks")
> was introduced to make negotiation work again by making display-connector
> act as a pass-through concerning input & output format negotiation.
> 
> But in the case where the dw-hdmi is single in the bridge chain, for
> example on Renesas SoCs, with the display-connector bridge the dw-hdmi
> is no more single, breaking output format.
> 
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Fixes: 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks").
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Changes since v1:
> - Remove bad fix in dw_hdmi_bridge_atomic_get_input_bus_fmts
> - Fix typos in commit message
> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f..97cdc61b57f6 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>   	if (!output_fmts)
>   		return NULL;
>   
> -	/* If dw-hdmi is the only bridge, avoid negociating with ourselves */
> -	if (list_is_singular(&bridge->encoder->bridge_chain)) {
> +	/* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
> +	if (list_is_singular(&bridge->encoder->bridge_chain) ||
> +	    list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
>   		*num_output_fmts = 1;
>   		output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>   

Can a bridge reviewer get an eye on this ? this actually solves an issue reported on a Renesas platform.

Neil
