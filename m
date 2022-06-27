Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C0255B97B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 14:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B4210FA25;
	Mon, 27 Jun 2022 12:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BDE10FC0B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:20:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id k22so12798456wrd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ykO033+iYv9guXQy3V+HFivvq6rPSfa7YdgevQ57AXI=;
 b=kAaia7P7lkezFgG+NFaBeJJRWWn2ucVn3yblXW/Pyp4nTXdnTYt8A69B6ZuecEu+Dw
 i8j7GAJm7SDBqUIhZcgsmwvEaKKm99CqtO0yXADVH8ODwusoLiPoElvVFYCAH0qIZzet
 Dpv/1q3BvMWnQ2kjTVIlQFKr8qqp+HH3tHXBxYUH6lhwj7sddc7NmJzjbmmmETkz7J5x
 KCqEH0TB063Z1/rWrW5sb/dleqkxWFcAWOPvrArIYVMrYv53VJfR1MRsavxiESJ9pLRJ
 SBeZbzvg6iSGQAXPEcKbIKnez8LmUH+F/lQR9cA1GcxEAzaU0Ezw4BuVF9EcSiaHB7tm
 u7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ykO033+iYv9guXQy3V+HFivvq6rPSfa7YdgevQ57AXI=;
 b=eN0ae/rpFw5vIe3MulDzL5vAC63VCQvuYagN4xGtp2yrQKMJfdUdyFB4SqhQLWYntT
 MMgb/+d4LirYIr+CJo+LfsYvZ3h1Z+F7EPnVxUINQBPznXxBbFWVCSXd3xmzHtWnji3a
 J7qbWQFzUeBGZFc8GUAbQeiyrcuU6vQbOqL4ab87KBzQf2dvnz20AMlGk0Pys1Hj5Y3a
 NNzq6rYvCHWGiw9aYygAhvJFkADL9GatyQW1K7ZnKUlYZsjAxkExlatJmdUcYQad5zfL
 9w0frmQ9+OHYIBwg9JIoldGbGkmcGkA3qGy2L6KG992fKjuxa1bcFd5fgmLCqqX84Hrl
 l8tQ==
X-Gm-Message-State: AJIora/AVfmLtPRj2G4CkmEvPk+diImkas12SVkmrfhLMZTJSU2Fr9qo
 2pFZ0mnUEuYOLwZQdBNQdm+5Cg==
X-Google-Smtp-Source: AGRyM1vSTnALwvK8vwllSlKst2dDE9xBQOUXnragdWlsnRCr3eY5Y0/WgVf9BJzF/a+hXq5LZ7pnHA==
X-Received: by 2002:a05:6000:1f81:b0:21b:a1b5:776 with SMTP id
 bw1-20020a0560001f8100b0021ba1b50776mr11540983wrb.201.1656332412700; 
 Mon, 27 Jun 2022 05:20:12 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c?
 ([2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a5d5588000000b002102f2fac37sm10350870wrv.51.2022.06.27.05.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 05:20:12 -0700 (PDT)
Message-ID: <f00991d4-8a0a-84d2-39fb-5dcd110df952@baylibre.com>
Date: Mon, 27 Jun 2022 14:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/bridge: tc358767: Do not cache dsi_lanes twice
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20220624181902.151959-1-marex@denx.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220624181902.151959-1-marex@denx.de>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2022 20:19, Marek Vasut wrote:
> The DSI lane count can be accessed via the dsi device pointer,
> make use of that. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index e4dd4f05f94b3..44f32bf483c51 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -288,7 +288,6 @@ struct tc_data {
>   	struct drm_connector	connector;
>   
>   	struct mipi_dsi_device	*dsi;
> -	u8			dsi_lanes;
>   
>   	/* link settings */
>   	struct tc_edp_link	link;
> @@ -1261,7 +1260,7 @@ static int tc_dsi_rx_enable(struct tc_data *tc)
>   	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
>   	regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
>   
> -	value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
> +	value = ((LANEENABLE_L0EN << tc->dsi->lanes) - LANEENABLE_L0EN) |
>   		LANEENABLE_CLEN;
>   	regmap_write(tc->regmap, PPI_LANEENABLE, value);
>   	regmap_write(tc->regmap, DSI_LANEENABLE, value);
> @@ -1909,8 +1908,7 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
>   
>   	tc->dsi = dsi;
>   
> -	tc->dsi_lanes = dsi_lanes;
> -	dsi->lanes = tc->dsi_lanes;
> +	dsi->lanes = dsi_lanes;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
>   


Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
