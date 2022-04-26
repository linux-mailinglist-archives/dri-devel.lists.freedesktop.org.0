Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EDE5101EA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 17:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6422610E7D1;
	Tue, 26 Apr 2022 15:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C157110E7B1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 15:29:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso1778431wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xmjXZYEvSywyflOdtu3pkNrfJwUdbHNGH7EM0+3lZVs=;
 b=L4RlUWBCgH/ZB0PeLn4K5fCuKrA+EjjZafQlSs6yEUCypcy55DalUV8m9WbfeKrtvS
 5Q4VlPCyZeMlTzaUWsjFgpG+zaPwlEbgudXS1o1V+TyKR+1FLfOTFqqiFk1E2fphEBo0
 2HeQ17FuYkSOCxre2wrdZ+evxgNFg2uJE7japTfSsp1L8GQunxqFdd3mdLKPusHceX8l
 aBndPSXpW2z4Y1l4t+l9stpfdVb29VAjpphjmv8L9ut/agbry7U+IFzV1RONXXfiBlZD
 rNnJV0ShMY6uy2OAjkaZGTj3GnqSPleqvQ8c4nzD7TyRH/C3m6dq7HpBKs7H2HvUHSGD
 XZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xmjXZYEvSywyflOdtu3pkNrfJwUdbHNGH7EM0+3lZVs=;
 b=zsVqsCu4C/InzSbtd3rjBFtaWoX65nnwOZlTfW0mMv+ZlBI75vnwPnFsVAES+Dk5vg
 znYKaI0a1eWxzf8MouiJlrKRqoJeQbT1gP3z98AEnbyqYR4mrUE56wF4aKftllTVd5Y3
 2VNrakFmRp8X5quww0UCwq7Ix61EeVJQlwScMNfVaQqu5an9GIbCy8a5jNe1LN6+nhPj
 CufP7bi4kJor0Am59mVDUDafiiRidEVAchqQeQA57rI23jsqZYo/uXYJqW3W/mTS+B9v
 QVN7V0MncHhyX1Up9IqQ1JNUETaNZpYwJiqNbMlGrFcb5Ang3zZ29lA3Gvfq/ELJqKvC
 v+ug==
X-Gm-Message-State: AOAM533xrwiRCPcoLLXCAO8taphxEOyJnmrcnQJFSXqrLB9/buOorRnp
 +fIZxrxgpWOngulWlRuRzbhoFg==
X-Google-Smtp-Source: ABdhPJx4o/yWEsHCDJMP2SoLs5GoZgq06izD/asRmKR9qCaO16o7SekLSb5++udJrRAQ0AaonO4vmg==
X-Received: by 2002:a1c:a181:0:b0:392:8f7e:d2f8 with SMTP id
 k123-20020a1ca181000000b003928f7ed2f8mr22115472wme.30.1650986973204; 
 Tue, 26 Apr 2022 08:29:33 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5959:ca32:2e01:b6fc?
 ([2001:861:44c0:66c0:5959:ca32:2e01:b6fc])
 by smtp.gmail.com with ESMTPSA id
 b11-20020adfc74b000000b0020ad84d3fa3sm7251824wrh.44.2022.04.26.08.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 08:29:32 -0700 (PDT)
Message-ID: <fd02a183-bcaa-86a8-8a13-52a9ddb374d5@baylibre.com>
Date: Tue, 26 Apr 2022 17:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/bridge: ite-it6505: add missing Kconfig option select
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220426141536.274727-1-fparent@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220426141536.274727-1-fparent@baylibre.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2022 16:15, Fabien Parent wrote:
> The IT6505 is using functions provided by the DRM_DP_HELPER driver.
> In order to avoid having the bridge enabled but the helper disabled,
> let's add a select in order to be sure that the DP helper functions are
> always available.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>   drivers/gpu/drm/bridge/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 007e5a282f67..2145b08f9534 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -78,6 +78,7 @@ config DRM_ITE_IT6505
>           tristate "ITE IT6505 DisplayPort bridge"
>           depends on OF
>           select DRM_KMS_HELPER
> +        select DRM_DP_HELPER
>           select EXTCON
>           help
>             ITE IT6505 DisplayPort bridge chip driver.

http://lore.kernel.org/r/20220403151637.15546-1-rdunlap@infradead.org also select DRM_DP_AUX_BUS,
can you check if this is really neaded ?

Neil
