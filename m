Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465BF74ABE6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A25510E516;
	Fri,  7 Jul 2023 07:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6249310E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:27:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-314319c0d3eso1585256f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 00:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688714854; x=1691306854;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=V6/TmvtoicuV2apOBPHtZufSiXvw1S4gApp22mcNi6U=;
 b=XyvzBlFnBIOWefRp007o8pmr8u8XYuh/QVE9r4HkFTAAwWtvXmG3TX/x15HRpiQHO7
 kkg75ZXUds2jBbqil8ddysVwrsH/OdIVdAOOQh85teh5KSqIxaknMlAFbEy+oudFEnty
 Ks7VWTz4ic2Bq1KDSW3ApfNoTwt4tYVbFZaaK5C1XfrfXIsiDuqVKCkYTyjr4K/gbGI2
 cKvnmPz+eQyils3bchYxE68Wf7nsn4pMaV1JBtj22m8XbYHonAoUn/iwBLxE4lydntsw
 3cLgc8N0tLhCnVrp6PYLzYHgMutvZRqVgykv7hTo/RQU5TIsV8uZ6Nddm5aVztUnYYFv
 whmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688714854; x=1691306854;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V6/TmvtoicuV2apOBPHtZufSiXvw1S4gApp22mcNi6U=;
 b=bpci/StVkkpRu6YZ6ib8eYL5J9suNFJ6hJ+mGHb0YeZzmSBSvVgd+oiXA6Bn8K/PcZ
 pIvAp4kBHxZwI5OIPqVMRVxbpT6Ym9Jw+16+v8WIhbwjIhIOmLfmoJORgu3ac0XYs4F3
 OL+279lj0c2X4SGF1QVq57lb5qjHuG8AIJn+FOuK482F5lwua7L9qMJPi+VrKWYEdJ9x
 ZizgiSE4fI8BzCs/Or6WXniydcfOlr/h4jC6O4/fWYeFNr2QrRDKqDSlBnkKO43iwxtm
 AfMVAdXPpBQOg/6O0ZDcXBksZpXbZlKDlD6up/g496mylWMlV53vmq48H/IYut8XfHnh
 yt8A==
X-Gm-Message-State: ABy/qLbSA71Pz8wsLjNsCmFdF+IUZspDTl/ZTxSmY+OQhtkgKO9cfQqz
 qdWQCmiKzCzu3VSgqPyyetF/rgzWSS9Lkt8Bq4ozy2JB
X-Google-Smtp-Source: APBJJlGZN7kAXBI0my9y3hTT0kqV5/03t70IF0sl2M02nL+hdZFtQm8jYwkkU3qiO3T+oA3tYnNQlA==
X-Received: by 2002:a05:6000:4e4:b0:313:f61c:42ab with SMTP id
 cr4-20020a05600004e400b00313f61c42abmr3457106wrb.56.1688714854622; 
 Fri, 07 Jul 2023 00:27:34 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a5d5683000000b0030ae499da59sm3700320wrv.111.2023.07.07.00.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 00:27:34 -0700 (PDT)
Message-ID: <9c777340-5e3a-0d8e-87b5-ab535f17544b@linaro.org>
Date: Fri, 7 Jul 2023 09:27:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 06/18] drm: bridge: dw_hdmi: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230707072034.48977-1-frank.li@vivo.com>
 <20230707072034.48977-6-frank.li@vivo.com>
Organization: Linaro Developer Services
In-Reply-To: <20230707072034.48977-6-frank.li@vivo.com>
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
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 7b66f362afd8..b2b320ba2196 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3417,8 +3417,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   			return ERR_PTR(-EINVAL);
>   		}
>   
> -		iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -		hdmi->regs = devm_ioremap_resource(dev, iores);
> +		hdmi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &iores);
>   		if (IS_ERR(hdmi->regs)) {
>   			ret = PTR_ERR(hdmi->regs);
>   			goto err_res;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
