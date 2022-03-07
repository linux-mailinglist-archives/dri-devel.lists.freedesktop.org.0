Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C94D0786
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 20:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA23210E134;
	Mon,  7 Mar 2022 19:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627FC10E134;
 Mon,  7 Mar 2022 19:20:08 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id b23so14167554qtt.6;
 Mon, 07 Mar 2022 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R7o+nT0JafYl6ez7zdRokzyUGr8DQzHkjeMOYPitiLQ=;
 b=Lkc0fQG2mm6q3tJXW7l2I3BJI4dzrla/rBcaD/7ue70gGuNHao822m9v8IiamXTXWx
 mM2mdq1dG+mCb/uLzAp5Ghx0HJhaQws44pFbr/8TJJJESXtxft22q22JpA+YHNIcGepK
 MHKbWGFpR2ll/mOWICCL3xD4Q3+M0sajES5fzz1Taz/shWyu40HVjVWIPeoYbPVLqvYZ
 K1qy+CEs51QA1BUsu3ch7+2vqtS5mmDo3iPj78PqeS5/z2oiH2rZqnNYSQmI+p/eDxOc
 O2gTyVWWjSyzyDu4whM1zp955ILXYPtU4viQKPwphtkDqe4jwlPwfefIrLaU8HEFyC/q
 n8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R7o+nT0JafYl6ez7zdRokzyUGr8DQzHkjeMOYPitiLQ=;
 b=K47tmRjpuA5J3yJdypE+tHKfaUU7FPA3FVPvup/PFiSlAbFvSP1zfizj7ktMEbt20n
 +WfZdkL1w8b7kWZh3+7X0QhXI5ihlqnKzc1Py/98u1CKlw3/tsvFVn0CQa+7OC9pVt+u
 W9b/Oji6kPC5WNzEgi9JdHSeLJGEEouliqR3dwHFc9ITR0m657KHLsIg3MRjCREx8Y8C
 sqHl28W35xAMNvKgxDj1Dwhpce5vk3vFYILk4tSi/QV0FcI8h3UL8Mv2aEpHcQuh5dy2
 o5UHc8zPdg/FwJ8kexafLDTqGj0Y7hI3Mea0TMr7n8xTuhRFmvY7AZmCeVYDsbCmy3NK
 pxGw==
X-Gm-Message-State: AOAM530a2yRlXn1ofHQE193WxCbYW1AeeKS8n5nEKmvj7QGHwMHwTg6H
 uvHJk6TATLfVo515GXmvGk0a7uJX+rn0FBU/NCg=
X-Google-Smtp-Source: ABdhPJwe2YancvZvZUEVtwWbJ08SmZHjehTEpMrgRbnoXLpo6vM/gziqUcrcflFDtRGHPN6715GyRyC30qWQsIB3Duw=
X-Received: by 2002:ac8:570c:0:b0:2e0:29f:4fc2 with SMTP id
 12-20020ac8570c000000b002e0029f4fc2mr10898462qtw.645.1646680807152; Mon, 07
 Mar 2022 11:20:07 -0800 (PST)
MIME-Version: 1.0
References: <20220304172333.991778-1-matthew.auld@intel.com>
 <20220304172333.991778-8-matthew.auld@intel.com> <YiJpkwFRUHIAoh0F@intel.com>
 <ebfc9db8-e7b3-bb01-e96e-0b37f047bcd2@intel.com> <YiY7riuJH2I1UbDB@intel.com>
 <476964f2-772f-b734-1a17-8e65c74b309c@intel.com> <YiZRy78PW2n2I/HB@intel.com>
In-Reply-To: <YiZRy78PW2n2I/HB@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 7 Mar 2022 19:19:40 +0000
Message-ID: <CAM0jSHNyGSYQ19FHoDVnr-QkE7tOjcqK5SHWr7PdJ-W9t5qhbg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: fixup the initial fb base on DG1
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Mar 2022 at 18:41, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Mon, Mar 07, 2022 at 06:26:32PM +0000, Matthew Auld wrote:
> > On 07/03/2022 17:06, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > On Mon, Mar 07, 2022 at 10:32:36AM +0000, Matthew Auld wrote:
> > >> On 04/03/2022 19:33, Ville Syrj=C3=A4l=C3=A4 wrote:
> > >>> On Fri, Mar 04, 2022 at 05:23:32PM +0000, Matthew Auld wrote:
> > >>>> The offset we get looks to be the exact start of DSM, but the
> > >>>> inital_plane_vma expects the address to be relative.
> > >>>>
> > >>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > >>>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > >>>> ---
> > >>>>    .../drm/i915/display/intel_plane_initial.c    | 22 ++++++++++++=
+++----
> > >>>>    1 file changed, 18 insertions(+), 4 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/=
drivers/gpu/drm/i915/display/intel_plane_initial.c
> > >>>> index f797fcef18fc..b39d3a8dfe45 100644
> > >>>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> > >>>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> > >>>> @@ -56,10 +56,24 @@ initial_plane_vma(struct drm_i915_private *i91=
5,
> > >>>>          if (!mem || plane_config->size =3D=3D 0)
> > >>>>                  return NULL;
> > >>>>
> > >>>> -        base =3D round_down(plane_config->base,
> > >>>> -                          I915_GTT_MIN_ALIGNMENT);
> > >>>> -        size =3D round_up(plane_config->base + plane_config->size=
,
> > >>>> -                        mem->min_page_size);
> > >>>> +        base =3D plane_config->base;
> > >>>> +        if (IS_DGFX(i915)) {
> > >>>> +                /*
> > >>>> +                 * On discrete the base address should be somewhe=
re in LMEM, but
> > >>>> +                 * depending on the size of LMEM the base address=
 might
> > >>>> +                 * intersect with the start of DSM, like on DG1, =
in which case
> > >>>> +                 * we need the relative address. In such cases we=
 might also
> > >>>> +                 * need to choose between inital fb vs fbc, if sp=
ace is limited.
> > >>>> +                 *
> > >>>> +                 * On future discrete HW, like DG2, we should be =
able to just
> > >>>> +                 * allocate directly from LMEM, due to larger LME=
M size.
> > >>>> +                 */
> > >>>> +                if (base >=3D i915->dsm.start)
> > >>>> +                        base -=3D i915->dsm.start;
> > >>>
> > >>> Subsequent code expects the object to actually be inside stolen.
> > >>> If that is not the case we should just give up.
> > >>
> > >> Thanks for taking a look at this. Is that subsequent code outside
> > >> initial_plane_vma()? In the next patch this is now using LMEM direct=
ly
> > >> for dg2. Would that blow up somewhere else?
> > >
> > > It uses i915_gem_object_create_stolen_for_preallocated() which assume=
s
> > > the stuff is inside stolen.
> >
> > At the start of the series that gets ripped out and replaced with
> > i915_gem_object_create_region_at(), where we can now just pass in the
> > intel_memory_region, and the backend hopefully takes care of the rest.
>
> Why? Is the BIOS no longer allocating its fbs from stolen?

On discrete, so far DSM is always just snipped off the end of lmem. On
DG1, which only has 4G lmem, the base seems to always exactly match
the DSM start(not sure if this is a fluke). However on DG2, which has
much larger lmem size, the base is still the same IIRC, but it isn't
even close to where DSM is located on such a device. Best guess is
that we were meant to just treat the bios fb(or that part of stolen
lmem) as a part of normal lmem, and might explain why the base is not
relative to the dsm.start like on integrated?

>
> >
> > >
> > >>> The fact that we fail to confirm any of that on integrated
> > >>> parts has always bugged me, but not enough to actually do
> > >>> anything about it. Such a check would be somewhat more involved
> > >>> since we'd have to look at the PTEs. But on discrete sounds like
> > >>> we can get away with a trivial check.
> > >>
> > >> Which PTEs?
> > >
> > > The PTEs the plane is actually using. We have no idea where they
> > > actually point to and just assume they represent a 1:1 mapping of
> > > stolen.
> > >
> > > I suppose with lmem we'll just start assuming a 1:1 mapping of
> > > the whole lmem rather than just stolen.
> >
> > So IIUC the base that we read is actually some GGTT address(I guess it
> > comes pre-programmed or something?), and that hopefully 1:1 maps to
> > stolen. Ok, so as you say, I guess we only want to subtract the
> > dsm.start for the physical allocation, and not the GGTT address, when
> > dealing with stolen lmem.
> >
> > >
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
