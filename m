Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2F82DCFC5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 11:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369606E24E;
	Thu, 17 Dec 2020 10:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEFF6E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:52:34 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id k9so6685634oop.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 02:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b86zQ6hYfHe5R9p87RFoj5eO/8yzWp3ebwGCI1Rpvps=;
 b=c8bshfvjy6uUFi+D4bkf0AbyxoR2/ay7qHCqYg6Q7GG/vKSZmZmTCMwUsLsz8/fkvq
 /TBbvGOWR1ViyNBvuLYF2ZJHWdmEkQGy4veC0SyfDYEJixyvbCXVbCCSMlhxqF2eTRiI
 HgriCVXuI3MvofPwgGkYPSA02MqKzX87/y9aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b86zQ6hYfHe5R9p87RFoj5eO/8yzWp3ebwGCI1Rpvps=;
 b=OuIh4mUQ4ifw+le2XpmFawtKWC0WCMCsblQEhNeza8Ww6h3LdN4FEotNDosRfEGVJh
 BnV7wXil22z7c7691iz4m2JdOpOKGUKjMli0vtmObAOrkXRylAewUyOIWiMOEBAPbkJh
 klybxyIXDcKtEZKSE6m3MViI+co9Pi87wVIga/qvUqCKn8ck2lwsBSIrbHn9ne71AtiO
 n6GhpZ4t1DOGZl5gHEgwDaZAJ8Wp7j96RD78Z8mxuw04XP3tKowYGdY14qtkIxCDZM8x
 OwQpPOcu7R20XCVPmo13eAuHtION7aIiwsRbfQCyB7eyjFFsXHp9zKdWJgZ2xYRRNKXA
 W+RA==
X-Gm-Message-State: AOAM5327WNstjBrDlML1cASB03hRRiXpsaM5yBYROa1/oQgKrc0KkbMi
 s/C2EH3n1aNgppErxCDwxPeVjBuGh1KUKvTvAM59Vg==
X-Google-Smtp-Source: ABdhPJy+qfVZxHUijYZbE0Nbh5z2k/rdFLYVHPEbmNFGCYUB78U1cyWfSgu7KLS8Ow59x+dJFGth9u5YfxUr/3yDwJM=
X-Received: by 2002:a4a:c387:: with SMTP id u7mr23354944oop.89.1608202354296; 
 Thu, 17 Dec 2020 02:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-9-contact@emersion.fr>
 <X9p65bX22V6SndAA@phenom.ffwll.local>
 <zg8iRcg5FuA6xTm47AXmIyBUBV8KVfnk4G61EVlu3gqaOdIg77OmCL_8weafYpfDxa4rnaDufT6eA_SLzVpP90hkgWtoat5H77zRZMl7hjk=@emersion.fr>
In-Reply-To: <zg8iRcg5FuA6xTm47AXmIyBUBV8KVfnk4G61EVlu3gqaOdIg77OmCL_8weafYpfDxa4rnaDufT6eA_SLzVpP90hkgWtoat5H77zRZMl7hjk=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 17 Dec 2020 11:52:23 +0100
Message-ID: <CAKMK7uFbG+x0kHQfZjqwmRQ7zQjTDSBo2FYkoLHG9yf1mzApMA@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/doc: document the type plane property
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 11:41 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, December 16th, 2020 at 10:23 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > > + * type:
> > > + *     Immutable property describing the type of the plane.
> > > + *
> > > + *     For user-space which has enabled the &DRM_CLIENT_CAP_UNIVERSAL_PLANES
> >
> > While we're at this: Does the kerneldoc for this cap mention that it's
> > implicitly enabled when you're enabling atomic?
> >
> > Maybe worth repeating here too.
>
> Good point. v2 will do both.
>
> > > + *     capability, the plane type is just a hint and is mostly superseded by
> > > + *     atomic test-only commits. The type hint can still be used to come up
> > > + *     more easily with a plane configuration accepted by the driver.
> > > + *
> > > + *     The value of this property can be one of the following:
> > > + *
> > > + *     "Primary":
> > > + *         To light up a CRTC, attaching a primary plane is the most likely to
> > > + *         work if it covers the whole CRTC and doesn't have scaling or
> > > + *         cropping set up.
> > > + *
> > > + *         Drivers may support more features for the primary plane, user-space
> > > + *         can find out with test-only atomic commits.
> >
> > We need to mention here that this is the implicit plane used by the
> > PAGE_FLIP and SETCRTC ioctl (maybe spell them out in full since these are
> > userspace docs).
>
> I intentionally didn't write that down here, because as previously discussed,
> user-space has no way to guess the drm_crtc.{primary,cursor} pointers, so
> user-space cannot guess which planes will be used for legacy IOCTLs. Adding any
> hint that user-space _could_ do it will result in broken user-space.

Hm then at least a warning that userspace must not mix legacy ioctls
with using primary planes explicitly, since havoc will ensue? More
relevant for cursor planes, since some compositors do use atomic +
legacy cursor planes, but imo good to have the same blurb with the
list of relevant ioctls for each.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
