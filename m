Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F899265B8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 18:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666F710E063;
	Wed,  3 Jul 2024 16:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L69Jsas5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0017710E0AD;
 Wed,  3 Jul 2024 16:11:58 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3d6301e7279so3417996b6e.3; 
 Wed, 03 Jul 2024 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720023118; x=1720627918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/dH8jV/d+x/FI16gAcv4uydOAqFjUfOw8j20FTynlU=;
 b=L69Jsas5/D3/3ApkGSi3VgF0gbzU/gvLHIkKWHRNhIeSj6SRYF/bIgZzqh9t0UQOdC
 bdclcz/L/L4Ie0uE5xUTWkXkHmfLf36Pmp2OgMhLnPUV8C7xZWaRLJ/XyQbBGNBMNNfN
 lJZpj3InNNmdZiZCY0xwa0Uv+lDp8x9MMsdSyUo2jS55vNNbfwtpTR3UA6d4uskZL/sP
 U31QHKKzvBA2eGvc+5ex+qmF/YpxRcGGBaMbl2ZaP9eQbn9k5haU2M/p9Szif3SDbXf4
 boYkoy9Io/l6bsQPIWfJj/nZHVOKcnYoDucVTzxOQYnsI7n8Gr0IECRdTyTT4zxifI5U
 Selw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720023118; x=1720627918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/dH8jV/d+x/FI16gAcv4uydOAqFjUfOw8j20FTynlU=;
 b=Ap3RvnpyfACigH64Jss15Pyo6CcBISap9ApM/m3QGL9gMvh2DPkU0l7iZPxThKMHWC
 5ZdcBHjDB6ueBd3yPCasqmn5MSfj8kyjhlIL4DV24PLcYpBWcpgehEooNEhEBYLjoeMC
 xYwR3ToVBkqyi1RfCFcAJZh4PtgkgZwMbMf5YJ618zLmxGwz9oe0Nok84oTuTFnL39cg
 lFME4OzuG3FtAPRDRS8NzZA5h/8aWPt30wzROfEgEeyeGF29Idz4/RUc6BExcD7ZEy2y
 SKWWIz7Ob0ZGSWA2r5zftSZ00rProX88qDn9snG4/yE3+DIgr0pau0Ahy6WknfsEzkms
 TflA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBKy9VqPgK1ij2A4dgB0IFwMtsMF0i6c5+tWyysUDz1iSHqZwUL9GagAwLpVoVAf0gmr2wjjPBiqsvyPYDz+xLD4m2OTYhcOYzMW4iyWgdepLHFshjQlHyAczuVP8w6KJEmjNiCnyks+bKrJExgLvwOTnBIM3V3R5M3JkhzZxY4YMXC2ryeFz+y38KSuLGVKBG9axUJdEbKljRHqhFgEY1CUV3BOw4LVDZa8/wYPNYZpRW9zE=
X-Gm-Message-State: AOJu0YwMQQu5A4meTmMnNSWFv8kZmGVVP9M/ptn549dVjbRUYFtjdvrw
 WumJhdfrfb4swROrB7PzUmJ7PafY55TL4iZpca0q821nm7YHT/YRXysg1Q6tTw55W35f9GLfDpt
 C1TyGBDCRnKF5RRpP75vSN9+0yYY=
X-Google-Smtp-Source: AGHT+IHHyVJ7tvgjX6YNT5yXxjT4ZfaP2CSlRVqBQQ9Svv1tUxG/jN+Xkt79kJWNOKN+ENdTMdSGcTnRp+qX6KDNUkc=
X-Received: by 2002:a05:6808:1909:b0:3d5:5e58:528b with SMTP id
 5614622812f47-3d6b2b24045mr15706235b6e.1.1720023118007; Wed, 03 Jul 2024
 09:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <20240702215804.2201271-31-jim.cromie@gmail.com> <ZoSOMClB0MeWeokU@intel.com>
 <CAJfuBxzsZUpO-Q_uAfMhzXs0WHYMTnj1F8ju7af-kQZKQjLvNQ@mail.gmail.com>
 <ZoU7kR2aYwVDvd_G@intel.com>
In-Reply-To: <ZoU7kR2aYwVDvd_G@intel.com>
From: jim.cromie@gmail.com
Date: Wed, 3 Jul 2024 10:11:31 -0600
Message-ID: <CAJfuBxwVWbJ9TdgH0ARmxUy+_DfNVKrTewjkqWKmCQtfOKQEAg@mail.gmail.com>
Subject: Re: [PATCH v9 30/52] drm-dyndbg: adapt drm core to use dyndbg
 classmaps-v2
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, 
 jani.nikula@intel.com, jbaron@akamai.com, gregkh@linuxfoundation.org, 
 ukaszb@chromium.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux@rasmusvillemoes.dk, joe@perches.com, mcgrof@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Got it.
I had some mental block about passing designated intializers as macro args.
it just worked, I needed to eyeball the .i file just to be sure.
thanks.
I have a fixup patch.
whats the best thing to do with it, squash it in for later ? send in
reply here ?

On Wed, Jul 3, 2024 at 5:52=E2=80=AFAM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Jul 02, 2024 at 08:34:39PM -0600, jim.cromie@gmail.com wrote:
> > On Tue, Jul 2, 2024 at 5:33=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Tue, Jul 02, 2024 at 03:57:20PM -0600, Jim Cromie wrote:
> > > > dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried =
to
> > > > do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
> > > > EXPORTs the classmap when CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy, for dir=
ect
> > > > reference by drivers.
> > > >
> > > > The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they stil=
l
> > > > redundantly re-declare the classmap, but we can convert the drivers
> > > > later to DYNDBG_CLASSMAP_USE
> > > >
> > > > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
> > > >  include/drm/drm_print.h     |  8 ++++++++
> > > >  2 files changed, 21 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_prin=
t.c
> > > > index 699b7dbffd7b..4a5f2317229b 100644
> > > > --- a/drivers/gpu/drm/drm_print.c
> > > > +++ b/drivers/gpu/drm/drm_print.c
> > > > @@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, w=
here each bit enables a debug cat
> > > >  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> > > >  module_param_named(debug, __drm_debug, ulong, 0600);
> > > >  #else
> > > > -/* classnames must match vals of enum drm_debug_category */
> > > > -DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_=
BITS, 0,
> > > > -                     "DRM_UT_CORE",
> > > > -                     "DRM_UT_DRIVER",
> > > > -                     "DRM_UT_KMS",
> > > > -                     "DRM_UT_PRIME",
> > > > -                     "DRM_UT_ATOMIC",
> > > > -                     "DRM_UT_VBL",
> > > > -                     "DRM_UT_STATE",
> > > > -                     "DRM_UT_LEASE",
> > > > -                     "DRM_UT_DP",
> > > > -                     "DRM_UT_DRMRES");
> > > > +/* classnames must match value-symbols of enum drm_debug_category =
*/
> > > > +DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS=
,
> > > > +                 DRM_UT_CORE,
> > > > +                 "DRM_UT_CORE",
> > > > +                 "DRM_UT_DRIVER",
> > > > +                 "DRM_UT_KMS",
> > > > +                 "DRM_UT_PRIME",
> > > > +                 "DRM_UT_ATOMIC",
> > > > +                 "DRM_UT_VBL",
> > > > +                 "DRM_UT_STATE",
> > > > +                 "DRM_UT_LEASE",
> > > > +                 "DRM_UT_DP",
> > > > +                 "DRM_UT_DRMRES");
> > >
> > > Looks like this stuff just ends up in an array, so presumably
> > > it should be possible to use designated initializers to make this
> > > less fragile?
> >
> > Im not sure I got your whole point, but:
>
> I mean using
>  [DRM_UT_CORE] =3D "DRM_UT_CORE"
> instead of
>  "DRM_UT_CORE"
> so there is no chance of screwing up the order.
> Or maybe the order doesn't even matter here?
>
> Could also stringify to avoid accidental of typos.
>
> >
> > the fragility is the repetitive re-statement of the map,
> > in those un-modified DECLARE_s,
> > once replaced, the USEs just ref the struct built by the _DEFINE
> > (once, and exported)
> >
> > I dont really like the _DEFINEs restatement of the enum-values: DRM_UT_=
*
> > especially as "strings".
> > I can automate the stringification with an APPLY_FN_(__stringify, ...)
> > but the enum-list DRM_UT_* (w.o quotes) is still needed as args.
> >
> > unless there is something C can do thats like Enum.values() ?
> >
> >
> >
> > >
> > > --
> > > Ville Syrj=C3=A4l=C3=A4
> > > Intel
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
