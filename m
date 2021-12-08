Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA346D3EE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 14:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4403D73161;
	Wed,  8 Dec 2021 13:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CB173160;
 Wed,  8 Dec 2021 13:00:18 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id p4so1834678qkm.7;
 Wed, 08 Dec 2021 05:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jEryG01QdOPeGXDzXEJNy0ucq7dOwEzyApebZ60SrZA=;
 b=XIs8qam/x+CyBkiGnmwhcuPBCkhHgpFs1qDCm2QGcn7Hijacg9npA5oB/BTIEFVivn
 CVLy3nIih13ItnUv2lQwk7XEHFpzyVo+ivQCv/78j8fUJurg5hJIqge3brGVW8P/6BIC
 1gO8CGUgepMTe9OV9GjhYfAQbTBNTBEmEG3zHjPETCZ5sMJvg0GAX2YSA6gr3qg3vB9a
 ehm7vEj9XIpGPGvEb1QZGjB0k8zRmyUOMtHHLeLUSFLpY7D/rN+2QcMjA06wvk97J1wf
 H/U6UNrFsUe8LDFUUnStDJEIMHwOHe+bchHzJncAT6UF6Sf3Khusr3YZTqGd2ylUd42z
 Fa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jEryG01QdOPeGXDzXEJNy0ucq7dOwEzyApebZ60SrZA=;
 b=k8zQZTryKa2OGGSCQ4IMmv620AGGT5sgBTeW1uJ+VIJgUN627GiY4wnTRTsi14YeUe
 nIYbVOGFdQyKraZvDspiPIl+U3um4euCP2eItWtS7XFFTGxim+1VX4KE4Ut2JOOf8Sj7
 nsFUnhWRNTZ4OJeCoLEcUQWi5tCsLp6Phm34zZhQeRuwaGFWyX+fhrgZ8za2gOENST22
 jYvEMINoby67ElbXRWZXQE+p04ochvhQTWYrk3pgC/Mg0lLKTSYkICi8KXTCs0PawWeT
 UOqOhukd8k9myQqXqKU3z5F4lISXzg++bjKTGVIjnw9Y4jYniPQ31a/myzYMq1n/Enms
 d0Dw==
X-Gm-Message-State: AOAM533ZMIFMdgfJSqaAt/eNtZ31kuD0sYnr5l5e0Rmc+hOru5Gbujb/
 fXGvbO5ZOKiWJrdPECd0yhI41ys0zA1tQwr98BI=
X-Google-Smtp-Source: ABdhPJynfqtbi4HgH/0mOlgWBGt591Crai+oab3lIbtC8e0p+agXkkG6WgGuX8OxLVear1FyQBPaRgniod/FcHRNoFU=
X-Received: by 2002:a05:620a:4244:: with SMTP id
 w4mr6326671qko.569.1638968417443; 
 Wed, 08 Dec 2021 05:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20211207165156.31244-1-ramalingam.c@intel.com>
 <20211207165156.31244-2-ramalingam.c@intel.com>
 <801b9d8b-1b5c-ce2f-dc05-e804cafc3683@shipmail.org>
In-Reply-To: <801b9d8b-1b5c-ce2f-dc05-e804cafc3683@shipmail.org>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 8 Dec 2021 12:59:50 +0000
Message-ID: <CAM0jSHMdk7R0e6uU7PU6Xn3Z_kX8X8O86_+DNxEz5FuB9acMew@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Add has_64k_pages flag
To: thomas_os@shipmail.org
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
Cc: Andi <andi.shyti@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris_intel_ID <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Dec 2021 at 12:43, Thomas Hellstr=C3=B6m (Intel)
<thomas_os@shipmail.org> wrote:
>
> Hi,
>
> On 12/7/21 17:51, Ramalingam C wrote:
> > From: Stuart Summers <stuart.summers@intel.com>
> >
> > Add a new platform flag, has_64k_pages, for platforms supporting
> > base page sizes of 64k.
> >
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >   drivers/gpu/drm/i915/i915_drv.h          | 2 ++
> >   drivers/gpu/drm/i915/i915_pci.c          | 2 ++
> >   drivers/gpu/drm/i915/intel_device_info.h | 1 +
> >   3 files changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i91=
5_drv.h
> > index 85bb8d3107f0..6132163e1cb3 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -1528,6 +1528,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i91=
5,
> >   #define HAS_MSLICES(dev_priv) \
> >       (INTEL_INFO(dev_priv)->has_mslices)
> >
> > +#define HAS_64K_PAGES(dev_priv) (INTEL_INFO(dev_priv)->has_64k_pages)
> > +
>
> Could we please have some documentation of the exact meaning of this flag=
.
> Like, smallest page size of LMEM is 64K. Hardware supports 64k pages etc?

Something like: "Set if the device requires 64K GTT page sizes or
larger for device local memory access. Also implies that we require or
at least support the compact PT layout for the ppGTT when using 64K
GTT pages."

>
> for future reference.
>
> /Thomas
>
>
>
>
>
> >   #define HAS_IPC(dev_priv)            (INTEL_INFO(dev_priv)->display.h=
as_ipc)
> >
> >   #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i91=
5_pci.c
> > index 6aaa7c644c9b..634282edadb7 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -1029,6 +1029,7 @@ static const struct intel_device_info xehpsdv_inf=
o =3D {
> >       DGFX_FEATURES,
> >       PLATFORM(INTEL_XEHPSDV),
> >       .display =3D { },
> > +     .has_64k_pages =3D 1,
> >       .pipe_mask =3D 0,
> >       .platform_engine_mask =3D
> >               BIT(RCS0) | BIT(BCS0) |
> > @@ -1047,6 +1048,7 @@ static const struct intel_device_info dg2_info =
=3D {
> >       .graphics.rel =3D 55,
> >       .media.rel =3D 55,
> >       PLATFORM(INTEL_DG2),
> > +     .has_64k_pages =3D 1,
> >       .platform_engine_mask =3D
> >               BIT(RCS0) | BIT(BCS0) |
> >               BIT(VECS0) | BIT(VECS1) |
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm=
/i915/intel_device_info.h
> > index 669f0d26c3c3..f38ac5bd837b 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -123,6 +123,7 @@ enum intel_ppgtt_type {
> >       func(is_dgfx); \
> >       /* Keep has_* in alphabetical order */ \
> >       func(has_64bit_reloc); \
> > +     func(has_64k_pages); \
> >       func(gpu_reset_clobbers_display); \
> >       func(has_reset_engine); \
> >       func(has_global_mocs); \
