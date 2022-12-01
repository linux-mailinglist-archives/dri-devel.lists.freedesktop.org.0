Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA7563ED90
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2E010E5A8;
	Thu,  1 Dec 2022 10:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EF910E5A8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:22:09 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id jl24so1204872plb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 02:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OI/9P086FlFXQcoskOlRhWzBPG93qoSMuWBLNBVt0Hk=;
 b=cz9Hvi/VslbiMd/9z6zO4e0a4+rsirsX9HCh5pxa8+Xo4jv6YBwtJT6Rd8Me12rv1e
 nDrzLl0tZBC/dbj13zqAXFEN9lDOneqOMdXP4vtV+WiiQwgQCaPBpCno+tK9D1hjc++h
 aBrGTznx5/m92CxTJwUOOhex+y8hBh+2NTk9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OI/9P086FlFXQcoskOlRhWzBPG93qoSMuWBLNBVt0Hk=;
 b=iW0Cvy0KHuyYCFWyHzMOGXGEhqDD84yLQXbgMsChGc8c71ch32GLgxBaUKryfOjLwd
 mjzhgj2RJMPFYM+l5K1IjwqlZfFj64ENKWVBMV9SIJq9wrX7Q2CNHIN+jr09JrJoeQtS
 XUYLw5aFXxiq1oaYF44ZcT2nVV5uP1g71f3ES55Yxb3puIRS1dWuBObJ4M+6ayf60qyj
 5SOevujdnRXUI1KEYCqOIIWKWom3+A2jgvtvgHUs5ZiUeeJPHyitvvYbPIFEbv15vIxi
 xf5Bv2FG9uDHbfRDPWqGIUq2XuA6Vl+g0xoRs2/uQ1wAeKDhzHHK29y5jGapoWA2ETAd
 mLmg==
X-Gm-Message-State: ANoB5plQzjpjqeBWIBhLqTytwmKhhZH1k9d8I63+PlME9xHs4FvAoLZv
 +AVnm77wvz0MDtm51yg52I78o9u/W+TgOSz2gNENXBEXR6Q3rA==
X-Google-Smtp-Source: AA0mqf6YUtzgO550Zg5+/tlaD0TlIZmPxWDgJACym4Qo/sP1IbLAZz9v/H9HeW6CGuB9pBJaJk7HzmYOnyPBbTQpH0I=
X-Received: by 2002:a17:902:d192:b0:189:8867:9bd4 with SMTP id
 m18-20020a170902d19200b0018988679bd4mr21126303plb.68.1669890129088; Thu, 01
 Dec 2022 02:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
 <Y4h85n6krZ3CVkQp@phenom.ffwll.local>
In-Reply-To: <Y4h85n6krZ3CVkQp@phenom.ffwll.local>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 1 Dec 2022 11:21:57 +0100
Message-ID: <CAKMK7uErF0THyGHcke=AizGhJkaoQpN6PzjykbFFCX6eJ6DoJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Document open source user waiver
To: DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
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
Cc: Neil Trevett <ntrevett@nvidia.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Dec 2022 at 11:07, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Nov 23, 2022 at 08:24:37PM +0100, Daniel Vetter wrote:
> > It's a bit a FAQ, and we really can't claim to be the authoritative
> > source for allocating these numbers used in many standard extensions
> > if we tell closed source or vendor stacks in general to go away.
> >
> > Iirc this was already clarified in some vulkan discussions, but I
> > can't find that anywhere anymore. At least not in a public link.
> >
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Alex Deucher <alexdeucher@gmail.com>
> > Cc: Daniel Stone <daniel@fooishbar.org>
> > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Neil Trevett <ntrevett@nvidia.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>
> From irc:
>
> <airlied> danvet: ack from me

Also from irc:

<mareko> danvet: Acked

-Daniel

> > ---
> >  include/uapi/drm/drm_fourcc.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index bc056f2d537d..de703c6be969 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -88,6 +88,18 @@ extern "C" {
> >   *
> >   * The authoritative list of format modifier codes is found in
> >   * `include/uapi/drm/drm_fourcc.h`
> > + *
> > + * Open Source User Waiver
> > + * -----------------------
> > + *
> > + * Because this is the authoritative source for pixel formats and modifiers
> > + * referenced by GL, Vulkan extensions and other standards and hence used both
> > + * by open source and closed source driver stacks, the usual requirement for an
> > + * upstream in-kernel or open source userspace user does not apply.
> > + *
> > + * To ensure, as much as feasible, compatibility across stacks and avoid
> > + * confusion with incompatible enumerations stakeholders for all relevant driver
> > + * stacks should approve additions.
> >   */
> >
> >  #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
> > --
> > 2.37.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
