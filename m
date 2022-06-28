Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA2055BF00
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 09:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6097F113685;
	Tue, 28 Jun 2022 07:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF36C11A7C5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:16:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 189so6290902wmz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 00:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bs+z55PCN7UQyUBJxgcy+aHliepyUTeZJS/7dKvj/Vs=;
 b=sx2iDbB52zthlCaNDBVZNobDlgLhSD3ltqD8N66Fiaxi4X1fVL66t+uiIzvb7A65Mn
 0dkgdZw3jDQIrwciUUkKGYFm1+2c7x4P7jS82oGw3FM4YDUm5cUrcrvsoejStKegxmwK
 rIqU9BV2N8fyojtwLU4itejL82ywgNUMUXohMuCWHolLjWkvno2S5t9oIOVxCQdg1nr7
 5aCS6N1SAMYo9dgjmSO7RK+Fmaj2EhlfTF+v6OYhvPTVcfCQeieqzODz6G2sUOSDkYJy
 GraE3yIS/cmpY1CaQiaFpsjhRhJjYQUxxYjeVSrCyza210OO5sycmVZEOTwbOOKK0iOy
 3Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bs+z55PCN7UQyUBJxgcy+aHliepyUTeZJS/7dKvj/Vs=;
 b=N0+Ptizk1cnAi87nZ+KlkkXb0tZYdbmLK3O1BXge4BSMjQJRnsyzLbyrg55d9SGHHh
 jd2BvwI6/JHQq7pGOYURsYUybbZtqPWnAzq41zuNVSpFYB6kD5LhlSrEsqOUyA2dM17d
 t86YhFD7auMCM/9CgqFOjwjoNTfPUdonarrl9mvnloKVaEUb41Kbf+ann5I62+rHVG5u
 xK9bQL7XjPp8+BC+Vmlo/wJaiU/7YTFeCupGaGEFGbP8/z2wl7nQfaSynprJYdF72GOt
 //8NeG5bGMrWUWfvFou1XS12plavT4ROIhREwdJqfsdGQp+ZN2XNMH3oLepNX3gwO+tq
 JVMw==
X-Gm-Message-State: AJIora9Y9Q+pBErVBWddXChrj+8Yew+9kh3Lq5HFfpSKZ7nOJS3oi9C+
 hHI4xhX3MAcXdsTZhyz3rI2SbQ==
X-Google-Smtp-Source: AGRyM1vxchna7WqIDzGoeRm1y3dk36g8qKBVE/8uNmDfNP0xD3EywJyopAiIJanVjVxMCEQ4qU1UGQ==
X-Received: by 2002:a05:600c:3ca4:b0:3a0:1825:2e29 with SMTP id
 bg36-20020a05600c3ca400b003a018252e29mr19509305wmb.11.1656400564294; 
 Tue, 28 Jun 2022 00:16:04 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:52cb:c433:b96:9ad?
 ([2001:861:44c0:66c0:52cb:c433:b96:9ad])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6484000000b0020d02262664sm12837096wri.25.2022.06.28.00.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 00:16:03 -0700 (PDT)
Message-ID: <3b1e41f3-3aa0-bf4e-685a-5dc148ac3753@baylibre.com>
Date: Tue, 28 Jun 2022 09:16:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm: bridge: dw_hdmi: only trigger hotplug event on real
 link state change
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220627124715.408258-1-l.stach@pengutronix.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220627124715.408258-1-l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 27/06/2022 14:47, Lucas Stach wrote:
> There are two events that signal a real change of the link state: HPD going
> high means the sink is newly connected or wants the source to re-read the
> EDID, RX sense going low is a indication that the link has been disconnected.
> 
> Ignore the other two events that also trigger interrupts, but don't need
> immediate attention: HPD going low does not necessarily mean the link has
> been lost and should not trigger a immediate read of the status. RX sense
> going high also does not require a detect cycle, as HPD going high is the
> right point in time to read the EDID.
> 
> Ignoring the negative HPD edge does make the detection much more robust
> against spurious link status changes due to EMI or marginal signal levels.

Fair enough, but it means RX Sense must be totally functional with this change.

> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 3e1be9894ed1..24f991b5248d 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3095,6 +3095,7 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>   {
>   	struct dw_hdmi *hdmi = dev_id;
>   	u8 intr_stat, phy_int_pol, phy_pol_mask, phy_stat;
> +	enum drm_connector_status status = connector_status_unknown;
>   
>   	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
>   	phy_int_pol = hdmi_readb(hdmi, HDMI_PHY_POL0);
> @@ -3133,13 +3134,15 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>   			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>   			mutex_unlock(&hdmi->cec_notifier_mutex);
>   		}
> -	}
>   
> -	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> -		enum drm_connector_status status = phy_int_pol & HDMI_PHY_HPD
> -						 ? connector_status_connected
> -						 : connector_status_disconnected;
> +		if (phy_stat & HDMI_PHY_HPD)
> +			status = connector_status_connected;
> +
> +		if (!( phy_stat & HDMI_PHY_RX_SENSE))
> +			status = connector_status_disconnected;
> +	}
>   
> +	if (status != connector_status_unknown) {
>   		dev_dbg(hdmi->dev, "EVENT=%s\n",
>   			status == connector_status_connected ?
>   			"plugin" : "plugout");

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

It would be nice to have this tested on another platform using the Synopsys PHY (unlike Amlogic platforms)
like Renesas, Rockchip, Allwinner or Ingenic SoCs.

Neil
