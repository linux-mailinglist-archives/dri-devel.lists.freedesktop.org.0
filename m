Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB24704661
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A50610E316;
	Tue, 16 May 2023 07:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A1710E316
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:28:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so75328615e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684222119; x=1686814119;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5Ojo8Lo8R8XK8o8hGTtw1jHEFL4HUoJLCCoc9AkFSnY=;
 b=v12KTHKxQx7EnacdOQpBFL+2hIuhtbpaBbjxbrtAe+ChJ5RR3t3q0K8xFdWFrO2Bd7
 qooSrpWB9G2Ay9YQPq7IS4vmR0bX1XLPQjghM3T6aYnncg+D0zWmt+d2TDo4FfKj5MBf
 FyP908dAJUBDgGUS8uSLj5WxFzkvp/qPmFpc4GucM8e1KTSP2xmdpaabCHaotXD1KWRZ
 ctxP24JPGrwkbvnDIPGSWK5Ua/JfgxJc4BddTj6rIgT7JMdwShv7+2vM9u/GEXh9b8K6
 gd2hbwSItIRpK6VFJN2wCWENQACqqel/Q4M9gccQh1uaM3ILrYQjuLQGa7pZwq5NDN9p
 x3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684222119; x=1686814119;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Ojo8Lo8R8XK8o8hGTtw1jHEFL4HUoJLCCoc9AkFSnY=;
 b=JWAAK7NOkV7ZSBjQvbmAsYoo9yAm48j8TKFctoTfd2Z1nLbd7gMZZLRK1p56FmRdzB
 WDlhN2goNHfkNPeWCKMDmZ3Z8OCK85hScv2teVrZS9FwGS4YxMmscmk9i/zn73zqN2Fx
 cdQapTFT+Z7HTGeptML3QXOyshzrjqUWVnFW70VBL5mhHMNwS6obA0COCZGMOAP69RwA
 19dPKR0AKPN00OPNfiocs5erueWUpAP7kz066/corSBhYsHVepZtVB8RtRXF/n+UwOmC
 dvr9AOa4fFEHVgEWqXrAMhYmzD8EjFCCGV1A7n+mHbB/jPnlB79G3OzpoYs4SW6yAJMK
 bgGQ==
X-Gm-Message-State: AC+VfDxOLA7mkq6zSzKeV5Dy8Ykk4e1I7Bk3ZhiOAn7pgQ9HD1YAzWlm
 /XLw5VWlYoHbMPVxpFpuYR0HPg==
X-Google-Smtp-Source: ACHHUZ42qX1J7JrLjIhLZuo1JUdK8Gbwanywl8mt+dn28iE4LA33oZ6g2EXTVXGGEh0KZWJM0LufwA==
X-Received: by 2002:a1c:4b16:0:b0:3f4:fc5e:fbf2 with SMTP id
 y22-20020a1c4b16000000b003f4fc5efbf2mr7168144wma.8.1684222118984; 
 Tue, 16 May 2023 00:28:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d4527000000b00307c46f4f08sm1533771wra.79.2023.05.16.00.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:28:38 -0700 (PDT)
Message-ID: <4cb44d8c-eff9-33a5-7488-d79963806a91@linaro.org>
Date: Tue, 16 May 2023 09:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] gpu: drm: bridge: No need to set device_driver owner
Content-Language: en-US
To: Anup Sharma <anupnewsmail@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <ZF9igb/nvL6GRBsq@yoga>
Organization: Linaro Developer Services
In-Reply-To: <ZF9igb/nvL6GRBsq@yoga>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/05/2023 12:12, Anup Sharma wrote:
> There is no need to exclusively set the .owner member of the struct
> device_driver when defining the platform_driver struct. The Linux core
> takes care of setting the .owner member as part of the call to
> module_platform_driver() helper function.
> 
> Issue identified using the platform_no_drv_owner.cocci Coccinelle
> semantic patch as:
> drivers/gpu/drm/bridge/samsung-dsim.c:1957:6-11: No need to set .owner here.
> The core will do it.
> 
> No functional changes are intended.
> 
> Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index e0a402a85787..10dc3315e69e 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1954,7 +1954,6 @@ static struct platform_driver samsung_dsim_driver = {
>   	.remove = samsung_dsim_remove,
>   	.driver = {
>   		   .name = "samsung-dsim",
> -		   .owner = THIS_MODULE,
>   		   .pm = &samsung_dsim_pm_ops,
>   		   .of_match_table = samsung_dsim_of_match,
>   	},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
