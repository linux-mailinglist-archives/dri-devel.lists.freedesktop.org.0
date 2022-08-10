Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01EF58E99D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 11:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34FD9792D;
	Wed, 10 Aug 2022 09:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C9AB007C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:27:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id p10so17033711wru.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=mT089N7onTcg+vIMF08EGSOIVoZTcAniiKuFVXJvnRM=;
 b=minfTV7B81uIoFj6/EKAv2vrdaTFmcSTxljtYZhH9sfQYq2l/Scg5lsF4RQkGybUa5
 QgVgsSn5lzGzD7Qd8HCKCdx9HSC1w2j/n3HfAbbuVHtS0uS6dhzaimuREAcJo1NYFTe2
 qGH7Fs71M0BgEWKZKiNEaKQSHZTteflvAmh2K+AIQ4O1H+UZtEsbYw94m0AlKDtrAxd2
 vQ8yX+TcFi+E5Wi3lSB13cpvsLjsr1g5fk26RW+6J/1EV90ym8rV4QZkAKUbeE8GVOfv
 yAEvLW+LnLzOQgk42N9tFHkskyf+jZvmNlU7aDce2MMhrg2XiUz7tsMHhcdRVtdLx22i
 CnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=mT089N7onTcg+vIMF08EGSOIVoZTcAniiKuFVXJvnRM=;
 b=RhcUbZzHFmFcykkNOL46JmyZXPmr7KWRPeJia1dgPlSJQuHltlqNnSraJSMv8XCeUI
 RF0u/zI8ErtXpAg0uCOUAGzBjoj5D++Av4oFljwgiSM2ErhF9pR5HcA0LEKVbdjsZjj4
 tqixhY2YnDIndPeW/HjMrlKB/QUJiM7YeX/NVTB+5czUExIjyPDjwnUO9B9laKj2l6D1
 vqy67C8V7kKlgsHFzdiXEbuCiI2+sat0SSGfUdgQH/CSGZM8vwpOuaUhq03eXnG75BId
 H8AH0sC5OCTtWJJTjVQKFgNUaU9zJFfxiboQDfwVgsAxPFLU7/1EI0TV/yV5yZWNfIj0
 pbjg==
X-Gm-Message-State: ACgBeo3Ol06mLPpN/AJ4TaB4eFI5kJmqNOZKap0lcthSpAWitHH88SVx
 sU0PygMNEwAFGnR8nhjG4DIWfiG/oaSAkw==
X-Google-Smtp-Source: AA6agR5fd8ms8GYechol1aJdsyQj2DMMIv+Bgb7ERUq85TbJNrLCOQJvlQj+jENlfr6C8HPNushK3w==
X-Received: by 2002:a5d:4fcc:0:b0:21f:dd9:df09 with SMTP id
 h12-20020a5d4fcc000000b0021f0dd9df09mr17417051wrw.294.1660123635185; 
 Wed, 10 Aug 2022 02:27:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bbf0:b69d:fecb:8006?
 ([2a01:e0a:982:cbb0:bbf0:b69d:fecb:8006])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b003a325bd8517sm2457869wmq.5.2022.08.10.02.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 02:27:14 -0700 (PDT)
Message-ID: <59e76231-9c67-eb53-a84c-4d4d3f4341e0@baylibre.com>
Date: Wed, 10 Aug 2022 11:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/bridge: lvds-codec: Fix error checking of
 drm_of_lvds_get_data_mapping()
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20220801125419.167562-1-marex@denx.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220801125419.167562-1-marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/08/2022 14:54, Marek Vasut wrote:
> The drm_of_lvds_get_data_mapping() returns either negative value on
> error or MEDIA_BUS_FMT_* otherwise. The check for 'ret' would also
> catch the positive case of MEDIA_BUS_FMT_* and lead to probe failure
> every time 'data-mapping' DT property is specified.
> 
> Fixes: 7c4dd0a266527 ("drm: of: Add drm_of_lvds_get_data_mapping")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/bridge/lvds-codec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index 702ea803a743c..39e7004de7200 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -180,7 +180,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>   		of_node_put(bus_node);
>   		if (ret == -ENODEV) {
>   			dev_warn(dev, "missing 'data-mapping' DT property\n");
> -		} else if (ret) {
> +		} else if (ret < 0) {
>   			dev_err(dev, "invalid 'data-mapping' DT property\n");
>   			return ret;
>   		} else {

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
