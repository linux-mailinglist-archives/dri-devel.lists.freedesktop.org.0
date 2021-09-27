Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8BC419E52
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 20:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FA689CE2;
	Mon, 27 Sep 2021 18:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D6089CE2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 18:31:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y28so81013482lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sWmqXMuBrucuIeakdjz9BORDR3vl7TbPCCWtbIs4HsQ=;
 b=qjbC3u4RvCRjqFP+IDqxbgDTZaId2dnGKxvHO5eeQyWsVWmbTQgLobqt/yAW+X0Ghn
 TajScg8JESA1H9S0+15RKB5n7gRpugUil1yVkZq4UgQ+xy0Qj9AZMUq6zZxddGPVytJq
 IZy+3rPID0+L31UtMNINPPx2F23HLf/jyda0MJC0n7LuSYyNEMpiorCUS0TEQ23RWqI3
 w8429B3XLM9pWb04fMen5yT1exU9mylBuRTgu3lcJ77hw/xQrnfEd3ROZlJ07IWaB6Xl
 0SqwaE3zB/KMh1AtJ4SNjbQAHhtG/rZVLoQ3EiTvD89/sgpZhe6hOWY6KTUQ62r4auFM
 xCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sWmqXMuBrucuIeakdjz9BORDR3vl7TbPCCWtbIs4HsQ=;
 b=SOZ4JW/ec6AWHQqYJJEWCzS0WjAAFhvi0eKDrWryKwE1Jr2s9/Q4kQAj+ziPlORI+I
 m9BzGvyKnUTH2FceUXdGogRi0ADJidQJE0OOWaOTV2YHdn4PhYAbuQNJ2G2ommW2JJ7z
 G5ZrGz5caQAx22Gd8eB8qJYMOMTb2Bly2nIKa/KwFxCENMQmv/cF2exc8ha1RYdsYPvI
 8JkJ2i8Is7b2R0alNz53VkpTkBa/8/xBVaCSAiM9QwhNOAQ6fvDtU1Twd0YECmzCSZFZ
 /Px+RqjRiK7xOEg8OXkkS4cw19NF6m+D9utk67LQpczbBL4YadLITZClJZi5vG+hBvIk
 NATA==
X-Gm-Message-State: AOAM533IHyILRyGC12isLBsVy+oA1HJiqjIS8RU+vgZW+DzDTWFBeijq
 UARuMOni3wu/F1KjUTQK62REXg==
X-Google-Smtp-Source: ABdhPJxwP05zdXBtU+0jDLh//7TLDHEPrVzDS70hOgJcCU4U2k6vSzc2JXdGoSf1+lT+28xAXHp4VQ==
X-Received: by 2002:a2e:bf1a:: with SMTP id c26mr1442559ljr.88.1632767476760; 
 Mon, 27 Sep 2021 11:31:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id r22sm2080554lji.5.2021.09.27.11.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 11:31:16 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge/lontium-lt9611uxc: fix provided connector
 suport
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20210708230329.395976-1-dmitry.baryshkov@linaro.org>
Message-ID: <e793810b-5e45-693f-8d72-b20e85b78f61@linaro.org>
Date: Mon, 27 Sep 2021 21:31:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210708230329.395976-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/07/2021 02:03, Dmitry Baryshkov wrote:
> - set DRM_CONNECTOR_POLL_HPD as the connector will generate hotplug
>    events on its own
> 
> - do not call drm_kms_helper_hotplug_event() unless mode_config.funcs
>    pointer is not NULL to remove possible kernel oops.
> 
> Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Gracious ping for review. It would be really nice to get this patch into 
5.16


>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 3cac16db970f..010657ea7af7 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -167,9 +167,10 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
>   	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
>   	bool connected;
>   
> -	if (lt9611uxc->connector.dev)
> -		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> -	else {
> +	if (lt9611uxc->connector.dev) {
> +		if (lt9611uxc->connector.dev->mode_config.funcs)
> +			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> +	} else {
>   
>   		mutex_lock(&lt9611uxc->ocm_lock);
>   		connected = lt9611uxc->hdmi_connected;
> @@ -339,6 +340,8 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
>   		return -ENODEV;
>   	}
>   
> +	lt9611uxc->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +
>   	drm_connector_helper_add(&lt9611uxc->connector,
>   				 &lt9611uxc_bridge_connector_helper_funcs);
>   	ret = drm_connector_init(bridge->dev, &lt9611uxc->connector,
> 


-- 
With best wishes
Dmitry
