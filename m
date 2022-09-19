Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A96645BC4D3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 10:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C3510E57C;
	Mon, 19 Sep 2022 08:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E11210E57C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 08:58:19 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id cc5so36580907wrb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=v7YvGusii2VWZOurmgvHPkAuYpvgY/iuHE+RqeSdYqI=;
 b=GJoLxPx811a04N6H2o44fP5LKcu2VG0CzmzazXzZSGTadhR9XsLH4GG6p4I7ICwzbR
 uY28MGejpO8x9ub1f9YpHFTl1vxaIm0LHikJECh5HQVbRnjFZjuFpJz6Qiz7MpUKLtE2
 xh+rPO5AN6ZLz43A41JBhwtpqUISY4MYpafWGRQxctK70+P/x6A0lJTW6qTTTrfsAhBv
 jllrkeoZJ559SJ5R5flPL3AvlQwURKjPgkxxUw6Zs7g91bDdjBBZWZJIU8dUQd0Hw7PI
 01ZRlV45+Khappbww9ibR7pTcj0OmktzAM8LwKJp40FXz5P/rKvMcLyqJVuuYI947xY7
 0pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=v7YvGusii2VWZOurmgvHPkAuYpvgY/iuHE+RqeSdYqI=;
 b=6pQMfGa5tkNux79fqNbQX+pgVxYmKt8HbCCfoBlFau2qTdh7B4hqPsVmpJK4tKYjAP
 iutyxQOdlXqhCTkiAIWeZz7gvaOmpIM7g6CnkS+Z0Ggp8Yq6C4xgrcUk/HWsDbkMqdCS
 bhSZBVM+LMLjQVkP58hs68zBQ/3/GRmmlK4PLW0ukYKWkSc8Qj1cPRTyAkHDwq3p9p0x
 HfWSHVCbPoWmqLYinlvuGqRAv1ezVZCEkiOPTBwjQ8DgYzIRk2CX8cxLeN8guQSmGult
 0Qaqf+0YwKs9jLDdXVcWETx2CR5/bS71grwj+0Agr76cG7mcRl4TRx6lQrvLf+90axwV
 fr3g==
X-Gm-Message-State: ACrzQf2H3C946Ba7v+GHCqVnDaHd4NTcwIZ39fdM2fT36T6MCRwPlKHe
 QBDaAX9UHOSe+24CTJlW+LrQtQ==
X-Google-Smtp-Source: AMsMyM4cww1aT+UyEi2mGQSWgBrXtd8K3pDPv0LQhtIrLRHZBUYk6cWyL8YyQ4KeV8LQa4h1u318XA==
X-Received: by 2002:a5d:6b09:0:b0:225:37cf:fb8b with SMTP id
 v9-20020a5d6b09000000b0022537cffb8bmr9996948wrw.179.1663577898020; 
 Mon, 19 Sep 2022 01:58:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f618:2ad3:3fb0:7965?
 ([2a01:e0a:982:cbb0:f618:2ad3:3fb0:7965])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfbb11000000b0022762b0e2a2sm13504272wrg.6.2022.09.19.01.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 01:58:17 -0700 (PDT)
Message-ID: <5aed4431-e99c-a3a1-1cc3-0f8a57e99827@linaro.org>
Date: Mon, 19 Sep 2022 10:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: bridge/dw-hdmi-ahb-audio: use strscpy() is more
 robust and safer
Content-Language: en-US
To: cgel.zte@gmail.com
References: <20220919030401.211331-1-chi.minghao@zte.com.cn>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20220919030401.211331-1-chi.minghao@zte.com.cn>
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
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 19/09/2022 05:04, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> The implementation of strscpy() is more robust and safer.
> 
> That's now the recommended way to copy NUL terminated strings.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> index 7d2ed0ed2fe2..4efb62bcdb63 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> @@ -542,8 +542,8 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> -	strlcpy(card->driver, DRIVER_NAME, sizeof(card->driver));
> -	strlcpy(card->shortname, "DW-HDMI", sizeof(card->shortname));
> +	strscpy(card->driver, DRIVER_NAME, sizeof(card->driver));
> +	strscpy(card->shortname, "DW-HDMI", sizeof(card->shortname));

Please keep using DRIVER_NAME in both lines.

>   	snprintf(card->longname, sizeof(card->longname),
>   		 "%s rev 0x%02x, irq %d", card->shortname, revision,
>   		 data->irq);
> @@ -561,7 +561,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
>   
>   	dw->pcm = pcm;
>   	pcm->private_data = dw;
> -	strlcpy(pcm->name, DRIVER_NAME, sizeof(pcm->name));
> +	strscpy(pcm->name, DRIVER_NAME, sizeof(pcm->name));
>   	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_dw_hdmi_ops);
>   
>   	/*

Thanks,
Neil
