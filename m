Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4764F1FA02F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 21:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A676E4DE;
	Mon, 15 Jun 2020 19:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5A56E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 19:27:33 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id o2so10050230vsr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 12:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HJ6bjo3Cs4Jwgups1DYv3/zdxfvupCXkofRDuQ5IYp4=;
 b=F/KF1m/Nsc5S3Yx4XObaR/c5zbV66z0YUGKURgdlXq3RhMwcOYjMvbsylDBdpMPaI5
 ZofxpZzwnmGrhmlm7Gsfnm/IE110cOQR38HaGX4srG2QqQLfDzZJTf+hP6n2pxq7WDnI
 LTWxE69cCLquAXsFA/o7rN+qZob2z4eKO7jERL3THdcSMhGdugsmoi5QU1HQNM3mxLvH
 CYHTqO/nsXT3AVh8/U+5SO0JOHL2wKbmhzJCF4WeTrFi6JSd8/ptRNMnprZx1j1KFoto
 OlHEn6TwBXJdd4nVUVw6/rYknBHF2hfn7swL5+IbPLMnGo7TTlBFFyqQDtQRFLUPPMoK
 qCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HJ6bjo3Cs4Jwgups1DYv3/zdxfvupCXkofRDuQ5IYp4=;
 b=Cr7UhjyMlAcd/kjgu8RStrWr+upANfLbmsHEgYIge1atPkAPocvnUyej4AAyAL+zNz
 Aur7NEqs9gDKguxORUSxou7wRLAVf9TqDyX5zSGGw1Q2aNwUn5zRidTzNx4fX8njIYhG
 3BEKkrTQbWXanQxcnHemc38zilbOgIbOsQbDre5M3Mn8mbDPThLtnTG13sMJdTOKI39m
 A7OiETeXhpQudul4Sv47ZPmdaGbALieec/d7tO4E87jYBIOi30C1V691CTU9fVX1/4i4
 ALsCZ2lGvZM/g5f27MNkqdre0/VnW/oZ8MwCn0ZreCg/TUID00xTnXUg2E/sAOR83d1M
 KZKQ==
X-Gm-Message-State: AOAM530H//cGbwVlxlO1oCaLE1b6e1z0EXqTF6TRQs2EvbC9jV5D6gT5
 Ba1g+LUsUgAWC8c4x50CxKR7c7lxmXV0yj9KyH8=
X-Google-Smtp-Source: ABdhPJyey5KBWRA1ZbCsa5rIECNxSTstW6aSPmQqLZD0K5FxzqvwTPBW/JBmWgeRWgeuakGBVhHZP6TGEjCBAJUkaZA=
X-Received: by 2002:a67:c18a:: with SMTP id h10mr20910321vsj.186.1592249252845; 
 Mon, 15 Jun 2020 12:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200603170434.2363446-1-emil.l.velikov@gmail.com>
 <20200604073049.GS20149@phenom.ffwll.local>
In-Reply-To: <20200604073049.GS20149@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 20:23:52 +0100
Message-ID: <CACvgo51dMoquksHkDj_UXtZcxE2r5uPWcuH8x-idWrcTDszzww@mail.gmail.com>
Subject: Re: [PATCH] drm/todo: Add item about modeset properties
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Jun 2020 at 08:30, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 03, 2020 at 06:04:34PM +0100, Emil Velikov wrote:
> > Add some information about pre-atomic modeset properties alongside a
> > list of suggestions how to handle the different instances.
> >
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > ---
> >  Documentation/gpu/todo.rst | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 658b52f7ffc6..6648fd13cc1e 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -392,6 +392,38 @@ Contact: Laurent Pinchart, respective driver maintainers
> >
> >  Level: Intermediate
> >
> > +Consolidate custom driver modeset properties
> > +--------------------------------------------
> > +
> > +Before atomic modeset took place, many drivers where creating their own
> > +properties. Among other things, atomic brought the requirement that custom,
> > +driver specific properties should not be used.
> > +
> > +In for this task, we aim to introduce core helper or reuse the existing ones
>
> s/In for/For/ I think ...
>
Fixed up alongside s/core helper/core helpers/

> > +if available:
> > +
> > +A quick, unconfirmed, examples list.
> > +
> > +Introduce core helpers:
> > +- audio (amdgpu, intel, gma500, radeon)
> > +- brightness, contrast, etc (armada, nouveau) - overlay only (?)
> > +- broadcast rgb (gma500, intel)
> > +- colorkey (armada, nouveau, rcar) - overlay only (?)
> > +- dither (amdgpu, nouveau, radeon) - varies across drivers
> > +- underscan family (amdgpu, radeon, nouveau)
> > +
> > +Already in core:
> > +- colorspace (sti)
> > +- tv format names, enhancements (gma500, intel)
> > +- tv overscan, margins, etc. (gma500, intel)
> > +- zorder (omapdrm) - same as zpos (?)
> > +
> > +
> > +Contact: Emil Velikov, respective driver maintainers
> > +
> > +Level: Intermediate
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

... and pushed to drm-misc. Thank you.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
