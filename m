Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378743E0856
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230BC6EA51;
	Wed,  4 Aug 2021 18:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9A36EA51
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 18:53:49 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 n1-20020a4ac7010000b0290262f3c22a63so710980ooq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 11:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rn/3kT2ysBO42makAuGXPJV73VFWwT1Y+IQxpHYfmao=;
 b=N4mNJIH0TXYrKNn21pMEJKQ0W2moyvP6fgQUYfhwYrsHIp82LTH64zNCMD/hR3sVuj
 km3qhN8DgHvjm0mlUOdm3b0bq0GBZjzvmeTg6JS0TFJWOOucUOkb1omuMywrG3S/kv1V
 vuZOhDitIHUL4ekhm8PvZ5GbpPf+j14FoJdSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rn/3kT2ysBO42makAuGXPJV73VFWwT1Y+IQxpHYfmao=;
 b=MfIdBs1y67dGSYWh9cuMf0fZRhyfZzPpCMJpSOrYfpypYqjUKgg3aDe2pxJn+Lv/GT
 7bRepL0aor7iq+QEnsT2TkYenqvKoscoVOasaPnCd/IqdrhFr43y0CnVkpPafwmilqtw
 ASF8SewGeKob5YlXmHtnUbtkLnwCsF1z7BL+5WI6kCjRCrPAgI6mJe9am2auCr2mCAPz
 SzcVOBJma12rhz258nO2KxoQ88fS1IDoITy5HNGyjzg0GhU0xa6looyVarKcTio8Le1W
 GGe6kU7HxvmeKvWDDMS/fyCxmx7XggoUi4nQxVvTmP2bt90xEv+uN9PHPjRS1dZQcpTb
 a/Lw==
X-Gm-Message-State: AOAM533cz+BxFAOwdMr+Qb79qCOb0sizhwNbhVMSt7N6BGm7LnPtLeWX
 H0giByCObNTBWSTYNBrOvudh6Sp/bIyL6ubQSGbxMA==
X-Google-Smtp-Source: ABdhPJxHyZ2UgOoEVW1aDUnpjKbU8Cv8JuRQN2+htQlTpqHiffO3nqVvLlgGFeFwJ9xRdHo0vj5d51HhZwQMTr3BKLs=
X-Received: by 2002:a4a:ea83:: with SMTP id r3mr629924ooh.89.1628103228541;
 Wed, 04 Aug 2021 11:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210804184816.623950-1-jason@jlekstrand.net>
 <CAOFGe97sfQn_g5c8wTKEt8g+EWK+w9ktzUTrPGs1LY9sJP_i=Q@mail.gmail.com>
In-Reply-To: <CAOFGe97sfQn_g5c8wTKEt8g+EWK+w9ktzUTrPGs1LY9sJP_i=Q@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 4 Aug 2021 20:53:37 +0200
Message-ID: <CAKMK7uHHYZRDgmu+4VRBWqbORTbUOSupE0j2rvgXw3sR7dSpkw@mail.gmail.com>
Subject: Re: [PATCH] docs/drm: Add a new bullet to the uAPI requirements
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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

On Wed, Aug 4, 2021 at 8:50 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Wed, Aug 4, 2021 at 1:48 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > While tracking down various bits of i915 uAPI, it's been difficult to
> > find the userspace much of the time because no one bothers to mention it
> > in commit messages.  Require the kernel patch to be a one-stop shop for
> > finding the various bits which were used to justify the new uAPI.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Dave Airlie <airlied@redhat.com>
> > ---
> >  Documentation/gpu/drm-uapi.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index 199afb503ab1..82f780bc3fce 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -109,6 +109,11 @@ leads to a few additional requirements:
> >    userspace patches land. uAPI always flows from the kernel, doing things the
> >    other way round risks divergence of the uAPI definitions and header files.
> >
> > +- The kernel patch which adds the new uAPI **must** reference the patch series
> > +  or merge requests in the userspaces project which use the new uAPI and
>
> Locally, I've done s/project which use/projects which demonstrate/

While we paint this shed ... projects which demonstrate the use of the new uAPI?

Either way this seems like a fine addition to our docs and process,
since grepping through all the things just to figure out what
something does because documentation was deemed optional too gets
boring.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

-Daniel

>
> --Jason
>
> > +  against which the review was done so that future developers can find all of
> > +  the pieces which tie together.
> > +
> >  These are fairly steep requirements, but have grown out from years of shared
> >  pain and experience with uAPI added hastily, and almost always regretted about
> >  just as fast. GFX devices change really fast, requiring a paradigm shift and
> > --
> > 2.31.1
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
