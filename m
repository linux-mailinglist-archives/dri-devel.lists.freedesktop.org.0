Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB594C87A8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 10:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21A610EC99;
	Tue,  1 Mar 2022 09:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1B410EC99
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 09:18:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 a13-20020a05600c348d00b0038188b8bbf6so770550wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 01:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TEYlXbvOWSupbAY8tVPqpr8CRR6na8Wr7aBD49DbKbw=;
 b=5XN30m4Ku6wsdOr1gXHxmASqPTvStwE7a9zlpqKAdBuXj5t51bUPPkLvAnB3wJfxFE
 2n6WDmPyE0FXui/5QAuK+WLOupUNijhsPIgHi2c+JlVBE6zalhCshibJt1ra+vi3Q+25
 VQaphmAdkKb8OqoYJ1kjv2qBPDOPgF7Km0qbSRQ+3cqqM/DLBu2mYVsvd4uwxe6hQCGx
 OqDxpjgre3klt1HNd2CAoZkhXtIkwrzuSmxK6J6v0+Oyb3UaWRHzwMiej/r3k7eGPml3
 mMnxtyIfuznRDSYGSaIzMK6mLtWZ1OAhGWwLF6Gn6j+ZD/4AIu/PbobEUboMBvtj7Tmm
 gkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TEYlXbvOWSupbAY8tVPqpr8CRR6na8Wr7aBD49DbKbw=;
 b=OUVSjzWEcgQ5afxplPt86Jx7UlCYJaaAaYBM/ghHWdJ9eynwlqIIFIJrMEI3INlIx+
 AFRkC44bm6REUGowSRiGbLfQ7FAOBtZ66hb6Buqe+TZ8F3DrL9FO6QMJlOun2DtHUW0s
 V1DNhhQXoGEyuMhI/jWXKzA0icygDBzsls1Ohozyg0F0vKoZbk+W/hju9FiBXu/YinWX
 QU5qe+/fag6hvJOIacdH/OFZSpPFws+weMPgJtiejVIgayUMvaaFW8AX7DhrTzy3kw41
 upc/vnNX8hayRl+u4cN8tPODkGpP8bKgfwAJwcAhwuyCIZAlNmAWxd9ej70V/ZNZOHCi
 Ts0Q==
X-Gm-Message-State: AOAM530OGWwXDJwMkeOZ3+qmVFFk9c6Kajj2MfGik/p6/DPcnI1TE0to
 ZXIYX/D6bP9kYjFAnHmF0dfZmw==
X-Google-Smtp-Source: ABdhPJyohskPJWFDRxtZYJ+kAebH7Cv0B/YHuOe8uClSNBI+nEuErf2HD9GpDSk1fn9dmbLCrEcTbw==
X-Received: by 2002:a1c:e90a:0:b0:381:504e:b57d with SMTP id
 q10-20020a1ce90a000000b00381504eb57dmr9988213wmc.177.1646126291336; 
 Tue, 01 Mar 2022 01:18:11 -0800 (PST)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a5d4dc1000000b001eeadc98c0csm12710913wru.101.2022.03.01.01.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 01:18:10 -0800 (PST)
Message-ID: <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
Date: Tue, 1 Mar 2022 10:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, letux-kernel@openphoenux.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 26/02/2022 18:13, H. Nikolaus Schaller wrote:
> Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
> 
> introduced a new mechanism to negotiate bus formats between hdmi connectors
> and bridges which is to be used e.g. for the jz4780 based CI20 board.
> 
> In this case dw-hdmi sets up a list of formats in
> dw_hdmi_bridge_atomic_get_output_bus_fmts().
> 
> This includes e.g. MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the CI20 but
> only produces a black screen.
> 
> Analysis revealed an omission in
> 
> Commit 6c3c719936dafe ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
> 
> to check for 8 bit with when adding UYVY8 or YUV8 formats.
> 
> This fix is based on the observation that max_bpc = 0 when running this
> function while info->bpc = 8.

In fact if bpc = 0, it should be considered as 8, so the issue is elsewhere.

> 
> Adding the proposed patch makes the jz4780/CI20 panel work again with default
> MEDIA_BUS_FMT_RGB888_1X24 mode.
> 
> Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
> Fixes: 6c3c719936dafe ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 43e375da131e8..c08e2cc96584c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2621,11 +2621,13 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>   		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>   	}
>   
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
> -		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +	if (max_bpc >= 8 && info->bpc >= 8) {
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
> +			output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>   
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> -		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +			output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> +	}

It should not select YUV here if it's not possible, so something is wrong.

Can you check if https://lore.kernel.org/r/20220119123656.1456355-2-narmstrong@baylibre.com fixes this issue instead ?

Neil

>   
>   	/* Default 8bit RGB fallback */
>   	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;

