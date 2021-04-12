Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F086735C753
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 15:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409BE6E580;
	Mon, 12 Apr 2021 13:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B916E580
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 13:16:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id f12so12945581wro.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1NFQRODE7UbGRsT/qpL+VgYqO00eDXxN0QzKYNR7OSo=;
 b=Rzl3serFaVp/CeP9qFNgof3NwsEvFO75bPgAAboTS0j6kUakjpL5kipmNF28wlwBPW
 47iCRD226ZEqW9N1HBN5TJJeQpF9/ATUvaALtYcgRyN9lW3dzZVUmVMUaiWE1d3OJpyX
 vbQ/m6Ogjqq5VWY13sRHCtTMZNDWsVjrl351M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1NFQRODE7UbGRsT/qpL+VgYqO00eDXxN0QzKYNR7OSo=;
 b=fEZl0sfRX4mmFvm2Tv8gJnov508o2rr1PcOoJ0/3r0D2Xmn1HC5o5a2s4pACRV9zxV
 h8VQnlcklDb013/pnTNZY1c2hxTmhyYg9EfAIOmFMT4QZCZ6JAxx+3YW2AM0JYTkIo0r
 LDZ4g6hnGoTJR/OqO/cJX/evpzV4SYpuTidDTpUyf/rOZv0cMEywOnRwI+q4CtPO565Z
 F2kbjmjjRM6qX52COOKxMwR8sveMMrIcNTP2yhEycaUY/hIR0z6BUazhrH8XRCBWskYx
 Jwhh10SwrfXvLDF8DxRO5bAnktSm+P86FhmuV44JvO8QqpneLVVMD7Niudjj5yhmtLpY
 ut8Q==
X-Gm-Message-State: AOAM533xtRac1Sth/EnOkE3umXxkDftu4jaUPn1m/oMoykW8HS8lYOnK
 +gEv/mDeVHBUAuYG2N12MzeD2w==
X-Google-Smtp-Source: ABdhPJzrzTIZkf4P2C8QU30V37tpgbPu5RrakKRa6LVLpNs244CmC5AoFSyKEl4I9xU5xrpRlDsN1g==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr28345494wro.31.1618233391880; 
 Mon, 12 Apr 2021 06:16:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f24sm14960425wmb.32.2021.04.12.06.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:16:31 -0700 (PDT)
Date: Mon, 12 Apr 2021 15:16:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/doc: emphasize difference between plane formats
 and IN_FORMATS blob
Message-ID: <YHRILSZZN/4sk7dr@phenom.ffwll.local>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-3-leandro.ribeiro@collabora.com>
 <YG24z2oeHVtzvkXy@intel.com>
 <RW8-e8gSvP1pTckh_2alh-dqd3OR_bdl8e5PYdZVWBL4VnBMh0_ZWEfdlRmoQvzI0lGVH62Fp83MCaPqLZxlCE5pjntUhq-zW0v4-S_4Vos=@emersion.fr>
 <20210408125919.4a83119c@eldfell>
 <YG7pSJHe6gKDJ6Hh@phenom.ffwll.local>
 <20210408165751.7488e793@eldfell> <YG8Vmsj6mtGZuf3H@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG8Vmsj6mtGZuf3H@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 05:39:22PM +0300, Ville Syrj=E4l=E4 wrote:
> On Thu, Apr 08, 2021 at 04:57:51PM +0300, Pekka Paalanen wrote:
> > On Thu, 8 Apr 2021 13:30:16 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > =

> > > On Thu, Apr 08, 2021 at 12:59:19PM +0300, Pekka Paalanen wrote:
> > =

> > > > The point of these documentation patches is to establish the conven=
tion
> > > > that:
> > > > =

> > > > - drm_mode_get_plane::format_type_ptr is the list of pixel formats =
that
> > > >   can work via the no-modifiers uAPI, but says nothing about the
> > > >   explicit modifiers uAPI.
> > > > =

> > > > - IN_FORMATS is a list of format-modifier pairs that can work via t=
he
> > > >   explicit modifiers API, but says nothing about the no-modifiers u=
API.
> > > > =

> > > > Is that a reasonable expectation?  =

> > > =

> > > I'm not sure. I thought they're the same list underneath in the kerne=
l, at
> > > least for drivers that do support modifiers. The current wording I th=
ink
> > > suggests more meaning than is actually there.
> > =

> > They may be the same list in the kernel today, but do you want to force
> > all future drivers and future formats-modifiers to have that too?
> > Or did the boat sail already?
> > =

> > The existing uAPI considers these two to be independent lists, no
> > documentation saying otherwise, is there?
> > =

> > Should a kernel driver not have a way to say "this format won't work
> > via the no-modifiers uAPI"?
> > =

> > The practical consequence in userspace is how should userspace collect
> > the lists of supported format-modifier pairs, when the kernel has two
> > independent format lists, one carries modifiers explicitly and the
> > other does not. The one that carries explicit modifiers cannot denote
> > "no modifier" AFAIU.
> > =

> > So the "obvious" interpretation in userspace is that:
> > - the format list that does not carry any modifier information should
> >   be used with the no-modifiers uAPI, and
> > - the format list that does carry explicit modifiers should be used
> >   with the explicit modifiers uAPI.

Imo the right interpretation is "it's the same list".

> > If you were to say, that if IN_FORMATS exists, use it and ignore the
> > old no-modifiers format list, then the conclusion in userspace when
> > IN_FORMATS exists is that you cannot use the no-modifiers uAPI, because
> > all formats that are listed as supported carry an explicit modifier.

So formats without modifiers are very funny in their semantics. It means
- implied modifier is untiled
- except on i915 and radeon/amdgpu, where there's magic hidden information
  and you might get something else. But it won't work in multi-gpu
  situations
- except bugs (like imo mesa trying to use tiling without modifiers and
  without magic in-kernel tiling information forwarding is just broken,
  and surprise, it's broken). We've had some where parts of mesa where
  assuming modifiers are ok, but that wasn't the case.

Now maybe we can expose to userspace which drivers have magic device-local
tiling information sharing, but I don't expect this list to ever grow.

Anything beyond that sounds like the kernel should maintain a bug list of
things which are broken in userspace.

> > I understand that the format or format-modifier lists are not
> > authoritative. Formats outside of the lists *could* work. But why would
> > anyone bother trying something that is not suggested to work?
> =

> IMO formats not listed by any plane should just be rejected by addfb2.
> I tried to put that check in the drm core actually but there was some
> weird pushback, so for the moment it's handled by each driver. Some
> drivers (like i915) will reject anything not supported by any plane,
> other drivers might not (and probably no one knows how badly they
> might blow up if you pass in some exotic format...).
>
> I also had some igt patches to test that addfb2 behaviour but
> they didn't go in either.
>
> > Or, is the intention such, that all formats in IN_FORMATS list imply
> > some support through the no-modifiers uAPI too, iff buffer
> > allocation does not give you an explicit modifier?
> > =

> > Or, should there be an i-g-t test to ensure that both the old and
> > IN_FORMATS lists have the exact same pixel formats always, carving that
> > fact into stone and resolving all this ambiguity?
> > =

> > > > Is it also so that passing MOD_INVALID to the explicit modifier uAPI
> > > > (ADDFB2) is invalid argument? Do we have that documented?  =

> > > =

> > > We'd need to check that, currently it's an out-of-band flag in the st=
ruct.
> > > Atm DRM_FORMAT_MOD_INVALID is entirely an internal sentinel value to
> > > denote end-of-array entries.
> > > =

> > > In practice it wont pass because we validate the modifiers against the
> > > advertised list.
> =

> We don't actually. If the driver provides the .format_mod_supported()
> hook then it's up to the driver to validate the modifier in said hook.
> This was done so that people can embed metadata inside the modifier
> while only having the base modifier on the modifier list. How userspace
> is supposed to figure out which values for this extra metadata are valid
> I have no idea.

It took me a while to figure this out again, but now I remember. It's
because of combinatorial explosion of modifiers with stuff like AFBC. So
the modifier list is not necessarily an exhaustive list of all
combinations, some of the modifiers count more like flags. Which is kinda
hilarious since it means userspace can't do anything with modifiers it
gets :-/
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
