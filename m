Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01A95B9F46
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 18:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5889B10E1E5;
	Thu, 15 Sep 2022 16:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1832A10E1FE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 16:00:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bq9so31591457wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=NtZaXYBrw/AG5wK2lscAo5IyphXo0G6cr0DhN47TYmY=;
 b=C8YIcEmdhu28gVUvnH9/7QZ1fFt9ne2TkutofZr7UtX09EouEEFHqGLZpin0xm5b30
 UwDiR7c+2NvxU4w5mt/fmWN6V8pklnwQx6b/skixsAAz5e1HZm+2TsQIwmsoObcbec+d
 iEhOwBTEhyRUnnpFnmwZ2Dj9gJf19d7wzVFfVgCcysmS2/qRAiQTTtbUis2VqjD7KzTU
 N40F/6pAb+tsxoDDrm6pGhAc5/gH8poH2LVE4mlkZZCItAdLO2WB5yuR2bTXdWb/+Aj7
 Gh2N6wDQ3LZnexSGKqt6yI5LYVBZVWgEXOk+/hBYeGPqrLkVq1+BYq+/HyVNEcLM2eFQ
 2NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NtZaXYBrw/AG5wK2lscAo5IyphXo0G6cr0DhN47TYmY=;
 b=FTCYnzSYG0aZlX8OwrxwypsyoNDB0ZPtreuzgkWBxpFFMjy077N4/GXL8JKfVNQL42
 yod6doXzwk3LhK3pP7c35Wgs00dDrZRqb7ajM033lfYbJaU8RMwL5OS9WbYN3VwBT1CB
 fCH8qVtWa8b4EiVYQuMbGZvXpQK/qg088OOI/GJOApn89TdhRWsfA5PshD//sOnssVLw
 S4OVbTP/FrjAHY3xLVeEIc/CU8sE0yiYceIi+7JKFbdAVxOAZn8Q9TCc7Jj9RZDk0ant
 nExZhqy1+XkpLFZQ51evEwibZ2fAe9KNBT+6xOy/ePTu9VSs43j403JViG730FpcUrm7
 T2iw==
X-Gm-Message-State: ACrzQf1EWmS6jMg4bgNkhulCoz3VkxAMDlrtcMbA+yz+n7nm6+cTXQEt
 DhMHbXqc6WIbKLRxrxNUHxU=
X-Google-Smtp-Source: AMsMyM6OQEeLXkxWzioaolT5lZWFXDRwM7L61hQ16+IEMxL+6+zAMajEyf1Uk2/9wt56xCnf8m1PNA==
X-Received: by 2002:adf:d1e8:0:b0:22a:c131:4c49 with SMTP id
 g8-20020adfd1e8000000b0022ac1314c49mr211925wrd.647.1663257615219; 
 Thu, 15 Sep 2022 09:00:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adfdb02000000b002253fd19a6asm3647717wri.18.2022.09.15.09.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 09:00:14 -0700 (PDT)
Message-ID: <fbf403c5-55c3-d73f-f46c-5d4bf9283984@gmail.com>
Date: Thu, 15 Sep 2022 18:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/3] drm/mediatek: dp: Fix warning in mtk_dp_video_mute()
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
 <20220915075028.644-4-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220915075028.644-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/09/2022 09:50, Bo-Chen Chen wrote:
> Warning:
> ../drivers/gpu/drm/mediatek/mtk_dp.c: In function ‘mtk_dp_video_mute’:
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:23: warning: format ‘%x’
> expects argument of type ‘unsigned int’, but argument 4 has type ‘long
> unsigned int’ [-Wformat=]
>    947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
>        |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/dev_printk.h:129:27: note: in definition of macro ‘dev_printk’
>    129 |   _dev_printk(level, dev, fmt, ##__VA_ARGS__);  \
>        |                           ^~~
> ../include/linux/dev_printk.h:163:31: note: in expansion of macro ‘dev_fmt’
>    163 |   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>        |                               ^~~~~~~
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:2: note: in expansion of
> macro ‘dev_dbg’
>    947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
>        |  ^~~~~~~
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:36: note: format string is defined here
>    947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
>        |                                   ~^
>        |                                    |
>        |                                    unsigned int
>        |                                   %lx
> 
> To fix this issue, we use %s to replace 0x%x.
> 
> Reported-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index c72c646e25e9..d58e98b2f83a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1222,8 +1222,8 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
>   		      mtk_dp->data->smc_cmd, enable,
>   		      0, 0, 0, 0, 0, &res);
>   
> -	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
> -		mtk_dp->data->smc_cmd, enable, res.a0, res.a1);
> +	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: %s, ret: 0x%lx-0x%lx\n",
> +		mtk_dp->data->smc_cmd, enable ? "enable" : "disable", res.a0, res.a1);
>   }
>   
>   static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
