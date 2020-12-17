Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C92DD01A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 12:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54C46E2BC;
	Thu, 17 Dec 2020 11:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EA16E30F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:09:21 +0000 (UTC)
Date: Thu, 17 Dec 2020 11:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1608203359;
 bh=JC6Cr1Hz4QnhR/+73a0YdgfVBHt35TXIE3I0TIhxPlw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GVrUh7jZOibfw7s7DwQJ/BZgySl8V5J4n2vTie7EOEZ6MLARzRqbZdsAbxfEUtGnd
 vqTVy74COpNxrxsvIW2gB6XgNUyxpxxl7LFIRVJNttveDAoj3MMLjTpRCmAJaL2siH
 DOMTz3cdM+2rfipJBH9esKoo8ItxOPpYiFlkp35C4tX4dBi+FsJOgZA19hC/qh7EUB
 +LUVffGoJ5wBoOD3KCO8/gGWMo8jPy9CRusWiXBWd1HXyZZ+xXHUd7zTOjfBHM9khU
 RhnRIQa8jegIYK2t3Noce1Evmp8luoBKYQTjwIlwnG1tEE2/nvAiyTZLNj+pW+DJvW
 8XmuTrFHIurnw==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 8/8] drm/doc: document the type plane property
Message-ID: <l8nD7pGzktK4GDrnjyZEBoStfFM0qfKm2h4rnZZB3Fr5VUK2lSgGXHXwCw3HlVbCnHM9WqDykkrHqJNNeX0Qo1h6ymVDtrKIcaCU4U2nLSU=@emersion.fr>
In-Reply-To: <CAKMK7uFbG+x0kHQfZjqwmRQ7zQjTDSBo2FYkoLHG9yf1mzApMA@mail.gmail.com>
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-9-contact@emersion.fr>
 <X9p65bX22V6SndAA@phenom.ffwll.local>
 <zg8iRcg5FuA6xTm47AXmIyBUBV8KVfnk4G61EVlu3gqaOdIg77OmCL_8weafYpfDxa4rnaDufT6eA_SLzVpP90hkgWtoat5H77zRZMl7hjk=@emersion.fr>
 <CAKMK7uFbG+x0kHQfZjqwmRQ7zQjTDSBo2FYkoLHG9yf1mzApMA@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, December 17th, 2020 at 11:52 AM, Daniel Vetter <daniel@ffwll.ch> wrote:

> > > > + *     capability, the plane type is just a hint and is mostly superseded by
> > > > + *     atomic test-only commits. The type hint can still be used to come up
> > > > + *     more easily with a plane configuration accepted by the driver.
> > > > + *
> > > > + *     The value of this property can be one of the following:
> > > > + *
> > > > + *     "Primary":
> > > > + *         To light up a CRTC, attaching a primary plane is the most likely to
> > > > + *         work if it covers the whole CRTC and doesn't have scaling or
> > > > + *         cropping set up.
> > > > + *
> > > > + *         Drivers may support more features for the primary plane, user-space
> > > > + *         can find out with test-only atomic commits.
> > >
> > > We need to mention here that this is the implicit plane used by the
> > > PAGE_FLIP and SETCRTC ioctl (maybe spell them out in full since these are
> > > userspace docs).
> >
> > I intentionally didn't write that down here, because as previously discussed,
> > user-space has no way to guess the drm_crtc.{primary,cursor} pointers, so
> > user-space cannot guess which planes will be used for legacy IOCTLs. Adding any
> > hint that user-space _could_ do it will result in broken user-space.
>
> Hm then at least a warning that userspace must not mix legacy ioctls
> with using primary planes explicitly, since havoc will ensue? More
> relevant for cursor planes, since some compositors do use atomic +
> legacy cursor planes, but imo good to have the same blurb with the
> list of relevant ioctls for each.

Oh, right, good idea, this sounds important. Will add in v2.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
