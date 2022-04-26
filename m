Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8448151050E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3884310E8F7;
	Tue, 26 Apr 2022 17:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7834A10E8F2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:16:16 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so2681545pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8N/olBTMX6m2KUUfwtQ/PQwAKnFQsB+gSNHy/8mAD9w=;
 b=AKGMRsMmiks1knJFd2PZ6g/1E9nVWMxzXSqrwc7WuhfPeQB2bQ4wRPb6QkLNH1IrQo
 OgttFPiz12UD5hekpy79aLb3Zss+hWHOzNo5BFOpuQoqwUYZJsrtbHkYcUdSKdaMvpAg
 SOFCK0D9MpK3FCz0QsbJUckFULIua1Vo01uSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8N/olBTMX6m2KUUfwtQ/PQwAKnFQsB+gSNHy/8mAD9w=;
 b=HtYAmZqQc9uEUL32EdeRNX6MwUZeA++N8CXvd+bAFZLnDW69LdtOUV5oi72ZQoBuaI
 wlgU8je6XeGAO4bO8NmwkJJ4Am6hvuRdf7zmoJqWHWa82GY3/0z1RDkXrWpOseu1UMAf
 YPQjmDbREuhyWubnbZ/W0fPYMkUIqUZvtU9GIiNmfZGF/8A4EoO5WuMzjCaQaeDmOHuC
 Moh6MkwjSkWk+29c4Zjx5Mcv/RQL551r0nHcoozYaNY2K045saV3os3EeTYHDQDK+rYg
 F0BhPmW0L24C1vrzN+e2yqVYCO9tXAbhG7fuFg8C/mDpyn3rxPy0ZYsSD6fak/D7l/p3
 mDnQ==
X-Gm-Message-State: AOAM531AtCO7//nikbD/YEuTFVI0GRJ9V6ZIISfhvEEq8tNxQSbRkvaN
 erU0Q75DonZBRQy2kX4TgiJ8PRkRnGNGCkDhQS5PSA==
X-Google-Smtp-Source: ABdhPJwQYJDMG4HHGAXB69CyOV61s/x5aYmAWxELbcZ3/zM7/HAB4j4xfRf0ycAWJ4779M3CqzvSkF6k96srobeqZh4=
X-Received: by 2002:a17:902:ea4f:b0:158:5013:1403 with SMTP id
 r15-20020a170902ea4f00b0015850131403mr24232493plg.75.1650993376099; Tue, 26
 Apr 2022 10:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
 <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
In-Reply-To: <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 26 Apr 2022 10:16:05 -0700
Message-ID: <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 10:08 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 19:05 schrieb Rob Clark:
> > On Tue, Apr 26, 2022 at 9:42 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 26.04.22 um 18:32 schrieb Chia-I Wu:
> >>> On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> >>>> In practice, trace_dma_fence_init called from dma_fence_init is good
> >>>> enough and almost no driver calls trace_dma_fence_emit.  But drm_sch=
ed
> >>>> and virtio both have cases where trace_dma_fence_init and
> >>>> trace_dma_fence_emit can be apart.  It is easier for visualization t=
ools
> >>>> to always use the more correct trace_dma_fence_emit when visualizing
> >>>> fence timelines.
> >>>>
> >>>> v2: improve commit message (Dmitry)
> >>>>
> >>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >>>> Cc: Rob Clark <robdclark@chromium.org>
> >>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> This has been reviewed.  Should we land it?
> >> No, there are still open discussions about it.
> > I think if it is needed for trace visualization, that is justification
> > enough for me
> >
> > I don't really see otherwise how a generic trace visualization tool
> > like perfetto would handle the case that some fence timelines have
> > separate events but others do not.
>
> Well I just send a patch to completely remove the trace point.
>
> As I said it absolutely doesn't make sense to use this for
> visualization, that's what the trace_dma_fence_init trace point is good f=
or.
>
> The only use case is for debugging the GPU scheduler and we should
> probably introduce a separate GPU scheduler specific trace point for
> this instead if we should ever need it.

Hmm, AFAIU from Chia-I, virtgpu has a separation of init and emit..
OTOH if using separate events in these special cases is better, then
I'm ok with that and can revert this patch.  Chia-I is more familiar
with the visualization end of it, so I'll let him comment on whether
that is a workable approach.

BR,
-R

> Regards,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> Regards,
> >> Christian.
> >>
> >>> (Or, how do I check if it has landed?)
>
