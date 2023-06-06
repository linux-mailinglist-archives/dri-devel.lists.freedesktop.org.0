Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE2872409E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 13:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34810E22F;
	Tue,  6 Jun 2023 11:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F67610E22F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 11:14:29 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-565cd2fc9acso65197457b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686050068; x=1688642068;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u/JpE1i6u3UyOCSwk7LIAsH+Du9jpLfkZSMYTXfJG3I=;
 b=FgIW/ISz5L/ObhQcPrKy49QeNqR3mBroqqS+wy7clcJ3QIRnx4IILlzIL7P/45WtWz
 nomye470QRmLCkgmC+J5G/thfqa5psVrhoon1bcwD0w/gl6P/hwPBMWDjz7HldoU9uEZ
 B0QmHyfD7EFnYp2kDFH+GLRZcliu5NMIb8GouJDAoW9Lv1cg6nUeXQjv600yY9BvoA+B
 EICaASFjVxMeljm5JX1ZSqFzxvqeFacelOOzZyiheFDzuF2JfGj/ADn1tJfr7ZMVNiSh
 qwgFAgKEtQ07qHEAgycVVVA49vWstKhODvcXtzd1RfV6epPaGIb7w6DhZcvQCC7Lht4P
 afcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686050068; x=1688642068;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u/JpE1i6u3UyOCSwk7LIAsH+Du9jpLfkZSMYTXfJG3I=;
 b=KqwrFD+lYsit4kOtEcA0N3eU0Eae9q0VhGc3QBU5uzSnNjgaWSDomz5FmgaBDEmx6N
 qhRyS/QHdFN3xhtjh3QLdf+Po+V6hSd/IbVqZ70c79HWfgCag58OEtHH7K3tf4ynWt7z
 l3wY8x/8lZ8SG64L3EQC8owH5VXXSIru0OMarWvDVwEN/tuRYlu27KwQAWOaZFYjtc7F
 EHy0fAvweM0n/6oeXc4gLz7Syv32Et+X3wnJ/BadB3FLVE1E48UmcnjeJQX/N+Jq20vo
 hubfJfBEmXFzKjVhuywVqqUaFZ2M8jqJrXBsZLF+iuD8mV92KxMZwwqo6vFUEoWzVnBv
 +wLw==
X-Gm-Message-State: AC+VfDyNriAHyBSL+syN6jmaEIaVM8Ae5uQnGLYEo21Zy7xkDjAGuuMI
 WsIdNZf7rwNO8Y8wF8zARwr1qPCTD72scq0z0AZcsA==
X-Google-Smtp-Source: ACHHUZ6eDhnU/z/JYiXN/UdObpxtsoiDAKWtnMH1n9IQ91ExOLpy9qqGrL2jYuFQHQq22Va53lhmznigmMXxoufIaQU=
X-Received: by 2002:a81:6dc6:0:b0:569:e7cb:c1d3 with SMTP id
 i189-20020a816dc6000000b00569e7cbc1d3mr2615624ywc.47.1686050067966; Tue, 06
 Jun 2023 04:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230531005358.18090-1-quic_abhinavk@quicinc.com>
 <CAA8EJpryw0h8TgpJ+SFJ7s0=LCjkQ6oqAjCKsm60dk_Q5e+wWA@mail.gmail.com>
 <0af4df3d-8048-98cd-6c91-7cd553f4f65f@quicinc.com>
 <98e4bda7-19e9-09b6-f008-383adada97cb@linaro.org>
 <a0b7a9fc-eb3c-3b26-b11d-fe1fb47b2c51@quicinc.com>
 <451b114c-05e1-541c-1d3e-26bb81a307c4@linaro.org>
 <47fda908-d76f-65d5-e001-8773c5b160b9@quicinc.com>
 <48cc3d26-10fe-5b10-30b6-0772d62a2a53@linaro.org>
 <804363cf-f6cf-71a6-be8f-5fc00eea3154@quicinc.com>
In-Reply-To: <804363cf-f6cf-71a6-be8f-5fc00eea3154@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Jun 2023 14:14:17 +0300
Message-ID: <CAA8EJprDSd79AXQvqW+=0xvTrTMCTL+CJ2E6Rhjro3g3E9UWog@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: re-introduce dpu core revision
 to the catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Jun 2023 at 05:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/5/2023 6:03 PM, Dmitry Baryshkov wrote:
> > On 06/06/2023 03:55, Abhinav Kumar wrote:
> >>
> >>
> >> On 6/3/2023 7:21 PM, Dmitry Baryshkov wrote:
> >>> On 31/05/2023 21:25, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 5/31/2023 3:07 AM, Dmitry Baryshkov wrote:
> >>>>> On 31/05/2023 06:05, Abhinav Kumar wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 5/30/2023 7:53 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Wed, 31 May 2023 at 03:54, Abhinav Kumar
> >>>>>>> <quic_abhinavk@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>> With [1] dpu core revision was dropped in favor of using the
> >>>>>>>> compatible string from the device tree to select the dpu catalog
> >>>>>>>> being used in the device.
> >>>>>>>>
> >>>>>>>> This approach works well however also necessitates adding catalog
> >>>>>>>> entries for small register level details as dpu capabilities and/or
> >>>>>>>> features bloating the catalog unnecessarily. Examples include but
> >>>>>>>> are not limited to data_compress, interrupt register set,
> >>>>>>>> widebus etc.
> >>>>>>>>
> >>>>>>>> Introduce the dpu core revision back as an entry to the catalog
> >>>>>>>> so that
> >>>>>>>> we can just use dpu revision checks and enable those bits which
> >>>>>>>> should be enabled unconditionally and not controlled by a catalog
> >>>>>>>> and also simplify the changes to do something like:
> >>>>>>>>
> >>>>>>>> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
> >>>>>>>>          enable the bit;
> >>>>>>>>
> >>>>>>>> Also, add some of the useful macros back to be able to use dpu core
> >>>>>>>> revision effectively.
> >>>>>>>>
> >>>>>>>> [1]:
> >>>>>>>> https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
> >>>>>>>>
> >>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  1 +
> >>>>>>>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  1 +
> >>>>>>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 31
> >>>>>>>> ++++++++++++++++++-
> >>>>>>>>   14 files changed, 43 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>
> >>>>>>> [skipped catalog changes]
> >>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>>>>> index 677048cc3b7d..cc4aa75a1219 100644
> >>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>>>>> @@ -19,6 +19,33 @@
> >>>>>>>>    */
> >>>>>>>>   #define MAX_BLOCKS    12
> >>>>>>>>
> >>>>>>>> +#define DPU_HW_VER(MAJOR, MINOR, STEP)\
> >>>>>>>> +                 ((((unsigned int)MAJOR & 0xF) << 28) |\
> >>>>>>>> +                 ((MINOR & 0xFFF) << 16) |\
> >>>>>>>> +                 (STEP & 0xFFFF))
> >>>>>>>> +
> >>>>>>>> +#define DPU_HW_MAJOR(rev)((rev) >> 28)
> >>>>>>>> +#define DPU_HW_MINOR(rev)(((rev) >> 16) & 0xFFF)
> >>>>>>>> +#define DPU_HW_STEP(rev)((rev) & 0xFFFF)
> >>>>>>>> +#define DPU_HW_MAJOR_MINOR(rev)((rev) >> 16)
> >>>>>>>> +
> >>>>>>>> +#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
> >>>>>>>> +(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
> >>>>>>>> +
> >>>>>>>> +#define DPU_HW_VER_300 DPU_HW_VER(3, 0, 0) /* 8998 v1.0 */
> >>>>>>>> +#define DPU_HW_VER_400 DPU_HW_VER(4, 0, 0) /* sdm845 v1.0 */
> >>>>>>>> +#define DPU_HW_VER_500 DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
> >>>>>>>> +#define DPU_HW_VER_510 DPU_HW_VER(5, 1, 1) /* sc8180 */
> >>>>>>>> +#define DPU_HW_VER_600 DPU_HW_VER(6, 0, 0) /* sm8250 */
> >>>>>>>> +#define DPU_HW_VER_620 DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
> >>>>>>>> +#define DPU_HW_VER_630 DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
> >>>>>>>> +#define DPU_HW_VER_650 DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
> >>>>>>>> +#define DPU_HW_VER_700 DPU_HW_VER(7, 0, 0) /* sm8350 */
> >>>>>>>> +#define DPU_HW_VER_720 DPU_HW_VER(7, 2, 0) /* sc7280 */
> >>>>>>>> +#define DPU_HW_VER_800 DPU_HW_VER(8, 0, 0) /* sc8280xp */
> >>>>>>>> +#define DPU_HW_VER_810 DPU_HW_VER(8, 1, 0) /* sm8450 */
> >>>>>>>> +#define DPU_HW_VER_900 DPU_HW_VER(9, 0, 0) /* sm8550 */
> >>>>>>>
> >>>>>>> Instead of having defines for all SoCs (which can quickly become
> >>>>>>> unmanageable) and can cause merge conflicts, I'd suggest inlining
> >>>>>>> all
> >>>>>>> the defines into respective catalog files.
> >>>>>>>
> >>>>>>
> >>>>>> Sure, that can be done.
> >>>>>>
> >>>>>>> Also, I'm not sure that the "step" should be a part of the
> >>>>>>> catalog. I
> >>>>>>> know that this follows the hardware revision. However, please
> >>>>>>> correct
> >>>>>>> me if I'm wrong, different step levels are used for revisions of the
> >>>>>>> same SoC. The original code that was reading the hw revision from
> >>>>>>> the
> >>>>>>> hardware register, listed both 5.0.0 and 5.0.1 for sm8150.
> >>>>>>>
> >>>>>>
> >>>>>> This is one of the things i noticed while making this change.
> >>>>>>
> >>>>>> Before the catalog rework, we used to handle even steps as we used
> >>>>>> to read that from the register and match it with the mdss_cfg
> >>>>>> handler. But after the rework, we dont handle steps anymore. Yes,
> >>>>>> you are right that different step levels are used for the
> >>>>>> revisions of the same SOC and so with that, i dont expect or
> >>>>>> atleast am not aware of DPU differences between steps but I am not
> >>>>>> able to rule it out.
> >>>>>>
> >>>>>> So are you suggesting we drop step altogether and DPU_HW_VER()
> >>>>>> macro shall only handle major and minor versions? With the current
> >>>>>> chipsets I see, it should not make a difference . Its just that I
> >>>>>> am not sure if that will never happen.
> >>>>>
> >>>>> Yes. The goal of this rework would be to drop generic features and
> >>>>> to replace those checks with DPU-revision lookups. Correct?
> >>>>
> >>>> Yes thats right.
> >>>>
> >>>>> I think that from this perspective having to handle toe step
> >>>>> revision is a sign of an overkill. Having to handle the step
> >>>>> revision is a sign of paltform feature (or mis-feature) rather than
> >>>>> a generic DPU bit.
> >>>>>
> >>>>
> >>>> Not entirely. Lets not forget that at the moment even dpu_perf_cfg
> >>>> is part of the catalog. Even if in terms of major HW blocks steps
> >>>> shouldnt change, there is absolutely no guarantee that perf data
> >>>> cannot.
> >>>>
> >>>> This is what is the sticking point for me which is holding me back
> >>>> against dropping step. Thoughts?
> >>>
> >>> We usually do not support ES versions of the chips, only the final
> >>> version. So supporting the perf data for earlier revisions is also
> >>> not required.
> >>>
> >>
> >> ack, we will drop step in that case. and good to know about the ES
> >> versions.
> >>
> >>>>
> >>>>> In fact I suppose that even handling a minor revision would be an
> >>>>> overkill. Why don't we start with .dpu_major instead of .core_rev?
> >>>>> We can add .dpu_minor if/when required.
> >>>>>
> >>>>
> >>>> No, unfortunately we cannot drop minor version for sure. I am seeing
> >>>> examples in downstream code where some of the features are available
> >>>> after a minor verion as well.
> >>>
> >>> Can you please give an example?
> >>>
> >>
> >> Yes, watchdog timer, intf reset counter are available only after DPU
> >> HW version 8.1 (not major version 8).
> >
> > Hmm, IIRC, wd timer was available for ages. Was it moved together with
> > the introduction of MDSS_PERIPH_0_REMOVED?
> >
>
> I am not sure of the timeline but its certainly tied to 8.1.
>
> > But anyway, I see your point. Let's have major and minor. I'd probably
> > still ask for the separate major and minor fields, if you don't mind.
> >
>
> hmmm so something like this?
>
> +#define DPU_HW_VER_300 DPU_HW_VER(3, 0) /* 8998 v1.0 */
>
> const struct dpu_mdss_cfg dpu_msm8998_cfg = {
> .......
> .dpu_major_rev = DPU_HW_MAJOR(DPU_HW_VER_300),
> .dpu_minor_rev = DPU_HW_MINOR(DPU_HW_VER_300)

Just:

const struct dpu_mdss_cfg dpu_msm8998_cfg = {
    .dpu_major_rev = 3,
    .dpu_minor_rev = 0,
    /* .... */
};

We do not need a single enumeration of all the versions. It can easily
become a source of merge conflicts.

> .......
> }
>
> But may I ask why? Since the manor/minor version macros handle this
> nicely for us.



-- 
With best wishes
Dmitry
