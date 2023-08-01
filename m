Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EBD76AE4C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8161A10E321;
	Tue,  1 Aug 2023 09:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A7510E321
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 09:37:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31765792c7cso5679086f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690882659; x=1691487459;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KPQo2Sh4IXaPrcdWyouCsvWXkycrqlPg24jNznzZZU8=;
 b=xPrZ0QsT+UCwbOrRmQ1iTIgW5yLAxZGGQqiow0SZZkONajlepMLeQGKf+pUxiUVpni
 KPaXzaJpC85Lp8y3d1XsgoRj9+8WuvMQV9q1yMgrqGsFjlg8ivD+Pl3Q97MZQKakSd23
 swWMMlKChNDlsbz8BTs96LibCclG20GI8kLt793fFNTbVeHQKp+Y6vq/rigZ92gZwktV
 jdnOJU7RmWicqqlovnGi2z5Nvcom6MPsZrFYRGgsKfFFrEWVkHuvm9veLdSZaJqvyWzG
 LnP3Yyc8mzEObLF17JiS/jyqK+RwPdm4zVmxzvoZ5ws04ay7y9PN0H38KB3dNKkoQfLF
 vt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690882659; x=1691487459;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KPQo2Sh4IXaPrcdWyouCsvWXkycrqlPg24jNznzZZU8=;
 b=ebzCRu7IbCS3htmcdiBN78xWjnU6CNTm8AHdhyKMt3X/wZ08HuBzYJU1D/P0KOAqg/
 tDVY314bqs7B9FKWjihLesYREQhD+JdFCtvUvMd9x3vAv/gXXqafgazWVrfBniar59cu
 JBKxCQlq5n9mRG2P7ezIqaZuRWLK7q8TgeRldiqgGHaBwsdv5/X6XOAP5EMvspZaZb8B
 SM3GaKMtGap3b8aVc0TPZ37zGaYnEBHxg4wX1vsdvWvFVmpGwfs/gKuD5lEeswR6hEiL
 F3AIx+yvgtBrZTEo8NniNOlmOGaQ7wFoENFeSG/QexeOcxcbTQPiWHlUKvLdU2orUbVH
 EKug==
X-Gm-Message-State: ABy/qLbigGxGn/I0ZsFzGrW0fiNw0MNa1T0DswsjxpJGhmvejhsYmv4a
 bH6ud5cLaPw+DIBDanwsWfFtQA==
X-Google-Smtp-Source: APBJJlFbgnS1mG8QzPSLJ4CJ7E9E15Yo2VWKgpnJaJ46srodTeo/zkoTU+shqPjT/ZJ26C2M++xkdw==
X-Received: by 2002:adf:ef8c:0:b0:317:62c3:13a7 with SMTP id
 d12-20020adfef8c000000b0031762c313a7mr1916263wro.19.1690882659482; 
 Tue, 01 Aug 2023 02:37:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3?
 ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d6b85000000b0031455482d1fsm1771236wrx.47.2023.08.01.02.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 02:37:39 -0700 (PDT)
Message-ID: <eb2b978d-cebb-b865-150d-8291ab5ab134@linaro.org>
Date: Tue, 1 Aug 2023 11:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: it6505: Check power state with
 it6505->powered in IRQ handler
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230727100131.2338127-1-treapking@chromium.org>
Organization: Linaro Developer Services
In-Reply-To: <20230727100131.2338127-1-treapking@chromium.org>
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

On 27/07/2023 12:01, Pin-yen Lin wrote:
> On system resume, the driver might call it6505_poweron directly if the
> runtime PM hasn't been enabled. In such case, pm_runtime_get_if_in_use
> will always return 0 because dev->power.runtime_status stays at
> RPM_SUSPENDED, and the IRQ will never be handled.
> 
> Use it6505->powered from the driver struct fixes this because it always
> gets updated when it6505_poweron is called.
> 
> Fixes: 5eb9a4314053 ("drm/bridge: it6505: Guard bridge power in IRQ handler")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
>   drivers/gpu/drm/bridge/ite-it6505.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 6c2fcd8b8780..2f300f5ca051 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2517,9 +2517,11 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>   	};
>   	int int_status[3], i;
>   
> -	if (it6505->enable_drv_hold || pm_runtime_get_if_in_use(dev) <= 0)
> +	if (it6505->enable_drv_hold || !it6505->powered)
>   		return IRQ_HANDLED;
>   
> +	pm_runtime_get_sync(dev);
> +
>   	int_status[0] = it6505_read(it6505, INT_STATUS_01);
>   	int_status[1] = it6505_read(it6505, INT_STATUS_02);
>   	int_status[2] = it6505_read(it6505, INT_STATUS_03);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
