Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A855B942
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 12:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C44410E27D;
	Mon, 27 Jun 2022 10:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F0710E27D;
 Mon, 27 Jun 2022 10:49:13 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id 89so14214816qvc.0;
 Mon, 27 Jun 2022 03:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ljfFd4lhgKZtraSwvbM41nnKFkuiOWpQfmHbtz8vIm4=;
 b=PgUxP1OGnaJceGxiRAWKkClS8JfdAqPpna+anzxt/SXhqla2gN/r9cK9arZpTYwqoT
 Oka2tcO8k92tBDbFQgDJ5feIgMh2bzounDyjV/rjOJJe8qxaDPwS203EZH24Ug6Qopah
 wQcdeNEEloN5f87f/eyV0P/PY1X8lsEJN2FybxJ9pZgWCef6cJXEZEqWJjJGZW2zv+Xg
 HFdynARYXrsz0OClTvzdiyE2OqYksAbCLLh8m2NuNJ4X9rYyasuFJ8YHZQCBFRtRLFyb
 rVyxdEnQ1QmjvWrvz9P1DRoySWEJR6kWmqjlrKQB3vMdX+FXSQSvJ1IoUnBKF3kULuyG
 hSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ljfFd4lhgKZtraSwvbM41nnKFkuiOWpQfmHbtz8vIm4=;
 b=KuevJa9EdX9Z50hhASZpDADG5r6lQ1HCtw+9Au/vxQ1eD2DB3JTKE/CY2PLuWUepbF
 aStorTjWTlqghxO40OqxW6tjXC+sMxSsmK+yZ8r1xwN6v849zS2Xk+2NgQUTox0RfrVo
 KwPErmxbJh0ZNpjsDHmOSZKirEDXp0CkZVf9L78TjA7N5sKUBRKdBfKfue7S9LtRt5DA
 DXPKYfdQLO3fhr2aIxeU9+PqLutfBRVLreP3H3KPoAflW/nxDkGcjHDC3IXk0zkOYkZD
 zsZo/8DUGSFZb9CosGjakEiOapO5YitWXryTU40WNBLHfZO41nZnwQn77FQB5mG2/vp3
 GpAg==
X-Gm-Message-State: AJIora8MekAQTLXGAKPIHExzylCYO9/kiM1p9Hkj7ai1Ug2fEOk4rD0I
 8stATyggAK5qaQtp/ZUsaB1mSgLo1kDbXffMSVo=
X-Google-Smtp-Source: AGRyM1saZ1LC1V74p9wXM27+SRMabZ+KmwF5rBMYGfzuqBdeo6i2poWG6VGB87w6B0a7kfHXlZcva1HQCVPKyPH8gXQ=
X-Received: by 2002:a05:622a:178d:b0:317:7102:d046 with SMTP id
 s13-20020a05622a178d00b003177102d046mr8327537qtk.645.1656326951969; Mon, 27
 Jun 2022 03:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220621104434.190962-1-matthew.auld@intel.com>
 <20220621104434.190962-11-matthew.auld@intel.com>
 <142c82a44dc1ea6ec1d501d783679c3a513282b5.camel@linux.intel.com>
 <27334c5e-6ee0-361a-cc93-9785f6c7136f@intel.com>
 <5c5eec72-1dfd-4f66-c162-1556aa51ec9e@amd.com>
 <ac9e3b86-64c5-9e89-7a9f-4249b918f5e0@intel.com>
In-Reply-To: <ac9e3b86-64c5-9e89-7a9f-4249b918f5e0@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 27 Jun 2022 11:48:45 +0100
Message-ID: <CAM0jSHMR8PYEK+vv63X=3UO_NC5OtseW8DAEyVU1R9pcsjZN-A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 10/12] drm/i915/ttm: handle blitter failure
 on DG2
To: Matthew Auld <matthew.auld@intel.com>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Jun 2022 at 16:31, Matthew Auld <matthew.auld@intel.com> wrote:
>
> On 23/06/2022 15:52, Christian K=C3=B6nig wrote:
> > Am 23.06.22 um 16:13 schrieb Matthew Auld:
> >> [SNIP]
> >>>> TTM_BO_VM_NUM_PREFAULT);
> >>>> +               /*
> >>>> +                * Ensure we check for any fatal errors if we had to
> >>>> move/clear
> >>>> +                * the object. The device should already be wedged i=
f
> >>>> we hit
> >>>> +                * such an error.
> >>>> +                */
> >>>> +               if (i915_gem_object_wait_moving_fence(obj, true))
> >>>> +                       ret =3D VM_FAULT_SIGBUS;
> >>>
> >>> We should check with Christian here whether it's ok to export
> >>> ttm_bo_vm_fault_idle() as a helper, so that we release the proper loc=
ks
> >>> while waiting. The above is not a bug, but causes us to wait for the
> >>> moving fence under the mmap_lock, which is considered bad.
> >>
> >> Christian, any chance we can export ttm_bo_vm_fault_idle() for use
> >> here? Or is that NACK?
> >
> > Well question is why you want to do this? E.g. what's the background?
>
> Right, so basically we need to prevent userspace from being able to
> access the pages for the object, if the ttm blit/move hits an error
> (some kind of GPU error). Normally we can just fall back to
> memcpy/memset to ensure we never leak anything (i915 is never allowed to
> hand userspace non-zeroed memory even for VRAM), but with small-BAR
> systems this might not be possible. Anyway, if we do hit an error during
> the ttm move we might now mark the object as being in an "unknown state"
> before signalling the fence. Later when binding the GPU page-tables we
> check for the "unknown state" and skip the bind (it will end up just
> pointing to some scratch pages instead). And then here on the CPU side,
> we need to sync against all the kernel fences, before then checking for
> the potential "unknown state", which is then handled by returning SIBUS.
> The i915_gem_object_wait_moving_fence() is basically doing exactly that,
> but it looks dumb compared to what ttm_bo_vm_fault_idle() is doing. And
> then while all this going on we then also "wedge" the device to
> basically signal that it's busted, which should prevent further work
> being submitted to the gpu.

Gentle ping?

>
> >
> > Regards,
> > Christian.
