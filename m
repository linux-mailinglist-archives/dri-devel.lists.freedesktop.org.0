Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E25B25F92B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 13:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FBD6E431;
	Mon,  7 Sep 2020 11:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8D6E431
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 11:19:14 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id m17so13611484ioo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSMAJyQnojOCbl+pS+23apnKqQXokc1A+gnWCgPYgpA=;
 b=hOOMo7UPorEhWgucxr6dV14qHX60sHJDsrG1tYk38jMWYrSFEicZDHkN2vtomj51CD
 93fdOtyj4KUHDgBje5Rhl91Qw7MHH50Bg2boprc25uJ06C1D6SiC4yYa7Xeo9iDIBlZE
 Ew+/IIlC6Mjru8c8f8hRQkTF29CgeDnrIzYfvYVS1r4YgD+Vxkt09QeLOOphZKwLbu5V
 jgNBzAO3wg4qm0DvRAsoOQegTtEAb66dcjX87g9Jdxw1y4ZlpotC3fsDSW4QGam3YLFk
 1+yU6oSKNvhUjngBJEFZwhEHvA6j8nw4LUX2mbCEK2k9FeUudFDmtMnFaoqoQR/zWWzH
 3C4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSMAJyQnojOCbl+pS+23apnKqQXokc1A+gnWCgPYgpA=;
 b=Yr8drZIZRVSTvsse2ZbCmRNfY3+FQHHhcbuo14QotM7LMze3bn+QJ4ygo2Lm88T2dl
 xTihrvh6h7znl3CqMRCO/sMV5gk3dGfPhirIvFZQxDyGKIrX370zQu3ohRPLmMoJiv2L
 lZr3dTqn0H8Z80LXDSafZD13xuUU4L1j6HTNK2FN21/jaAnyTxA59M1eeJAQzsbI2yjV
 hcSFnd08Owl3ctrPMnqlJYsSy3P3cJuWDFjuD0rQluSTpEkxyQLkYGjKhzSpd9Tn1UJW
 3NgJ+suUfupT1wtvkIh8nGzC+6sJTONTSuE/RTvJT55X4VoLuOVX6UpvMJMNUaa8Hiuc
 afIw==
X-Gm-Message-State: AOAM533v3gLPXqBgtIW8YmoZzzuAh6TsDOfTnhMNjwnMYFW+kQRMnUu+
 5PPVg42/jMTQgkVIOXJI5kslrmG5+mv0swFt6HHavQ==
X-Google-Smtp-Source: ABdhPJzSO0+KuiAfUJkCrZwZcCAvTlxo/3ZH0rabTShxMso9g65XLtY8e03DD9JIhoWPPy31pCAoaE5b6rWciJPypA8=
X-Received: by 2002:a02:234c:: with SMTP id u73mr19212114jau.141.1599477554164; 
 Mon, 07 Sep 2020 04:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
 <20200904160709.123970-5-bas@basnieuwenhuizen.nl>
 <290218db-ffbe-0ae7-5a35-33e95d0581c8@amd.com>
In-Reply-To: <290218db-ffbe-0ae7-5a35-33e95d0581c8@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 7 Sep 2020 13:19:05 +0200
Message-ID: <CAP+8YyGyym25=SnbpT_h3dMDjUxNuJi2qGwdvejuTkaY_4HipA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] drm/fourcc: Add AMD DRM modifiers.
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, fixed both locally.

On Mon, Sep 7, 2020 at 10:44 AM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> Hi Bas,
>
> 2 small typos you may want to fix:
>
> On 04/09/2020 18:07, Bas Nieuwenhuizen wrote:
> > This adds modifiers for GFX9+ AMD GPUs.
> >
> > As the modifiers need a lot of parameters I split things out in
> > getters and setters.
> >   - Advantage: simplifies the code a lot
> >   - Disadvantage: Makes it harder to check that you're setting all
> >                   the required fields.
> >
> > The tiling modes seem to change every generatio, but the structure
>
> "generatio" -> "generation"
>
> > of what each tiling mode is good for stays really similar. As such
> > the core of the modifier is
> >  - the tiling mode
> >  - a version. Not explicitly a GPU generation, but splitting out
> >    a new set of tiling equations.
>
> [...]
> > + * with DCC & DCC_RETILE:
> > + *   - main surface in plane 0
> > + *   - displayable DCC surface in plane 1 (not RB-aligned & not pipe-aligned)
> > + *   - pipe-aligned DCC surface in plane 2 (RB-aligned & pipe-aligned)
> > + *
> > + * For multi-plane formats the above surfaces get merged into one plane for
> > + * each for format plane, based on the required alignment only.
>
> "for each for format plane" => "for each format plane"?
>
>
> Pierre-Eric
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
