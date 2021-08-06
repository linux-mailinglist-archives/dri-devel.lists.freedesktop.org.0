Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289313E2F82
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CE46EC17;
	Fri,  6 Aug 2021 18:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AD56EC17
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 18:55:10 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id n16so13414332oij.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 11:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ee0WQeW0oG+HO4+aCd3pDBfOm+0C7p8Uim3sYNB9Dhs=;
 b=V3jMri66tYweKRcATev05VAOWtxQs52p0LGgXR0sUtaP1FY6m8/HLC19V7d4H1O6ZM
 jyII1sPovoHwb8CVgaKlZBhpg8PJqWhhZvNkSWW/JCv44iaxNQdtTJ516fIXtRcnzApW
 ozV7uipbgZnYKu57Yf/noXHkMmfYYCgh9Q0qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ee0WQeW0oG+HO4+aCd3pDBfOm+0C7p8Uim3sYNB9Dhs=;
 b=XiYvzmI6JUdj1ot2s/iiDaVxnEZstes69JctylzQmNbnyyCsgyoiilWz+89VonzlC3
 zlrYCm6lpfrzVLtwL9zSVEZZk0t3FoKzxt7uodwKuuc1fmmzTg+5WKMzsKyhqLa8hemO
 b/rjY7IQKSNnldCSTmTh4Z2vByxXL2G1urcm131r0hgCvTYS4Tdt9qRDaRQpzlT5KaZy
 KdEqX9d+EWkDS6xiYLDpwpFzQn+N7amQ4pu4UnUijsDYrA8FUwbTD5nkO1SX2jiX/Y0/
 Dgiihy9553DlRJyl352JUW8X+/tZeIL2cCjQjgZUsnzLHOeWc6I/e/TFuFEJ2QOnU3z7
 9sbg==
X-Gm-Message-State: AOAM531cobM5LSirFVyMZ1SBXrmcWx6Mg6DEQ62ttkICJ1k3Snynmea6
 QQ4BihbKfiFo3jf3t44g7UqvF4AB0KVdpUYfa+qAyg==
X-Google-Smtp-Source: ABdhPJyu5IblimdvK8unLyxQL5go3Wze1QlSxFjYYy0f/NJx+gBzxcskFzLl4GjuAx94IlCDtklhmTIe9pOkdbQUJlk=
X-Received: by 2002:a54:4015:: with SMTP id x21mr6374991oie.128.1628276110210; 
 Fri, 06 Aug 2021 11:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210728192100.132425-1-matthew.brost@intel.com>
 <23d6e809-1d6e-ae35-1aee-e6f0c8c90419@intel.com>
In-Reply-To: <23d6e809-1d6e-ae35-1aee-e6f0c8c90419@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 6 Aug 2021 20:54:59 +0200
Message-ID: <CAKMK7uGt3xcquCAkoMNhF4=yVPQpVpWM7zKS8jPQ=wzha-VPfA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable bonding on gen12+ platforms
To: John Harrison <john.c.harrison@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 6, 2021 at 8:25 PM John Harrison <john.c.harrison@intel.com> wrote:
> On 7/28/2021 12:21, Matthew Brost wrote:
> > Disable bonding on gen12+ platforms aside from ones already supported by
> > the i915 - TGL, RKL, and ADL-S.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 05c3ee191710..9c3672bac0e2 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -446,6 +446,13 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
> >       u16 idx, num_bonds;
> >       int err, n;
> >
> > +     if (GRAPHICS_VER(i915) >= 12 && !IS_TIGERLAKE(i915) &&
> > +         !IS_ROCKETLAKE(i915) && !IS_ALDERLAKE_S(i915)) {
> > +             drm_dbg(&i915->drm,
> > +                     "Bonding on gen12+ aside from TGL, RKL, and ADL_S not allowed\n");
> I would have said not supported rather than not allowed. Either way:
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

Either is fine with me.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>
> > +             return -ENODEV;
> > +     }
> > +
> >       if (get_user(idx, &ext->virtual_index))
> >               return -EFAULT;
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
