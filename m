Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AAC51059C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBE410E2B2;
	Tue, 26 Apr 2022 17:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6950310E03E;
 Tue, 26 Apr 2022 17:40:52 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gh6so13497699ejb.0;
 Tue, 26 Apr 2022 10:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=39WI8e9MaPtwFY3BU5vYG4JdpWLlNJ93HLnpo4B04GI=;
 b=pXvbv4zo49JQaB+hW9g4iXfuoZ9i90YISVmG2MzzVmhMh8tlRI2GlNk5DQ+toDgl5h
 lTLNDi2dpS/ggI7dmzbBWDKI/XT1Kb/MqruFpet7/8AFN7Q7trmyuCNdst6TZFXNjmS2
 T28yyjIfkO9MzeoZm/yJMEqN4tStppw/6CS9qq1ZFv79wE4Br+Z79EE+eIam3dChlK0S
 9Q6O61QC/bZNj8Donp2VqOWbSZU2QkCVMT2KeYiwU7ASJCqu6haSLhpuspRqCj1NgNex
 wQRpWamb7RFYvja0JY8+4NtDH7N0qEPNHS6TgZeko6zb4czuHkv69Za/0M8wfhZoES6+
 Oo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=39WI8e9MaPtwFY3BU5vYG4JdpWLlNJ93HLnpo4B04GI=;
 b=cLrpEHhYx5PyNfpMsqy7L/qo9EWn81SOwB7U+JhhX/in88mKjqRoqPpe7a/vGlEgJF
 C0ebmpSxKlsd6TQ8+2mhTE8l551SlvdRokL7cpVbNr1fPXTH/qCqxpXWu3VWEwhEjScO
 t+lIder82vJ7YL0CKiH8qrKQ03cwfUfklRfNlDzrVriNYmpTCeJ+l3IHurx/ZWE74UEz
 FRYhOkB4i2sa0sQ9VKzZv4eBcbmgeCL2a98iXd36ZGkpEO6uQnU2Q13+ymtPALJEgtaZ
 GzCCzjJZOUIA1Ehv5bomoyd5kuNxH/EzunYZamw30JPI28zS9lyrQM5gILBSQp++Bpiy
 r3WA==
X-Gm-Message-State: AOAM531pw9cakCD5Vw3l8AkxLUKn71Egm8wa/XbcgbRUwti6XBRAKQNa
 VXn0wbqddXTetajAq+BkrbzeDM5jci2SCpi3XBs=
X-Google-Smtp-Source: ABdhPJyTOt9N11WaJgYRYWkyR24Jh9AivZtJjPPrwNMZgQRcJfFlbnqNN/vLX5HRo3fMd7cs41zvVOz/axAGVu6HET4=
X-Received: by 2002:a17:907:9808:b0:6f3:89ed:279a with SMTP id
 ji8-20020a170907980800b006f389ed279amr13339749ejc.308.1650994850729; Tue, 26
 Apr 2022 10:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
 <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
 <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
 <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com>
In-Reply-To: <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 26 Apr 2022 10:40:39 -0700
Message-ID: <CAPaKu7Rny7pxsPA+cnow0d6PAD2YCb+b+j1_Di5gziyOVNLaYQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 10:20 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 19:16 schrieb Rob Clark:
> > On Tue, Apr 26, 2022 at 10:08 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 26.04.22 um 19:05 schrieb Rob Clark:
> >>> On Tue, Apr 26, 2022 at 9:42 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 26.04.22 um 18:32 schrieb Chia-I Wu:
> >>>>> On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote=
:
> >>>>>> In practice, trace_dma_fence_init called from dma_fence_init is go=
od
> >>>>>> enough and almost no driver calls trace_dma_fence_emit.  But drm_s=
ched
> >>>>>> and virtio both have cases where trace_dma_fence_init and
> >>>>>> trace_dma_fence_emit can be apart.  It is easier for visualization=
 tools
> >>>>>> to always use the more correct trace_dma_fence_emit when visualizi=
ng
> >>>>>> fence timelines.
> >>>>>>
> >>>>>> v2: improve commit message (Dmitry)
> >>>>>>
> >>>>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >>>>>> Cc: Rob Clark <robdclark@chromium.org>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> This has been reviewed.  Should we land it?
> >>>> No, there are still open discussions about it.
> >>> I think if it is needed for trace visualization, that is justificatio=
n
> >>> enough for me
> >>>
> >>> I don't really see otherwise how a generic trace visualization tool
> >>> like perfetto would handle the case that some fence timelines have
> >>> separate events but others do not.
> >> Well I just send a patch to completely remove the trace point.
> >>
> >> As I said it absolutely doesn't make sense to use this for
> >> visualization, that's what the trace_dma_fence_init trace point is goo=
d for.
I am a bit confused by this.  _emit and _signaled are a great way to
see how many fences are pending from cpu's point of view.  How does
_emit make no sense and _init is good instead?

Or is this just that _init is good enough most of the time?  (More below)

> >>
> >> The only use case is for debugging the GPU scheduler and we should
> >> probably introduce a separate GPU scheduler specific trace point for
> >> this instead if we should ever need it.
> > Hmm, AFAIU from Chia-I, virtgpu has a separation of init and emit..
> > OTOH if using separate events in these special cases is better, then
> > I'm ok with that and can revert this patch.  Chia-I is more familiar
> > with the visualization end of it, so I'll let him comment on whether
> > that is a workable approach.
>
> Interesting, I wasn't aware of the virtgpu separation of init and emit.
>
> But yes if there is really an use case for tracing this time stamp as
> well then we should probably have that use case specific.
>
> I just looked into the scheduler case a bit and found that even there we
> already have a different trace point for it, which is probably the
> reason why we never used trace_dma_fence_emit there.
Yeah, I am using drm_sched tracepoints in that case.
>
> So yes, there really isn't much reason I can see two have two separate
> trace points for every driver.
That sounds fair.  In any tool, it should be easy to see if a fence
timeline has _emit in addition to _init, and adapt accordingly.  We
can drop this patch.

A clarification that _emit is optional/redundant for most fence
timelines should be nicer than removing it though.

>
> Christian.
>
> >
> > BR,
> > -R
> >
> >> Regards,
> >> Christian.
> >>
> >>> BR,
> >>> -R
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> (Or, how do I check if it has landed?)
>
