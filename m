Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D776F531E
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 10:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6A810E1E1;
	Wed,  3 May 2023 08:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BAD10E1F5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 08:26:46 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8ad872ea5so49426961fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683102404; x=1685694404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQnrm2QW4A/lP09UQBsC/buiW1QQXts5oTWTDd0Iapk=;
 b=lDzxex/N/6+1jPEwsRwpTbE7kdGx+/+N/+gXGXx6vSL+UVNr6oeMm21UfdIDBbZZIT
 KqQ365QFrR0ZtxGfp/u51BE3IQ7E7PZJ3VNbtqf0HMqFGnhA2j7r2Upb3xzEEavEcY8C
 qUVTvNDN+DhLtvos/3KCh88DWtiLzmtoeV6MEgKrprb1OJlLCTpqlqxSGhTuB3UamZNE
 l4azF/2/ASmLaEugvQPebmvn8g5HEhkMJaaYNgEceStBUD2suc+xPV1sT4C1+o1ZyIqu
 dFd/mwyT2OqSm3TdCEcyY6gal0OzuIsOvWm1Sd+MwsEG6fYjQgU33UNRIy0rNlnPckBf
 P88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683102404; x=1685694404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQnrm2QW4A/lP09UQBsC/buiW1QQXts5oTWTDd0Iapk=;
 b=jvOcXJDm5Ps0INN1rPhY0K3pw3x+H5DaCwKc9crBQ+Fm+AM3kbJjoCNniICdKeTyTW
 P+36CQwsf5HuzF1pqd9skbnAMifjiGwJ8y+3Lvs1mMheoRfIBe6oJaGd/ruzjPAL8soV
 bpzxVBme9feS/coug/LU6/9fduF8N7sHbzx7lR+B0iGCA9ZBqDzpkozT0aaAFhIgZpw2
 BCHYdCyH5ybYvUMKxh2pqTQ9uqYsd24c6Ofoc4hhG7kvRXHunDsoUeJuBw/cunBgD9ne
 9wYBgDgJYJsFquwIgAZEWU0i0eCqRNgj+D7L4jh3rScO04cc3utBq3eLnh2Oxor4CF2z
 qh+A==
X-Gm-Message-State: AC+VfDz1HVyXICVatcw7bFbueWPhNRvnLg4tL8wGu8gpQk167klciqb0
 sqeK3SMaUvRSNF7uXLHkCqi0bQ==
X-Google-Smtp-Source: ACHHUZ5I/B8/b7dNYVIEYJghFgcOuzDA4b8h+9I+HVutFLfzrBZ8gqF8yFrKzcjAPE9hprtWYeCNUQ==
X-Received: by 2002:ac2:420d:0:b0:4ef:f5fe:bc76 with SMTP id
 y13-20020ac2420d000000b004eff5febc76mr705187lfh.14.1683102404401; 
 Wed, 03 May 2023 01:26:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d14-20020ac2544e000000b004edc2a023ffsm5837150lfn.36.2023.05.03.01.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 01:26:43 -0700 (PDT)
Message-ID: <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
Date: Wed, 3 May 2023 11:26:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] drm/msm/dsi: Fix compressed word count calculation
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/05/2023 04:19, Jessica Zhang wrote:
> Currently, word count is calculated using slice_count. This is incorrect
> as downstream uses slice per packet, which is different from
> slice_count.
> 
> Slice count represents the number of soft slices per interface, and its
> value will not always match that of slice per packet. For example, it is
> possible to have cases where there are multiple soft slices per interface
> but the panel specifies only one slice per packet.
> 
> Thus, use the default value of one slice per packet and remove slice_count
> from the word count calculation.
> 
> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to compute word count")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 35c69dbe5f6f..b0d448ffb078 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		if (!msm_host->dsc)
>   			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>   		else
> -			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_count + 1;
> +			/*
> +			 * When DSC is enabled, WC = slice_chunk_size * slice_per_packet + 1.
> +			 * Currently, the driver only supports default value of slice_per_packet = 1
> +			 *
> +			 * TODO: Expand drm_panel struct to hold slice_per_packet info
> +			 *       and adjust DSC math to account for slice_per_packet.

slice_per_packet is not a part of the standard DSC, so I'm not sure how 
that can be implemented. And definitely we should not care about the 
drm_panel here. It should be either a part of drm_dsc_config, or 
mipi_dsi_device.

> +			 */
> +			wc = msm_host->dsc->slice_chunk_size + 1;
>   
>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>   			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> 

-- 
With best wishes
Dmitry

