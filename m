Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF14662ED4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BC210E4E2;
	Mon,  9 Jan 2023 18:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DE710E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 18:24:19 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bt23so14293324lfb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 10:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ciC8Itd05zrc4mqdQW4FAXytrWOg65pDTPIECNA32rA=;
 b=WycOer6N4iDXZTrEoXCOWDtIFlFKdYnysTq4lttAbZ667wDehkC2KFmWEctX/lwhZR
 BCymIM97fYFLN6iSU88dYcKULCqgs9sug6hWhW5RPkUA2mimIdRNliXKdL2Ap268kXKQ
 bV1eP8wFpYs/WBrFIdRR2cQzvKEaSZRuHP7x7MW7xbdFzb/+Un7glAPpUijczorjgUN0
 Pu/EpcIv17iKuuboF1d3sK84yv6k2gO7KaZIPFh26BumPLIN2G2Pjqk/tPjqT4Y/9024
 wpEmfuFnJHusw/QP/EhqB0Wp/QCBl4hRe9n0fARhQY2d7HOUnQTIOcy+uOoeePCBHX5T
 AUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ciC8Itd05zrc4mqdQW4FAXytrWOg65pDTPIECNA32rA=;
 b=rE1U1AYYrzvr+Afk4XPiRSbhR1xBtkruQa/MiWxFarJZcC3IOjETXs9FpJ2oL9eRNH
 b24NHAhD6OPACIPo9DREDRcXyIrK8SdsuSTD1Knifx4LqL/QoPfAzUt2xmijw3cMdXAD
 No6JG5mzqpV7o7Bl/s8TGm9Su3EU+Z2E1XHTDKbOxlmcF0VDqytK+6GJYD6JcRK4dOjl
 BKEaZZ5OJl5GBvOFe0nVUziv1Xkjjr5Kh3BH9VHGuO9io2pB3hQorbxynDoGEdnwgmUU
 imF5HxtwUW7lfEEs6P/boW7xStIc32FwiHFu5D+DxVCcwCcXcCFxCZKyyKrYUr6nrAk/
 00WQ==
X-Gm-Message-State: AFqh2ko94YKQN0RJaWIz4oHYXrbIqzwtnK28lXpRCRxgIB8jlCru7BeE
 qWZ/3tvWQIEiTGgPsuffzDLMyw==
X-Google-Smtp-Source: AMrXdXvIr6JDWXylhCd83Kbg77UPE81swhmMPkPrl0hoB7kDLxXgvcpoYZqWOL8YI6s9nAZLYyMJTw==
X-Received: by 2002:ac2:5fce:0:b0:4b5:850e:6f4a with SMTP id
 q14-20020ac25fce000000b004b5850e6f4amr19855731lfg.69.1673288658255; 
 Mon, 09 Jan 2023 10:24:18 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1740486lfe.201.2023.01.09.10.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 10:24:17 -0800 (PST)
Message-ID: <4514a37f-ff75-1aed-2207-426ad846411e@linaro.org>
Date: Mon, 9 Jan 2023 20:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated resources to be
 returned
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org>
 <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
 <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org>
 <20230109082357.meebk7udokdfvwle@SoMainline.org>
 <CAA8EJppqocjgTbZLhcJtmRGjE4X2u_jDEGDWS9Bsp7MEgD+Ldg@mail.gmail.com>
 <20230109171223.vjkigcj7xwfwow2a@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109171223.vjkigcj7xwfwow2a@SoMainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Vinod Koul <vkoul@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 19:12, Marijn Suijten wrote:
> On 2023-01-09 11:06:45, Dmitry Baryshkov wrote:
>> On Mon, 9 Jan 2023 at 10:24, Marijn Suijten
>> <marijn.suijten@somainline.org> wrote:
>>>
>>> On 2023-01-09 01:30:29, Dmitry Baryshkov wrote:
>>>> On 09/01/2023 01:28, Dmitry Baryshkov wrote:
>>>>> On 22/12/2022 01:19, Marijn Suijten wrote:
>>>>>> In the event that the topology requests resources that have not been
>>>>>> created by the system (because they are typically not represented in
>>>>>> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
>>>>>> blocks) remain NULL but will still be returned out of
>>>>>> dpu_rm_get_assigned_resources, where the caller expects to get an array
>>>>>> containing num_blks valid pointers (but instead gets these NULLs).
>>>>>>
>>>>>> To prevent this from happening, where null-pointer dereferences
>>>>>> typically result in a hard-to-debug platform lockup, num_blks shouldn't
>>>>>> increase past NULL blocks and will print an error and break instead.
>>>>>> After all, max_blks represents the static size of the maximum number of
>>>>>> blocks whereas the actual amount varies per platform.
>>>>>>
>>>>>> ^1: which can happen after a git rebase ended up moving additions to
>>>>>> _dpu_cfg to a different struct which has the same patch context.
>>>>>>
>>>>>> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
>>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>>>>>>    1 file changed, 5 insertions(+)
>>>>>
>>>>> I think the patch is not fully correct. Please check resource
>>>>> availability during allocation. I wouldn't expect an error from
>>>>> get_assigned_resources because of resource exhaustion.
>>>
>>> Theoretically patch 5/8 should take care of this, and we should never
>>> reach this failure condition.  Emphasis on /should/, this may happen
>>> again if/when another block type is added with sub-par resource
>>> allocation and assignment implementation.
>>
>> Yeah. Maybe swapping 4/8 and 5/8 makes sense.
> 
> Ack.
> 
>>>> Another option, since allocation functions (except DSC) already have
>>>> these safety checks: check error message to mention internal
>>>> inconstency: allocated resource doesn't exist.
>>>
>>> Is this a suggestion for the wording of the error message?
>>
>> Yes. Because the current message makes one think that it is output
>> during allocation / assignment to encoder, while this is a safety net.
> 
> Good.  So the patch is correct, just the wording is off, which I fully
> agree on.  This isn't allocating anything, just handing out what was
> previously allocated (and is a safety net).

Yes. Please excuse me if my original message was not 100% clear.

> 
> - Marijn

-- 
With best wishes
Dmitry

