Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B7B924DDE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 04:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A6510E527;
	Wed,  3 Jul 2024 02:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LnWyUTls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F19B10E520;
 Wed,  3 Jul 2024 02:35:07 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-810177d1760so169360241.2; 
 Tue, 02 Jul 2024 19:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719974106; x=1720578906; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ruvas3khZrC/B13qfnO4yyfQhv4rJjj6J6cC5+FuVww=;
 b=LnWyUTlsyG5hxFl7Nb5tsdPCZHXFMhCQlb/OLqINLZpaIJe+EdL6j3xDRguY+Gp0q9
 0VDt7g4koEvZq5YwVwesYRdcJNpw+XX5bpLdXZj9LPrPBLw+OnKf4ywBPyGjL0E3rJJ7
 0ovxAlM0EY+V897rKpFvZbWVFcHSezkHD1CBSfXSss4fu9l9T9+NdksFPWK1EQu67eAC
 ZB8HuZ5ujbVhKM0K6ZzSS9TMj2RrBJ+EeS9Cjnh1Yn9lm8bCym2grbivzOQf8cMX9Bve
 yJ81dRKbp23JYHXxS/bJg51SCBvY4SVW+q7XP/HHqvZPj1NpSPawo3j8Jql8XO664C6f
 vapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719974106; x=1720578906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ruvas3khZrC/B13qfnO4yyfQhv4rJjj6J6cC5+FuVww=;
 b=U8xaedNvQTyP3lstKPZD7HwwwADxbKBz1HfbbqJUndcubCGsCbsNN0or4IkO/FzL/A
 udpE5HC+GCnZ+5/MByB2IGRaO3nMiuSeKb8zQE5oj97wdi0+zynBpFG10MKAZXXnUbNC
 +N6fDx0rYzeF29AQNDzNCnr1RN/DRLD5KRbfTkJqBS5ir9jWIEehDUUsd8I4xGS2TdQZ
 3t9ok1n22Kwm4aIMKkZQMh8OWB37lnE8R1KMgE7TceNRBlqcznyP/hDt6ugGjP4ULVLW
 9qeFYrlIvFmTj1hmuDATsAHiOk6yKzIxbeDR1EAlUjcxRWfugSGK/yFSOi1WkRVHiWfK
 QCUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnNG1plTd7kYkhXT9kqh856TNtE/UJ0A2ZRaXKzxy33W8xFr2ufCxDzz2hvrbXzoE8ug93EfPx9XzEntGOGW8BpgQ/h7BNoyKrTeOql6sA1RxH60gkIl/WpXbGAum0+RPApycPvfscx7fCBXZNAL5yzTjKhf1+xN6uEMg5/Yd4vZ3ynfP2X6pwk55Fq5c/3QuTb03V1xfhK81wTmptRp90UIrv1sZE86TC0K3buPKWm4qHbLM=
X-Gm-Message-State: AOJu0YyzId/EsEFGgmaGNiiRVp0YdBIGP/6x+H2uUvNR5Emdez8ekeiH
 b/2IM+z623JiFslbA/QnrKIDsQg1NweOY6dFffuYnBPBj3jGcLNkVV9s0E7fWMletkUonixeyrE
 tIDE5HNLgHjTbnVRrSfzI5TRSjoM=
X-Google-Smtp-Source: AGHT+IFqPTyDSbqJ95dxhUcwADW5HMUYYPETXq2E7N0v3z5D4nmrIWNtCjp5NcD+lseyyRcQp6qVXKcAGD13o9MqU8Y=
X-Received: by 2002:a05:6102:548d:b0:48f:d683:f46e with SMTP id
 ada2fe7eead31-48fd683f75emr3271895137.22.1719974105840; Tue, 02 Jul 2024
 19:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <20240702215804.2201271-31-jim.cromie@gmail.com> <ZoSOMClB0MeWeokU@intel.com>
In-Reply-To: <ZoSOMClB0MeWeokU@intel.com>
From: jim.cromie@gmail.com
Date: Tue, 2 Jul 2024 20:34:39 -0600
Message-ID: <CAJfuBxzsZUpO-Q_uAfMhzXs0WHYMTnj1F8ju7af-kQZKQjLvNQ@mail.gmail.com>
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

On Tue, Jul 2, 2024 at 5:33=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Jul 02, 2024 at 03:57:20PM -0600, Jim Cromie wrote:
> > dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
> > do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
> > EXPORTs the classmap when CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy, for direct
> > reference by drivers.
> >
> > The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
> > redundantly re-declare the classmap, but we can convert the drivers
> > later to DYNDBG_CLASSMAP_USE
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
> >  include/drm/drm_print.h     |  8 ++++++++
> >  2 files changed, 21 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > index 699b7dbffd7b..4a5f2317229b 100644
> > --- a/drivers/gpu/drm/drm_print.c
> > +++ b/drivers/gpu/drm/drm_print.c
> > @@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where=
 each bit enables a debug cat
> >  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> >  module_param_named(debug, __drm_debug, ulong, 0600);
> >  #else
> > -/* classnames must match vals of enum drm_debug_category */
> > -DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS=
, 0,
> > -                     "DRM_UT_CORE",
> > -                     "DRM_UT_DRIVER",
> > -                     "DRM_UT_KMS",
> > -                     "DRM_UT_PRIME",
> > -                     "DRM_UT_ATOMIC",
> > -                     "DRM_UT_VBL",
> > -                     "DRM_UT_STATE",
> > -                     "DRM_UT_LEASE",
> > -                     "DRM_UT_DP",
> > -                     "DRM_UT_DRMRES");
> > +/* classnames must match value-symbols of enum drm_debug_category */
> > +DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
> > +                 DRM_UT_CORE,
> > +                 "DRM_UT_CORE",
> > +                 "DRM_UT_DRIVER",
> > +                 "DRM_UT_KMS",
> > +                 "DRM_UT_PRIME",
> > +                 "DRM_UT_ATOMIC",
> > +                 "DRM_UT_VBL",
> > +                 "DRM_UT_STATE",
> > +                 "DRM_UT_LEASE",
> > +                 "DRM_UT_DP",
> > +                 "DRM_UT_DRMRES");
>
> Looks like this stuff just ends up in an array, so presumably
> it should be possible to use designated initializers to make this
> less fragile?

Im not sure I got your whole point, but:

the fragility is the repetitive re-statement of the map,
in those un-modified DECLARE_s,
once replaced, the USEs just ref the struct built by the _DEFINE
(once, and exported)

I dont really like the _DEFINEs restatement of the enum-values: DRM_UT_*
especially as "strings".
I can automate the stringification with an APPLY_FN_(__stringify, ...)
but the enum-list DRM_UT_* (w.o quotes) is still needed as args.

unless there is something C can do thats like Enum.values() ?



>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
