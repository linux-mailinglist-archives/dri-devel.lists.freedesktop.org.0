Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1427F5BDFAA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCE310E3A3;
	Tue, 20 Sep 2022 08:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE4C10E392
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 08:17:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c11so2917901wrp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 01:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date;
 bh=l9gtbM2uto1x5bgL0a0otnawkJGJbySIPkwXwU+/1Sg=;
 b=g0l7m7UeOdhQ1PnCBXbxUamAfihljV9V2FnQje6nfTZog1OMNhC8oL2nO8DhxAHrdz
 R5tjgOGSyumGkF1pwo5z9ZhIt6dtb8075rVEd0oApEB71LEbSqSUTlsR+EYRxDVa3Lu8
 O+M8MmsB1I9X2KmauJ8B5tR6kOAf5niG8lHh5Je0byFx2N6cYQQqgVnAETPrQm822657
 YCcAnFbL9A6L59hlZ4tsyqYSyzTIcsC5bqU+4Hl6WMx9QJcCoacg34iA3YmNAviHMt2M
 G3tn/H27cfKd2XR8nEMg2hGrsCRaySYxd8kgkvHDc8Y2YLYU+EuDxVMvRszMbjSiW2gX
 nLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=l9gtbM2uto1x5bgL0a0otnawkJGJbySIPkwXwU+/1Sg=;
 b=wbIZaAISfNqA0kH7sxtLZzuR1UgcWxc5ipZP0SgmqfbXaRbUhM/s0LGLUxqcrx+BjE
 sai+kDhGNILbz21P4yV0K4fubcVBmbeXJ+1W2qUa0Z3RtHLQXg8x0ZR8srYD5+MrU9SN
 agmgnhh8gxT9ZGrtLnbi6vtqnvM7WLWA0j4N/gMO5149uUxuHYvHCQLnnKoKx1dCtKmw
 O6v5b3mzCR1MEflYiYCiWG2vxYFRXxKQ4z0SvlusSm7GCP4bo2dObAVnbDKNF2rt0JCZ
 ZJ8DmnBqs8RnXqAn3SSEMh5Dl09I1+/7M2QnWK3oSUutqK5JtITEBvtF7BLDnBA31h07
 v+AA==
X-Gm-Message-State: ACrzQf2FUfGzbUEu1XpA4yVWWIm5POwO/dDtV+Gdtc+vNmBQ2yzzA0Nb
 venh0nizgMsG0J3KZmz2z2otOQ==
X-Google-Smtp-Source: AMsMyM7tatwTKzU25uwqfUSidVRXEueFyIejARipSVNwx7OXnQPpPmj88gcBjqsYA2tRb+GzRzL8Iw==
X-Received: by 2002:adf:9b97:0:b0:22a:e61a:4b0c with SMTP id
 d23-20020adf9b97000000b0022ae61a4b0cmr10134280wrc.290.1663661859773; 
 Tue, 20 Sep 2022 01:17:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e?
 ([2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e])
 by smtp.gmail.com with ESMTPSA id
 bx9-20020a5d5b09000000b00228d183f9c2sm973130wrb.89.2022.09.20.01.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 01:17:39 -0700 (PDT)
Message-ID: <4aa7744a-f002-9029-d50d-bae43c051559@linaro.org>
Date: Tue, 20 Sep 2022 10:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: bridge/dw-hdmi-ahb-audio: use strscpy() is more
 robust and safer
Content-Language: en-US
To: cgel.zte@gmail.com, andrzej.hajda@intel.com
References: <20220919030401.211331-1-chi.minghao@zte.com.cn>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
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
Cc: dri-devel@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
