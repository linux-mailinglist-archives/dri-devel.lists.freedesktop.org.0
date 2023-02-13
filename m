Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F136669449D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C1F10E522;
	Mon, 13 Feb 2023 11:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF64310E522
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:35:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id fi26so12400178edb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5kO61Xdr+q3Xm/aE1pgal7R7MWN8+6oxdSKgU0U1UyM=;
 b=aNkt7NyT/zDXkcN+k4nhOMnT+Q4V2oMXq57WA+MQzmYKT828gn+Qb0d/73CmKSyGVy
 ZsKQozLMCViOvi/1/0vN2cT9pzpvfHXg7Hj/jF+mq7BAO2UdBGhpvqubOcUYu8UMetwE
 +xG0txJEaTcuJuc3k76xnvbkedvCjF89AhaC9Bm+wzeslIQk0vfbclQJKlJ+pD4exWx1
 Xe8Z+2T2QitIwu9FTxgRQDHOC3tkhMjlbf/ZIBVwmv1qkLAjUs+jP+bOSt4zIuqmXAmK
 3yfh4vnWbd12j05E1qaphjH1VYJTGSxRH6XJpANN4WIsOVgao+322I1nB6opXkPZ6twq
 aIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5kO61Xdr+q3Xm/aE1pgal7R7MWN8+6oxdSKgU0U1UyM=;
 b=j7dg1eezN50UEM1EhM7mP8YqZrnKXEkD8bcqrYK6MJO+fXGepMM463HSK+8b3IQJr9
 Zh89SMBFCniMur/RI5nLB+Py4lSI8WdqG4BLimN5nS5L9jmM973tYZu+A64Cu3C8eNwx
 6lcndbCcOAw1DSnV6Ae2ZD1QwLRyY8iVFWvohDqWpnOG+1k+Jc4gergq7WpBdEocsmie
 t4nA3q7r9LzN8wgiFM0n+l+k7+JDaOZqHjAQSC8dtpUZjZ+/KLZ5+ia6qw5TU+ulc2YQ
 MBHtWOUz+EmgxgMsft61IzOSWxW123PfDSzlquiB83wrNcCIUHskoGAI92UlcMVJH5wT
 4IzA==
X-Gm-Message-State: AO0yUKXZebyaFZGFH3A2PL+N6rJ2Qeo/xKzI13gJghONoyre+pWxrx8F
 NFgh0SrQLioIoFwFz1uFTU4/qg==
X-Google-Smtp-Source: AK7set86B+Ujcg/vW0N50ATX4TqqCB7mTK19gsN++SiRbozDYUP8807huE7WiHrtRmFGrNHon15wcw==
X-Received: by 2002:a50:9e2a:0:b0:4ab:d15:7e5c with SMTP id
 z39-20020a509e2a000000b004ab0d157e5cmr19017164ede.36.1676288104215; 
 Mon, 13 Feb 2023 03:35:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 eg21-20020a056402289500b004acb6189693sm3760351edb.83.2023.02.13.03.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:35:03 -0800 (PST)
Message-ID: <8560b69f-8d42-995d-2f4d-11d6a64afef0@linaro.org>
Date: Mon, 13 Feb 2023 13:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/10] drm/msm/dpu: Add SM6350 support
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-7-konrad.dybcio@linaro.org>
 <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
 <cc364658-478a-f239-5d17-5ca2b7f7df8b@linaro.org>
 <20230213113008.ih7ii5m3cz4w3lmz@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213113008.ih7ii5m3cz4w3lmz@SoMainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Robert Foss <rfoss@kernel.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>, freedreno@lists.freedesktop.org,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 13:30, Marijn Suijten wrote:
> On 2023-02-13 12:15:19, Konrad Dybcio wrote:
> [...]
>>>> @@ -1674,6 +1765,15 @@ static struct dpu_pingpong_cfg sc8280xp_pp[] = {
>>>>              DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>>>>    };
>>>>    +static struct dpu_pingpong_cfg sm6350_pp[] = {
>>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>>
>>> No TE support?
>> It's.. complicated.. With just this patch, display refreshes, albeit
>> not at 60fps. Marijn is working on getting it going, though
>>
>> https://github.com/SoMainline/linux/commits/marijn/longbois-next/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> 
> This branch hasn't been updated for the longest time.  I'm preparing v2
> of the INTF TE series at:
> 
> https://github.com/SoMainline/linux/commits/marijn/dpu/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> 
> and it has about ±40% of Dmitry's review applied.  More to come now that
> hiatus is over.

We should agree on landing order for my rework vs your changes. Can I 
try persuading you to review that 50-patches beast? With the hope that 
you'd agree to land your changes on top of it?

-- 
With best wishes
Dmitry

