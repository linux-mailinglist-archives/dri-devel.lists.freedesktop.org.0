Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AD1405801
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 15:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E21B6E889;
	Thu,  9 Sep 2021 13:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024C96E88A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 13:46:29 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id t19so3803473lfe.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 06:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IcwFUmmVK4ypxuZB23EEwU2VdYJAuPPWgw97xtMQXeU=;
 b=RINgsBNhJnCucEyXqV3FOzzraqEYyxPdozRS9NKc72eAh06i1T6Gj5zxbFPIf9eG2I
 6JmenaLmC7P9DfI1SztdX6NWRzh5Qy2Lam0FGQhLsKOAm0rftefD7Q48aaec0NHKfil1
 M5fQiqk8iz1TDrGBR4hg2in/9UPakmlNJJW2HFfCtQBgAEwGxk0SlJ2r/1A528FCojRB
 2K89O0XOXJd7vkYBaKvyRfYq065zoCXx5ZLxdAFZx0A60a6UHr+T2QXotcAlVVyDzqsO
 V+pZwquUI98tXSDgn48q+J8ECzQ22N9/qyN/1nMZRn1xRHP91Jl/LMqdL/EhSIliWy5Z
 PHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IcwFUmmVK4ypxuZB23EEwU2VdYJAuPPWgw97xtMQXeU=;
 b=oSinZ3IcchIT0HofE9dsGSmQA7aXXUwHK0JJhD78tL5SNKzE3P8yedL//EH27R8+yy
 sIeqql5LZNZ5l8e5tJUWSJ2bzapjKBb1H213mWnJgVu/YxK5HjqjQdIkKH3lEvHEtxUB
 qCCUFgWqncK+s+ISXjtEXK2+opjJgpMuZ/OpsxXKkN3quNpr8VgtySRa1Im2JmQfzk1O
 prdaQA/GF9o91DSrQEOnmUBtnScKBix8weB4rUrczrp0IwgyHcR/YhWAuYYxr8n6d2w1
 2Ub6FbYlIpLT6i9uejiXhwR03jE7BCOM94U/ZrtpMjsYOEsPDf/ER9h/7bV9331vptR4
 yGaQ==
X-Gm-Message-State: AOAM531WqO/lTlFyVp3jG2/WcmPrW+5/rpivVmCwx8boT2GxHz0h7m8J
 2O+rNv5dwU6Qo/PW6zWpA44zEQ==
X-Google-Smtp-Source: ABdhPJyF6qKPZwa2rQgVlQLfXg7myYMb6+RC7nDu5gtDEdqGAda5fbEso5nkszPL4Y+XWmWjXZ0w4g==
X-Received: by 2002:ac2:5c0d:: with SMTP id r13mr2487808lfp.552.1631195188217; 
 Thu, 09 Sep 2021 06:46:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm205874lfr.72.2021.09.09.06.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 06:46:27 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, DTML <devicetree@vger.kernel.org>
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
 <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com>
 <CAA8EJpp6tj10A0QUR1E75t7BZf2Y3jHUyVNniYhEUd9rXj8Vrg@mail.gmail.com>
 <CAOCk7NqhuCJqh-u6ke=Mn=EPgHnc7C2RS_X1nSCg_Nc8An=yPA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2d25526f-dd9c-e336-970d-e8882f848d65@linaro.org>
Date: Thu, 9 Sep 2021 16:46:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOCk7NqhuCJqh-u6ke=Mn=EPgHnc7C2RS_X1nSCg_Nc8An=yPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2021 17:22, Jeffrey Hugo wrote:
> On Wed, Sep 8, 2021 at 2:26 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Hi,
>>
>> On Tue, 7 Sept 2021 at 22:13, Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>>>
>>> On Wed, Sep 1, 2021 at 12:11 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@somainline.org> wrote:
>>>>
>>>> Bringup functionality for MSM8998 in the DPU, driver which is mostly
>>>> the same as SDM845 (just a few variations).
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>>
>>> I don't seem to see a cover letter for this series.
>>>
>>> Eh, there are a fair number of differences between the MDSS versions
>>> for 8998 and 845.
>>>
>>> Probably a bigger question, why extend the DPU driver for 8998, when
>>> the MDP5 driver already supports it[1]?  The MDP/DPU split is pretty
>>> dumb, but I don't see a valid reason for both drivers supporting the
>>> same target/display revision.  IMO, if you want this support in DPU,
>>> remove it from MDP5.
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14&id=d6c7b2284b14c66a268a448a7a8d54f585d38785
>>
>> I don't think that we should enforce such requirements. Having support
>> both in MDP5 and DPU would allow one to compare those two drivers,
>> performance, features, etc.
>> It might be that all MDP5-supported hardware would be also supported
>> by DPU, thus allowing us to remove the former driver. But until that
>> time I'd suggest leaving support in place.
> 
> Well, then you have a host of problems to solve.
> 
> Lets ignore the code duplication for a minute and assume we've gone
> with this grand experiment.  Two drivers enter, one leaves the victor.
> 
> How are the clients supposed to pick which driver to use in the mean
> time?  We already have one DT binding for 8998 (which the MDP5 driver
> services).  This series proposes a second.  If we go forward with what
> you propose, we'll have two bindings for the same hardware, which IMO
> doesn't make sense in the context of DT, and the reason for that is to
> select which driver is "better".  Driver selection is not supposed to
> be tied to DT like this.
> 
> So, some boards think MDP5 is better, and some boards think DPU is
> better.  At some point, we decide one of the drivers is the clear
> winner (lets assume DPU).  Then what happens to the existing DTs that
> were using the MDP5 description?  Are they really compatible with DPU?
> 
>  From a DT perspective, there should be one description, but then how
> do you pick which driver to load?  Both can't bind on the single
> description, and while you could argue that the users should build one
> driver or the other, but not both (thus picking which one at build
> time), that doesn't work for distros that want to build both drivers
> so that they can support all platforms with a single build (per arch).

Yep, the DT issue wasn't thought about from my side at the review time. 
I considered qcom,msm8998-dpu as an extension/upgrade of bare qcom,mdp5 
compatibility string (as we usually add chip-specific compatibilities).

In fact using just 'qcom,mdp5' prevents us from having such kind of 
driver upgrades.

What I'd propose if everybody else agrees on moving 8998 (and maybe 
others later) from MDP5 to DPU would be to continue supporting qcom,mdp5 
binding in the mdp5 driver and to add qcom,msm8998-dpu binding used by 
the DPU driver. Maybe with the warning telling to update the binding. 
Then at some point if all the MDP5-supported hardware is supported by 
the DPU we can drop the MDP5 driver and implement required bindings 
compatibility in the DPU.

> 
>  From where I sit, your position starts with a good idea, but isn't
> fully thought out and leads to problems.
> 
> If there is some reason why DPU is better for 8998, please enumerate
> it.  Does DPU support some config that MDP5 doesn't, which is valuable
> to you? 

The DPU receives more attention from both Qualcomm and Linaro, so it 
will continue acquiring features (which MDP5 might not have at the moment).

For example consider the SmartDMA (multirect) support. For now the 
multirect patchset it is limited to newer versions, but it might be 
extended to support older chips (in the DPU) too. We did not have plans 
to backport SmartDMA v1 support to MDP5.

Writeback also has more chances to be supported in the DPU rather than 
in the MDP5 driver (I remember Rob's patches for the MDP5, but they 
never actually landed upstream).

Last but not least at this moment DPU has bandwidth scaling support, 
while MDP5 does not. I've sent a patch for MDP5 earlier, which then got 
reverted because of armv7 support. At this moment I did not resend it 
since we found some underrun issues on resume or when quickly changing 
bw down and up.

> I'm ok with ripping out the MDP5 support, the reason I didn't
> go with DPU was that the DPU driver was clearly written only for 845
> at the time, and needed significant rework to "downgrade" to an
> earlier hardware.  However, the "reason" DPU exists separate from MDP5
> is the claim that the MDP hardware underwent a significant
> rearchitecture, and thus it was too cumbersome to extend MDP5.  While
> I disagree with the premise, that "rearch" started with 8998.

Just checked, the SDE, the origin (or parent) of the DPU driver starts 
it's support from the 8996 and 8998.




-- 
With best wishes
Dmitry
