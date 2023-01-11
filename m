Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00796665ED2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0D110E758;
	Wed, 11 Jan 2023 15:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA62D10E1A7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:11:06 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b3so24003928lfv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=li7uYANK4G+SChag2/mpGdHQOxE/rvlJtqarjph+1bo=;
 b=b7J5gqwukqsCuvsplGHbk9P7MXCKIbPurlVzbhe0gQXG2f3poNej6lZIVT44JBpm0P
 ZqRGIgPtKmVl7ZjYwNJl+d5wDtQuxjlP8QfgjSpOz2out+oiGwlOMYqE6WVPTwqc9BKO
 MKQb0LKb1KLV9/pZHrsC8PcZjNw1D7pxMduOJSAU9qVVNFrCJUEaA3ibpB7vgI+mm3LS
 18U2ybdt6nJNMwARdfkQeZQw4N8MC6VU+Y2VgMNg/acB5zbx4VfuyYotmujFSZk9EQ5f
 dcAontW7O1isPNNjZEFNf42lvtXOAbwvd+33cBuprbXDXTPGmeEC4nMmBRxEZJQf/cYh
 Gncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=li7uYANK4G+SChag2/mpGdHQOxE/rvlJtqarjph+1bo=;
 b=qej+2MZQ9y7XDHzKdw3+9DLIPl7iYhwyE+8oZt5AqDeH7yqll3HYGWwIYuUoxR0bkF
 9C73LXUj5RV5tEjb4tY1q+ika7qLOvfGjiyPh2yHYzoPFFR7BDQ6i9Vh4eYuZrC9K5+s
 6JcCfeYRjbbbmn/+ee1gz0XAqECwbJYjeJZHYKRe8LMHp+X/qyzBLCRYBmsV3zzVxgpY
 eF/4Z8EEAQuiLoAcXpFZmikovK29i4Nhi3ZGENnQaXO7mySE2EHc7FkJmvgmapNuWnhn
 CdaKZOQH+f2xYevYVtuXwr8vovXNiu5LQHPPQKMeTa6AFjHcv7MW/NzJDJ7b0rGQWzzj
 610w==
X-Gm-Message-State: AFqh2kq8d/655KV06+L06aV0yH6sv/XhOzkmtdCRxKk6HT0L656OAQJN
 8x/U5vcjQNm+LZBeu1EMR+Xu+g==
X-Google-Smtp-Source: AMrXdXtI5H/Qq5HqkRKFEVytDKZHp8DAnvESgHDjEBl8nGEZKXVbqLgG/uam89ozoPwpt8HMtQ9Bmw==
X-Received: by 2002:a05:6512:130c:b0:4ca:f9ec:eee2 with SMTP id
 x12-20020a056512130c00b004caf9eceee2mr21980196lfu.20.1673449864982; 
 Wed, 11 Jan 2023 07:11:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056512358f00b004cb39d89f40sm2768367lfr.248.2023.01.11.07.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 07:11:04 -0800 (PST)
Message-ID: <e1c49c07-8ae2-f82f-97e0-4bb03c5f5af6@linaro.org>
Date: Wed, 11 Jan 2023 17:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 1/4] drm/msm/mdss: convert UBWC setup to use match data
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-2-dmitry.baryshkov@linaro.org>
 <047cd859-7141-d52f-4989-847fd2ada002@quicinc.com>
 <b66de0ab-a31b-c86a-c1d0-c9a5f98c4f85@linaro.org>
 <5aa47cf1-0589-4830-c1fb-22e15bac974a@quicinc.com>
 <20230111084458.wcwzipew3ny7fpno@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230111084458.wcwzipew3ny7fpno@SoMainline.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/01/2023 10:44, Marijn Suijten wrote:
> On 2023-01-09 12:32:18, Abhinav Kumar wrote:
> <snip>
>>>> On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
> <snip>
>>>>> +struct msm_mdss_data {
>>>>> +    u32 ubwc_version;
>>>>> +    u32 ubwc_swizzle;
>>>>> +    u32 ubwc_static;
>>>>> +    u32 highest_bank_bit;
>>>>> +    u32 macrotile_mode;
>>>>> +};
> 
> This magic struct could really use some documentation, otherwise users
> will have no idea what fields to set (or omit) nor what values to use.
> For example decoder 2.0 seems to only use ubwc_static as a sort of magic
> "we don't know what the bits in UBWC_STATIC mean", whereas decoder 3.0
> reconstructs this field entirely from the other parameters.  Decoder 4.0
> however does the same, but _also_ embeds this uwbc_static magic value
> back into the register value....?

On the bright side these magic values correspond 1:1 to the vendor dtsi 
and to the part of DPU hw catalog. It would be nice to know the bit used 
by decoder 2.0, but I fear that we'd have to resort to wild guesses 
unless Qualcomm decides to disclose that information.

As for dec 4.0 and ubwc_static. I fear that it's just somebody (writing 
downstream DT parsing) reused the ubwc-static name for the bitfield 
which in reality has some sensible name.

> 
> Also read on below about checking "compatibility" between this struct
> and the decoder version, and why I feel this struct (versus mandatory
> function arguments) makes this struct less robust.
> 
>>>>>    struct msm_mdss {
>>>>>        struct device *dev;
>>>>> @@ -40,6 +48,7 @@ struct msm_mdss {
>>>>>            unsigned long enabled_mask;
>>>>>            struct irq_domain *domain;
>>>>>        } irq_controller;
>>>>> +    const struct msm_mdss_data *mdss_data;
>>>>>        struct icc_path *path[2];
>>>>>        u32 num_paths;
>>>>>    };
>>>>> @@ -180,46 +189,40 @@ static int _msm_mdss_irq_domain_add(struct
>>>>> msm_mdss *msm_mdss)
>>>>>    #define UBWC_3_0 0x30000000
>>>>>    #define UBWC_4_0 0x40000000
>>>>> -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
>>>>> -                       u32 ubwc_static)
>>>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
>>>>>    {
>>>>> -    writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>>>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>>>>> +
>>>>> +    writel_relaxed(data->ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>>>>>    }
>>>>> -static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
>>>>> -                       unsigned int ubwc_version,
>>>>> -                       u32 ubwc_swizzle,
>>>>> -                       u32 highest_bank_bit,
>>>>> -                       u32 macrotile_mode)
>>>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
>>>>>    {
>>>>> -    u32 value = (ubwc_swizzle & 0x1) |
>>>>> -            (highest_bank_bit & 0x3) << 4 |
>>>>> -            (macrotile_mode & 0x1) << 12;
>>>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>>>>> +    u32 value = (data->ubwc_swizzle & 0x1) |
>>>>> +            (data->highest_bank_bit & 0x3) << 4 |
>>>>> +            (data->macrotile_mode & 0x1) << 12;
>>>>> -    if (ubwc_version == UBWC_3_0)
>>>>> +    if (data->ubwc_version == UBWC_3_0)
>>>>>            value |= BIT(10);
>>>>> -    if (ubwc_version == UBWC_1_0)
>>>>> +    if (data->ubwc_version == UBWC_1_0)
>>>>>            value |= BIT(8);
>>>>>        writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>>>>    }
>>>>> -static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
>>>>> -                       unsigned int ubwc_version,
>>>>> -                       u32 ubwc_swizzle,
>>>>> -                       u32 ubwc_static,
>>>>> -                       u32 highest_bank_bit,
>>>>> -                       u32 macrotile_mode)
>>>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>>>>>    {
>>>>> -    u32 value = (ubwc_swizzle & 0x7) |
>>>>> -            (ubwc_static & 0x1) << 3 |
>>>>> -            (highest_bank_bit & 0x7) << 4 |
>>>>> -            (macrotile_mode & 0x1) << 12;
>>>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>>>>> +    u32 value = (data->ubwc_swizzle & 0x7) |
>>>>> +            (data->ubwc_static & 0x1) << 3 |
>>>>> +            (data->highest_bank_bit & 0x7) << 4 |
>>>>> +            (data->macrotile_mode & 0x1) << 12;
>>>>>        writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>>>> -    if (ubwc_version == UBWC_3_0) {
>>>>> +    if (data->ubwc_version == UBWC_3_0) {
>>>>>            writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
>>>>>            writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
>>>>>        } else {
>>>>> @@ -232,6 +235,7 @@ static int msm_mdss_enable(struct msm_mdss
>>>>> *msm_mdss)
>>>>>    {
>>>>>        int ret;
>>>>>        u32 hw_rev;
>>>>> +    u32 ubwc_dec_hw_version;
>>>>>        /*
>>>>>         * Several components have AXI clocks that can only be turned
>>>>> on if
>>>>> @@ -250,53 +254,36 @@ static int msm_mdss_enable(struct msm_mdss
>>>>> *msm_mdss)
>>>>>         * HW_REV requires MDSS_MDP_CLK, which is not enabled by the
>>>>> mdss on
>>>>>         * mdp5 hardware. Skip reading it for now.
>>>>>         */
>>>>> -    if (msm_mdss->is_mdp5)
>>>>> +    if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
>>>>>            return 0;
>>>>>        hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
>>
>> hw_rev is not used anymore now so why not just drop that reg read
>> altogether.
>>
>>>>>        dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
>>>>> +
>>>>> +    ubwc_dec_hw_version = readl_relaxed(msm_mdss->mmio +
>>>>> UBWC_DEC_HW_VERSION);
>>
>> If we are going to tie UBWC version to the HW compatible match, then
>> even this register read can be skipped and instead you can add
>> ubwc_dec_hw_version to your match data struct and skip this read as well.
> 
> I have suggested in IRC to keep this register read, and utilize it to at
> least sanity check the configuration.  You are right that the DPU HW
> version already describes what UWBC decoder version is used, but we're
> are already questioning whether it was ported correctly for SM6115.  A
> WARN() that catches a mismatch between what was written in the "catalog"
> (or this match table) versus what the hardware reports would have gone a
> long way.

Well... Sanity checking here means we do not trust the kernel. And whom 
we can trust then? Note, that for 6115 I had a question regarding the 
ubwc_version stated in the comment, not in the code. I asked for 
UBWC_DEC_HW_VERSION value just to be sure.

> 
> This is especially relevant with the new struct where fields are
> (un)used depending on the UBWC HW decoder version, making for an extra
> exercise to the developer to double-check whether their struct values
> are taken into account or not (or if used ones are accidentally
> omitted).

Granted the overlay between DPU catalog and MDSS device data maybe we 
should make DPU ask MDSS for the ubwc settings.

> 
> - Marijn
> 
>> That way we get rid of all register reads in this path which have
>> continuously bugged us with crashes.
> 
> <snip>

-- 
With best wishes
Dmitry

