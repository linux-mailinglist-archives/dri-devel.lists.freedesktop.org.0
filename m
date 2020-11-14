Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7DB2B30B3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 21:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4926E964;
	Sat, 14 Nov 2020 20:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C746E964;
 Sat, 14 Nov 2020 20:48:29 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 23so14137993wrc.8;
 Sat, 14 Nov 2020 12:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kxdW0BGmya6+iac4PEbXw/SdeDVo3PvponWz/JT0D0=;
 b=YBzvbEClpZhjQV4W5jQm7JKHQrD1GEqBjbjGovBWVvKh1I7A2YgZtR3k0YGZ2dY+Sh
 YPSU0nRuJmrWZ4sqAuPt7ty6CwPEeVelxR9YPjRZUaHA1JltUCcFNyGszHqEX8R2TIad
 AyK/AIfDybRoc4OL6FwYv6XFfkceWyHvVUPDvWcv3uLZatmgxTwl/qcii78FyXTyjwbD
 iV68Ul9QUA8qQKIz4shJX9YuH0Db07fRudbra129wztYUa4+WDjfeWYwlAhJuX+swdtH
 QkCLTvjcrqtRWB2sggjJ0I2B1WlrNEmeOW8+np5+4OAWFC6c73t/S3udxdUTEKDNCKoh
 inlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kxdW0BGmya6+iac4PEbXw/SdeDVo3PvponWz/JT0D0=;
 b=eT1yXMMd8TvqL1fScJExFXBk6b16J05KopRc4QrzXVnfjYA2iNwBStujkLV7b6nsxc
 Xuhww2r9BynupOtvgVJe8I50L7DxUWMrqAtDgbRosQGkU17oTTIs3BstJDOx28D15YC+
 8x2V9cohHGX5yyF+3o39LNRZp+3yYNEaL509tb8tSvoBz+/D12MjM8QsYLVfNqQAxNnZ
 IlzvSrmnrKO7JoiMVrItl/r2wDOJos/5DJoPFxUezsWkhN9foH+mTwz9OuddZPfYcZRG
 Vto/qCoCmbUsNDt7Ge+PvYKJzzdl4o8d91jaNBlbyXJB96W0Re82LX7aK+a2ghH+n0cs
 vmPg==
X-Gm-Message-State: AOAM531jWe03ukiDbJ/VCglLln569BP7/Xv2+HI2kx0FIOtrxMfhrjKh
 C550gVcwlnlI8tGZvEtfryZkaAr3DfHCCfSD3ak=
X-Google-Smtp-Source: ABdhPJwr/t/g2wfdy6h1Iuz8dqJ8uKKA5Jp/prFloAxEH8BmClb9cm6EBJO7JAHC5gZ7svYddzH/IOL7mFlzUktzT4Q=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr11557917wrb.132.1605386907608; 
 Sat, 14 Nov 2020 12:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca>
 <20201114162406.GC24411@lst.de>
 <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
 <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
 <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
In-Reply-To: <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 14 Nov 2020 12:48:15 -0800
Message-ID: <CAF6AEGv7fXGVVWcTcSXF6EGB2LOi_wvQP6h6hcX8yNvAZRDbVg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 11/14/20 2:39 PM, Rob Clark wrote:
> > On Sat, Nov 14, 2020 at 10:58 AM Jonathan Marek <jonathan@marek.ca> wrote:
> >>
> >> On 11/14/20 1:46 PM, Rob Clark wrote:
> >>> On Sat, Nov 14, 2020 at 8:24 AM Christoph Hellwig <hch@lst.de> wrote:
> >>>>
> >>>> On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
> >>>>> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> >>>>> +             size_t range_start, size_t range_end)
> >>>>> +{
> >>>>> +     struct msm_gem_object *msm_obj = to_msm_bo(obj);
> >>>>> +     struct device *dev = msm_obj->base.dev->dev;
> >>>>> +
> >>>>> +     /* exit early if get_pages() hasn't been called yet */
> >>>>> +     if (!msm_obj->pages)
> >>>>> +             return;
> >>>>> +
> >>>>> +     /* TODO: sync only the specified range */
> >>>>> +
> >>>>> +     if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
> >>>>> +             dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> >>>>> +                             msm_obj->sgt->nents, DMA_TO_DEVICE);
> >>>>> +     }
> >>>>> +
> >>>>> +     if (flags & MSM_GEM_SYNC_FOR_CPU) {
> >>>>> +             dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> >>>>> +                             msm_obj->sgt->nents, DMA_FROM_DEVICE);
> >>>>> +     }
> >>>>
> >>>> Splitting this helper from the only caller is rather strange, epecially
> >>>> with the two unused arguments.  And I think the way this is specified
> >>>> to take a range, but ignoring it is actively dangerous.  User space will
> >>>> rely on it syncing everything sooner or later and then you are stuck.
> >>>> So just define a sync all primitive for now, and if you really need a
> >>>> range sync and have actually implemented it add a new ioctl for that.
> >>>
> >>> We do already have a split of ioctl "layer" which enforces valid ioctl
> >>> params, etc, and gem (or other) module code which is called by the
> >>> ioctl func.  So I think it is fine to keep this split here.  (Also, I
> >>> think at some point there will be a uring type of ioctl alternative
> >>> which would re-use the same gem func.)
> >>>
> >>> But I do agree that the range should be respected or added later..
> >>> drm_ioctl() dispatch is well prepared for extending ioctls.
> >>>
> >>> And I assume there should be some validation that the range is aligned
> >>> to cache-line?  Or can we flush a partial cache line?
> >>>
> >>
> >> The range is intended to be "sync at least this range", so that
> >> userspace doesn't have to worry about details like that.
> >>
> >
> > I don't think userspace can *not* worry about details like that.
> > Consider a case where the cpu and gpu are simultaneously accessing
> > different parts of a buffer (for ex, sub-allocation).  There needs to
> > be cache-line separation between the two.
> >
>
> Right.. and it also seems like we can't get away with just
> flushing/invalidating the whole thing.
>
> qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like
> dma_sync_single_for_cpu() does deal in some way with the partial cache
> line case, although I'm not sure that means we can have a
> nonCoherentAtomSize=1.
>

flush/inv the whole thing could be a useful first step, or at least I
can think of some uses for it.  But if it isn't useful for how vk sees
the world, then maybe we should just implement the range properly from
the get-go.  (And I *think* requiring the range to be aligned to
cacheline boundaries.. it is always easy from a kernel uabi PoV to
loosen restrictions later, than the other way around.)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
