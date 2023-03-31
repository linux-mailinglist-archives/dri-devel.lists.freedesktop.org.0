Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B48F6D1B0F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B1110F159;
	Fri, 31 Mar 2023 09:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59C510F159
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:00:35 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r29so21621021wra.13
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680253234;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4nQxeJeXLAS1yXrHfRZgden2oQvmJ5Y9pjAachYDoZ8=;
 b=Rfekt0B+9GcLek7jW9pdK9C1nrTpK/XO63FVs0kWMDI5v92l510njwVLFzcTfuNy+e
 aPvLB9GcI83JEBBGZe/Jyw+qV6BywO88PArPxQJB6+QFugl+XaEatn4d3umC0stKVGyt
 Ttp65Pj8/BRs+eT1Aejcl6TLwpDDS/JloMzMIrZLZJNugidEBrFDVP8LWnzS9bDb+Txp
 9qRh97w8EUdr1zZZNCzE872PvRwyXLl81Neqi6pSMFhbKSjh4z7CTS0Gvn2DzYaHadPZ
 zeL3fbjd7nuFEV5lqH+D3qz4uuDn6CgUXNGcEh5oqhHCvHOgCFL0RmrF1kgE3DN0GwCG
 i7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680253234;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4nQxeJeXLAS1yXrHfRZgden2oQvmJ5Y9pjAachYDoZ8=;
 b=kTo9uv85e/6xjvh4WEexNJjj39fLq5iW7G2elpXpw7jU4VyWp9UUOdAPX9SMbSX2QU
 XUVV0cq0x24vykyygWhWlqXedZ8W+YJCH54UHZ2mwx5+AcqM8IFr9gfsNBp2XgksCh9D
 8jgKyZuSE5fkPulxU8YAU8MTAMkCXGPtIlqhIWw2WvakxfELe91EXTiQtzXmoLeBiwIv
 QQgn3dpFA0G3npGofUQYnUufR1ecawkbmW5Pcz61XiLIsjM0U9yVIkgvsGWjUUgqSusR
 Q5e0/n8ui+zLVRT2qiYd4Ve4wjT2hyeM2aljqYeMsSDFCyNOHiyG9rH041rb1+O2eH66
 HUng==
X-Gm-Message-State: AAQBX9fS4S/h6HKQymEvZrO66jrLZQWGsbdAAPH6t8hSuFlxfBsDc6eL
 KwDFM/GaRoW5tIiE92iRDUL/HQ==
X-Google-Smtp-Source: AKy350Z55GTUKlJlEyylgRJXO0eyo6+oSEbH6wjS3e2bsKEghN79AAf836I98UmhXi41vJrW7Wd7SA==
X-Received: by 2002:adf:f703:0:b0:2cf:ea38:ef29 with SMTP id
 r3-20020adff703000000b002cfea38ef29mr20498270wrp.44.1680253234309; 
 Fri, 31 Mar 2023 02:00:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0?
 ([2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0])
 by smtp.gmail.com with ESMTPSA id
 n5-20020adffe05000000b002d97529b3bbsm1619283wrr.96.2023.03.31.02.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 02:00:34 -0700 (PDT)
Message-ID: <4a22e085-b339-aa43-518e-d528c5f76de4@linaro.org>
Date: Fri, 31 Mar 2023 11:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/3] drm/bridge: tfp410: Fix logic to configured polled
 HPD
Content-Language: en-US
To: Jonathan Cormier <jcormier@criticallink.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
 <20230125-tfp410_i2c-v3-2-a85d5f0f50f1@criticallink.com>
Organization: Linaro Developer Services
In-Reply-To: <20230125-tfp410_i2c-v3-2-a85d5f0f50f1@criticallink.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org,
 Michael Williamson <michael.williamson@criticallink.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 20/02/2023 23:10, Jonathan Cormier wrote:
> From: Michael Williamson <michael.williamson@criticallink.com>
> 
> The logic to configure polling (vs async/irq notification) of hot-plug
> events was not correct.  If the connected bridge requires polling,
> then inform the upstream bridge we also require polling.
> 
> Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>   drivers/gpu/drm/bridge/ti-tfp410.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index bb3f8d0ff207..41007d05d584 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -155,7 +155,7 @@ static int tfp410_attach(struct drm_bridge *bridge,
>   		return -ENODEV;
>   	}
>   
> -	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_DETECT)
> +	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD)
>   		dvi->connector.polled = DRM_CONNECTOR_POLL_HPD;
>   	else
>   		dvi->connector.polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> 

A Fixes tag is probably needed here ?

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
