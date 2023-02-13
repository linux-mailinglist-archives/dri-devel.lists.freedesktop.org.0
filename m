Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F524694948
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B2410E5E3;
	Mon, 13 Feb 2023 14:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A9B10E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 14:58:04 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qw12so32590187ejc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 06:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t0Ex7E8/vmOGGjqbpJ8kCxNFK5nmMmqwxxY1Vu/9df4=;
 b=hee2ImtXzsBXl0kILmav25lZmZsTObzYVFVKMe+g/lNF6+c0BpUFXcMx9n3LtCFfAS
 fY/UayWHlXuu52LpVgIUwb1cJOXkdoktHBPJtUnTxNjgnVT0CIeak8nft+iTcWcuaf0l
 3IowKe/30r585w16pMnsZzRUc+NaCZ+hpFsQcizjJPMVo25r+2kMBHz3HMsgUhiLdcm/
 c6FzCKd1MyuY00EY7AU2CnedoLJYftFvM0kcjs1+70Pn8w6P/WmoJ7f1IHyALYeNwhyS
 bLTHvinZ4AHJfH/LIo0NWjFSkrNgxsQGgtN8bXsfr1EOGcZqhD8g80mPjGqODTTGN2f1
 rT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t0Ex7E8/vmOGGjqbpJ8kCxNFK5nmMmqwxxY1Vu/9df4=;
 b=6FE1jd/RuyO9fnobFxHkLyaPd9WU8oxMREaBac1MqmYkcwnvJeDFNeYyLLDTT7sJiG
 NsB/m/EP0S0PcStXNp8QCpsA2BXLE3uZFaFAr9f2uy2l7h69f4EuZ9oMqaCO9k+dBb5u
 ZAwYnBa0zxzJdeiGGXkHuiu4PFKeXx+hoZ6oDwD2WajPKr6F9USZCnMXkQbaOAC9UcHL
 MTMOdzG5bEoGOSs0BqdQys/rtEqN7oFcMr+RRbaTEi26AXgzYGHJzNc5NR/m2M2M3rxB
 Y8QraFiEgdHTlV0htqPxOfNdFjqMJ+exbeNWMqlJYsYfBARQFpzZrCwDxEMtLaIL0HEe
 bgDw==
X-Gm-Message-State: AO0yUKWG3dKfg5khJtTh80jtHyktSQLsCl+XSLd9LqHN5r/B2ML7x/Y1
 kdSN16N+bRBjQgDFZXd80eP4Mg==
X-Google-Smtp-Source: AK7set8/0u0A9i1O4BrN3E62HOfZ77pOUJdLLuGEIVIOcdxEJSmdM56oSksfFW5QH1OXL2J1oe81zw==
X-Received: by 2002:a17:907:c21:b0:8af:9c84:9412 with SMTP id
 ga33-20020a1709070c2100b008af9c849412mr12333294ejc.71.1676300282962; 
 Mon, 13 Feb 2023 06:58:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x27-20020a170906135b00b007ae32daf4b9sm6883519ejb.106.2023.02.13.06.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:58:02 -0800 (PST)
Message-ID: <28c9ea04-fedb-16cf-f874-f4c965fbc445@linaro.org>
Date: Mon, 13 Feb 2023 16:58:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/10] drm/msm/dpu: Add SM6350 support
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-7-konrad.dybcio@linaro.org>
 <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
 <cc364658-478a-f239-5d17-5ca2b7f7df8b@linaro.org>
 <20230213113008.ih7ii5m3cz4w3lmz@SoMainline.org>
 <8560b69f-8d42-995d-2f4d-11d6a64afef0@linaro.org>
 <20230213142831.hbzfp2chekshsqyy@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213142831.hbzfp2chekshsqyy@SoMainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Liu Shixin <liushixin2@huawei.com>,
 Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 16:28, Marijn Suijten wrote:
> On 2023-02-13 13:35:01, Dmitry Baryshkov wrote:
>> On 13/02/2023 13:30, Marijn Suijten wrote:
>>> On 2023-02-13 12:15:19, Konrad Dybcio wrote:
>>> [...]
>>>>>> @@ -1674,6 +1765,15 @@ static struct dpu_pingpong_cfg sc8280xp_pp[] = {
>>>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>>>>>>     };
>>>>>>     +static struct dpu_pingpong_cfg sm6350_pp[] = {
>>>>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>>>>
>>>>> No TE support?
>>>> It's.. complicated.. With just this patch, display refreshes, albeit
>>>> not at 60fps. Marijn is working on getting it going, though
>>>>
>>>> https://github.com/SoMainline/linux/commits/marijn/longbois-next/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>
>>> This branch hasn't been updated for the longest time.  I'm preparing v2
>>> of the INTF TE series at:
>>>
>>> https://github.com/SoMainline/linux/commits/marijn/dpu/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>
>>> and it has about ±40% of Dmitry's review applied.  More to come now that
>>> hiatus is over.
>>
>> We should agree on landing order for my rework vs your changes. Can I
>> try persuading you to review that 50-patches beast? With the hope that
>> you'd agree to land your changes on top of it?
> 
> SM6115 unexpectedly landing in advance of SM8[345]0 was already an
> unnecessary headache to deal with, and now we're "changing direction" on
> landing SM6350/75 in advance of INTF TE too...  not to forget about
> SM6125 which I also keep rebasing locally but planned on landing _after_
> INTF TE.  Regardless of the extra effort it will take from me I'd be
> happy to land my patches after everyone else's to have final say over
> which setup gets what bitflags and interrupts, as these typically got
> botched in our trees after rebases leading to broken INTF TE.
> Perhaps I should resubmit the individual Fixes: commits though?

What is the current status of your INTF TE patchset? If it's mostly 
ready, I can rebase my patch-bomb on top of it.

I definitely do not want to merge new platforms before sorting out INTF 
TE and the catalog. Handling sc8280xp, sm8350, sm8450 and sm6115 was a 
nightmare. The restructure targets making addition of new platforms simpler.

> Feel free to propose a merge order listing all the aforementioned SoCs,
> your rework, my INTF TE patches and whatever else is in the pipeline.
> As I've been away for a while, and only have limited hobby time (_and_
> have to split that on various projects), I'm behind on what's currently
> in swing for DPU (need additional time to catch back up) nor will be
> able to rebase/resubmit my patches often (a set-in-stone merge order
> will really help prioritise/plan ahead here).

We have several patchsets in the pipeline (PSR, color-transformation 
rework, wide planes) which do not touch the catalog, so the amount of 
conflicts should be pretty minimal. We are still waiting for DSC 1.2 v2, 
but it definitely will take time to mature even if v2 is posted today.

So, *possible* the merge order is the following:
- fixes from https://patchwork.freedesktop.org/series/113910/ go to 
msm-fixes
- fixes from your intf-te go to msm-fixes
- https://patchwork.freedesktop.org/series/111751/
- the rest of intf-te and catalog (*see below)
- DPU features
- new DPU platforms (might go together with DPU features)

* That really depends on the availability of the patchsets. Most 
probably, as your patchset also contains several fixups, it would be 
easier to land it before catalog split/rework.

So, if you have the available timeslot, could you please finish & send 
intf te on top of msm-next.

> Sure, I will at least start looking at your 50-patch as part of catching
> back up.  Do you want to process that on the mailing list or via
> https://gitlab.freedesktop.org/drm/msm/-/merge_requests/44?

I'd prefer to use email. The MR was open to doublecheck that nothing got 
broken on sc7180.

-- 
With best wishes
Dmitry

