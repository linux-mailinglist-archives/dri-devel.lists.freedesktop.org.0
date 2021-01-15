Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4072F7C7D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 14:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E80E6E40A;
	Fri, 15 Jan 2021 13:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48E86E40A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 13:25:38 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id l207so9524549oib.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 05:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K50fymFwwgAwWgVlH3TJWbeGWCkL0HpABIVSxMeyoEw=;
 b=FSnbPn1FT0MV4DKTU3e0RnAeuAQ71EKPrZA16T/sSAsfo3GKiuLfaq55NHetrbSS2Q
 ScwhL8zlb5AZjCzwi88HxZq994SWUnJ7VoB4ERFTqFKYXhScmGG7skXyNdftcOAgd6EJ
 XuoL+16Ft9LNt6D9Nq4ao3VqsuZB9oM/9iahI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K50fymFwwgAwWgVlH3TJWbeGWCkL0HpABIVSxMeyoEw=;
 b=guZeNf+VoC4okL3KRzTcbSf/aL0lg1mGxm7pdAv0yP5tVxYwT89m+DVyI6LRIZv0z9
 GHpZaQPjV1k27gHxKUB3JlDnSgmz3Sa3K5EJvABvoz39mZhQIKcUaAX7fLbTUVcpLW5s
 xf040YeBBx1dzUsqoiM6UcyXdIpdRi/dQA+1lF5yqoiHM5N6lpQCzlH/LCNB1yAzC+b3
 TvnnsqEHyIiC7bqY87AV7vSjwinjKikKAgtNqrRNh1pMrXJHhnfcbSH0Zym9Q8qT8nLm
 thHStg9f4NrMkvOKFSbDJgOHyMdwF1tlHiIJZOPqJ4yBxQBvW9YAhbqNKpfhwY2hHFyM
 009g==
X-Gm-Message-State: AOAM532r3cmiT8cAryQk4Rx+U5cDd2suXhrVyjUgMRS109lYHi/pXgxi
 IpQK1H4Ra4Q16sHvRZoFYfcVRVOuZDD2+Kq9iCV2jA==
X-Google-Smtp-Source: ABdhPJwor6avZfOwUX7wMIiqwwll30mCqE6YhlyAATBVpzvlaAQZdhw+kHZB7DP7zznKELrpVRJA6xEn+zozujahjVI=
X-Received: by 2002:aca:54d8:: with SMTP id i207mr5562786oib.101.1610717137891; 
 Fri, 15 Jan 2021 05:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20201222133524.160842-1-contact@emersion.fr>
 <20201222133524.160842-3-contact@emersion.fr>
 <X+H7qJI6gqPa57tL@phenom.ffwll.local>
 <P9LiAZrbvSONX_tx4jjrn8n_00rDsAQlbxgWNrK1cO9L9BEKYM1y_4qH8Zo3_Oihtj88PVxxS1a38-3AgeHFvD5iJlDuCnVo2ZK6_nPaMs4=@emersion.fr>
In-Reply-To: <P9LiAZrbvSONX_tx4jjrn8n_00rDsAQlbxgWNrK1cO9L9BEKYM1y_4qH8Zo3_Oihtj88PVxxS1a38-3AgeHFvD5iJlDuCnVo2ZK6_nPaMs4=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 15 Jan 2021 14:25:26 +0100
Message-ID: <CAKMK7uEFwkQ=ruJY9JeYj-MUVxqS_me+pWj3D+iot+9qwN3hMA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/doc: document the type plane property
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

On Fri, Jan 15, 2021 at 12:06 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, December 22nd, 2020 at 2:59 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > > + * type:
> > > + *     Immutable property describing the type of the plane.
> > > + *
> > > + *     For user-space which has enabled the &DRM_CLIENT_CAP_UNIVERSAL_PLANES
> >
> > s/UNIVERSAL_PLANES/ATOMIC/ here?
> >
> > With just universal planes you don't have atomic test-only. But I guess it
> > also works as-is, I'm just not entirely clear what you want to state here.
>
> Right. This paragraph was written when I wasn't aware about ATOMIC implicitly
> enabling UNIVERSAL_PLANES. Fixed in v5.
>
> > > + *     capability, the plane type is just a hint and is mostly superseded by
> > > + *     atomic test-only commits. The type hint can still be used to come up
> > > + *     more easily with a plane configuration accepted by the driver. Note that
> > > + *     &DRM_CLIENT_CAP_UNIVERSAL_PLANES is implicitly enabled by
> > > + *     &DRM_CLIENT_CAP_ATOMIC.
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
> > > + *
> > > + *         Primary planes are implicitly used by the kernel in the legacy
> > > + *         IOCTLs &DRM_IOCTL_MODE_SETCRTC and &DRM_IOCTL_MODE_PAGE_FLIP.
> > > + *         Therefore user-space must not mix explicit usage of any primary
> > > + *         plane (e.g. through an atomic commit) with these legacy IOCTLs.
> >
> > Empty line here for reading comfort in plain text? Same below.
> >
> > Since you mention formats below, I also wonder whether we should state
> > here that xrgb8888 is generally supported, worst case through software
> > emulation. That's defacto the uapi we have to adhere to.
>
> I wonder. If a new driver decides not to support XRGB8888, that wouldn't be a
> kernel regression because it's about new hardware. Do we want to formally lock
> future drivers into XRGB8888 support? Or do we want to open the door for a
> driver to break this assumption, even if most user-space won't work on the new
> hardware?
>
> I guess all of this is mostly theoretical at this point.

It's been practical since a few years, since a lot of the simple
panels we've added don't support xrgb8888. That's why we have the
fairly good horror show of format conversions in drm_format_helper.c.
And we've done this because too much general distro userspace just
keels over real bad if xrgb8888 doesn't work.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
