Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB5D73774C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 00:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B67D10E050;
	Tue, 20 Jun 2023 22:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF64110E050
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 22:11:17 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-bd61dd9a346so5256690276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687299076; x=1689891076;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CO8OejPC4gZPbUKY20BuZtiY+JX/he1vANgb25qIZbQ=;
 b=fE85Zrqy3r+kdR8ArHB/hTwzAJCRL3cxC7Bqrp9pSD9NxadKuWpGfoSXOaTM5fhCNU
 N41+vFxRLZbuLnx/3iSPkGVT7Tibyqb3LhVJToc2zB88jQ1cq5IVQumA99Algn8tmXMN
 uCb7p/2Lx2+YGQFqFF3YHHrR0nVBDr2GppheKlx2Io4tXo5XSpvP1e/fkwFvP0PFB82K
 9ERAJQEBAIm32J2pbItz+7q4y/5mefWVIy+h5B0pN0ZshrFFKU7pjr2U5dXPd9O/0XeD
 lVO/+s8rJhEjo1USkfSWx6hmKCZIhiVLjo2TFsycpbLVEBi95a2vYKKToDq7a+xGLMpG
 ohKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687299076; x=1689891076;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CO8OejPC4gZPbUKY20BuZtiY+JX/he1vANgb25qIZbQ=;
 b=iX5kDO+rGQTgkGYOCXbrRSlMGHv+d9cTr0GmLLpvrhx53dexzfp4vKClFK72zDD+ZP
 SNljO3u4aJJ1TFGBqeWKKY1IHAzK8+ifTiAdh6KwY1bGeAk6+oNYpZqnQy8LsnOftsBl
 nf2nPBokr8Rw35SFMK1yj+AoCIOVUOVxbHL1FxfaOHjI2rQQ+PIiRRUt6CipCGV1spYI
 0YlMigI9HAz8Nsipqxe5oLRtb9O59jhm0GZz7fUmbuCafv7SbcwaNFdkmkZSmZW45MtJ
 UBNalJEVk3HjDM+JW4rRv41Jqb5HmWqfPzmohYsaAAJ1WSXEBQER3til09+ScM8JNNKT
 iA+g==
X-Gm-Message-State: AC+VfDx6nibHOxBjJzij2h+dj77XBBWDQUA5x6iNTAgbuV5DY/HEv1hc
 Q7qujuOO9d8YJBkbKMu2oZs9Apusl6qydMp8IUIiGw==
X-Google-Smtp-Source: ACHHUZ7fDE/rhQSyqOpD/BAWYftdNsswcG/R8gyuckSNMsS8k6rkqW5n1rTgRj17TRg5ZHST0ZFDpaevX5ayDwfzcMs=
X-Received: by 2002:a25:ac20:0:b0:bff:bcc:a51e with SMTP id
 w32-20020a25ac20000000b00bff0bcca51emr92081ybi.19.1687299076560; Tue, 20 Jun
 2023 15:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
 <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
 <e23de804-060d-3278-5045-1ed03f0de80d@quicinc.com>
 <c5cfc132-effb-8269-ac5d-ed8c988d1a16@quicinc.com>
 <08b6aaf4-6edd-4f41-5d98-11ffc27e766e@quicinc.com>
 <6d11e420-1b95-0029-ec7a-17fbc8acb5ca@linaro.org>
 <827875ad-a446-10e7-6608-f9b0fa830a00@quicinc.com>
 <2b01b53a-9d8a-3b7d-d1bd-7d25eb77a9c0@linaro.org>
 <6ebab21c-5b1a-f9d7-e0c6-6a091e27761a@quicinc.com>
In-Reply-To: <6ebab21c-5b1a-f9d7-e0c6-6a091e27761a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Jun 2023 01:11:05 +0300
Message-ID: <CAA8EJpoqnW08rtx0T5OhOUs5+5k8jgza7sLwqwqyU2_o-wH1cg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN
 feature flag for DPU >= 5.0
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jun 2023 at 00:37, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 6/16/2023 5:37 PM, Dmitry Baryshkov wrote:
> > On 17/06/2023 00:10, Abhinav Kumar wrote:
> >>
> >>
> >> On 6/14/2023 1:43 PM, Dmitry Baryshkov wrote:
> >>> On 14/06/2023 23:39, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 6/14/2023 12:54 PM, Abhinav Kumar wrote:
> >>>>>
> >>>>>
> >>>>> On 6/14/2023 12:35 PM, Abhinav Kumar wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 6/14/2023 5:23 AM, Marijn Suijten wrote:
> >>>>>>> On 2023-06-14 15:01:59, Dmitry Baryshkov wrote:
> >>>>>>>> On 14/06/2023 14:42, Marijn Suijten wrote:
> >>>>>>>>> On 2023-06-13 18:57:11, Jessica Zhang wrote:
> >>>>>>>>>> DPU 5.x+ supports a databus widen mode that allows more data
> >>>>>>>>>> to be sent
> >>>>>>>>>> per pclk. Enable this feature flag on all relevant chipsets.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>>>>>> ---
> >>>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
> >>>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
> >>>>>>>>>>    2 files changed, 4 insertions(+), 1 deletion(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>>>>>> index 36ba3f58dcdf..0be7bf0bfc41 100644
> >>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>>>>>> @@ -103,7 +103,8 @@
> >>>>>>>>>>        (BIT(DPU_INTF_INPUT_CTRL) | \
> >>>>>>>>>>         BIT(DPU_INTF_TE) | \
> >>>>>>>>>>         BIT(DPU_INTF_STATUS_SUPPORTED) | \
> >>>>>>>>>> -     BIT(DPU_DATA_HCTL_EN))
> >>>>>>>>>> +     BIT(DPU_DATA_HCTL_EN) | \
> >>>>>>>>>> +     BIT(DPU_INTF_DATABUS_WIDEN))
> >>>>>>>>>
> >>>>>>>>> This doesn't work.  DPU 5.0.0 is SM8150, which has DSI 6G 2.3.
> >>>>>>>>> In the
> >>>>>>>>> last patch for DSI you state and enable widebus for DSI 6G 2.5+
> >>>>>>>>> only,
> >>>>>>>>> meaning DPU and DSI are now desynced, and the output is completely
> >>>>>>>>> corrupted.
> >>>>>>>
> >>>>
> >>>> I looked at the internal docs and also this change. This change is
> >>>> incorrect because this will try to enable widebus for DPU >= 5.0 and
> >>>> DSI  >= 2.5
> >>>>
> >>>> That was not the intended right condition as thats not what the docs
> >>>> say.
> >>>>
> >>>> We should enable for DPU >= 7.0 and DSI >= 2.5
> >>>>
> >>>> Is there any combination where this compatibility is broken? That
> >>>> would be the strange thing for me ( not DPU 5.0 and DSI 2.5 as that
> >>>> was incorrect)
> >>>>
> >>>> Part of this confusion is because of catalog macro re-use again.
> >>>>
> >>>> This series is a good candidate and infact I think we should only do
> >>>> core_revision based check on DPU and DSI to avoid bringing the
> >>>> catalog mess into this.
> >>>
> >>> I have just a single request here: can we please have the same
> >>> approach for both DSI and DP? I don't mind changing DP code if it
> >>> makes it better. If you don't have better reasons, I like the idea of
> >>> DSI/DP dictating whether wide bus should be used on the particular
> >>> interface. It allows us to handle possible errata or corner cases
> >>> there. Another option would be to make DPU tell DSI / DP whether the
> >>> wide bus is enabled or not, but I'd say, this is slightly worse
> >>> solution.
> >>>
> >>
> >> Today, DP's widebus does not check if DPU supports that or not.
> >>
> >> DPU encoder queries the DP whether widebus is available and enables it.
> >>
> >> We can also do the same thing for DSI.
> >>
> >> So for intf_type of DSI, DPU encoder will query DSI if it supports
> >> widebus.
> >
> > Not if it supports wide bus. But the check is whether enabling wide bus
> > is requested by the output driver (DSI/DP).
>
> Hi Dmitry,
>
> Can you explain what you mean by "requested by output driver"? FWIW, if
> the DSI version supports wide bus && if DSC is enabled, then wide bus
> will be enabled in DSI.

Like for DP, let DSI select whether a wide bus should be enabled or
not, then let DPU get this flag from DSI.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>
> >> Then DSI will do its version checks and for DSC it will say yes.
> >>
> >> This way, we will never check for the DPU's core revision for DSI and
> >> purely rely of DP/DSI's hw revisions.
> >>
> >> Thats fine with me because that way we again just rely on the hw
> >> revision to enable the feature.
> >>
> >> But as a result I am still going to drop this patch which adds widebus
> >> to the catalog as a dpu cap which I always wanted to do anyway as we
> >> will just rely on the DSI and DP hw revisions.
> >
> > Yep.
> >
> >>
> >>>>
> >>>>>>> Tested this on SM8350 which actually has DSI 2.5, and it is also
> >>>>>>> corrupted with this series so something else on this series might be
> >>>>>>> broken.
> >>>>>>>
> >>>>>
> >>>>> Missed this response. That seems strange.
> >>>>>
> >>>>> This series was tested on SM8350 HDK with a command mode panel.
> >>>>>
> >>>>> We will fix the DPU-DSI handshake and post a v2 but your issue
> >>>>> needs investigation in parallel.
> >>>>>
> >>>>> So another bug to track that would be great.
> >>>>>
> >>>>>>>>> Is the bound in dsi_host wrong, or do DPU and DSI need to
> >>>>>>>>> communicate
> >>>>>>>>> when widebus will be enabled, based on DPU && DSI supporting it?
> >>>>>>>>
> >>>>>>>> I'd prefer to follow the second approach, as we did for DP. DPU
> >>>>>>>> asks the
> >>>>>>>> actual video output driver if widebus is to be enabled.
> >>>>>>>
> >>>>>>
> >>>>>> I was afraid of this. This series was made on an assumption that
> >>>>>> the DPU version of widebus and DSI version of widebus would be
> >>>>>> compatible but looks like already SM8150 is an outlier.
> >>>>>>
> >>>>>> Yes, I think we have to go with second approach.
> >>>>>>
> >>>>>> DPU queries DSI if it supports widebus and enables it.
> >>>>>>
> >>>>>> Thanks for your responses. We will post a v2.
> >>>>>>
> >>>>>>> Doesn't it seem very strange that DPU 5.x+ comes with a widebus
> >>>>>>> feature,
> >>>>>>> but the DSI does not until two revisions later?  Or is this
> >>>>>>> available on
> >>>>>>> every interface, but only for a different (probably DP) encoder
> >>>>>>> block?
> >>>>>>>
> >>>>>>
> >>>>>> Yes its strange.
> >>>>>>
> >>>>
> >>>> I have clarified this above. Its not strange but appeared strange
> >>>> because we were checking wrong conditions.
> >>>>
> >>>>
> >>>>>>> - Marijn
> >>>
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
