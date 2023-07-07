Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5A74ABEB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 09:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD10110E51D;
	Fri,  7 Jul 2023 07:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A59910E51D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:27:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3128fcd58f3so1562966f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 00:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688714869; x=1691306869;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mfGfzIB+RcA72dyodym3yq746uqRLSsXTKVVkcw8AD8=;
 b=G0luk0upz8DSdbX6QT6rROaZMATKsr9FAmewd7D9/BT72cYJnx6Xt/yPD4ZcZr+bHv
 ikZ9fZZQGnAxx/hgxxD9DXEhaAAcNmwtkd5XKQaKQDxvWuxTVjsw4qe+FvQSb7A76ZeR
 JSrbS2GWudguU+JqiMNsd9Q7Tejsm7Cl9gV0FXqU/plqaXIXNNs76HPqJYxXQ3peHtsU
 h+53sCYRocwqAz8CGygdBNzoFghJtDzRoN1Vm+r+xAQfsEpBMNyf9ZWOqGxs39vCod4q
 XJnlgr4gxZRtHIJEiM3sewMnZAwZGhlndBy/8JHcVhm0u5n7Y91xfIrsmbPB1KIhrq3c
 O5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688714869; x=1691306869;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mfGfzIB+RcA72dyodym3yq746uqRLSsXTKVVkcw8AD8=;
 b=VM/8rCDIFqbhJEYZ1QVkt8NeZMpkEKjUdBUT90l+bmHFUQUh6s3Vawf3fG5ioUWx7G
 AzCea9pTRD13lLdSMwCjJmJBJfunkjGA4YSkS10Josx8Mvn5G8VOLIJVfsxappMb9awT
 gI9KsyfWdy0OS6wkftJv+/SJXcmzAHQsmBqhlWvavSPA50rL8n1IHMGSIakoQA8694xW
 82kngBuaYb4NPM3J4OcWMfIfKDaJqUUgyWj/4ytIIpS7j8bAAvwW/xrz1v197XAwWc3B
 /ImArpQS+8SogLTDNltDdhi/RNvuqSkTOgQEu4Wt/GnxujJqiIbiRyPfs6M7w2LgaMle
 nfGw==
X-Gm-Message-State: ABy/qLbR7MlNUJWyeXWRz+4TRQlAe7fIg9ePCS7krXaBwESzfNcjTKH1
 Mr6OFX/878zAPwt8oXB7bfkRDw==
X-Google-Smtp-Source: APBJJlE1Lp8Td/p603T/IB8hb6xWItINAd4yu2c/zsIWdZt1qXYK9Z1W/EalIOZfv5OMAfcOKI6MDw==
X-Received: by 2002:a05:6000:4ec:b0:314:1483:d8ad with SMTP id
 cr12-20020a05600004ec00b003141483d8admr3314256wrb.44.1688714869253; 
 Fri, 07 Jul 2023 00:27:49 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 g7-20020adff3c7000000b00313e59cb371sm3736792wrp.12.2023.07.07.00.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 00:27:48 -0700 (PDT)
Message-ID: <3c0ff63e-a35d-60b6-38aa-178219e65cbd@linaro.org>
Date: Fri, 7 Jul 2023 09:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 07/18] drm/bridge: analogix_dp: Convert to
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230707072034.48977-1-frank.li@vivo.com>
 <20230707072034.48977-7-frank.li@vivo.com>
Organization: Linaro Developer Services
In-Reply-To: <20230707072034.48977-7-frank.li@vivo.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07/2023 09:20, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index df9370e0ff23..c6b228f1ed4c 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1686,7 +1686,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct analogix_dp_device *dp;
> -	struct resource *res;
>   	unsigned int irq_flags;
>   	int ret;
>   
> @@ -1740,9 +1739,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   
>   	clk_prepare_enable(dp->clock);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
> +	dp->reg_base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(dp->reg_base)) {
>   		ret = PTR_ERR(dp->reg_base);
>   		goto err_disable_clk;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
