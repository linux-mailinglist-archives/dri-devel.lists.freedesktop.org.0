Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD75F8DB5
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 21:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75BA10E081;
	Sun,  9 Oct 2022 19:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACB210E081
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 19:24:39 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id bn8so11160769ljb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d8Zf3BsxO45m3r/45zObKvChnR3gfGHDc8wwHfVB+mM=;
 b=Jo9FydsSo3KFqrMCPz1dJsMMf24LFsWe5cCzzTzQDbtFmRMvq1lX56myj+xDLnPLlF
 MUZEZXHctCl7yP//dIcPizkSs76q1iHU4aukA2TogMY3zvIRIq+1xArPgUZJmPnoZakX
 LONOD0jWD0X5Reod3urH0E05Jc9rfxhqydw6tF0uK5uBZfJwq+JbzDj1ko9Tj2KYuC/F
 eDzeaeOvFbzXGHrpkZbSAk4tcmLAJA8NkWeCWXng7V0+uF27JUMKsA3OqAgISqFLQZ2Z
 NoJf2V0YtA6NHTE1ecsbqEfwzX6xO7J+kQs0rkCMMxT5G0u1Xb+n+upE+Y8JpHswZ1mP
 BvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d8Zf3BsxO45m3r/45zObKvChnR3gfGHDc8wwHfVB+mM=;
 b=JcCouMkVbVVIxZWR8IlFexj1cXAFOHOOVeb1Tiv/tDfanN060hGrKGpjLUvEMaLAzA
 VGyxuLWWnwxiuII6fyUG+QO9L3GmavpEjvgRlSTKfG4FNVBx+x+HZKSvdHdqUGmmNcBB
 UBZf8NpQwt+50B9VoLEHRwKi2eaRHJrlx91uoPLCs1cU6KskY5jhFIzul39NAEiljTDl
 RUPIGnKYM7o+aR6TiuGPZbu2LV9+kU8iZFcqbtcNI61Gt9Pm6I0QYnzAvcm8uRTqQ7Rj
 R8+JDT8ezaFQUCHTByc44cpBaTO3jVYLofqZsBuXNUtakff9tGzSIvh8f9zaoPTjx5J9
 BhLw==
X-Gm-Message-State: ACrzQf1EjW93rM5YPMtaLTSYdvDChd/bar35zcgPlkOZjGyGxBKg9bL0
 XQNtmn/p2yEVrkdQfHhWgbyPnA==
X-Google-Smtp-Source: AMsMyM66JUJ2jqCOTzPTtqfXv5I+mno/7wauBHCBh7zYyj1HZ/eXqdJXn8tZeHWFk4fcR/T4hyf7Pw==
X-Received: by 2002:a05:651c:1590:b0:26c:4311:9b84 with SMTP id
 h16-20020a05651c159000b0026c43119b84mr5816939ljq.152.1665343477534; 
 Sun, 09 Oct 2022 12:24:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a0565120ad100b0049936272173sm1111974lfu.204.2022.10.09.12.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 12:24:37 -0700 (PDT)
Message-ID: <13755211-82fe-937b-f96e-966a55e68917@linaro.org>
Date: Sun, 9 Oct 2022 22:24:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 08/10] drm/msm/dsi: Account for DSC's bits_per_pixel
 having 4 fractional bits
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185316.462522-1-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009185316.462522-1-marijn.suijten@somainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2022 21:53, Marijn Suijten wrote:
> drm_dsc_config's bits_per_pixel field holds a fractional value with 4
> bits, which all panel drivers should adhere to for
> drm_dsc_pps_payload_pack() to generate a valid payload.  All code in the
> DSI driver here seems to assume that this field doesn't contain any
> fractional bits, hence resulting in the wrong values being computed.
> Since none of the calculations leave any room for fractional bits or
> seem to indicate any possible area of support, disallow such values
> altogether.  calculate_rc_params() in intel_vdsc.c performs an identical
> bitshift to get at this integer value.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry

