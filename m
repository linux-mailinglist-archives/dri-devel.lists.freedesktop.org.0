Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC344BA26
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 02:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4816E3B7;
	Wed, 10 Nov 2021 01:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226166E3B7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 01:58:32 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id v2so821458qve.11
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 17:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HqZCX1MCv43dkPkUD+9wFNRRgwIOAeVThyPIqXHsR2Y=;
 b=lrFpKxSt9B3R233SnxJPeqgxAfo/p6iplRPtzt1nBRyY9kgppfITLl/XSUavCZqw/l
 8rs0L1mqusVfI1jmdnFP5tPa1kBVyw5M/nA+JwcyolEg9GUpn6TmbED75TtGlpcCtpMr
 /7fG8OcHhvQFU2UKde+46ZJXBUy2x8HqbMnjVvnOV6Y9p9vBM32o/agmj107K0AfXrDg
 PL9CCa8oO6fk/1ncRPZsoXzFFfWQEhCFgcrofTFfDziwPCkpQ8ZbkpyaN4adZfwjis3m
 hVEZLzcesjIvFvY9O6C2Kc2/sRgY9ubnF17CYZdfBisBLBdE3e96mIbQ7RRAL6zHArbp
 Z9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HqZCX1MCv43dkPkUD+9wFNRRgwIOAeVThyPIqXHsR2Y=;
 b=QzYDCqIJmi1tMMJ4rDENP0UN0xu2jcqXyJ7GhJ6am82fP+3pOfU3kPN3PSZmDkPS9s
 SXCv0hfOUgwUdnwnbDTtn3rqAunGAS6YG1FAblkd5RLawbf/0+xEa0qAAuGzlNP2uA4s
 ZLEXw0LeKQMURAILKylzO0Fe7aXgf57/Eq/i0Lqy+GH9lcKPnw0M2moMeI4elAF5Z9V/
 rwHHU7Wv5PldTto5OUag4NoddIZWtaEdIjN9KL2wJ1ghZtwjuRxHZc7qfBy462Ub1abQ
 jpyrtoT+smRVm/RI6sQ1m8TvxaWRi1wQkeVOmnFM8ucaHuYsd1JxY/sLJNKMSeHRrkYZ
 9HFA==
X-Gm-Message-State: AOAM532Vlu4nDsGuj2joxSHyDMmy+GTA+SM64bZLRyVmC3ntx+SMDR82
 684ahHTp0M1wPYUzfqRmkU8vy1lQ3wOhWuMDBzArBw==
X-Google-Smtp-Source: ABdhPJzTCuDgwJ0uuBJD9MLiduF9ay+dCcYlRgUVJPUCQebCF6N3LvzjQUuFCtFt1YCmn2opuXxyrlj4IyApX21iJTw=
X-Received: by 2002:ad4:5def:: with SMTP id jn15mr5710516qvb.27.1636509511027; 
 Tue, 09 Nov 2021 17:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-17-dmitry.baryshkov@linaro.org>
 <3a48e580272ceb9d5d499455d8f35630@codeaurora.org>
 <CAA8EJpoKiu32oqGLpus-W8Z1ifKKVyAyOOp9kPF6NnxRLS6+fw@mail.gmail.com>
 <08150e6e9df2ebbbfee71b6b7f2ea395@codeaurora.org>
In-Reply-To: <08150e6e9df2ebbbfee71b6b7f2ea395@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Nov 2021 04:58:19 +0300
Message-ID: <CAA8EJppNnfK3Ra=fmpNRBxFmivnbW8hT3T9ckAy8xa0VCHwzHA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 16/22] drm/msm/dpu: do not limit the zpos
 property
To: abhinavk@codeaurora.org
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 at 04:35, <abhinavk@codeaurora.org> wrote:
>
> On 2021-11-09 12:21, Dmitry Baryshkov wrote:
> > On Tue, 9 Nov 2021 at 23:15, <abhinavk@codeaurora.org> wrote:
> >>
> >> On 2021-07-04 18:21, Dmitry Baryshkov wrote:
> >> > Stop limiting zpos property values, we use normalized_zpos anyway. And
> >> > nothing stops userspace from assigning several planes to a single zpos
> >> > (it is a userspace bug, but the kernel is forgiving about it).
> >>
> >> Userspace assigning several planes to a single zpos was intended to
> >> identify
> >> cases where src split can be used. Downstream does not use normalized
> >> zpos,
> >> hence it did not come across as a bug but mostly as a way to identify
> >> when
> >> usermode needs src split to be enabled based on the composition
> >> strategy.
> >>
> >> We can talk about that more in the rest of the patches of this series.
> >>
> >> For this one, I only have a couple of questions:
> >>
> >> 1) Across different vendors, some have gone with limiting the zpos and
> >> some have gone with
> >> the max, so is there an issue with sticking with the max_blend_stages
> >> limit?
> >>
> >> 2) If there is no hard reason to make this change, I think its better
> >> to
> >> keep it the way it is.
> >
> > Short answer to both questions: we want to have more planes than the
> > max_blend_stages. So we should remove the limit.
> >
> > Consider this to be a unification with MDP5, which uses 255 here.
>
> Alright, one minor comment below.
>
> Also, what you have mentioned now "wanting to have more planes than
> blend stages"
> should goto the commit text and the userspace bug part can be omitted as
> its technically
> isnt a bug but just the way we intended it to be.

It still is a bug. See
https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#plane-abstraction,
"zpos" description:
'User-space may set mutable zpos properties so that multiple active
planes on the same CRTC have identical zpos values. This is a
user-space bug...'

>
>
> >
> >>
> >> >
> >> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> > ---
> >> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +----------
> >> >  1 file changed, 1 insertion(+), 10 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> > index 8ed7b8f0db69..3850f2714bf3 100644
> >> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> > @@ -44,7 +44,6 @@
> >> >  #define DPU_NAME_SIZE  12
> >> >
> >> >  #define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
> >> > -#define DPU_ZPOS_MAX 255
> instead of getting rid of this, you can use this macro below where 255
> is hardcoded.

Ack

> >> >
> >> >  /* multirect rect index */
> >> >  enum {
> >> > @@ -1374,7 +1373,6 @@ struct drm_plane *dpu_plane_init(struct
> >> > drm_device *dev,
> >> >       struct dpu_plane *pdpu;
> >> >       struct msm_drm_private *priv = dev->dev_private;
> >> >       struct dpu_kms *kms = to_dpu_kms(priv->kms);
> >> > -     int zpos_max = DPU_ZPOS_MAX;
> >> >       uint32_t num_formats;
> >> >       int ret = -EINVAL;
> >> >
> >> > @@ -1412,14 +1410,7 @@ struct drm_plane *dpu_plane_init(struct
> >> > drm_device *dev,
> >> >
> >> >       pdpu->catalog = kms->catalog;
> >> >
> >> > -     if (kms->catalog->mixer_count &&
> >> > -             kms->catalog->mixer[0].sblk->maxblendstages) {
> >> > -             zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
> >> > -             if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
> >> > -                     zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
> >> > -     }
> >> > -
> >> > -     ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
> >> > +     ret = drm_plane_create_zpos_property(plane, 0, 0, 255);
> >> >       if (ret)
> >> >               DPU_ERROR("failed to install zpos property, rc = %d\n", ret);



-- 
With best wishes
Dmitry
