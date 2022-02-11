Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C04B2278
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61A710EA62;
	Fri, 11 Feb 2022 09:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9791210EA62;
 Fri, 11 Feb 2022 09:53:21 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id b35so7839419qkp.6;
 Fri, 11 Feb 2022 01:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PR1ghveonxIfHnf3nXh3vT9XGNGU4at+DRZze/shTDo=;
 b=G9SudckG82dJcSHs3XEVx79SWyMosWoLGtkAYQgHjdJE6dIhBr4Em4pGiH9Dic5Ksa
 U4fN62ehoE7VWFnCQ1dUeIZ03MdbMOvmGqbPcNDnWbbQB+iIM/ayIH/zKwzqQ3p6gNgf
 QV1cxqZA3W54elJoz5tho51Mm/pAFncXZvB+7LFaIZEN7UwRqAJSkDB0HAJQBjXzcfqE
 4jD2FiKRNcIfssBy/7bNfkFumevbDiqJG05bNz8IJxqC9hkrh2hnFETtJq3BGde2QZDO
 YMkZyzptNpPCRhLYuPCo9gocglokyblI0Q8CQjeOU217F9j+Z2FvhYZdLKHQZ97H6K2W
 qJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PR1ghveonxIfHnf3nXh3vT9XGNGU4at+DRZze/shTDo=;
 b=7xSDyIF7yvqEOnSK/ZHlQIHK7rn0R1vP/PXV0JPkYRMTr3BA10zAGMNfdd3PiRAb+O
 qgz5hIRlQSyIun1akIdNP/LJyzgeDvT+7406g7MQk5DA/dbU+jRWAMHsg5vcvtKsypmR
 8EsirPJYlX691o0Le2SWd8rGqFJ64/03vSpzuqmYmraMdiNjMpTKMwKNMfFGeor27IFU
 QLLlTKQssCIVBB4NXAgUcRjDa9cWnh0I+O0CAVkiGqy4N+zujtI5OwAq5xFLMVy8m1fp
 SMA9XXEumMr055VsC/e2zJ2MqyofBFwWmHz35Ms7ISO30AsBvYAcfKSk14Y6d+Usp9n0
 CBFA==
X-Gm-Message-State: AOAM53384tgdrcHuLTtQMFrkbOEfAO3xncMTl5ro4eWqVBY4MzWdnTsg
 z50lwx825aCkCKV+kSB18v1r1+ezLyAmdWn5bjU=
X-Google-Smtp-Source: ABdhPJz0DAkXraEZEisnLcYpJeFm+rsnUmnX4+H5Sdvi0CQIMKJfWPtPAD5gSfn6XfdXFVJnMWlDUy/dx/3CJbYznpM=
X-Received: by 2002:a05:620a:573:: with SMTP id
 p19mr312715qkp.82.1644573200746; 
 Fri, 11 Feb 2022 01:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-13-matthew.auld@intel.com>
 <e4f128ad-1738-cee7-6790-fbdbb6d5698d@linux.intel.com>
In-Reply-To: <e4f128ad-1738-cee7-6790-fbdbb6d5698d@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Feb 2022 09:52:54 +0000
Message-ID: <CAM0jSHM8+KBAN2iMM7L+9HUKuTodH5u32o4XgGZbv8fvUrn67g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 12/15] drm/i915/create: apply
 ALLOC_GPU_ONLY by default
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Feb 2022 at 09:49, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
>
> On 2/10/22 13:13, Matthew Auld wrote:
> > Starting from DG2+, when dealing with LMEM, we assume that by default
> > all userspace allocations should be placed in the non-mappable portion
> > of LMEM.  Note that dumb buffers are not included here, since these are
> > not "GPU accelerated" and likely need CPU access.
> >
> > In a later patch userspace will be able to provide a hint if CPU access
> > to the buffer is needed.
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_create.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_create.c
> > index 9402d4bf4ffc..cc9ddb943f96 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > @@ -424,6 +424,15 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, =
void *data,
> >               ext_data.n_placements =3D 1;
> >       }
> >
> > +     /*
> > +      * TODO: add a userspace hint to force CPU_ACCESS for the object,=
 which
> > +      * can override this.
> > +      */
> > +     if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
> > +                           ext_data.placements[0]->type !=3D
> > +                           INTEL_MEMORY_SYSTEM))
> > +             ext_data.flags |=3D I915_BO_ALLOC_GPU_ONLY;
> > +
>
> WRT previous review comment here, it would be easier to follow if the bo
> was marked as a GPU only buffer regardless. Then for example capture and
> other functions where it actually matters can choose to take action
> based on, for example, whether the BAR is restricted or not?

Yeah, I completely forgot about this, sorry. Will fix now.

>
> /Thomas
>
>
>
> >       obj =3D __i915_gem_object_create_user_ext(i915, args->size,
> >                                               ext_data.placements,
> >                                               ext_data.n_placements,
