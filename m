Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320E405C7C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 20:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815B06E8ED;
	Thu,  9 Sep 2021 18:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2716E8ED
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 18:01:00 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 95A573EBAE;
 Thu,  9 Sep 2021 20:00:57 +0200 (CEST)
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
 <2d25526f-dd9c-e336-970d-e8882f848d65@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <dcae0f15-8568-0b13-9d3c-b5641bdade10@somainline.org>
Date: Thu, 9 Sep 2021 20:00:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <2d25526f-dd9c-e336-970d-e8882f848d65@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Il 09/09/21 15:46, Dmitry Baryshkov ha scritto:
> On 08/09/2021 17:22, Jeffrey Hugo wrote:
>> On Wed, Sep 8, 2021 at 2:26 AM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> Hi,
>>>
>>> On Tue, 7 Sept 2021 at 22:13, Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>>>>
>>>> On Wed, Sep 1, 2021 at 12:11 PM AngeloGioacchino Del Regno
>>>> <angelogioacchino.delregno@somainline.org> wrote:
>>>>>
>>>>> Bringup functionality for MSM8998 in the DPU, driver which is mostly
>>>>> the same as SDM845 (just a few variations).
>>>>>
>>>>> Signed-off-by: AngeloGioacchino Del Regno 
>>>>> <angelogioacchino.delregno@somainline.org>
>>>>
>>>> I don't seem to see a cover letter for this series.
>>>>
>>>> Eh, there are a fair number of differences between the MDSS versions
>>>> for 8998 and 845.
>>>>
>>>> Probably a bigger question, why extend the DPU driver for 8998, when
>>>> the MDP5 driver already supports it[1]?  The MDP/DPU split is pretty
>>>> dumb, but I don't see a valid reason for both drivers supporting the
>>>> same target/display revision.  IMO, if you want this support in DPU,
>>>> remove it from MDP5.
>>>>
>>>> [1] 
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14&id=d6c7b2284b14c66a268a448a7a8d54f585d38785 
>>>>
>>>
>>> I don't think that we should enforce such requirements. Having support
>>> both in MDP5 and DPU would allow one to compare those two drivers,
>>> performance, features, etc.
>>> It might be that all MDP5-supported hardware would be also supported
>>> by DPU, thus allowing us to remove the former driver. But until that
>>> time I'd suggest leaving support in place.
>>
>> Well, then you have a host of problems to solve.
>>
>> Lets ignore the code duplication for a minute and assume we've gone
>> with this grand experiment.  Two drivers enter, one leaves the victor.
>>

I know you said let's ignore - but anyway, the code duplication is already
there: DPU1 supports most of the features that are supported by the MDP5
driver *anyway*, lacking support for the very very old hardware.

>> How are the clients supposed to pick which driver to use in the mean
>> time?  We already have one DT binding for 8998 (which the MDP5 driver
>> services).  This series proposes a second.  If we go forward with what
>> you propose, we'll have two bindings for the same hardware, which IMO
>> doesn't make sense in the context of DT, and the reason for that is to
>> select which driver is "better".  Driver selection is not supposed to
>> be tied to DT like this.
>>
>> So, some boards think MDP5 is better, and some boards think DPU is
>> better.  At some point, we decide one of the drivers is the clear
>> winner (lets assume DPU).  Then what happens to the existing DTs that
>> were using the MDP5 description?  Are they really compatible with DPU?
>>

I don't see any MSM8998 dts/dtsi file using mdp5 upstream anyway, so we wouldn't
even need to convert anything to using dpu1.

>>  From a DT perspective, there should be one description, but then how
>> do you pick which driver to load?  Both can't bind on the single
>> description, and while you could argue that the users should build one
>> driver or the other, but not both (thus picking which one at build
>> time), that doesn't work for distros that want to build both drivers
>> so that they can support all platforms with a single build (per arch).
> 
> Yep, the DT issue wasn't thought about from my side at the review time. I 
> considered qcom,msm8998-dpu as an extension/upgrade of bare qcom,mdp5 compatibility 
> string (as we usually add chip-specific compatibilities).
> 
> In fact using just 'qcom,mdp5' prevents us from having such kind of driver upgrades.
> 
> What I'd propose if everybody else agrees on moving 8998 (and maybe others later) 
> from MDP5 to DPU would be to continue supporting qcom,mdp5 binding in the mdp5 
> driver and to add qcom,msm8998-dpu binding used by the DPU driver. Maybe with the 
> warning telling to update the binding. Then at some point if all the MDP5-supported 
> hardware is supported by the DPU we can drop the MDP5 driver and implement required 
> bindings compatibility in the DPU.
> 

Since there's no upstream dtsi using mdp5, this problem practically does not exist.
In any case, removing MSM8998 support from mdp5 is probably a good idea.. dpu1 is
"more featureful" already, so it wouldn't really make sense to use mdp5 for a 8998
board right now.
I've also validated this on different 8998 devices with both command mode and video
mode panels (cmd on Sony Yoshino, video on FxTec Pro1) and they both work fine.

>>
>>  From where I sit, your position starts with a good idea, but isn't
>> fully thought out and leads to problems.
>>
>> If there is some reason why DPU is better for 8998, please enumerate
>> it.  Does DPU support some config that MDP5 doesn't, which is valuable
>> to you? 
> 
> The DPU receives more attention from both Qualcomm and Linaro, so it will continue 
> acquiring features (which MDP5 might not have at the moment).
> 
> For example consider the SmartDMA (multirect) support. For now the multirect 
> patchset it is limited to newer versions, but it might be extended to support older 
> chips (in the DPU) too. We did not have plans to backport SmartDMA v1 support to MDP5.
> 
> Writeback also has more chances to be supported in the DPU rather than in the MDP5 
> driver (I remember Rob's patches for the MDP5, but they never actually landed 
> upstream).
> 

Not to mention the probably coming PCC support (since DSPP is already supported on
DPU), and the fact that there's Display Stream Compression (DSC) support in the
works (I saw some patches around on LKML), which is actually needed by at least the
Sony Xperia XZ Premium (1080p scaled no dsc, or 4k non-scaled but needs dsc).

> Last but not least at this moment DPU has bandwidth scaling support, while MDP5 
> does not. I've sent a patch for MDP5 earlier, which then got reverted because of 
> armv7 support. At this moment I did not resend it since we found some underrun 
> issues on resume or when quickly changing bw down and up.
> 
>> I'm ok with ripping out the MDP5 support, the reason I didn't
>> go with DPU was that the DPU driver was clearly written only for 845
>> at the time, and needed significant rework to "downgrade" to an
>> earlier hardware.  However, the "reason" DPU exists separate from MDP5
>> is the claim that the MDP hardware underwent a significant
>> rearchitecture, and thus it was too cumbersome to extend MDP5.  While
>> I disagree with the premise, that "rearch" started with 8998.
> 
> Just checked, the SDE, the origin (or parent) of the DPU driver starts it's support 
> from the 8996 and 8998.
> 
> 
> 
> 

Yes you are correct, I saw the same downstream, even though I've never tried SDE on
MSM8996, on Sony downstream kernels we successfully use SDE on MSM8998 since we did
the porting on the newer kernel (not sure, I think that was 3.18).


Also, sorry for not being immediately ready to reply to my own patch series, my
days are a bit messy, currently.

Cheers,
- Angelo
