Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24D510647
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B5510E885;
	Tue, 26 Apr 2022 18:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9927E10E65B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:04:34 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id l19so10416724ljb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tufCt4byBk3LeEDKkh/mC8U5Nhou08h/BKoICMK0GmI=;
 b=crVYUnuh24mOkyUpx+qDImncBz6JWXkQ3hqw20FmjmtUUK9peW+IgUTJmIkj1My6KE
 xYZsNWQOlPqTrNPin/oqF52o10VfAD2KThjCsoaeJj2r0VWkI6H4p63p26qdZElVH6zh
 jc05H+QVNrFGia260RsvfnkGQukqL7AAjiUYBdHQ/mVDz5Baq9DvMCEFDyGfuHkJ6n2R
 ROtdWNksOVMKQ4Xin0hCp5XfHbMYiYH5Cu4+DFuYLLcvHM+yzMqMG7dc4uHOIDVd5Nyt
 fm0kixb1YeR96Yv8wCyaiZijW0dWrm9C4ZTxsYMpliTCesEsANRv+cbX3HXJoQTbx6hz
 FXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tufCt4byBk3LeEDKkh/mC8U5Nhou08h/BKoICMK0GmI=;
 b=hM8f2ehjIcocXlkT3jo1qdqUF8J8OXr0b3BApK2ebac6Ac7Tjnu7qsF//90jsy7dky
 saGfcTRWspCTiWFvL3WxAqHtSyWr1Jej57J1gTBhe78chIh3kIKZUX8XG1nyO0WMnJen
 KicT32/ao352emvZWmSS10KNI9zLEoH7ejLYULhS29czpt1zWtS7ZVFsBKW43AmYxgko
 Jda5Ih48hzTZeSP1drHIbe9BddUKORqAz4EHOVKAdv+qszsdSpo0gvKS/hqe1YYPJX9R
 Ngry0qRZK6X0x4UA11HbubfOHsZb0KCLYvcaMVf76lI+R85nYF0H530KWnv70wlyYrhw
 yuxg==
X-Gm-Message-State: AOAM531lb/uqPbiV4mvnlasOYWHAcg+bzpLFrOYiULRJwvDrVfkNYX+h
 W3R4DL4cDdpx0gEro6WHn0+w9w==
X-Google-Smtp-Source: ABdhPJw5RAklH7SXLgSYk+EhZIYU91zA9CkrW8NLL2lhc3YisU6DNjKb3w+8zwUEltnqjz9MSuwsuA==
X-Received: by 2002:a2e:7f13:0:b0:247:ef72:9e8b with SMTP id
 a19-20020a2e7f13000000b00247ef729e8bmr15410498ljd.205.1650996272660; 
 Tue, 26 Apr 2022 11:04:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bi10-20020a05651c230a00b0024f13295d98sm593105ljb.63.2022.04.26.11.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 11:04:32 -0700 (PDT)
Message-ID: <a67dbe24-f15f-cc52-d2d8-22dca554caae@linaro.org>
Date: Tue, 26 Apr 2022 21:04:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: move add fail safe mode to
 dp_connector_get_mode()
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org>
 <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
 <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
 <9b331b16-8d1b-4e74-8fee-d74c4041f8d7@quicinc.com>
 <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
 <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com>
 <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
 <d3d1d0d5-d3e0-0777-5b20-cdf24697742d@quicinc.com>
 <CAD=FV=W2WPdiY2zq6JC_-10kOqzDuiUYQOdYbyRyw2k-fbXFXQ@mail.gmail.com>
 <eaedbc40-f8cb-aaf8-f335-ef48e3cf82cc@quicinc.com>
 <87a921db-c4bb-eb43-96c5-0bdb757c7df9@linaro.org>
 <CAD=FV=XNWCLxEcGdDOarsY5j7wQDcPP__VsMhpe_G4N1kL-gHg@mail.gmail.com>
 <fa751163-78e8-18ee-4441-c50e016ee8bf@linaro.org>
 <CAD=FV=W7FyKeJ4h6uAjQFWg=-Cn9r1+js+RUm_niGexJmcDu6A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=W7FyKeJ4h6uAjQFWg=-Cn9r1+js+RUm_niGexJmcDu6A@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2022 20:56, Doug Anderson wrote:
> Hi,
> 
> On Tue, Apr 26, 2022 at 10:44 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 26/04/2022 20:11, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Tue, Apr 26, 2022 at 10:01 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On 26/04/2022 18:37, Abhinav Kumar wrote:
>>>>> Hi Doug
>>>>>
>>>>> On 4/26/2022 8:20 AM, Doug Anderson wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Mon, Apr 25, 2022 at 8:35 PM Abhinav Kumar
>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>
>>>>>>> On 4/25/2022 7:18 PM, Doug Anderson wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On Mon, Apr 25, 2022 at 6:42 PM Abhinav Kumar
>>>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>>>> 2) When there was a valid EDID but no 640x480 mode
>>>>>>>>>>>
>>>>>>>>>>> This is the equipment specific case and the one even I was a bit
>>>>>>>>>>> surprised. There is a DP compliance equipment we have in-house
>>>>>>>>>>> and while
>>>>>>>>>>> validation, it was found that in its list of modes , it did not
>>>>>>>>>>> have any
>>>>>>>>>>> modes which chromebook supported ( due to 2 lanes ). But my
>>>>>>>>>>> understanding was that, all sinks should have atleast 640x480 but
>>>>>>>>>>> apparently this one did not have that. So to handle this DP
>>>>>>>>>>> compliance
>>>>>>>>>>> equipment behavior, we had to do this.
>>>>>>>>>>
>>>>>>>>>> That doesn't seem right. If there's a valid EDID and the valid EDID
>>>>>>>>>> doesn't contain 640x480, are you _sure_ you're supposed to be adding
>>>>>>>>>> 640x480? That doesn't sound right to me. I've got a tiny display in
>>>>>>>>>> front of me for testing that only has one mode:
>>>>>>>>>>
>>>>>>>>>>        #0 800x480 65.68 800 840 888 928 480 493 496 525 32000
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> As I had wrote, DRM core kicks in only when the count of modes is 0.
>>>>>>>>> Here what is happening is the count was not 0 but 640x480 was not
>>>>>>>>> present in the EDID. So we had to add it explicitly.
>>>>>>>>>
>>>>>>>>> Your tiny display is a display port display?
>>>>>>>>>
>>>>>>>>> I am referring to only display port monitors. If your tiny display is
>>>>>>>>> DP, it should have had 640x480 in its list of modes.
>>>>>>>>
>>>>>>>> My tiny display is actually a HDMI display hooked up to a HDMI to DP
>>>>>>>> (active) adapter.
>>>>>>>>
>>>>>>>> ...but this is a legal and common thing to have. I suppose possibly my
>>>>>>>> HDMI display is "illegal"?
>>>>>>>>
>>>>>>>> OK, so reading through the spec more carefully, I do see that the DP
>>>>>>>> spec makes numerous mentions of the fact that DP sinks _must_ support
>>>>>>>> 640x480. Even going back to DP 1.4, I see section "5.2.1.2 Video
>>>>>>>> Timing Format" says that we must support 640x480. It seems like that's
>>>>>>>> _intended_ to be used only if the EDID read fails, though or if we
>>>>>>>> somehow have to output video without knowledge of the EDID. It seems
>>>>>>>> hard to believe that there's a great reason to assume a display will
>>>>>>>> support 640x480 if we have more accurate knowledge.
>>>>>>>>
>>>>>>>> In any case, I guess I would still say that adding this mode belongs
>>>>>>>> in the DRM core. The core should notice that it's a DP connection
>>>>>>>> (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) and that 640x480 was
>>>>>>>> left out and it should add it. We should also make sure it's not
>>>>>>>> "preferred" and is last in the list so we never accidentally pick it.
>>>>>>>> If DP truly says that we should always give the user 640x480 then
>>>>>>>> that's true for everyone, not just Qualcomm. We should add it in the
>>>>>>>> core. If, later, someone wants to hide this from the UI it would be
>>>>>>>> much easier if they only needed to modify one place.
>>>>>>>>
>>>>>>>
>>>>>>> So I debugged with kuogee just now using the DP compliance equipment.
>>>>>>> It turns out, the issue is not that 640x480 mode is not present.
>>>>>>>
>>>>>>> The issue is that it is not marked as preferred.
>>>>>>>
>>>>>>> Hence we missed this part during debugging this equipment failure.
>>>>>>>
>>>>>>> We still have to figure out the best way to either mark 640x480 as
>>>>>>> preferred or eliminate other modes during the test-case so that 640x480
>>>>>>> is actually picked by usermode.
>>>>>>>
>>>>>>> Now that being said, the fix still doesn't belong in the framework. It
>>>>>>> has to be in the msm/dp code.
>>>>>>>
>>>>>>> Different vendors handle this failure case differently looks like.
>>>>>>>
>>>>>>> Lets take below snippet from i915 as example.
>>>>>>>
>>>>>>> 3361    if (intel_connector->detect_edid == NULL ||
>>>>>>> 3362        connector->edid_corrupt ||
>>>>>>> 3363        intel_dp->aux.i2c_defer_count > 6) {
>>>>>>> 3364            /* Check EDID read for NACKs, DEFERs and corruption
>>>>>>> 3365             * (DP CTS 1.2 Core r1.1)
>>>>>>> 3366             *    4.2.2.4 : Failed EDID read, I2C_NAK
>>>>>>> 3367             *    4.2.2.5 : Failed EDID read, I2C_DEFER
>>>>>>> 3368             *    4.2.2.6 : EDID corruption detected
>>>>>>> 3369             * Use failsafe mode for all cases
>>>>>>> 3370             */
>>>>>>> 3371            if (intel_dp->aux.i2c_nack_count > 0 ||
>>>>>>> 3372                    intel_dp->aux.i2c_defer_count > 0)
>>>>>>> 3373                    drm_dbg_kms(&i915->drm,
>>>>>>> 3374                                "EDID read had %d NACKs, %d
>>>>>>> DEFERs\n",
>>>>>>> 3375                                intel_dp->aux.i2c_nack_count,
>>>>>>> 3376                                intel_dp->aux.i2c_defer_count);
>>>>>>> 3377            intel_dp->compliance.test_data.edid =
>>>>>>> INTEL_DP_RESOLUTION_FAILSAFE;
>>>>>>
>>>>>
>>>>> The reason I pointed to this code is to give an example of how other
>>>>> drivers handle this test-case.
>>>>>
>>>>> We added this patch for 4.2.2.1 and 4.2.2.6 EDID test cases.
>>>>>
>>>>> The challenge here as found out from our discussion here was to mark a
>>>>> particular mode as preferred so that the Chrome usermode can pick it.
>>>>>
>>>>> Now whats happening with that there was always a possibility of two
>>>>> modes being marked as preferred due to this and so-on.
>>>>>
>>>>> We had a pretty long discussion last night and thought of all possible
>>>>> solutions but all of them look like a hack to us in the driver because
>>>>> we end up breaking other things due to this.
>>>>>
>>>>> So we decided that driver is not the place to handle this test case.
>>>>> Since we do have IGT support for chromebooks, we will handle both these
>>>>> test cases there as other vendors do the same way and it works.
>>>>>
>>>>>
>>>>>> Just because Intel DRM has its own solution for something doesn't mean
>>>>>> everyone else should copy them and implement their own solution. Up
>>>>>> until recently DP AUX backlights were baked into different DRM
>>>>>> drivers. A recent effort was made to pull it out. I think the Intel
>>>>>> DRM code was the "first one" to the party and it wasn't clear how
>>>>>> things should be broken up to share with other drivers, so mostly it
>>>>>> did everything itself, but that's not the long term answer.
>>>>>>
>>>>>> I'm not saying that we need to block your change on a full re-design
>>>>>> or anything, but I'm just saying that:
>>>>>>
>>>>>> * You're trying to implement a generic DP rule, not something specific
>>>>>> to Qualcomm hardware. That implies that, if possible, it shouldn't be
>>>>>> in a Qualcomm driver.
>>>>>>
>>>>>> * It doesn't seem like it would be terrible to handle this in the core.
>>>>>>
>>>>>>
>>>>>>> This marks the fail safe mode and IGT test case reads this to set this
>>>>>>> mode and hence the test passes.
>>>>>>>
>>>>>>> We rely on the chromeOS usermode to output pixel data for this test-case
>>>>>>> and not IGT. We use IGT only for video pattern CTS today but this is a
>>>>>>> different test-case which is failing.
>>>>>>>
>>>>>>> ChromeOS usermode will not pick 640x480 unless we mark it as preferred
>>>>>>> or other modes are eliminated.
>>>>>>>
>>>>>>> So we have to come up with the right way for the usermode to pick
>>>>>>> 640x480.
>>>>>>>
>>>>>>> We will discuss this a bit more and come up with a different change.
>>>>>>
>>>>>> Can you provide the exact EDID from the failing test case? Maybe that
>>>>>> will help shed some light on what's going on. I looked at the original
>>>>>> commit and it just referred to 4.2.2.1, which I assume is "EDID Read
>>>>>> upon HPD Plug Event", but that doesn't give details that seem relevant
>>>>>> to the discussion here.
>>>>>
>>>>> Yes so it is 4.2.2.1 and 4.2.2.6.
>>>>>
>>>>> That alone wont give the full picture.
>>>>>
>>>>> So its a combination of things.
>>>>>
>>>>> While running the test, the test equipment published only one mode.
>>>>> But we could not support that mode because of 2 lanes.
>>>>> Equipment did not add 640x480 to the list of modes.
>>>>> DRM fwk will also not add it because count_modes is not 0 ( there was
>>>>> one mode ).
>>>>> So we ended up making these changes.
>>>>
>>>> I think a proper solution might be to rewrite
>>>> drm_helper_probe_single_connector_modes() in the following way:
>>>> - call get_modes()
>>>> - validate the result
>>>> - prune invalid
>>>>
>>>> - if the number of modes is 0, call drm_add_override_edid_modes()
>>>> - validate the result
>>>> - prune invalid
>>>>
>>>> - if the number of modes is still 0, call drm_add_modes_noedid()
>>>> - validate the result
>>>> - prune invalid
>>>>
>>>> [A separate change might happen here after all the checks: if the number
>>>> of modes is still 0 and if it is a DP, enforce adding 640x480 even w/o
>>>> validation. But generally I feel that this shouldn't be necessary
>>>> because the previous step should have added it.]
>>>>
>>>> This way we can be sure that all modes are validated, but still to do
>>>> our best to add something supported to the list of modes.
>>>
>>> I'm partway through implementing / testing something similar to this.
>>> ;-) My logic is slightly different than yours, though. In the very
>>> least I'm not convinced that we want to add the higher resolution
>>> modes (like 1024x768) if all the modes fail to validate. The DP spec
>>> only claims 640x480 is always supported. The higher resolution modes
>>> are for when the EDID fails to read I think. Similarly I'm not
>>> convinced that we should do pruning before deciding on
>>> drm_add_override_edid_modes().
>>
>>
>> I think pruning before drm_add_override_edid_modes() would allow one to
>> use override if the first read returned some modes which are invalid.
> 
> Yeah, I'm less certain about drm_add_override_edid_modes(), but as per
> documented it's only to be used if the EDID failed to read.
> 
> If someone has an actual use case where they need to add the override
> modes for this specific case then we can, but I think it can be done
> separately once someone has an actual use case.
> 
> 
>> Regarding 1024 vs 640. For the restructure we shouldn't change this. And
>> I'd actually point to the following commit message:
>>
>> commit 9632b41f00cc2fb2846569cc99dbeef78e5c94a0
>> Author: Adam Jackson <ajax@redhat.com>
>> Date:   Mon Nov 23 14:23:07 2009 -0500
>>
>>       drm/modes: Fall back to 1024x768 instead of 800x600
>>
>>       This matches the X server's fallback modes when using RANDR 1.2.
>>
>>       See also: http://bugzilla.redhat.com/538761
>>
>>       Signed-off-by: Adam Jackson <ajax@redhat.com>
>>       Signed-off-by: Dave Airlie <airlied@redhat.com>
>>
>>
>> So I'd say, let's leave 1024 as is and just try them if all other modes
>> are invalid.
> 
> I'm pretty strongly against adding 1024x768 when all modes fail to
> validate. Specifically:
> 
> If the EDID fully fails to read then adding these higher resolution
> modes makes sense. We have no knowledge at all about the display in
> this case and so we can guess that some standard higher resolutions
> might make sense. In the case we're dealing with here, we have very
> specific knowledge about what the display said it could handle and we
> can't support any of them. The DP spec _only_ lists 640x480 as a
> required mode so that's the only one we should add.

Then this should be a DP-specific override happening after all the pruning.

-- 
With best wishes
Dmitry
