Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D3414E35
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 18:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BE06EC40;
	Wed, 22 Sep 2021 16:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4106EC40
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 16:35:46 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u18so8683882wrg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XdQgCWF+HbG2xPtwVWVByVbos5CxGYFvNsMZE3cxEp8=;
 b=JlrBGgWRjSNrAFP2UtKXrI5eKubObLSYQAXO9P1SFT661XJ0iXdB6D2OSKjk4o2BqK
 YnKVQavDm81Er7abThInPnhii2sd+fKmz4ReYpp+Hq4BZH4YzFsofaoZmd560yhWRsya
 xgZsW3wqrjwQ2iqf8kzkUMloY/u0Qxnm0uAhjE8R6zWizV6nEDAMjVAO078OktsG0X6n
 XSxw/eAZRj09tSUBKtFJHNVHCrjvCA6ooACft9G+tePoP2+1F0sdoN+q4K71GVNgdanc
 stBkDvSOcU8CnUFaPPFP5Cu9B+gCgCfFRlj9zmOsm0kN/j1iA031nRwnjCqIsVbldlKb
 s8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XdQgCWF+HbG2xPtwVWVByVbos5CxGYFvNsMZE3cxEp8=;
 b=dmWbut+yinoT4CCmQJFM4QQ6D3We+P5iotsLfVGMMBuESLXigF0PRl1arFqVsSzbIf
 HentfI6pALIyzyt7JBULHHdePSlzCoTDLQfSB7r/+rGsEv2HgTr17buGyL5nTwAr9rX2
 ERR4+noVHx79lp0+qlz9AFJuovcDGHmZ9xyoPaMdtEKb9oHNAxHrGqH6wZMBHuuo4tMX
 f3mDUgUu85sif1JF0mGDhEzy7CoEK8cJU9dulZAocUaMdlZ996QfsX/PeerA+9yPxAqA
 tBMj9rr8bVCmNuzNCXkIDzdQpLavAFuV6QqNwrYOO2hn4ST8tqg2oddq1QR4h84dfTU8
 kwjg==
X-Gm-Message-State: AOAM533kvxtgF81u/ylGDT5PedwfVPg3cgYnoWOk78IqUfNU/J4TWtUF
 EpiEsbXOMaCo3+g9enrfwg==
X-Google-Smtp-Source: ABdhPJwVxjQpNqvuAwLwUaVV8QWAF0/MVmZ7ssPoivZ0DMahLg1fiWqMHLnVwcAMUFpfKJhOcE3iYA==
X-Received: by 2002:adf:d084:: with SMTP id y4mr585418wrh.249.1632328544941;
 Wed, 22 Sep 2021 09:35:44 -0700 (PDT)
Received: from ?IPv6:2a02:810b:f40:4200:c404:3070:bbbd:746b?
 ([2a02:810b:f40:4200:c404:3070:bbbd:746b])
 by smtp.gmail.com with ESMTPSA id y11sm3261447wrg.18.2021.09.22.09.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 09:35:44 -0700 (PDT)
Subject: Re: [PATCH][next] drm/rockchip: Remove redundant assignment of
 pointer connector
To: Colin King <colin.king@canonical.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210922112416.182134-1-colin.king@canonical.com>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <27c79f7a-8e4c-fad8-c6cf-a89793f2e3c6@gmail.com>
Date: Wed, 22 Sep 2021 18:35:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922112416.182134-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi Colin,
Am 22.09.21 um 13:24 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer connector is being assigned a value that is never
> read, it is being updated immediately afterwards. The assignment
> is redundant and can be removed.

The pointer to the connector is used in rockchip_rgb_fini for 
drm_connector_cleanup.
It's pretty much the same for the encoder, btw.

Regards,

Alex
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_rgb.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> index 09be9678f2bd..18fb84068a64 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> @@ -150,7 +150,6 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
>   	if (ret)
>   		goto err_free_encoder;
>   
> -	connector = &rgb->connector;
>   	connector = drm_bridge_connector_init(rgb->drm_dev, encoder);
>   	if (IS_ERR(connector)) {
>   		DRM_DEV_ERROR(drm_dev->dev,
> 

