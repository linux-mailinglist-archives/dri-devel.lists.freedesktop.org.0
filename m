Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7381684AB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 18:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8DD6F4DF;
	Fri, 21 Feb 2020 17:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1E36F4DF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 17:17:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b17so2720369wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 09:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VvU6qS7YW9e8upuyatVyrxTRLx/v1yYX3s1Xf82uqAk=;
 b=aQ19w7SewSu+WoeWIYX+sS1RPvu8h5zxbbSazY1X0+bItr/JfF6tRC9peTJ+gObDS0
 QKaq20gwdfIyFazjmuI+KfWwGM6yolg3VcTNBDZnBPSobsK2y3S68/+x9bgSJlUBt2cS
 tDVkzgkumwp6qlWK3/DMwwC4hjwTEaV5w24Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VvU6qS7YW9e8upuyatVyrxTRLx/v1yYX3s1Xf82uqAk=;
 b=uRfJuhQwzk9XWAzTu1J5YhkCpmNMy4IPS2FuKMIxfjTH4AUIZZXwQIufNssR+w1D51
 TSAtUPyZoOlboxMHDUiwNvrAT2Gb/y++zgxU7hQO80E0nwrFJ00L3oOm24qksXxZ8v8x
 b07Sv81ru9U4FYba5PLD5KE+DoXlF81+ZUGfaN8gKzTJOVa+Q4GFWSAZA0Xi0Jyq2Gmv
 zySaGG4CPAvrfNYwaJLimbWyNtNj+iFf8f9VDAYsbUg3OnvDwP3dUlVS98JaZC5LYyzi
 tzm+qIRZ4FLdP/OCNrtpAv2XUOA2nt7p4F39X50JQ33xjgbjcZ4M1iVK7QLVL/fUcM6q
 HfYQ==
X-Gm-Message-State: APjAAAVpjIkqO7DO7QdvbfamD2Sb/incmF6n2wkv8hMrmSBWewwZyBQW
 M4CnN5QSsZ5FCVwWdVbvZT+NGg==
X-Google-Smtp-Source: APXvYqwipfe/NQXnEVFKLR9xHO1r6L/og6lStFct4k+RGkMTLTJ0W1ckbEe7zou/k/HrDGPLg2boPg==
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr4851564wmj.1.1582305420957; 
 Fri, 21 Feb 2020 09:17:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d22sm4200089wmd.39.2020.02.21.09.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:17:00 -0800 (PST)
Date: Fri, 21 Feb 2020 18:16:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 00/12] drm: Put drm_display_mode on diet
Message-ID: <20200221171657.GE2363188@phenom.ffwll.local>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CACvgo50pCb4OafEs9tLm7YEPqHc+BtDAvagRnwjXtZeQDNwUwg@mail.gmail.com>
 <20200220142759.GA13686@intel.com>
 <20200220153426.GC13686@intel.com> <871rqoyy42.fsf@intel.com>
 <20200221114309.GM13686@intel.com>
 <CAKMK7uGTpEHuBA09FuUA5ihPLtw7s+6=YBfQ2A4i=8Q-4SsRjA@mail.gmail.com>
 <20200221154031.GQ13686@intel.com>
 <20200221160904.GS13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221160904.GS13686@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 06:09:04PM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Feb 21, 2020 at 05:40:31PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Fri, Feb 21, 2020 at 03:42:56PM +0100, Daniel Vetter wrote:
> > > On Fri, Feb 21, 2020 at 12:43 PM Ville Syrj=E4l=E4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Fri, Feb 21, 2020 at 01:32:29PM +0200, Jani Nikula wrote:
> > > > > On Thu, 20 Feb 2020, Ville Syrj=E4l=E4 <ville.syrjala@linux.intel=
.com> wrote:
> > > > > > Looks like getting rid of private_flags is going to be pretty
> > > > > > straightforward. I'll post patches for that once this first ser=
ies
> > > > > > lands.
> > > > >
> > > > > Going all in on crtc state? I suppose migrating away from private=
_flags
> > > > > could easily start in i915 before that. Seems rather independent.
> > > > >
> > > > > I guess it's __intel_get_crtc_scanline() and:
> > > > >
> > > > >       vblank =3D &crtc->base.dev->vblank[drm_crtc_index(&crtc->ba=
se)];
> > > > >       mode =3D &vblank->hwmode;
> > > > >
> > > > >       if (mode->private_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_=
TIMESTAMP)
> > > > >
> > > > > that gives me the creeps in reviewing all that.
> > > > >
> > > > > There's also [1] adding new uses for private_flags; I think there=
 were
> > > > > issues in getting at the right crtc state on some of those paths,=
 but I
> > > > > forget the exact details. Ideas?
> > > >
> > > > I'm just going to move them to the crtc_state and put a copy into t=
he
> > > > crtc itself for the vblank code. Pretty much a 1:1 replacement.
> > > > Saves me from having to think ;)
> > > =

> > > I've looked through the patches, and didn't spot any place where we
> > > couldn't just get at the full crtc state. Might need some crtc->state
> > > dereferencing and upcasting and making sure stuff is ordered correctly
> > > with enable/disable paths of crtc, but nothing to jump over.
> > =

> > swap_state() could easily race with the irq handler. I guess
> > practically unlikely the old crtc state would disappear before
> > the irq handler is done, but still seems somewhat dubious.
> =

> And I guess the bigger problem is that swap_state() happens way too
> early. So crtc->state would be pointing to bogus stuff while we're
> disabling the crtc.

Uh, so we're essentially piggy-packing some random i915 state on top of
the hw timing stuff the vblank handler does, and hope that this is
race-free enough to not matter?

I think the right solution there would be to have a proper
spinlock_irqsafe for this stuff that the dsi TE handler needs, and through
that make sure that we're actually not going boom. At least it looked like
there's also irq handling bits outside of the vblank code, so the vblank
locking is not going to safe the day.

Or maybe it's really just too late and I should go into w/e :-)
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
