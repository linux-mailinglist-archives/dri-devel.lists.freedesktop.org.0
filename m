Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22444D2A51
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 09:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4804410E8FD;
	Wed,  9 Mar 2022 08:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C3210E8FD
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 08:04:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so925847wmp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 00:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=U1D/3A7OGVZLniswJ8+s6z6Hi+6szsOAA85P72ar9O4=;
 b=oXXmdxSa9EK6PyApp1vchkzTPZQjHDdJA2RhBUOj685CSyBtqbbl1sfN+Opd04o/w9
 rgl0Lu9ILcp0+8aNQo39SMl7gZFK7BxzWO5+l/9OVoB3AsHrvNp+LiJ2hyu8w+xXsSkP
 li1E968Ru6mwKyqk0Q1OfrenTNITj0+uGoLufw38g7hWrnR2Knok6ni1QX9xyTBkAnI4
 veLjferX2gyXo8bx36F5vrz5MQHnbOT54ot25FvEE5t7Q3zJoAP+hfwme0ZX9oVwHDIc
 3/XGdcYpMMTEqvfAGDtYgptGNPV3A1yOKHAiPUEoI7ZJfPsr2BKrjbjXxuzSfV+/zqhD
 V0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=U1D/3A7OGVZLniswJ8+s6z6Hi+6szsOAA85P72ar9O4=;
 b=KXiuaVmS50gUTKdj03Fz6ypROV4cHtMkpeQ6aqxRkLzc7uGjDKEBgdTSdEB/4KT9BQ
 rqC3AZ6BAZJ6A3u2tkhyVdpF3+3V/f2e7rFj2XwcyLNwtAHY51jSQze+uEOrvM33YdIR
 TtfP+UViSOvqyap23RC8YAyj9oz1caGi34MnBTG/KF3dCSXVTLSGE6pC4KtYK8NTcUXR
 2r2he5E5pZ6VFFNX9zrnowmfkLPzThqq/wqu9f8rx4Dm7rr0QK5ofeuiZf8h1x1grLmg
 1ekWrrhcmG3Ipz2jVbZfqfE+vt0Bgcg26U6YZgoFof0VU6lz/PVBUeYnmn8CLIN8DLX9
 uQ9Q==
X-Gm-Message-State: AOAM5303jKgLrAGsfUWxZ+GEhspxqcGX8naTC++Od+j/u4By7VG4zN1N
 dug7vVQck/r4LZEwN3ftDYq4MA==
X-Google-Smtp-Source: ABdhPJxWAnPzNAFriE/hOf1GBpLWPZEaTw/EytIGyGix86yk1qL/T8KwVPxgeXpbYVmDGBWcOyborg==
X-Received: by 2002:a05:600c:a45:b0:346:5e67:cd54 with SMTP id
 c5-20020a05600c0a4500b003465e67cd54mr6430729wmq.127.1646813073133; 
 Wed, 09 Mar 2022 00:04:33 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:e587:9f12:6489:6b8?
 ([2001:861:44c0:66c0:e587:9f12:6489:6b8])
 by smtp.gmail.com with ESMTPSA id
 ay24-20020a05600c1e1800b00389a420e1ecsm967251wmb.37.2022.03.09.00.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 00:04:32 -0800 (PST)
Message-ID: <9fb21623-60e1-fe35-b740-9577f096f84e@baylibre.com>
Date: Wed, 9 Mar 2022 09:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] drm/bridge: Add MAINTAINERS entry for DRM drivers for
 bridge chip bindings
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2022 20:06, Douglas Anderson wrote:
> The bindings for bridge chips should also get the same maintainers
> entry so the right people get notified about bindings changes.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0216d2ffe728..a73179d55d00 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6403,6 +6403,7 @@ R:	Jonas Karlman <jonas@kwiboo.se>
>   R:	Jernej Skrabec <jernej.skrabec@gmail.com>
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/bridge/
>   F:	drivers/gpu/drm/bridge/
>   
>   DRM DRIVERS FOR EXYNOS

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
