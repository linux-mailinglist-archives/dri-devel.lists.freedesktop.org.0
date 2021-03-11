Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE82336D8F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 09:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441B86EB1A;
	Thu, 11 Mar 2021 08:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8E36EB19;
 Thu, 11 Mar 2021 08:14:33 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 184so995473ljf.9;
 Thu, 11 Mar 2021 00:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hopiSLCzCJWM8+V53PdoiSs1GqKs/2+4TO/eWgMFmL8=;
 b=lt1AZddWPABeZvB5gc21VkYrdQoSzvfiDh8pCTVIIJUtsQQQ/XguniN/Eluli9NUdh
 MRiQw0Nb4Bhqj0uRbh5Id66w/35h7PmieM4oVB1cC/027nlr4DB+IRnL+QTNbmwutvL3
 OqRAuDi1LKqM7lKZSi2RFie/E2XW1bFzl4uCq5y+5ZZSiWuiS8jS4/Skri6hTN7P4Biz
 LBmFfmpePjd4HIQSWUQXhfGrpYggtRVU9zpo+EbKZs1GijOgGa76DTuohJaxYiLiU/x3
 XVVEfmxhPixjdMbA/k+OggYoI5EBWLCQTn8qaRBi71E+KmA3R0rYx6jt1iRpm7rcCEeo
 aSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hopiSLCzCJWM8+V53PdoiSs1GqKs/2+4TO/eWgMFmL8=;
 b=udKgE96FLLEodxYknUY6VG2i6orL1yS/pT74uHqep2CI3+Vs0MvqRkxwrg+wawCvGG
 w9IdkopLHJGEp/D23ggHqcKD6Q2Cplfywr2TtKEZOW+rAuiBVAVBxqq4TNNd8MU4l+24
 egbVi4ZBTkqELKN3kT4Zjqe2QIa/JVwtzWSme07VtYxXmoxhRjpZPR42JS15rXVUTttj
 c+Oy7htktkEy4qJ6ylE7orql6RdDB80zT909jgVSXWh1DsHurjV+kBtnZHMMMl591rqN
 8isUdvdj9asm8clcbkg+X9wgR7yGKmFqY7tkKThielHCGOn8OnuMzcOZS6HQmYpWf0Xl
 oNaw==
X-Gm-Message-State: AOAM530mkD4iyDT2PFGtuIETAfd5IelJ27ukRk/sAquamC/m4vdAyKw4
 PptYboqrJZJc/ur0GZaMZ4dNpnmHO+eClSfRtVE=
X-Google-Smtp-Source: ABdhPJxalcSkKqt7XoU1PA9qqPn4/uA3zxZRdWZDchPxpV9Ju5mo/75YNGqp3OQQZe/pKitSV63L5OSQ7im5dQ2JHUc=
X-Received: by 2002:a2e:94c8:: with SMTP id r8mr4160354ljh.332.1615450472267; 
 Thu, 11 Mar 2021 00:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20210310212606.766121-1-jason@jlekstrand.net>
 <20210310215007.782649-1-jason@jlekstrand.net>
In-Reply-To: <20210310215007.782649-1-jason@jlekstrand.net>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Thu, 11 Mar 2021 00:14:21 -0800
Message-ID: <CAKi4VAKbEhhr+w1K8ByeioAnrzczH6grnXT9GmdMu9taVPtAmg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] i915: Drop relocation support on all new
 hardware (v3)
To: Jason Ekstrand <jason@jlekstrand.net>
X-Mailman-Approved-At: Thu, 11 Mar 2021 08:16:25 +0000
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 10, 2021 at 1:50 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> The Vulkan driver in Mesa for Intel hardware never uses relocations if
> it's running on a version of i915 that supports at least softpin which
> all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12+ is
> only supported by iris which never uses relocations.  The older i965
> driver in Mesa does use relocations but it only supports Intel hardware
> through Gen11 and has been deprecated for all hardware Gen9+.  The
> compute driver also never uses relocations.  This only leaves the media
> driver which is supposed to be switching to softpin going forward.
> Making softpin a requirement for all future hardware seems reasonable.
>
> Rejecting relocations starting with Gen12 has the benefit that we don't
> have to bother supporting it on platforms with local memory.  Given how
> much CPU touching of memory is required for relocations, not having to
> do so on platforms where not all memory is directly CPU-accessible
> carries significant advantages.
>
> v2 (Jason Ekstrand):
>  - Allow TGL-LP platforms as they've already shipped
>
> v3 (Jason Ekstrand):
>  - WARN_ON platforms with LMEM support in case the check is wrong
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 99772f37bff60..b02dbd16bfa03 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1764,7 +1764,8 @@ eb_relocate_vma_slow(struct i915_execbuffer *eb, struct eb_vma *ev)
>         return err;
>  }
>
> -static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
> +static int check_relocations(const struct i915_execbuffer *eb,
> +                            const struct drm_i915_gem_exec_object2 *entry)
>  {
>         const char __user *addr, *end;
>         unsigned long size;
> @@ -1774,6 +1775,14 @@ static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
>         if (size == 0)
>                 return 0;
>
> +       /* Relocations are disallowed for all platforms after TGL-LP */
> +       if (INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
> +               return -EINVAL;
> +
> +       /* All discrete memory platforms are Gen12 or above */
> +       if (WARN_ON(HAS_LMEM(eb->i915)))

HAS_LMEM() will return true for the fake lmem support, which may be < gen12.
Dropping the fake lmem would be a possibility.

Lucas De Marchi

> +               return -EINVAL;
> +
>         if (size > N_RELOC(ULONG_MAX))
>                 return -EINVAL;
>
> @@ -1807,7 +1816,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
>                 if (nreloc == 0)
>                         continue;
>
> -               err = check_relocations(&eb->exec[i]);
> +               err = check_relocations(eb, &eb->exec[i]);
>                 if (err)
>                         goto err;
>
> @@ -1880,7 +1889,7 @@ static int eb_prefault_relocations(const struct i915_execbuffer *eb)
>         for (i = 0; i < count; i++) {
>                 int err;
>
> -               err = check_relocations(&eb->exec[i]);
> +               err = check_relocations(eb, &eb->exec[i]);
>                 if (err)
>                         return err;
>         }
> --
> 2.29.2
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
