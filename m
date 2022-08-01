Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3C587269
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 22:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48D514ACD9;
	Mon,  1 Aug 2022 20:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D120814ACD9;
 Mon,  1 Aug 2022 20:42:47 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a9so6308125lfm.12;
 Mon, 01 Aug 2022 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=kIthB6TdDhvPyIaexnTVyNbX/FCo84yFP9KPpNhWWBY=;
 b=j5MzaMTJnqz34fw2Csn3rJvONY9AS+T7ZuCnNuEncmdiqawrf3dEvAWUK/l/ifXNpY
 f9yQT1qgelDTxzM7vKCNjQEXOSdxokMVX2uisDsUoMSP/ckxTJPivRSnBhUe8w9H9L+s
 r9buZwZv5h7nQ3u696dl6dRlS/0cfc8zMH11Du4ZeFyRfcs0YZvABnxuDlUFk4nI0amC
 74S6c4DYN1QeUY33mD0yMOTRTA5xQ1ZheteO8wVfbJV2O7ZmBf0eOkEwnn4MR9PDYkOD
 egI1v6NsRu6NiR+ye/zAIyWCXR0QWx6zhsEaIlUAcg6vAQyjSEpzZh/J9xDTEcp5wp36
 G7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=kIthB6TdDhvPyIaexnTVyNbX/FCo84yFP9KPpNhWWBY=;
 b=7fSNVzGUdtzr3aEkzwzEKQ+8LMXNBckKNsyfqLja4bUVp2BaxTBKJnpE4qe8w0voWU
 11UBqB9uE9g43er2Orb2+BKMnp9sPgNbcVu3kk0S/gQFVBlA4A4ADdwMh03+qA8ibx9w
 I8NqIqriUr17LWOkj5Xd771AqPXphQNx/TTmR8B5jF2a90Pgkf7q2M3XcZf+Gj5ELfCF
 H5x9SOdmv4UHKx16Jq5A3DlI/fPUnm9g3rPNWJkhqeVlRFPmXueiogO0enu9dsWrgYhu
 h7coaXLXMVT+7/e8m/smlANuYG4bsX0bOl4zqbZoeSm1DvaB3TsJWTRLXhohHRV8fzg+
 edJw==
X-Gm-Message-State: AJIora8qnj2RuPtJMZ/lPU+2FxIxmnoow5FVOBSfuC3tvDhYnFoq2dbk
 8eOhBix98GGAbnEqG808mIVY9Bp6kGrZP+bIXd8=
X-Google-Smtp-Source: AGRyM1skt9q0ry/mgHPex0SgVfhaLl0kYvKNgfxFdnPqi7je6iVIXJWKfJkgv19VqjAta18vJNQs/Cr++y8j7e0NBV8=
X-Received: by 2002:ac2:4f03:0:b0:481:50f7:ac07 with SMTP id
 k3-20020ac24f03000000b0048150f7ac07mr5817490lfr.422.1659386565885; Mon, 01
 Aug 2022 13:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220726175043.1027731-1-robdclark@gmail.com>
 <20220726175043.1027731-10-robdclark@gmail.com>
 <def8e47c-067e-0841-4ae4-1eb90244cd50@collabora.com>
 <CAF6AEGtV4GY6=PmQh0wrKxjxk_baRCzOo=s=Uz-uKBNEn7SBBg@mail.gmail.com>
 <6b35b912-68e5-e722-0b5a-0f7bd06c22c2@collabora.com>
 <733f5d3f-293e-f951-a00b-fcd3052f68e7@collabora.com>
 <88576d7a-da5f-753d-51cf-08ed22f7c81e@collabora.com>
In-Reply-To: <88576d7a-da5f-753d-51cf-08ed22f7c81e@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Aug 2022 13:42:33 -0700
Message-ID: <CAF6AEGu1_5EBmKQR8cMs=or6o_ALBWxTyKA_JL-G-AhemDyaww@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] drm/gem: Add LRU/shrinker helper
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 1:26 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 8/1/22 23:13, Dmitry Osipenko wrote:
> > On 8/1/22 23:11, Dmitry Osipenko wrote:
> >> On 8/1/22 23:00, Rob Clark wrote:
> >>> On Mon, Aug 1, 2022 at 12:41 PM Dmitry Osipenko
> >>> <dmitry.osipenko@collabora.com> wrote:
> >>>>
> >>>> On 7/26/22 20:50, Rob Clark wrote:
> >>>>> +/**
> >>>>> + * drm_gem_lru_remove - remove object from whatever LRU it is in
> >>>>> + *
> >>>>> + * If the object is currently in any LRU, remove it.
> >>>>> + *
> >>>>> + * @obj: The GEM object to remove from current LRU
> >>>>> + */
> >>>>> +void
> >>>>> +drm_gem_lru_remove(struct drm_gem_object *obj)
> >>>>> +{
> >>>>> +     struct drm_gem_lru *lru = obj->lru;
> >>>>> +
> >>>>> +     if (!lru)
> >>>>> +             return;
> >>>>> +
> >>>>> +     mutex_lock(lru->lock);
> >>>>> +     lru_remove(obj);
> >>>>> +     mutex_unlock(lru->lock);
> >>>>> +}
> >>>>> +EXPORT_SYMBOL(drm_gem_lru_remove);
> >>>>
> >>>> I made a preliminary port of the DRM-SHMEM shrinker on top of the the
> >>>> latest version of dma-buf locking convention and yours LRU patches. It
> >>>> all works good, the only thing that is missing for the DRM-SHMEM
> >>>> shrinker is the drm_gem_lru_remove_locked().
> >>>>
> >>>> What about to add a locked variant of drm_gem_lru_remove()?
> >>>
> >>> Sounds fine to me.. the only reason it didn't exist yet was because it
> >>> wasn't needed yet..
> >>
> >> There is no use for the drm_gem_lru_move_tail_locked() as well, you're
> >> not using it in the MSM driver. Hence I thought it might be good to add
> >> the drm_gem_lru_remove_locked(), or maybe the
> >> drm_gem_lru_move_tail_locked() should be dropped then?
> >>
> >>> I can respin w/ an addition of a _locked() version, or you can add it
> >>> on top in your patchset.  Either is fine by me
> >>
> >> The either option is fine by me too. If you'll keep the unused
> >> drm_gem_lru_move_tail_locked(), then will be nice to add
> >> drm_gem_lru_remove_locked().
> >>
> >
> > The drm_gem_lru_move_tail_locked() will be needed by DRM-SHMEM shrinker,
> > BTW.
>
> On the other hand, I see now that DRM-SHMEM shrinker can use the
> unlocked versions only. Hence both drm_gem_lru_move_tail_locked() and
> drm_gem_lru_remove_locked() aren't needed.

drm_gem_lru_move_tail_locked() is used internally, but I guess it
could be made static since there ended up not being external users
(yet?)

I could see _move_tail_locked() being useful for a driver that wanted
to bulk update a bunch of GEM objs, for ex. all the bo's associated
with a submit/job.

BR,
-R
