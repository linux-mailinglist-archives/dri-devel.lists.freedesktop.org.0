Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD408679269
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 08:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C049A10E61B;
	Tue, 24 Jan 2023 07:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E0010E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 07:57:23 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x36so17295260ede.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 23:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I3bszTCkD+kw+1Y7L2uGsYTJlWqLn8lcFGeHp2xVzYs=;
 b=Yd3Me3+cKdqdLlAwp8AvD/tWrYtVn7tB/vvQyHiQc6PUX4I2VrddOvyS5s8MGqIchI
 wCdXjpZV9dYY6eIplbatXT7nWd/2599Xm1FMAUOvMbT2owgt/d0ABiNlVVpUOV64X7vb
 SgTHamw4hskUtfa1XGl99c3AhXE6sDn4cNfA8CivcJ5FEP2PXV+2krL+yJagNfHFz41h
 dI0bN/51xhbwTUg6Aahm+pdXV285AIbcPco1FW/CNJmrxWnr0lcjM7hRkGV8j4SSQFxA
 UmspSpS24H62B+6vbzJtGX/Mh5l6Y9b+RVEJzdhZNrIA8nbxv/V2m1rZ1vDLuGgAZG2j
 lSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3bszTCkD+kw+1Y7L2uGsYTJlWqLn8lcFGeHp2xVzYs=;
 b=H8OfizJodfZZPn9tsjNRrunINBrQ44yDWGBcQ0a3oOYhLgzlEya+1+CSJ/QLoBqU2a
 cWc6puPD/rlutN7RrBlWY8h70UgMpM3WVkS11RaWYdzyDsWzuGNQsbGP3kwzrEJ+WrjV
 BPSHa2uXFqh8bj2lk6TaSjgj5H4OtyMVVFEZ4nDZ6BlDg2TDZY9ArUJVJ/PQIxVpkfKd
 d9JQdzWn8C7L1/irfKX4QjqEZCmdT/nxVBYzf0bv7DVfN7uaCepYfgQqeUCzE9RlgbRN
 +nChYnkwW9s0956NG24iFQ6YPddri7JHbJ0TvIxhfjdFUVo7VOHL80EkhqCz1tOm5XVT
 HhDg==
X-Gm-Message-State: AFqh2kqTN54Nz5xJ/IhoZiG4zvjCmIO/QQKuQsCnAKKnPWebxfUed6+g
 QqFO/byClpoS4ABufKS2EuKrwA==
X-Google-Smtp-Source: AMrXdXt+1GGRxvTU201N0GgA/ANjRYl0kMjG+dTlxFaG95i9L3Q80YyqWCvwwDwBnIPn0Lwak3CV6A==
X-Received: by 2002:a05:6402:28cb:b0:49e:db43:1722 with SMTP id
 ef11-20020a05640228cb00b0049edb431722mr14083304edb.18.1674547042151; 
 Mon, 23 Jan 2023 23:57:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a50c052000000b0049ebbee7134sm698378edd.94.2023.01.23.23.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 23:57:21 -0800 (PST)
Message-ID: <76500be3-08c8-311b-6f9c-ad9e2feaf2ae@linaro.org>
Date: Tue, 24 Jan 2023 09:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/3] drm/msm/mdss: convert UBWC setup to use match data
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
 <20230118010428.1671443-2-dmitry.baryshkov@linaro.org>
 <2a5c8934-a479-6ea7-4236-9e156e26b29a@quicinc.com>
 <CAA8EJpp4h1Pt2cNuQi94ShvERmDKTrui_brJORqzx6_wT=KC8Q@mail.gmail.com>
 <4b0d0fcd-ddbc-5806-0ed9-e674d965d7cc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4b0d0fcd-ddbc-5806-0ed9-e674d965d7cc@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/01/2023 03:48, Abhinav Kumar wrote:
> 
> 
> On 1/19/2023 9:26 PM, Dmitry Baryshkov wrote:
>> On Fri, 20 Jan 2023 at 00:54, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 1/17/2023 5:04 PM, Dmitry Baryshkov wrote:
>>>> To simplify adding new platforms and to make settings more obvious,
>>>> rewrite the UBWC setup to use the data structure to pass platform 
>>>> config
>>>> rather than just calling the functions direcly.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> I was reviewing this series and
>>> https://patchwork.freedesktop.org/series/111732/ together.
>>>
>>> More I think about it, it seems like we are duplicating the same values
>>> here and in the catalog.
>>>
>>> Yes, these two are different drivers.
>>>
>>> But now that you are adding the UBWC entries here using the compatible
>>> string so you are creating something like a "catalog" here.
>>>
>>> In that case, why dont we remove the entries from dpu catalog and in the
>>> DPU driver get the parent's match data as we know that the msm_mdss is
>>> the parent of DPU driver
>>
>> I should give it a thought, especially since we are trying to clean up
>> the DPU catalog.
> 
> I just went through the cover letter of 
> https://patchwork.freedesktop.org/patch/519752/ and it mentions
> 
> "My itent is to land both series and then to make
> DPU request this data from the MDSS driver"
> 
> This means that the parent data suggestion will be implemented?

Yes, at some point. You probably saw the dpu_ubwc_cfg structure. As I 
wrote, I'd like to get it from MDSS. Just looking for a best way to do this.


-- 
With best wishes
Dmitry

