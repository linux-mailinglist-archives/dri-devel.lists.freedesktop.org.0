Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E0F439E91
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 20:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2236E1CD;
	Mon, 25 Oct 2021 18:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC6D6E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 18:33:41 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c28so10383222lfv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z8dBYZTcodW1RIYY1CuZg5+AR74dovOpvsO6NBf+lLc=;
 b=ZryNl7LCusVTz1ohIfF0UDBP1HQe32e/17uZVKDo26y8lXSi69cyY/O2zW0EaidLAF
 yqPai5WEnpFTpa9hKWtic57snky53zK8VVouzHZ79u4xnxXurzXQcnuUgD2KiO4tpb8h
 6Q6Oo/ZbVgwgFHWP7XELlyzO5NpgMDSfg7a9hu1LVV1DESPwUS2EbUuq+WvAuGgPnEZW
 103YlT4Jjnr4fBuc0Go8Yp0kReiert0vN4kQ/LgvwHMbTcyMTtbesgsrVpM6Tu5Hjyov
 jiQh1JZ4DsOuMqekLyFoNN63AnSO9lkgXfAcs+bNbAppCG00vFLEUgTG05RYZkXpyzcx
 xRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z8dBYZTcodW1RIYY1CuZg5+AR74dovOpvsO6NBf+lLc=;
 b=2pu9zICcIBaZBl5W8cIKfBjQ7R9DcXX3z0Wq+rWR8unOQA667Uzsoigj5Ujq5LL+xY
 mxqouFfOLXmYMhC+OrMVSyseaUEY1zJfmMIiOwoWjMpvrnhpBytUtRphti4Ig+7zpBNT
 bo+Iplm2cEQveldloh/D3oVR92XJOxc36msAqvvmCXqw0unTsPqLhbCkyx9h8/Z15fSS
 1IMMV+W9jBT7/w7ugv49fO1bLLMzXms+MoBeCqOFicPtjzYMVInnKS+9EKZiIWQXCr4n
 OETdQpSICyrL0fLDDpZIs6XDcLJBZw5AWOHt05n3A+O6PV2qyOOm5VYCcO0422Ato6sS
 jnlg==
X-Gm-Message-State: AOAM533FKkbc3G70ky6R39cCjfz1cV1x/ACMGAZFzmnAJUn4pBVZqmWt
 pVWcv5ZhfqEaxGlfO2JBq7gteQ==
X-Google-Smtp-Source: ABdhPJx10i3nwleH7dxXSovt1g/kWHZ8liOWRHVHDlkIVeA5FV8xIRs9Pj7CSmFadXRB/KENK3CmtQ==
X-Received: by 2002:a05:6512:3f86:: with SMTP id
 x6mr18959945lfa.389.1635186819446; 
 Mon, 25 Oct 2021 11:33:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h1sm1717600lfu.277.2021.10.25.11.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:33:39 -0700 (PDT)
Subject: Re: [PATCH v2 06/11] drm/msm/disp/dpu1: Don't use DSC with mode_3d
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-7-vkoul@kernel.org>
 <11becace-7b44-6141-5a8b-1bd6d0673243@linaro.org>
 <35eb95c5-1c42-94d1-3f33-df029f753ab3@linaro.org> <YW+957ZKnbf1g/89@matsya>
 <e96d1368-fe7b-cf24-82c9-99783df44b0d@linaro.org> <YXbXBTlgDRa564Ic@matsya>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d1cb8a37-b749-4098-a248-f0a9997e05a9@linaro.org>
Date: Mon, 25 Oct 2021 21:33:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXbXBTlgDRa564Ic@matsya>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/10/2021 19:10, Vinod Koul wrote:
> On 25-10-21, 17:40, Dmitry Baryshkov wrote:
>> On 20/10/2021 09:57, Vinod Koul wrote:
>>> On 14-10-21, 16:50, Dmitry Baryshkov wrote:
>>>> On 14/10/2021 16:41, Dmitry Baryshkov wrote:
>>>>> On 07/10/2021 10:08, Vinod Koul wrote:
> 
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>>>> index 806c171e5df2..5dfac5994bd4 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>>>> @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
>>>>>>      * @mode_3d:               3d mux configuration
>>>>>>      * @merge_3d:              3d merge block used
>>>>>>      * @intf_mode_sel:         Interface mode, cmd / vid
>>>>>> + * @dsc:                   DSC BIT masks
>>>>>>      * @stream_sel:            Stream selection for multi-stream interfaces
>>>>>>      */
>>>>>>     struct dpu_hw_intf_cfg {
>>>>>> @@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
>>>>>>         enum dpu_3d_blend_mode mode_3d;
>>>>>>         enum dpu_merge_3d merge_3d;
>>>>>>         enum dpu_ctl_mode_sel intf_mode_sel;
>>>>>> +    unsigned int dsc;
>>>>
>>>> I think this should be:
>>>> enum dpu_dsc dsc[MAX_DSCS];
>>>> unsigned int num_dsc;
>>>
>>> hmmm, how do we go about getting the num_dsc value here.
>>> dpu_encoder_phys does not know about that..
>>
>> dpu_encoder_get_topology() can decide whether to use DSC or not and then set
>> num_dsc. For now it will always set 2 if we are using DSC at all, but let's
>> keep the decision in a single place rather than having it scattered all over
>> the driver.
> 
> Yes agree, but dpu_encoder_get_topology() is private to encoder. Am not
> sure how best to propagate the info into the hw_intf_cfg?

Let dpu_encoder_get_topology() set num_dscs to 2 and merge_3d to 0 if 
the encoder has DSC information and to 0 otherwise. This will cover all 
topologies that we care about for now.

Regarding getting the DSC config. Currently you use single priv->dsc 
pointer, which works for the simple case of single DSI output, but will 
break as soon as somebody has DSC DSI + DP config. Either we can 
introduce the array of DSC configs, or we can add a DSI-specific 
msm_dsi_get_dsc_config(), which will be later paired with the 
corresponding displayport function.

-- 
With best wishes
Dmitry
