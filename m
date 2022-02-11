Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC8D4B22A9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 11:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAB710EA5F;
	Fri, 11 Feb 2022 10:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F6A10EA5F;
 Fri, 11 Feb 2022 10:01:06 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id 200so7878637qki.2;
 Fri, 11 Feb 2022 02:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W8bmJm6UkYjSgB+MCcEWo8EXZssemHPqz8UYIgfuw8s=;
 b=Lpjyc/sba/6HHmlrmy0H/6zKvUvx3EVI2PfZkHxWQvKrPoexQaWbUOLRhCjGrw+++k
 l/X+y90gRIefD2M4HWyq1oLbyjHmXj8tH3Vbx2Seds3QxWhyOulBrOiFi+D0YyUo70ux
 baJdFY2Qt0QYzoQE/x+sHt0vUm34Xj15TT5LBPmMRaSe417l1MqXRzuLJqs13jfrjk/l
 k8rjeNOnrUcwJkhIVZsnN1lzTjvklXpPMmAG6Cof0nX0+4ka90xnzkqJxmwhvI9V5JKr
 3Ml6RVXZSKeebpZ8VTSEGzpZ1+xqEMXOEhj7paIHh48418d+uT3RvfaIY4Bydtpw2Wja
 mCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W8bmJm6UkYjSgB+MCcEWo8EXZssemHPqz8UYIgfuw8s=;
 b=I7MvCYsTmoCoPcEjPEJGeFwcoQrix3LxiQG+nBEjYcoBGIIk0es5eB7RXXGiNlz2jV
 KpmSgkLVjkChn2uRJmC6II5PTkNCQTniL+Q+gsmdTn1cFuj5Tif1IJlQzbxyKH7tn5mQ
 yulXd8b10cdXos2oy3xcDclqZyrmEW7miCFwV1gBvRnZFK7y7dZrTDjoR08hfm18xTSM
 4WWnbJmbMkl9eUxn6LdAB5BemDDYU7xkQnsFAXs9F/IFXlXshUWglaJvqlPgA5yjwv5a
 frivZfFr/P9ME1DN62Z4QyUTC/nWBc7Jb59UYAqmsGlBhUPZMEhLBfTkruXcYwOAM5wC
 XB+g==
X-Gm-Message-State: AOAM533dHMJKjXKEQFieDQo89cPIp82MrdGgHy9/VwUFZXnw0rFTjR/A
 i6RJlcS8eZFN1wISe0IW9KzbFy2iHM7MxR3V+73WUQYvmSg=
X-Google-Smtp-Source: ABdhPJwC72mB78IP+AIkKvCGztlzg6aNM6O8b7iLczDzPg5YMvsUvy2351UReq0dIp0jLTBUj6FjdFVXjHsmIpi8jIk=
X-Received: by 2002:a05:620a:1a13:: with SMTP id
 bk19mr305385qkb.519.1644573665581; 
 Fri, 11 Feb 2022 02:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-13-matthew.auld@intel.com>
 <e4f128ad-1738-cee7-6790-fbdbb6d5698d@linux.intel.com>
 <CAM0jSHM8+KBAN2iMM7L+9HUKuTodH5u32o4XgGZbv8fvUrn67g@mail.gmail.com>
 <45a64b08-1a7e-117f-fd20-e5c4a15f8d7c@linux.intel.com>
In-Reply-To: <45a64b08-1a7e-117f-fd20-e5c4a15f8d7c@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Feb 2022 10:00:39 +0000
Message-ID: <CAM0jSHMrX9=MKunVqHS1kkZevW-Y9kmCNUrAPqOi=3xRmMk1AA@mail.gmail.com>
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

On Fri, 11 Feb 2022 at 09:56, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
>
> On 2/11/22 10:52, Matthew Auld wrote:
> > On Fri, 11 Feb 2022 at 09:49, Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> >>
> >> On 2/10/22 13:13, Matthew Auld wrote:
> >>> Starting from DG2+, when dealing with LMEM, we assume that by default
> >>> all userspace allocations should be placed in the non-mappable portio=
n
> >>> of LMEM.  Note that dumb buffers are not included here, since these a=
re
> >>> not "GPU accelerated" and likely need CPU access.
> >>>
> >>> In a later patch userspace will be able to provide a hint if CPU acce=
ss
> >>> to the buffer is needed.
> >>>
> >>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >>> ---
> >>>    drivers/gpu/drm/i915/gem/i915_gem_create.c | 9 +++++++++
> >>>    1 file changed, 9 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu=
/drm/i915/gem/i915_gem_create.c
> >>> index 9402d4bf4ffc..cc9ddb943f96 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> >>> @@ -424,6 +424,15 @@ i915_gem_create_ext_ioctl(struct drm_device *dev=
, void *data,
> >>>                ext_data.n_placements =3D 1;
> >>>        }
> >>>
> >>> +     /*
> >>> +      * TODO: add a userspace hint to force CPU_ACCESS for the objec=
t, which
> >>> +      * can override this.
> >>> +      */
> >>> +     if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
> >>> +                           ext_data.placements[0]->type !=3D
> >>> +                           INTEL_MEMORY_SYSTEM))
> >>> +             ext_data.flags |=3D I915_BO_ALLOC_GPU_ONLY;
> >>> +
> >> WRT previous review comment here, it would be easier to follow if the =
bo
> >> was marked as a GPU only buffer regardless. Then for example capture a=
nd
> >> other functions where it actually matters can choose to take action
> >> based on, for example, whether the BAR is restricted or not?
> > Yeah, I completely forgot about this, sorry. Will fix now.
>
> Actually you did reply, but I forgot to reply to that :).

Hmm, should we just drop the IS_DG1() check here(that was my first
thought), or go further and still apply even regardless of placements?
i.e it would be set on integrated

>
> /Thomas
>
>
