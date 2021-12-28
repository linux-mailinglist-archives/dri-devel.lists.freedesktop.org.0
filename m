Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C3B480A94
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 15:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2604510F529;
	Tue, 28 Dec 2021 14:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D2E10F529
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 14:53:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q16so38862935wrg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=25qf0XUnbGHEj5vg+5G4WLH5F89cbHHWYGCIQ9dS1uY=;
 b=fxY3OcVQeu1QknWvAhC07wCcatiSI0pUUHId/HZzZ1pm8Mvt+9c4IniVsMFxvEQWXZ
 69nDOtXhTUKrYlXCEvKDPf6UkxV5L2F1r6iizH10fmZpGm00D91SHR+Iavb2yl20VAdx
 6ZhhNFYOfTirbi07w3gQPem7NLp22mSxtTthStSG6PsFBUdyJEAt7qOQFAMkH4LgQ5zc
 59UfcheyQdr3QXZmHe02a2JCtfL2nh8UO74GwrP3+f0JjuBXJLjY4yCv1Sei605sEvEF
 NhyAjzsLvaUai8dj6ugFs4kzoSCSMD5niHAM/vs8jnK2mbUKAob3VisluT05aI9KdOOz
 WCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=25qf0XUnbGHEj5vg+5G4WLH5F89cbHHWYGCIQ9dS1uY=;
 b=i+WBvcKdJdXBZbx1SohsxD+wUAJT/eJE7Nwx7k9LHbnRen66YMnFZxhwJz/f8fme9o
 1vyDwlsljzqV1rdT7CeQZeIBGpAScnLuJhEFX5Vs0rK4nGDLuGiOEaeDUgMOT9Yfu/bv
 NqneAfe0whEqLWxbMwZpD1PCFLmuuJ4qWnfH2zMzKmcgbtCzAUTl9KvqNGprHUIRt9dW
 mGdCejnHcnsKuju8Jmquifdei4gwmm0xrH4RP8VezQODZ0djO7QJwDruYBMswcGYVL1H
 7UdCqhDwFGctt42ugfsoMM/1twi9gO9pNwIIVgPewd3eLtE71YiDkUDetUD70kWtjhrQ
 gkrg==
X-Gm-Message-State: AOAM532MPn2QX/Q3Ii0CY2RcUlChnqOXJLqUOhp1YzSdrhFIRde4ZsUe
 5DB8OkCvcCtfGwVj5447Ulc=
X-Google-Smtp-Source: ABdhPJxHVFXemI/84jypP87JEPzJM3v8K0/yYjNa6T2mSJs3rhe4xR1SVFGvstCb2ymf1aisIUBVcw==
X-Received: by 2002:adf:f390:: with SMTP id m16mr16261571wro.589.1640703236599; 
 Tue, 28 Dec 2021 06:53:56 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id l26sm18003618wme.36.2021.12.28.06.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 06:53:56 -0800 (PST)
Message-ID: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
Date: Tue, 28 Dec 2021 15:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211228092527.29894-1-miles.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix unused-but-set variable warning
In-Reply-To: <20211228092527.29894-1-miles.chen@mediatek.com>
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
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28/12/2021 10:25, Miles Chen wrote:
> Fix unused-but-set variable warning:
> drivers/gpu/drm/mediatek/mtk_cec.c:85:6: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
> 

Actually we ignore the value passed to mtk_cec_mask. In case of
mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);


We are not setting CEC_32K_PDN. I wonder which side effect will it have to set 
that bit.

Anyway, if it's the right thing to do, we should add:

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")


Regards,
Matthias

> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index e9cef5c0c8f7..cdfa648910b2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -85,7 +85,7 @@ static void mtk_cec_mask(struct mtk_cec *cec, unsigned int offset,
>   	u32 tmp = readl(cec->regs + offset) & ~mask;
>   
>   	tmp |= val & mask;
> -	writel(val, cec->regs + offset);
> +	writel(tmp, cec->regs + offset);
>   }
>   
>   void mtk_cec_set_hpd_event(struct device *dev,
> 
