Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562544EE140
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 21:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A8410E48A;
	Thu, 31 Mar 2022 19:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE11E10E0E5;
 Thu, 31 Mar 2022 19:01:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d7so1060567wrb.7;
 Thu, 31 Mar 2022 12:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T9+AkiW/4h4A1Ms4Miaw1I42u6H5Nq21dOfaVBmxDOY=;
 b=YhXQSDQNFt1PUyiQir/KzfA2QkhaB5iXoDEQqrvlYnBuvliALMKTvUF/Tst9kBbB4J
 3SNayKANcUSbmkrIBfOB11eokDrjDFeazk5bLvOuuZ4y8rx4zeCDpIi026N2sJjKSBvO
 MLyPRQCBNRqwW41BtETq9xWEHbm8pmQeI5NYZJD57XBOlNH+RELCfvheG81DDNXbfrW5
 9V51RZJSTRfoGOfhBH/9emqzBACiqYXX7x+tMVXyOuVUUFOwQZ2CpUr+Isk4MflSzgt/
 lC6ridW1AAiN1lJPO3jwMQmplC3eS2daZ4s+pQGQBaxFHIrfLJFYlsbAsQptf933E6Ba
 kSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T9+AkiW/4h4A1Ms4Miaw1I42u6H5Nq21dOfaVBmxDOY=;
 b=Sf5T1x+l34h3HFFvzf2Qy2ao/xV/RwrGCvanOPDZECg6T/8/H3Ugn1qoR6B+qxg8EN
 Q0bn+tzuMdOG7eLgA8FbKAqXIblvsmqMTPOOD0LhdW4koU9Jpckg4/YcEiQUS1RWhNky
 aXNODYfUquYq0F5LID7XLtAILK8ok/n2XGcyPopo3hrIT9la749plwq54L+LctHe8cN1
 HQuMk/Btlw980C+rNmOHWJ0xdBv0+gbYKHOXPgLGznu4xjZQVCqIxEMd9/yuOSt2QykC
 n6eaWITO/QVBytEQy8V/1pLtIG42vOG7X7syvbjS+HlsPv14xeyWnUiV1o2ELMrjvahT
 K8nA==
X-Gm-Message-State: AOAM533DfR1+eC0LQ4eUarjReqreVn4C779KCqi9Vv7+lscCWWRHG3VK
 LQgnuqirYe9TMK0304n1ONyiSK2ffxiTsx/BruI=
X-Google-Smtp-Source: ABdhPJwX9ypiRh4trrEQoi/7vM1BBV0U8zxJnGyxDNIWxKMhout7D4Lj2PJ5oVdWZLsHo820nf/TSIMiwiSGtr2XH7o=
X-Received: by 2002:adf:f20f:0:b0:203:fc73:a9a0 with SMTP id
 p15-20020adff20f000000b00203fc73a9a0mr5182581wro.418.1648753303352; Thu, 31
 Mar 2022 12:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220330204804.660819-1-robdclark@gmail.com>
 <20220330204804.660819-11-robdclark@gmail.com>
 <ad97096f-cc90-4f20-0f73-f33e9b275f1a@collabora.com>
In-Reply-To: <ad97096f-cc90-4f20-0f73-f33e9b275f1a@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 31 Mar 2022 12:02:35 -0700
Message-ID: <CAF6AEGvZqM1OT_n1C+x+C1GTd4PbFkH4c7P-BseDOUGj7yj3Eg@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] drm/msm: Add a way for userspace to allocate GPU
 iova
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 11:52 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> ...
> > +/*
> > + * Get the requested iova but don't pin it.  Fails if the requested iova is
> > + * not available.  Doesn't need a put because iovas are currently valid for
> > + * the life of the object.
> > + *
> > + * Setting an iova of zero will clear the vma.
> > + */
> > +int msm_gem_set_iova(struct drm_gem_object *obj,
> > +                  struct msm_gem_address_space *aspace, uint64_t iova)
> > +{
> > +     int ret = 0;
>
> nit: No need to initialize the ret

actually, we do

> > +     msm_gem_lock(obj);
> > +     if (!iova) {
> > +             ret = clear_iova(obj, aspace);
> > +     } else {
> > +             struct msm_gem_vma *vma;
> > +             vma = get_vma_locked(obj, aspace, iova, iova + obj->size);
> > +             if (IS_ERR(vma)) {
> > +                     ret = PTR_ERR(vma);
> > +             } else if (GEM_WARN_ON(vma->iova != iova)) {
> > +                     clear_iova(obj, aspace);
> > +                     ret = -ENOSPC;
>
> The (vma->iova != iova) means that vma is already set, but to a
> different address. Is -ENOSPC really appropriate here? -EBUSY or -EINVAL
> looks more natural to me.

yeah, -EBUSY is better

> > +             }
> > +     }
> > +     msm_gem_unlock(obj);
> > +
> > +     return ret;
> > +}
> > +
> >  /*
> >   * Unpin a iova by updating the reference counts. The memory isn't actually
> >   * purged until something else (shrinker, mm_notifier, destroy, etc) decides
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > index 38d66e1248b1..efa2e5c19f1e 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -38,6 +38,12 @@ struct msm_gem_address_space {
> >
> >       /* @faults: the number of GPU hangs associated with this address space */
> >       int faults;
> > +
> > +     /** @va_start: lowest possible address to allocate */
> > +     uint64_t va_start;
> > +
> > +     /** @va_size: the size of the address space (in bytes) */
> > +     uint64_t va_size;
> >  };
> >
> >  struct msm_gem_address_space *
> > @@ -144,6 +150,8 @@ struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
> >                                          struct msm_gem_address_space *aspace);
> >  int msm_gem_get_iova(struct drm_gem_object *obj,
> >               struct msm_gem_address_space *aspace, uint64_t *iova);
> > +int msm_gem_set_iova(struct drm_gem_object *obj,
> > +             struct msm_gem_address_space *aspace, uint64_t iova);
> >  int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
> >               struct msm_gem_address_space *aspace, uint64_t *iova,
> >               u64 range_start, u64 range_end);
> nit: There is an odd mix of uint64_t and u64 (and alike) in the MSM code
> :) The uint64_t variant shouldn't be used by kernel code in general and
> checkpatch should want about it.

one of many things that I disagree with checkpatch about ;-)

I prefer standard types to custom ones.  I _kinda_ get the argument in
case of uapi (but IMHO that doesn't apply to how drm uapi headers are
used)

BR,
-R
