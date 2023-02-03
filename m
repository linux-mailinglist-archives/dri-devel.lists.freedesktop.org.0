Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB800689B2E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 15:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A7310E061;
	Fri,  3 Feb 2023 14:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AB310E061
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 14:09:54 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id dr8so15574110ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 06:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gzy7uk6PIWZpzhHS9Q2N99o+izHmIpMwH2uTxhvt0hI=;
 b=nOwbPfqnnx+JtB+p1BbdTSGh0gHcr0+Upl9ouZ2UPfjBVuvvAZVkG3KyN/Yr1/z/2u
 Vcj7T29Zk36njq5kFBg8BX83oNQHLfqJ02YtWHlrmnBLeQ3bEjVJ7SW2Q0aLw2DcRpSb
 DXuWO+jg5erBHkAOk/yl+LtJa3qZwehkHzc4RckkzbHWBj5Tv0V8C/kbUlIRIk6yVNs/
 gTAbcLpVZeLrUjTi3N10sOP+GhegPzU0A7kpaoQaVoB7GjFnP+DnrMh642qKMV+QBjHK
 PJYkWGfpcuVzdh5v3LQY08Qa/nqdQojbqEPgZ5qJ+6UkA06clnMMlgDT1kpEYjb9A4DW
 f1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gzy7uk6PIWZpzhHS9Q2N99o+izHmIpMwH2uTxhvt0hI=;
 b=sjoXeGRPgSgyC4y2OlciS/9FbbpOgT7j/Aa1k9kKDQ+bqOZ+troPzZTah96UTH/rPn
 xLKrO3fso8+zpqoT7DFA4AofohcX8Q/Kkg/jKh0xGGz/pqCFy4SjXwL21CwkmNvnSQBf
 JyLkmcQS2WXzu5mtgT+5yUjFDBIitYVwpO/TqGWH0FQJ+1rCoi4ATCMoxwq9heSd1rWK
 F8wk8pQRFGFt8+8TbRnvvZW1MDcvQ5y3zKLtC0vC8XP1duwSiCBC2K1J8DoL3pieODjG
 wGsK9OVgGssdfZIk5Wd6RoCjvU82QqXno0/ZNZqNacJUeDKTqwhJ1psO3uwHG9MisLoJ
 viyw==
X-Gm-Message-State: AO0yUKVNoC8G0tR4sGEH2RYdplagcpWcjcv/bPjO+ho29Nuth+xqID5w
 L+JZ/ge1uMxrxyUZp+Q4Kk+j/xSS224RjwuK
X-Google-Smtp-Source: AK7set9edBQbx/D5pwmn4ZFPTE1VYiA4G1b4YT/Qc54v54/iiy6PRnPkZjXg31eFobRLQTLhmPfplw==
X-Received: by 2002:a17:906:4fc7:b0:87b:1be:a8c2 with SMTP id
 i7-20020a1709064fc700b0087b01bea8c2mr11962181ejw.73.1675433392680; 
 Fri, 03 Feb 2023 06:09:52 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a1709064dd100b0087276f66c6asm1417029ejw.115.2023.02.03.06.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 06:09:52 -0800 (PST)
Message-ID: <fbdab5e4-4f48-f18f-561d-442d493724e5@linaro.org>
Date: Fri, 3 Feb 2023 16:09:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 12/27] drm/msm/dpu: remove dpu_hw_fmt_layout from
 struct dpu_hw_pipe_cfg
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-13-dmitry.baryshkov@linaro.org>
 <77764494-8a74-8450-ac75-33d6de0b2f8d@quicinc.com>
 <CAA8EJpq4ybOQg-Mb5RM+dcrBbR+3WrWSgvd4d20C6NKa90C15Q@mail.gmail.com>
 <62ace381-2c59-9096-2b4f-412b329ad78e@quicinc.com>
 <c6eb252e-fdff-8e17-4acb-cdb3ba850887@linaro.org>
 <a4af7146-126f-cd6e-4c65-dbdffe6cca82@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a4af7146-126f-cd6e-4c65-dbdffe6cca82@quicinc.com>
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

On 02/02/2023 22:14, Abhinav Kumar wrote:
> 
> 
> On 2/2/2023 12:10 PM, Dmitry Baryshkov wrote:
>> On 02/02/2023 21:54, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/2/2023 11:45 AM, Dmitry Baryshkov wrote:
>>>> On Thu, 2 Feb 2023 at 21:38, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>>>>> Remove dpu_hw_fmt_layout instance from struct dpu_hw_pipe_cfg, 
>>>>>> leaving
>>>>>> only src_rect and dst_rect. This way right and left pipes will have
>>>>>> separate dpu_hw_pipe_cfg isntances, while the layout is common to 
>>>>>> both
>>>>>> of them.
>>>>>>
>>>>>
>>>>> Sorry for not responding to this comment earlier.
>>>>>
>>>>> https://patchwork.freedesktop.org/patch/473168/?series=99909&rev=1#comment_875370
>>>>>
>>>>>   From the perspective of wide planes you are right that the layout is
>>>>> common but not true from smart DMA point of view.
>>>>>
>>>>> For wide planes, yes, its usually the same buffer with just the src_x
>>>>> being different but conceptually and even HW wise each rectangle of 
>>>>> the
>>>>> smart DMA is capable of fetching from a different buffer.
>>>>>
>>>>>   From the pov, this decision of not having the dpu_hw_fmt_layout 
>>>>> as part
>>>>> of dpu_hw_pipe_cfg seems incorrect to me.
>>>>
>>>> Yes, each rectangle/pipe can fetch from a different buffer. However in
>>>> our use case the layout is not defined for each pipe. It is defined
>>>> for a plane, no matter how many pipes are used for the plane, since
>>>> the buffer is also defined per plane.
>>>>
>>> Even if the layout is defined per plane.
>>>
>>> So lets say
>>>
>>> plane A with layout A maps to rect 1 of DMA0
>>> plane B with layout B maps to rect 2 of DMA0
>>>
>>> How can layout be assumed to be duplicated in this case?
>>>
>>> This is not a wide plane use-case but just smartDMA case of two 
>>> different layers.
>>>
>>> Maybe I am missing something but this is the example i am interested 
>>> about.
>>
>> PlaneA has layoutA. So dpu_plane_sspp_update_pipe() will program 
>> layoutA using (DMA0, rect1)->setup_sourceaddress(layoutA).
>>
>> PlaneB has layoutB, so (DMA0, rect2)->setup_sourceaddress(layoutB).
>>
>> Maybe the commit message is misleading. The layout is not common to 
>> rect1 and rect2. It is common to all pipes/rectangles driving a single 
>> plane.
>>
> 
> Ack, Its clear now.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I have rephrased the last sentence of the commit message in the 
following way. Hopefully it will be cleaner now:

This way all the pipes used by the plane
will have a common layout instance (as the framebuffer is shared between
them), while still keeping a separate src/dst rectangle configuration
for each pipe.

-- 
With best wishes
Dmitry

