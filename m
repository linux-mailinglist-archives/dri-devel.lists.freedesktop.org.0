Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C756B6BABA7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B8F89343;
	Wed, 15 Mar 2023 09:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35FA89343
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:08:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r18so16614280wrx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678871303;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qSsckNSpK1c9n86p4aO+c/oJA0ycZxu7SJjrPE+HAQ8=;
 b=tmD+UjAkWr8b4XsqB22P78X5JUKvi1YiIAUkHzNKUDz9uIw8cl5dkhRRf1Q52iPRl+
 NpRzWkRVDz73h1W9Tsp4mwAXY0QStTNh1x0ueCYwTV010cngmmPZAhH37/5hJvYPIaO2
 yQ+7azjTlIF122DsaMci1HP0fY/hRzsiGfOju0Pn7gb1iRZjiOuCbjpYr3a/bRICH7+3
 rTkUFw73fmcrrsrueLMJLucDVk999FHjjZly8TbRJSlDd75zYikzavlRLGTzimDcdYQw
 VzfBiKbsQKFmkKVCkuSUVjlQHYkytLrcp5COcTm6Bgq/PBH9GcMFdtAFg5+zZpSe5I9j
 A8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871303;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qSsckNSpK1c9n86p4aO+c/oJA0ycZxu7SJjrPE+HAQ8=;
 b=TQdf29XXh7zPfizJzRuhmQLLW8lAEtHqgxfllaQ9zRogU2BSnAxACAcdFhucq90eGc
 oT2IzIAVS4wZ6/jX/Aj7IdB2dTTdl6yq5j8kPlpJfJsJAQtC7wIoH0jjlky+O3SBJMBw
 ujS5ZWvjX/ub0XcZllYqYw+xBolpRx0dVhxQrdf9Si+2kUmt8IWD26jT/4poZ89N5Dq4
 MNeXMjRZUV00k7qKhOdt0IoICORtoCI8i6NXYhaNTRHJDh8UexE+CN6IMSDu3tKXAdBh
 nhKJ3cDAbjN0UA4HpqoYttZi/lCdc4fQBtaN4sGjDw6hw5I2GGONd1z9oPNQcS7C3E+E
 U/JA==
X-Gm-Message-State: AO0yUKXiKZM3LkWOLrxldi1tafvqGG76sB+SFXRxGY/mK0s3F04M2O0h
 8KHFLI7NDH31t9yozE+zLCdWUw==
X-Google-Smtp-Source: AK7set/VD7eCD1LIq0xwBIFKZji2Qq6fk458HtzGpOXLjPiHI+9hyptBnXREbMtiE96CAt3f1xsd8A==
X-Received: by 2002:a5d:4985:0:b0:2cf:f140:52e3 with SMTP id
 r5-20020a5d4985000000b002cff14052e3mr1263706wrq.9.1678871303389; 
 Wed, 15 Mar 2023 02:08:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7?
 ([2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a5d550b000000b002bfd524255esm4121784wrv.43.2023.03.15.02.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 02:08:22 -0700 (PDT)
Message-ID: <d1eee7a0-8942-5f76-a3f0-74dcfddb95b5@linaro.org>
Date: Wed, 15 Mar 2023 10:08:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/bridge: adv7511: fix race condition bug in
 adv7511_remove due to unfinished work
To: Zheng Wang <zyytlz.wz@163.com>, dri-devel@lists.freedesktop.org
References: <20230308173433.2788833-1-zyytlz.wz@163.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230308173433.2788833-1-zyytlz.wz@163.com>
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
Cc: alex000young@gmail.com, andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
 1395428693sheep@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 08/03/2023 18:34, Zheng Wang wrote:
> In adv7511_probe, adv7511->hpd_work is bound with adv7511_hpd_work.
> If we call adv7511_remove with a unfinished work. There may be a
> race condition where bridge->hpd_mutex was destroyed by
> drm_bridge_remove and used in adv7511_hpd_work in drm_bridge_hpd_notify.
> 
> Fix it by canceling the work before cleanup in adv7511_remove.
> 

Can you add the relevant Fixes tag ?

Thanks,
Neil

> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index ddceafa7b637..9bf72dd6c1d3 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1349,6 +1349,7 @@ static void adv7511_remove(struct i2c_client *i2c)
>   {
>   	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
>   
> +	cancel_work_sync(&adv7511->hpd_work);
>   	adv7511_uninit_regulators(adv7511);
>   
>   	drm_bridge_remove(&adv7511->bridge);

