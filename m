Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EED372BB6
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 16:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FEC6EB0E;
	Tue,  4 May 2021 14:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0D76EB0E;
 Tue,  4 May 2021 14:11:09 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id x9so3090277uao.3;
 Tue, 04 May 2021 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jiXH4fkGuY/DcXg6Fy3aG8WYsnSNP4df/hIJAV75w+Y=;
 b=hDrnnlpXGONLRhvm72rGD8ip7uzz25iA0ktVrHTjT3yh28HJ4h+8bttU7CqFm6+tQt
 FSYQ/IXo2qTaxXrCeO5Xx5L6H+r4uJkzldFEgvPNfEf5ehCX1+VHHSKLtFwtgDixx9D7
 sE4+V97idmjzFr2zlVgGf5W1ef1ie4TWlFt26wENbI40EEj95gRCU/4gol+PMYNMxd2u
 JtB1TVF0FZwDEKYjJQFILA9NO20RG+Er04IesNP2Na2XV2h37+Et6kM2HXoup0Rpq3Ep
 RaDLS/F14J7JGLITNnqNpXLmOFGvFKycfMij6+07krUdFxfk+ZZaTd+/jGe/mk2IaA3T
 7Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jiXH4fkGuY/DcXg6Fy3aG8WYsnSNP4df/hIJAV75w+Y=;
 b=Ntfc1SDqYznJLLv4OoQNHeHxsuauaKj84k/B83H4wmbZ6DFHPbE4uU1XltyUNbkOfa
 TfndBBJIunhPv48PUgf6jch2OTEDU7V5xSJ3df0ZtnQMm2XtjhAnzJpyvrCDcQ1zhxZ8
 KHPaYCzrED2Q2RhTZY78ZAKrCwLM1EGLY5ovqjUudrzU4PhfIyJz/dpvKXOBmXSxlXIo
 uUxSTaqXt27Yw2sWM50VZUxr3rSuesvB1w6xERagQzELqM8GCF7JbEhKMe7OZ7I0vLQB
 6O/VZXdRoTK71Ipr17UtCNTJUFIyFCzZDJ7z7mIscrC2KrPK2cHqIiTKlAydmxgCQO0/
 iSdw==
X-Gm-Message-State: AOAM5304jpFcamaU2HwVBJaL8w4nEALY+rGlfhnN4J7BMrDdTJw0o41h
 N8sk356g2D9GUSwsqICsZC7PaYG4MnoSMegiRYE=
X-Google-Smtp-Source: ABdhPJxIVNZ6oP9HY9osOupnpc1x28h0a1ITmD4A5VjOv1XlrMu6Q4JGT62nVUW2heITfNRh3OyFot1hooiuCurzoTI=
X-Received: by 2002:ab0:3157:: with SMTP id e23mr19876511uam.106.1620137468998; 
 Tue, 04 May 2021 07:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
 <20210427092018.832258-8-daniel.vetter@ffwll.ch>
 <CACvgo51rQJmHc1K-MSq-WLZkwVt34MY73csgEyxorrYsKPwQiA@mail.gmail.com>
 <YIgB76WmQijHCJeV@phenom.ffwll.local>
In-Reply-To: <YIgB76WmQijHCJeV@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 4 May 2021 15:10:57 +0100
Message-ID: <CACvgo50frye2h5L78YKnHm8TaE9xM=fn-7fNNtHbSwiv+GnYVA@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/modifiers: Enforce consistency between the cap an
 IN_FORMATS
To: Daniel Vetter <daniel@ffwll.ch>, Inki Dae <inki.dae@samsung.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thanks for the extra clarification.

On Tue, 27 Apr 2021 at 13:22, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Apr 27, 2021 at 12:32:19PM +0100, Emil Velikov wrote:
> > Hi Daniel,
> >
> > On Tue, 27 Apr 2021 at 10:20, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > > @@ -360,6 +373,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
> > >   * drm_universal_plane_init() to let the DRM managed resource infrastructure
> > >   * take care of cleanup and deallocation.
> > >   *
> > > + * Drivers supporting modifiers must set @format_modifiers on all their planes,
> > > + * even those that only support DRM_FORMAT_MOD_LINEAR.
> > > + *
> > The comment says "must", yet we have an "if (format_modifiers)" in the codebase.
> > Shouldn't we add a WARN_ON() + return -EINVAL (or similar) so people
> > can see and fix their drivers?
>
> This is a must only for drivers supporting modifiers, not all drivers.
> Hence the check in the if. I did add WARN_ON for the combos that get stuff
> wrong though (like only supply one side of the modifier info, not both).
>
Hmm you're spot on - the arm/malidp patch threw me off for a minute.

> > As a follow-up one could even go a step further, by erroring out when
> > the driver hasn't provided valid modifier(s) and even removing
> > config::allow_fb_modifiers all together.
>
> Well that currently only exists to avoid walking the plane list (which we
> need to do for validation that all planes are the same). It's quite tricky
> code for tiny benefit, so I don't think it's worth it trying to remove
> allow_fb_modifiers completely.
>
Pardon if I'm saying something painfully silly - it's been a while
since I've looked closely at KMS.

From some grepping around, removing ::allow_fb_modifiers would be OK
although it's a secondary goal. It feels like the bigger win will be
simpler modifier handling in DRM.

In particular, one could always "inject" the linear modifier within
drm_universal_plane_init() and always expose DRM_CAP_ADDFB2_MODIFIERS.
Some drivers mxsfb, mgag200, stm and likely others already advertise
the CAP, even though they seemingly lack any modifiers.

The linear/invalid cargo-cult to drm_universal_plane_init() seems
strong and this series adds even more.

Another plus of always exposing the CAP, is that one could mandate (or
nuke) optional .format_mod_supported that you/Ville discussed
earlier[1].
Currently things are weird, since it's required to create IN_FORMAT
blob, yet drivers lack it while simultaneously exposing the CAP to
userspace.

One such example is exynos... Although recently it recently dropped
`allow_fb_modifiers = true` and there are no modifiers passed to
drm_universal_plane_init(), so the CAP is no longer supported.
Inki you might want to check, if that broke your userspace.


Tl:Dr: There _might_ be value in simplifying the modifier handling
_after_ these fixes land.


[1] https://lore.kernel.org/dri-devel/CAKMK7uGNP5us8KFffnPwq7g4b0-B2q-m7deqz_rPHtCrh_qUTw@mail.gmail.com/

> > Although for stable - this series + WARN_ON (no return since it might
> > break buggy drivers) sounds good.
> >
> > > @@ -909,6 +909,8 @@ struct drm_mode_config {
> > >          * @allow_fb_modifiers:
> > >          *
> > >          * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
> > > +        * Note that drivers should not set this directly, it is automatically
> > > +        * set in drm_universal_plane_init().
> > >          *
> > >          * IMPORTANT:
> > >          *
> > The new note and the existing IMPORTANT are in a weird mix.
> > Quoting the latter since it doesn't show in the diff.
> >
> > If this is set the driver must fill out the full implicit modifier
> > information in their &drm_mode_config_funcs.fb_create hook for legacy
> > userspace which does not set modifiers. Otherwise the GETFB2 ioctl is
> > broken for modifier aware userspace.
> >
> > In particular:
> > As the new note says "don't set it" and the existing note one says "if
> > it's set". Yet no drivers do "if (config->allow_fb_modifiers)".
> >
> > Sadly, nothing comes to mind atm wrt alternative wording.
>
> Yeah it's a bit disappointing.
>
> > With the WARN_ON() added or s/must/should/ in the documentation, the series is:
>
> With my clarification, can you please recheck whether as-is it's not
> correct?
>
Indeed - with the series as-is my RB stands.

Thanks
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
