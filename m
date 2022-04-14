Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2B501C8E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 22:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716C010E2C1;
	Thu, 14 Apr 2022 20:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2138710E2C1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 20:21:05 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id bn33so7426879ljb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 13:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W3Tk74L2ir68zakq4v8zlWdg5BrR7HZyOAvpDgySkc4=;
 b=ABYSQIEkXuWiJt6eDgMBaIhFrF6vy5f62wq+5X9uwXzBujfUD/V+Frqyu4X5V62jSS
 TXd3MAa0wYWVU/7nqaJE+DHSyQovq/bDUk+COAF1qJp8Om9bT+2iPdrzkVmO6Ad/FfAI
 kDWkkcR97WyhvBhJTIZZxBIPpqAFGsWM5bn1Sx0tHFPg7VIRmRu68yu7i1Ms3Q2z1aqD
 XGXuFd3V7EL1qBt/mkun8X3lEX3paECWJ+FVAOcs+BNcohR21jvuLTxNCpALXSQZeWpK
 qnG8cxwAslWb77Qy1NHvpoCwHnWaqUtXM+1fHb6R4BT0z9OHQdmHHqFW6xDPo/FrACb7
 Scsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W3Tk74L2ir68zakq4v8zlWdg5BrR7HZyOAvpDgySkc4=;
 b=Dr8jG2fH8AbVVnnp5EInJNPnpZy0PJ5cG5daGKyXkg0a/EX9Zn/hFLcHKRFGHWFu4P
 104n9yksBWVqLi9boOCkyXN+9rEGzas2jp3uPrDlH3JtSuPIWCHv/lbELjZ2I539VVjE
 HNg0ZnbIkIlo4eZTnNITFjo5INA1yDDxzuTeRFNH+dbadSrwhuWteMNXEBvhMK/tNvOG
 NyZK34s1EDSeOFfYpRqnqYUKw2NKglyIzNZ4Bqm6hVYLC6bvpau6F/hpLwUYtYWDGnso
 gJXiduH4mh8MPbirX9qtRsDh3sWsLh63pKQMWH1tlKfG5hBbArhFVTgxUyZaCND9d3Cy
 PsoA==
X-Gm-Message-State: AOAM532S3gc1WdVqu7VvdYpa2DPEzRlOdeFoNLUusahK7Y/frQ8jHDYn
 6CDl0idRKsPB/AZ+fXmfkNndYQ==
X-Google-Smtp-Source: ABdhPJwq6E9Dm9JeRvDM83qfLCCNL3VKPy7UV1MWmncbBh5UHeTupvI8MtlR29m8KOd7amcA61BLDA==
X-Received: by 2002:a2e:97d2:0:b0:24b:5802:9ebc with SMTP id
 m18-20020a2e97d2000000b0024b58029ebcmr2544323ljj.521.1649967663374; 
 Thu, 14 Apr 2022 13:21:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a0565123da800b0044aa117f1aasm99577lfv.119.2022.04.14.13.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:21:03 -0700 (PDT)
Message-ID: <71582688-d26a-04f0-350b-38a4fcaf86c2@linaro.org>
Date: Thu, 14 Apr 2022 23:21:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Freedreno] [PATCH v7 0/4] Add support for the eDP panel over
 aux_bus
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
 <20afcd97-4b8d-f770-151a-268b893b7c5a@linaro.org>
 <CAE-0n51fc-b-8VF7XP29=o8Xi86HQALGB-1u8n3b_3NjVyyJYw@mail.gmail.com>
 <e3154f3b-aea4-6961-b409-6b20ff8bf18e@quicinc.com>
 <2fd4a157-a9de-ca0e-7a47-7bb85199ae91@linaro.org>
 <bc3a3162-b34d-bff3-2109-e2fd0bc65bb4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bc3a3162-b34d-bff3-2109-e2fd0bc65bb4@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2022 23:19, Abhinav Kumar wrote:
> 
> 
> On 4/14/2022 1:03 PM, Dmitry Baryshkov wrote:
>> On 14/04/2022 23:00, Abhinav Kumar wrote:
>>> Hi Dmitry
>>>
>>> On 4/14/2022 12:43 PM, Stephen Boyd wrote:
>>>> Quoting Dmitry Baryshkov (2022-04-14 12:20:31)
>>>>> On 14/04/2022 19:40, Doug Anderson wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Thu, Apr 14, 2022 at 5:19 AM Sankeerth Billakanti
>>>>>> <quic_sbillaka@quicinc.com> wrote:
>>>>>>>
>>>>>>> This series adds support for generic eDP panel over aux_bus.
>>>>>>>
>>>>>>> These changes are dependent on the following series:
>>>>>>> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=* 
>>>>>>>
>>>>>>
>>>>>> You're basically depending on the last two patches of that series.
>>>>>> What's the plan there? In patchwork they're marked as "Not
>>>>>> Applicable". If they're good to go, maybe we should land them? If 
>>>>>> not,
>>>>>> maybe you should include them (with Dmitry as the author, of course)
>>>>>> at the beginning of your series?
>>>>>
>>>>> No, please do not resend patches. The patches in question are 
>>>>> marked as
>>>>> 'Not applicable' as they are really not applicable to Bjorn's tree.
>>>>> It would be better to point to the correct patchwork:
>>>>>
>>>>> https://patchwork.freedesktop.org/series/98585/
>>>>>
>>>>> Note those patches still lack the R-B tag. I can include them anyway,
>>>>> basing on Sankeerth's Tested-by tag, but the formal R-B would also 
>>>>> be good.
>>>>>
>>>>
>>>> Can you resend those as not RFC?
>>>
>>> Yes, please resend these, I can ack them.
>>>
>>> Previously I held off my ack, as kuogee ran into some issues testing 
>>> them which was later concluded to be a mismatch in QC internal trees 
>>> due to different versions of the changes.( another reason why we 
>>> should get these landed ).
>>>
>>> Now, that Sankeerth has tested these, if you can remove RFC and post 
>>> them, I can ack the.
>>
>> Well, you can ack those patches without them being resent. You have 
>> already added your Reviewed-by to first three patches (which were 
>> merged during last window).
>>
> I thought you might have to rebase them :) that way you could have 
> resent the rebased patch with the RFC tag removed.
> 
> If you dont, you now have my R-b.

Thank you!

-- 
With best wishes
Dmitry
