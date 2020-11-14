Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F8F2B2FCA
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 19:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75496E940;
	Sat, 14 Nov 2020 18:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1978A6E940;
 Sat, 14 Nov 2020 18:45:12 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c17so13941363wrc.11;
 Sat, 14 Nov 2020 10:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mwaTQ8CRNOisIPpv1s2Kuarb/aJwOV+xZelk78899p4=;
 b=eXiaXE1zpOF7soDIe0ZFrZUhZudhtfvkavxwo7+c1rjBg6fbIMTMta9ZYySZcwoPQe
 j2t5qXqq9r/wzUv6z90z6kNo/pyMXXX8EMqj1ZI6n1IMeiAigipzXVLcLe5AqoKNypTT
 wWJuJmM9ELwq9sjFlLSmnRO0omO1ovv8j0bG1tkZnO66B9XP3JoCL9isxCfVD9AmwVyl
 ty9Eza2J0fhyjcrDnK6yt0eyH6vMY+vBXpoGN29/O2/Q6lGoJdVQfXtaaCUHL6REcjsO
 3TS/FWSUTCT//JIJVamaVqDmnA8X5tz6uUqfMXYaS+7rx5UBddXU2n1tJiUGslRZZcg5
 TbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mwaTQ8CRNOisIPpv1s2Kuarb/aJwOV+xZelk78899p4=;
 b=G2qluHA+geepQaidOb0feoONFpmb67c6C968PyFr5Wh+MMvobk+SnsaFGtKUPX3wna
 6hksv4DmHDLo1g8lrZWku/Kwh9/FIe/3Ew8K1+DdxV6AtctKsQk9WFg4AAhWPTxi/lM9
 G9ypga6yfNr0cENY06SnFR71EsIkWn1xSbWxPX2UkmBMb+os7q57pSiphS1yzLihTOf5
 2qKlFwfOThYhE3BbqA+znBhWaefXVXwT26wtcZVVyArEs2vUYu/+q51l4wDLFze2S5Bv
 0yVV9YNfG8NYLp/J94uDmt24svrDvj85MnaKZKpm/Gxqk59LhG5QfjsLxmkWV2rEwtLo
 yZOg==
X-Gm-Message-State: AOAM531h07ly8f9q+HTEmtmg3cpxi+208F+q+dmUais7SqH/7CHTxIJf
 SxJPyv96sysoM22hGnox44HSLmtM+GWqD55sXMg=
X-Google-Smtp-Source: ABdhPJzzVqEbJpQptFAswg6i7BE/EPfAuddQpxmWjHIdbT4+CANyjD8wZ1iz67UV4WIHafY4RUG8eMwCcs6AqW3aROE=
X-Received: by 2002:adf:f04b:: with SMTP id t11mr10162129wro.147.1605379511355; 
 Sat, 14 Nov 2020 10:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca>
 <20201114162406.GC24411@lst.de>
In-Reply-To: <20201114162406.GC24411@lst.de>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 14 Nov 2020 10:46:55 -0800
Message-ID: <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To: Christoph Hellwig <hch@lst.de>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 8:24 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
> > +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> > +             size_t range_start, size_t range_end)
> > +{
> > +     struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > +     struct device *dev = msm_obj->base.dev->dev;
> > +
> > +     /* exit early if get_pages() hasn't been called yet */
> > +     if (!msm_obj->pages)
> > +             return;
> > +
> > +     /* TODO: sync only the specified range */
> > +
> > +     if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
> > +             dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> > +                             msm_obj->sgt->nents, DMA_TO_DEVICE);
> > +     }
> > +
> > +     if (flags & MSM_GEM_SYNC_FOR_CPU) {
> > +             dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> > +                             msm_obj->sgt->nents, DMA_FROM_DEVICE);
> > +     }
>
> Splitting this helper from the only caller is rather strange, epecially
> with the two unused arguments.  And I think the way this is specified
> to take a range, but ignoring it is actively dangerous.  User space will
> rely on it syncing everything sooner or later and then you are stuck.
> So just define a sync all primitive for now, and if you really need a
> range sync and have actually implemented it add a new ioctl for that.

We do already have a split of ioctl "layer" which enforces valid ioctl
params, etc, and gem (or other) module code which is called by the
ioctl func.  So I think it is fine to keep this split here.  (Also, I
think at some point there will be a uring type of ioctl alternative
which would re-use the same gem func.)

But I do agree that the range should be respected or added later..
drm_ioctl() dispatch is well prepared for extending ioctls.

And I assume there should be some validation that the range is aligned
to cache-line?  Or can we flush a partial cache line?

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
