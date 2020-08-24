Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78AD24F9E4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 11:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AEC6E1BB;
	Mon, 24 Aug 2020 09:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0316E1BB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 09:50:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t2so7454723wma.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GN0bzIf92cLXxdNm0copsKALAFMVqgJeFRySzwdh4c8=;
 b=jnEdpSxgilYeo+nXQZMsXl/6xVjkVCPzaHgymM3NtwujgMb9nEHmftycU+C07g2drD
 FJE4n2krbcNLMcsyB50ENW1P+uZUBeqiOQMyzIQg6SmM9PGFsDeACpRsCbEYJR5dKzwH
 khNveRrdINmQbLd1b+aYdxI6azLk/YnOCvodAAnI8Wdq8/wV4eEpviME3c+absrLUAbt
 tpWKPmG0IMRu8k5sMh+0/IburKqM44f5FajorxOD5phdS/w7HHVDaV8UDlEivoEqNLAk
 j7bBO+N4m2Nom5/uH5Km3DcBczle49cNSav0u8McffL/CEKfeScPXGibm1tHZQ2/WVFg
 G7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GN0bzIf92cLXxdNm0copsKALAFMVqgJeFRySzwdh4c8=;
 b=RgewEVazji1xW8pXKjuYqQ8iGJb7Yh1kOOqjer+AeNHJ1AXhf/i0XG616IXp6bGM+D
 rxQvHMy99v95MEdYycNLgXkh8gFxNDyBJAmTjHPbVFeTTGeXrL1cwFXpIawUasnzKinT
 8g/+d051bszLmnDFu3qvbizAeXiq00RriUYYPo3ZjdtAqrloc/f+I79bKHWK1p2mMcs8
 CV4NU1sk9g3Hf5bp2CzYBKg8/ARg1OVfZPPYfNKaGKn0lNo1bDT8fZRwtJktv41Mu7Hy
 h6tbi1e2YL/N/Yu0nu4ETDvx2PbHOtkcFi1O6xT69Jn6I6TwZKtyIsbXIujgxiNY6VXn
 RqCw==
X-Gm-Message-State: AOAM531lO6CqSn+MUdfLsxTafqn4TRFGvYsgJlUiRdRiwW+yYEBchURs
 hsbFb10NqmwBmw/XPQx/g013EA==
X-Google-Smtp-Source: ABdhPJwUuWot06jk0vQROx/nE2H4dDyaxUfVX8TWUJFmH1DEgMFHDwooH3IZCO8Ogthwgm7ZnfTiUg==
X-Received: by 2002:a05:600c:28c1:: with SMTP id
 h1mr5037278wmd.174.1598262637102; 
 Mon, 24 Aug 2020 02:50:37 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d10sm10360947wrg.3.2020.08.24.02.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 02:50:36 -0700 (PDT)
Subject: Re: [PATCH 6/6] drm: bridge: dw-hdmi: Get output bus format when
 dw-hdmi is the only bridge
To: Algea Cao <algea.cao@rock-chips.com>, a.hajda@samsung.com,
 kuankuan.y@gmail.com, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, airlied@linux.ie,
 heiko@sntech.de, jernej.skrabec@siol.net, Laurent.pinchart@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, jonas@kwiboo.se,
 mripard@kernel.org, darekm@google.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org,
 linux-kernel@vger.kernel.org, jbrunet@baylibre.com,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch
References: <20200812083120.743-1-algea.cao@rock-chips.com>
 <20200812083631.4411-1-algea.cao@rock-chips.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <61c3860a-6e35-b90a-2c4f-6caca96c5db9@baylibre.com>
Date: Mon, 24 Aug 2020 11:50:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812083631.4411-1-algea.cao@rock-chips.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/08/2020 10:36, Algea Cao wrote:
> If plat_data->get_output_bus_format() is exist, we can
> use it to get hdmi output bus format when dw-hdmi is the
> only bridge. The hdmi output bus format can be set by vendor
> properties.
> 
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> ---
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 1eb4736b9b59..878e9e506963 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2644,6 +2644,8 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>  					unsigned int *num_output_fmts)
>  {
>  	struct drm_connector *conn = conn_state->connector;
> +	struct dw_hdmi *hdmi = bridge->driver_private;
> +	void *data = hdmi->plat_data->phy_data;
>  	struct drm_display_info *info = &conn->display_info;
>  	struct drm_display_mode *mode = &crtc_state->mode;
>  	u8 max_bpc = conn_state->max_requested_bpc;
> @@ -2662,7 +2664,11 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>  	/* If dw-hdmi is the only bridge, avoid negociating with ourselves */
>  	if (list_is_singular(&bridge->encoder->bridge_chain)) {
>  		*num_output_fmts = 1;
> -		output_fmts[0] = MEDIA_BUS_FMT_FIXED;
> +		if (hdmi->plat_data->get_output_bus_format)
> +			output_fmts[0] =
> +				hdmi->plat_data->get_output_bus_format(data);


The whole bus format negociation was introduced to actually avoid using such get_output_bus_format()
callback, please implement proper bus format negociation.

Neil

> +		else
> +			output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>  
>  		return output_fmts;
>  	}
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
