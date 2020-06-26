Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4920B449
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 17:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311E36E1B3;
	Fri, 26 Jun 2020 15:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0DA6E1B3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 15:17:05 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id h17so8365326oie.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vCxKFDW5hD8IOf+dFKW2LCXvx1/7rd0oZU5ZWYNHYg=;
 b=cTA7+6e8Yb0wzu9JVS9l3XBzANSDAyxbuq8iTGzwOYT8oqOKS9rOPnEWllRm1+1rv6
 QyHr/u8js1ZrgPkGJH6oSP56PhJTtUssfVpRSY0arFawxxWXRW0Q8C1/W+hLvIX/NJnm
 NtZEH2+Bezng2M4fBefZQXvKyThcF43NvlPiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vCxKFDW5hD8IOf+dFKW2LCXvx1/7rd0oZU5ZWYNHYg=;
 b=ByMmRbFzmJVVAdVvfN4ZNPEy1+xI/QxZ9ehcJUvTx5ntmbikJe1M6EIJrweWKKlUYH
 SE3CRj6S5mAmrXyU+o1dfq8k5DzovF4olj7EpVHPjd8B65wQZoZpt609RPR09N0zh5Dn
 QtcELE90Yd/KMUhJb+6HZiSoZCdfqs+tHWa0GY+DnRkzc+S4pZ28tj/+CQNFjubEa/nx
 +QyOdtwSBg3l+CWJ0IqBcHOlLBe5r0xgRWPBKE96XQmnuHhd9FqMLjtnXJXhvR/VrkuL
 /Yjmmx76csrKBy+kOgnEYQmODFbK+QLAs+wP5LuntZyDC8Cdr8cbF0E4Vh6hDKFBRKqA
 tMzA==
X-Gm-Message-State: AOAM531POoOleuVBnhrXpAf7PokLL39Rm432BIVm5FvFZRp7lIDagd2L
 lpr/ov6ilEtSxOnUGBuii1usoR7xcCLMn6ZQN9IioQ==
X-Google-Smtp-Source: ABdhPJzKv0XctBo7Sgi5TH0M/ph27yk2+Z6CWSYxAOtLqikZf+h/Xod65574KsQ9H7uwnpiMlnXWU+AcCK1zD5DtKxA=
X-Received: by 2002:aca:bc06:: with SMTP id m6mr2636289oif.101.1593184624750; 
 Fri, 26 Jun 2020 08:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200626135233.32137-1-brian.starkey@arm.com>
 <CAKMK7uGCQV7XptAAycHG_XOW-VOtHpUB2qqp2Kvo+3oUhkmOQA@mail.gmail.com>
 <20200626141557.g7vhzfyre764otr4@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20200626141557.g7vhzfyre764otr4@DESKTOP-E1NTVVP.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 26 Jun 2020 17:16:53 +0200
Message-ID: <CAKMK7uFy59UegLzWhrx3a1u1Hiv3+0iDhViHC+SecPJBo+O0mA@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_fourcc: Add generic alias for 16_16_TILE modifier
To: Brian Starkey <brian.starkey@arm.com>
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
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, nd <nd@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, matteo.franchin@arm.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 4:16 PM Brian Starkey <brian.starkey@arm.com> wrote:
>
> Hi Daniel,
>
> On Fri, Jun 26, 2020 at 04:07:43PM +0200, Daniel Vetter wrote:
> > On Fri, Jun 26, 2020 at 3:52 PM Brian Starkey <brian.starkey@arm.com> wrote:
> > >
> > > In cases such as DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, the modifier
> > > describes a generic pixel re-ordering which can be applicable to
> > > multiple vendors.
> > >
> > > Define an alias: DRM_FORMAT_MOD_GENERIC_16_16_TILE, which can be
> > > used to describe this layout in a vendor-neutral way, and add a
> > > comment about the expected usage of such "generic" modifiers.
> > >
> > > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> > > ---
> > >
> > > This is based off a suggestion from Daniel here:
> > > https://lore.kernel.org/dri-devel/20200529115328.GC1630358@phenom.ffwll.local/
> > >
> > > If there are future cases where a "generic" modifier is identified
> > > before merging with a specific vendor code, perhaps we could use
> > > `fourcc_mod_code(NONE, n)` or add a DRM_FORMAT_MOD_VENDOR_GENERIC.
> > >
> > > However, I also think we shouldn't try and "guess" what might be generic
> > > up-front and end up polluting the generic namespace. It seems fine to
> > > just alias vendor-specific definitions unless it's very clear-cut.
> >
> > I think the above two things would also be good additions to the comment.
> >
> > A totally different thing: I just noticed that we don't pull in all
> > the comments for modifiers. I think we could convert them to
> > kerneldoc, and then pull them into a separate section in drm-kms.rst.
> > Maybe even worth to pull out into a new drm-fourcc.rst document, since
> > these are officially shared with gl and vk standard extensions. Then
> > this new modifier's doc could simply point at teh existing one (and
> > the generated kerneldoc would make that a hyperlink for added
> > awesomeness).
> >
> > Aside from that makes sense to me, maybe just add it to your patch
> > series that will start making use of these.
>
> This is only supported by the GPU, so we wouldn't be using this on the
> Display side.

I mean the patch to add the NV15 fource, it mentions "suitable for 16
by 16 tile layout", would be nice to just put the generic modifier in
that comment.
-Daniel

>
> Thanks,
> -Brian
>
> > -Daniel
> >
> > >
> > > I typed a version which was s/GENERIC/COMMON/, other suggestions
> > > welcome.
> > >
> > > Cheers,
> > > -Brian
> > >
> > >  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > index 299f9ac4840b..ef78dc9c3fb0 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -345,8 +345,27 @@ extern "C" {
> > >   * When adding a new token please document the layout with a code comment,
> > >   * similar to the fourcc codes above. drm_fourcc.h is considered the
> > >   * authoritative source for all of these.
> > > + *
> > > + * Generic modifier names:
> > > + *
> > > + * DRM_FORMAT_MOD_GENERIC_* definitions are used to provide vendor-neutral names
> > > + * for layouts which are common across multiple vendors. To preserve
> > > + * compatibility, in cases where a vendor-specific definition already exists and
> > > + * a generic name for it is desired, the common name is a purely symbolic alias
> > > + * and must use the same numerical value as the original definition.
> > > + *
> > > + * Note that generic names should only be used for modifiers which describe
> > > + * generic layouts (such as pixel re-ordering), which may have
> > > + * independently-developed support across multiple vendors.
> > > + *
> > > + * Generic names should not be used for cases where multiple hardware vendors
> > > + * have implementations of the same standardised compression scheme (such as
> > > + * AFBC). In those cases, all implementations should use the same format
> > > + * modifier(s), reflecting the vendor of the standard.
> > >   */
> > >
> > > +#define DRM_FORMAT_MOD_GENERIC_16_16_TILE DRM_FORMAT_MOD_SAMSUNG_16_16_TILE
> > > +
> > >  /*
> > >   * Invalid Modifier
> > >   *
> > > --
> > > 2.17.1
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
