Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C1F3581C7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7091D6EAA2;
	Thu,  8 Apr 2021 11:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3806EAA2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:30:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p19so1034522wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 04:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vQj46IhNspmas/5OPr6SjIi6f3GMIjw/EQLmBDggwkQ=;
 b=Ys+NBfXEpc8IP56JypAEBeJOKc6fZHMuBvMZOkqVwVM0Z89mB6me434fB0cO1SGLSB
 /KIelL8/pfu2a9P6UeJlG4wZjqXvOKVG9TaIBuahjwyGAc2atte+c7NnuoEnFAnANKp6
 jPkkP6DT9gCbZmYZvFyeh6t/y2UGTfRnXjOWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vQj46IhNspmas/5OPr6SjIi6f3GMIjw/EQLmBDggwkQ=;
 b=gy2rM1iKYTOMJ6IdWBqfuoyyGIznZ0Yr+FfpMwkvRmGLhwFgiMCgz+P2MLleSlOc+S
 Xe/lGp3aZTgbFOsA3rm1hwVbzL3AJY6t1b57dbMWUffultj9H1Jcw/oYUXwz5P1DyrYc
 mzvaSPP1FKbsRfZEwMjvuUmKE05tD4LzXRRlL+Uq8D0x5fp67gIhUwhNGi7pKKltIJv+
 vQZ6+hLz6Zprku6a3OrPgpXhgPpKLGB5pqWaAN1GWyJuuHCnDlrFw/8LpqTewZIcbME5
 waZnfH9o3+xb3j0tY3xtLVXsseT0qOdLg/pg6UxuTdOcmqhGcAhwVsdw6MFJhhwyFh6Y
 jgaA==
X-Gm-Message-State: AOAM533Evk19rG4QIDyDTCW0OWQrwlORLFapH8MR3z1keqfLLhzYiMPB
 UQrwM3t3aloTokd9nVI+vAbyLQ==
X-Google-Smtp-Source: ABdhPJwZY6QT8oFYKEvaxkBEaIaVK8CaiTCP2nczW7BjZ/7b2XH6MHRHT8cyV9j8WMCX0ibi9NbeBw==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr8049198wmc.51.1617881419442; 
 Thu, 08 Apr 2021 04:30:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm14873760wrt.22.2021.04.08.04.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:30:18 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:30:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 2/2] drm/doc: emphasize difference between plane formats
 and IN_FORMATS blob
Message-ID: <YG7pSJHe6gKDJ6Hh@phenom.ffwll.local>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-3-leandro.ribeiro@collabora.com>
 <YG24z2oeHVtzvkXy@intel.com>
 <RW8-e8gSvP1pTckh_2alh-dqd3OR_bdl8e5PYdZVWBL4VnBMh0_ZWEfdlRmoQvzI0lGVH62Fp83MCaPqLZxlCE5pjntUhq-zW0v4-S_4Vos=@emersion.fr>
 <20210408125919.4a83119c@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408125919.4a83119c@eldfell>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 12:59:19PM +0300, Pekka Paalanen wrote:
> On Thu, 08 Apr 2021 08:39:10 +0000
> Simon Ser <contact@emersion.fr> wrote:
> =

> > On Wednesday, April 7th, 2021 at 3:51 PM, Ville Syrj=E4l=E4 <ville.syrj=
ala@linux.intel.com> wrote:
> > =

> > > > +	 * To find out the list of formats that support modifiers, usersp=
ace
> > > > +	 * must use the plane IN_FORMATS blob property.
> > > >  	 */  =

> > >
> > > Addfb2+modifiers predates the IN_FORMATS blob, so this doesn't
> > > match reality.  =

> > =

> > TBH, I'm inclined not to care about this edge-case. It's already
> > complicated enough for user-space to figure out what's the right thing
> > to do when supporting both implicit modifiers and explicit modifiers.
> > Using modifiers without IN_FORMATS is risky, since a whole part of the
> > modifier negotiation mechanism is missing.
> > =

> > Maybe we can just stick a "since kernel x.y.z" in here to address your
> > concern.
> =

> Yeah, or we could word it less "must", e.g. "The list of supported
> formats with their explicit modifiers is advertised via IN_FORMATS blob."
> =

> We don't have to require userspace to not use the explicit modifier
> uAPI if IN_FORMATS does not exist. There might be other ways how
> userspace determines the explicit modifiers, like a Wayland compositor
> advertising those format-modifier pairs that EGL can import. Then
> clients use those, and the compositor can try to import those to KMS as
> well. Maybe it works, maybe it doesn't (the same even if IN_FORMATS
> exists).
> =

> IN_FORMATS just gives better chances of picking something that ends up
> working.

Yup.

> The thing userspace *must not* do is to try to use the no-modifiers uAPI
> when it has an explicit modifier. But do we then have exceptions for
> MOD_LINEAR?
> =

> If a buffer has been allocated with explicit modifier MOD_LINEAR, does
> it mean it is ok to import to KMS using the no-modifiers uAPI or not?

Maybe it work with current userspace, but not guaranteed. I think we
should strongly discourage this at least.

The case this can go boom is if userspace allocates a big bo, with some
implicit metadata. And then suballocates some linear buffer out of that
with explicit modifiers. This could happen if userspace does realize
modifiers work, and then does some funky optimization to linear e.g. as
part of a resolve pass. Not such hw/driver currently exists, but not
something I'd guarantee never happens.

If you then create a drm_fb with that with no modifier specified, you get
the implicit one from the metadata.
> =

> The other things userspace *must not* do is use the explicit modifier
> uAPI when it does not have an explicit modifier, in essence pulling a
> modifier out of a hat. It might be tempting to use MOD_LINEAR in that
> case, sometimes it might work, but it's wrong. Userspace must use the
> no-modifiers uAPI instead.

Yes. Userspace can't guess the modifier if it doesn't have it.


> =

> Right?
> =

> The point of these documentation patches is to establish the convention
> that:
> =

> - drm_mode_get_plane::format_type_ptr is the list of pixel formats that
>   can work via the no-modifiers uAPI, but says nothing about the
>   explicit modifiers uAPI.
> =

> - IN_FORMATS is a list of format-modifier pairs that can work via the
>   explicit modifiers API, but says nothing about the no-modifiers uAPI.
> =

> Is that a reasonable expectation?

I'm not sure. I thought they're the same list underneath in the kernel, at
least for drivers that do support modifiers. The current wording I think
suggests more meaning than is actually there.

> Is it also so that passing MOD_INVALID to the explicit modifier uAPI
> (ADDFB2) is invalid argument? Do we have that documented?

We'd need to check that, currently it's an out-of-band flag in the struct.
Atm DRM_FORMAT_MOD_INVALID is entirely an internal sentinel value to
denote end-of-array entries.

In practice it wont pass because we validate the modifiers against the
advertised list.
-Daniel

> =

> =

> Thanks,
> pq



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
