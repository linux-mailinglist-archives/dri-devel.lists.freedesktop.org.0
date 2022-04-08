Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72804F9584
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B20410E58E;
	Fri,  8 Apr 2022 12:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1209310E58E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:20:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id h16so5379241wmd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 05:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Tm3844p3tyj2hoHmI7W25/vDNLRVfKVH7ujOGYxkyIE=;
 b=SQ4QXeiefAStQE0uIiuq5fbTmB6dqaolONV3x2vWJ/d61seFNX6BK/GfTHcpkaABjv
 fN90oNIkgoBZXoioj+sQt2X7JdgL1a4QbcIKAtSVIqnkUK6DdA0oTRa3fxKiNaOYSwav
 E0OUcFQLy5tttayTwrU4ht2Z6VjzGjpbDOhmKEVf3ug5gh+jzOlXvIfbyDj0Cp7quIv9
 0rV7CEzteB98W5wJu/75nOqNpENOjVFuZwd7LycBEGWPvFpQx5RpQ3B2YvAW0+ZId6eh
 WiQud2cf5ykiV6P4hyCUzQfaEES8MCcWGxwJcG0Nl80x01UqH/kh4K/BnH85E+ODKxup
 hmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Tm3844p3tyj2hoHmI7W25/vDNLRVfKVH7ujOGYxkyIE=;
 b=xLIg579WugLz49Eejb2WFrOkik0D+Rgp/Aj6Nsn0azrZpmuxmoH2dhKUYtCg6k1N4Y
 uNkWWT2YtvbR7HpOvGTv1KXD7V5tfjVBF14N9btsxYbyyjZD9wH55vrItb6vX6YXuYf2
 u7G9jkjbKAqvKkgIvanK75lM8FMIUza81T1G2oML3w+jRUGtpbubrlPNFCjXbV5dnpkT
 598Qyzbf0T3INl/joSjC9RzZgbLpSd/wNoKrejjw5sxElVQXQ8ZX4KbNG6njgpOZbfF/
 XvLI4TD0eLFkAlQF8u3gNsDYvTu3J1xxUaHhIG6R3qnlZslB1YUkmq2pCpesg8W7TLQf
 bolg==
X-Gm-Message-State: AOAM530OStZLOdttKE5ig+00qO806SangDiO9B2mOpC+f3eF695a7Fdv
 Iuyp9GsnXzyIyCrr5y9sDuvGaw==
X-Google-Smtp-Source: ABdhPJyGLvOJ/1FtA8a81Q6gFsU03e8HUiyv0If0DZiyYPgTULh2Nj1Yr/DOO3WhVFFKZf93TjeeVw==
X-Received: by 2002:a05:600c:5021:b0:38c:70c0:80e9 with SMTP id
 n33-20020a05600c502100b0038c70c080e9mr16445209wmr.91.1649420451363; 
 Fri, 08 Apr 2022 05:20:51 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:eacd:ce6:e294:acd1?
 ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 j3-20020adfd203000000b0020616cddfd5sm11134751wrh.7.2022.04.08.05.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 05:20:50 -0700 (PDT)
Message-ID: <50460cf7-34e9-7c8e-131b-6866f43ec2da@baylibre.com>
Date: Fri, 8 Apr 2022 14:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/5] drm: bridge: dw_hdmi: default enable workaround to
 clear the overflow
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <39592fee39610c544058e6b8f9af4b4ea8dc4cdc.1649412256.git.Sandor.yu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <39592fee39610c544058e6b8f9af4b4ea8dc4cdc.1649412256.git.Sandor.yu@nxp.com>
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
Cc: shengjiu.wang@nxp.com, cai.huoqing@linux.dev, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04/2022 12:32, Sandor Yu wrote:
> i.MX8MPlus (v2.13a) has verified need the workaround to clear the
> overflow with one iteration.
> Only i.MX6Q(v1.30a) need the workaround with 4 iterations,
> the others versions later than v1.3a have been identified as needing
> the workaround with a single iteration.
> 
> Default enable the workaround with one iteration for all versions
> later than v1.30a.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 23 +++++++----------------
>   1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 4befc104d220..02d8f7e08814 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2086,30 +2086,21 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
>   	 * then write one of the FC registers several times.
>   	 *
>   	 * The number of iterations matters and depends on the HDMI TX revision
> -	 * (and possibly on the platform). So far i.MX6Q (v1.30a), i.MX6DL
> -	 * (v1.31a) and multiple Allwinner SoCs (v1.32a) have been identified
> -	 * as needing the workaround, with 4 iterations for v1.30a and 1
> -	 * iteration for others.
> -	 * The Amlogic Meson GX SoCs (v2.01a) have been identified as needing
> -	 * the workaround with a single iteration.
> -	 * The Rockchip RK3288 SoC (v2.00a) and RK3328/RK3399 SoCs (v2.11a) have
> -	 * been identified as needing the workaround with a single iteration.
> +	 * (and possibly on the platform).
> +	 * 4 iterations for i.MX6Q(v1.30a) and 1 iteration for others.
> +	 * i.MX6DL (v1.31a), Allwinner SoCs (v1.32a), Rockchip RK3288 SoC (v2.00a),
> +	 * Amlogic Meson GX SoCs (v2.01a), RK3328/RK3399 SoCs (v2.11a)
> +	 * and i.MX8MPlus (v2.13a) have been identified as needing the workaround
> +	 * with a single iteration.
>   	 */
>   
>   	switch (hdmi->version) {
>   	case 0x130a:
>   		count = 4;
>   		break;
> -	case 0x131a:
> -	case 0x132a:
> -	case 0x200a:
> -	case 0x201a:
> -	case 0x211a:
> -	case 0x212a:
> +	default:
>   		count = 1;
>   		break;
> -	default:
> -		return;
>   	}
>   
>   	/* TMDS software reset */

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
