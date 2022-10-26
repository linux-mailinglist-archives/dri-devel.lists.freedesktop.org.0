Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1910C60E92D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 21:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393DF10E4F8;
	Wed, 26 Oct 2022 19:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C3F10E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 19:41:56 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g7so30893122lfv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wlJf3bJtBBgfFdtr4YnzwfnWV9gabWn1JKDOmEMYAcs=;
 b=OaLRVdla/d+TMqXrOSWuQDnvl/G7v76nRGBeNbCqwidDlA8awO3d5kSaxKuHb6uhkF
 Nw8YdrDWyEnIij7buDNTNnMa2aSEqwgANRyQ3ajpcYUFNNK9c+oJ8hVOMg2Q1fe+J1aG
 aiY7MSOx82phb+XMhm1/SwWIqD+PWr8ITBEH/eXc9vUL+bAsq2V0qY1TFMsYo9IF8QeI
 TugngMXn8L2O0W3K6u49V43g6OJfNd5VQ3F0LVg9HYAhHdtJ4mE0sy07SlVKXNRwwKa4
 2/4kfn8ucbcPfBsiCL4CpWG1AhnRvwRGTWzzRcrzlvTBXUTWAHOx7ZtwLczl+0y/wX1P
 cWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wlJf3bJtBBgfFdtr4YnzwfnWV9gabWn1JKDOmEMYAcs=;
 b=5cdeYk8zccc64M2KkoVtTao+sOGLx4ETORDayqNRBVzDB9XiNYevcNP9rKQLxi3Qsp
 pMkAtgX1YPO6LMgQFL8YVx2pxMjrp+yMqwDuNdfmRZBL2rQDDiK6bktWBw/JpvJYI8Cf
 foOu3lKBnUfntVUjUJ2C/vu5qvvsI11pQGzsFKRUNDvA1qLJUOxEr471ntpx0UW5gBgy
 mOKoINvlONMyiEYhy3AgLXVXek+Bu1B0WdtQiJ3GdHDh2JEYl1MzhMZS3yz5xkqfomSU
 IkfboXe4OfYhPHSBceiQmQiqg0RsvY4cCnhiW6JPuX++vcuDlvAP5RjKHxPvUgjkqgA7
 CLrw==
X-Gm-Message-State: ACrzQf3azyvQgFrpcRbgqfiorf3DCD+nBWFY1i3if/XtwevP1dmKFTEo
 dbE9zo142/6PZwuHurrslzPuLg==
X-Google-Smtp-Source: AMsMyM7PFC5Uw4to/B1qlnRLPHlmqEyPFzMnsc0jMDHWsc7stttckh7FiiZh9Te3P35yPA6tQ0aD6g==
X-Received: by 2002:ac2:5cba:0:b0:4aa:5b6d:fb33 with SMTP id
 e26-20020ac25cba000000b004aa5b6dfb33mr7781326lfq.491.1666813315070; 
 Wed, 26 Oct 2022 12:41:55 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a056512314e00b0049f6484694bsm942263lfi.161.2022.10.26.12.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 12:41:54 -0700 (PDT)
Message-ID: <3aa1d8f5-156d-2bd8-b9fc-3e496d7d64d3@linaro.org>
Date: Wed, 26 Oct 2022 22:41:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221026182824.876933-1-marijn.suijten@somainline.org>
 <20221026182824.876933-7-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221026182824.876933-7-marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/10/2022 21:28, Marijn Suijten wrote:
> As per the FIXME this code is entirely duplicate with what is already
> provided inside drm_dsc_compute_rc_parameters(), supposedly because that
> function was yielding "incorrect" results while in reality the panel
> driver(s?) used for testing were providing incorrect parameters.
> 
> For example, this code from downstream assumed dsc->bits_per_pixel to
> contain an integer value, whereas the upstream drm_dsc_config struct
> stores it with 4 fractional bits.  drm_dsc_compute_rc_parameters()
> already accounts for this feat while the panel driver used for testing
> [1] wasn't, hence making drm_dsc_compute_rc_parameters() seem like it
> was returning an incorrect result.
> Other users of dsc->bits_per_pixel inside dsi_populate_dsc_params() also
> treat it in the same erroneous way, and will be addressed in a separate
> patch.
> In the end, using drm_dsc_compute_rc_parameters() spares both a lot of
> duplicate code and erratic behaviour.
> 
> [1]: https://git.linaro.org/people/vinod.koul/kernel.git/commit/?h=topic/pixel3_5.18-rc1&id=1d7d98ad564f1ec69e7525e07418918d90f247a1
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 64 +++---------------------------
>   1 file changed, 6 insertions(+), 58 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you for the expanded explanation.

-- 
With best wishes
Dmitry

