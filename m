Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA45F46A1E1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EA96FD36;
	Mon,  6 Dec 2021 17:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AC06FD36;
 Mon,  6 Dec 2021 17:01:13 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id g28so11773022qkk.9;
 Mon, 06 Dec 2021 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVwsJYpONmEmVEn0jaYYepe0KfNbDz2OtRqVJGAt+AM=;
 b=eqvsYaH+lCEeKUbMV8eaxilZmR8UWxBmTdrIN4XSbxVTrwGIUCF9pHQcNrcpP7uFv0
 uHPi3pg02YLGyi+vOFobwU2Re/qgNIOmbl1YXpFWQi0fP/Kjoq9Xun5A+fUdvICnYjyi
 RkiyEuhABX3Z9hUKfXl5QXsW8C2Uzs9ICkF9a9nJoejJjDXC67p2JCE5WdQAGp6P2qCR
 XpWhQpGpebzLSlzO6Y+79awEzx0i/crQf5RDWaVnbpCGhxHEefwnrjIXC1BQw2//njGT
 DJ4qP+qAaLw1T9TKauAhBGiEgyihxH5apsYqjzc9Nje2NxNzSkR2arKJgQe7rY+nI4hg
 qIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVwsJYpONmEmVEn0jaYYepe0KfNbDz2OtRqVJGAt+AM=;
 b=qVnUuPC1cp/tWH97nawiM+5qDIfqsuo/rqqturmGVsfvpZvINC3uKC5rW8hJoYR0Pu
 LRpS7g1z4JRp/fmhZHvJurgAQ20UiPAa0LjA4kBD2PEC+lzg9CMEhmH0reWmgSgqAZhO
 SVqYDKU4HZHk4Hon/OsmWEuQmfUg5tUKSh1bYB7yTrHNkmR761CV9apGN3FzfgwleejH
 OUz8LIeZmAk/PIl8PTJehpnP24HhffICA1rIJ7hOXamE2eHcl8qA3IisZXNohBJMwlrI
 8C3BMC9OdMNITc0dVh3olY7K/dSrRaXsUu1Q9pRbvjTZzJIyuLXXGZKiAlhZ/mKZHfI3
 8ovA==
X-Gm-Message-State: AOAM533ZTvtQNcd0B8FUHZ38rk4EjQJLMI5eQq4KIaU7aEeWwqpG/eaz
 VqWmaER7Vmw++hPMVeib/rcHsmYOI5uHXT641ykR1N05gtA=
X-Google-Smtp-Source: ABdhPJz7cKPFRiGCIfqcoTPlRurmBOTFf3JyU6ipZqkqdiFxSdjFLRMniDx6H+/fd/zFoRUl4JZX5DlzOB3LZ8Tsz6E=
X-Received: by 2002:a05:620a:2413:: with SMTP id
 d19mr34627680qkn.82.1638810072502; 
 Mon, 06 Dec 2021 09:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-4-maarten.lankhorst@linux.intel.com>
 <CAM0jSHPcJJLV7Sx170FWBdGhc1X+bwC=cshP3ndEHYJvZDmMYw@mail.gmail.com>
 <b7fe0261-2528-b862-ec41-eda79a035a94@linux.intel.com>
In-Reply-To: <b7fe0261-2528-b862-ec41-eda79a035a94@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 6 Dec 2021 17:00:46 +0000
Message-ID: <CAM0jSHMY0DiPC7R_saw6i-q-YWohyc7UsarwTWmiQ1wbmFfgtw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 03/16] drm/i915: Remove pages_mutex and
 intel_gtt->vma_ops.set/clear_pages members, v2.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Dec 2021 at 15:18, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> On 06-12-2021 14:13, Matthew Auld wrote:
> > On Mon, 29 Nov 2021 at 13:57, Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com> wrote:
> >> Big delta, but boils down to moving set_pages to i915_vma.c, and removing
> >> the special handling, all callers use the defaults anyway. We only remap
> >> in ggtt, so default case will fall through.
> >>
> >> Because we still don't require locking in i915_vma_unpin(), handle this by
> >> using xchg in get_pages(), as it's locked with obj->mutex, and cmpxchg in
> >> unpin, which only fails if we race a against a new pin.
> >>
> >> Changes since v1:
> >> - aliasing gtt sets ZERO_SIZE_PTR, not -ENODEV, remove special case
> >>   from __i915_vma_get_pages(). (Matt)
> >>
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_dpt.c      |   2 -
> >>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  15 -
> >>  drivers/gpu/drm/i915/gt/intel_ggtt.c          | 403 ----------------
> >>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  13 -
> >>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 -
> >>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  12 -
> >>  drivers/gpu/drm/i915/i915_vma.c               | 444 ++++++++++++++++--
> >>  drivers/gpu/drm/i915/i915_vma.h               |   3 +
> >>  drivers/gpu/drm/i915/i915_vma_types.h         |   1 -
> >>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  12 +-
> >>  drivers/gpu/drm/i915/selftests/mock_gtt.c     |   4 -
> >>  11 files changed, 424 insertions(+), 492 deletions(-)
> >>
> > <snip>
> >
> >>  }
> >> @@ -854,18 +1233,22 @@ static int vma_get_pages(struct i915_vma *vma)
> >>  static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
> >>  {
> >>         /* We allocate under vma_get_pages, so beware the shrinker */
> >> -       mutex_lock_nested(&vma->pages_mutex, SINGLE_DEPTH_NESTING);
> >> +       struct sg_table *pages = READ_ONCE(vma->pages);
> >> +
> >>         GEM_BUG_ON(atomic_read(&vma->pages_count) < count);
> >> +
> >>         if (atomic_sub_return(count, &vma->pages_count) == 0) {
> > Does this emit a barrier? Or can the READ_ONCE(vma->pages) be moved
> > past this, and does that matter?
>
> It's not that tricky, and only there because we still have to support unlocked until patch 13, patch 15 removes it.
>
> From the kernel doc:
>
>  - RMW operations that have a return value are fully ordered;
>
>  - RMW operations that are conditional are unordered on FAILURE,
>    otherwise the above rules apply.
>
> so READ_ONCE followed by a bunch of stuff that only happens when cmpxchg is succesful, is ok.
>
> At the beginning of vma_put_pages(), we hold at least 1 reference to vma->pages, and we assume vma->pages is set to something sane.
>
> We use READ_ONCE to read vma->pages before decreasing refcount on vma->pages_count, after which we attempt to clear vma->pages.
>
> HOWEVER, as we are not guaranteed to hold the lock, we are careful. New pages may have been set by __i915_vma_get_pages(), using xchg.
>
> In that case, we fail, and _get_pages() cleans up instead.
>
> After that, we drop the reference to the object's page pin, which we needed for the pages != vma->obj->mm.pages comparison.

Ok, I can buy that.

>
> >> -               vma->ops->clear_pages(vma);
> >> -               GEM_BUG_ON(vma->pages);
> >> +               if (pages == cmpxchg(&vma->pages, pages, NULL) &&
> > try_cmpxchg? Also can pages be NULL here?
>
> cmpxchg is correct here. We don't need to loop, and only need to try once. The only time we can fail, will happen after at least one get_pages() call, and that would have otherwise freed it for us.
>
> > As an aside, is it somehow possible to re-order the series or
> > something to avoid introducing the transient lockless trickery here? I
> > know by the end of the series this all gets removed, but still just
> > slightly worried here.
>
> The locked version would actually be identical in this case.
>
> I removed the locking because it didn't add anything. The same ops would be required, only with additional locking for something that is using atomic ops for a refcount anyway..
>
>
> >> +                   pages != vma->obj->mm.pages) {
> >> +                       sg_free_table(pages);
> >> +                       kfree(pages);
> >> +               }
> >>
> >>                 i915_gem_object_unpin_pages(vma->obj);
> >>         }
> >> -       mutex_unlock(&vma->pages_mutex);
> >>  }
>
>
