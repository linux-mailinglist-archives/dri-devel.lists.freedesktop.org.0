Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435069EA29
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 23:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8306210E37F;
	Tue, 21 Feb 2023 22:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762FD10E1A0;
 Tue, 21 Feb 2023 22:28:23 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id bm20so5341699oib.7;
 Tue, 21 Feb 2023 14:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F4Iy6VrXhR9K+HbN5pwicMX3S23KY9nb4sxLhyP475c=;
 b=EAMohaBrf4/49QfiHQliMmnD6WIeq5tih3fsYkBw5/nmNBAj/yjkoaGALhnpCg+ekP
 PTYfkXGOKDbKn93+PV6YidAic7uLouqpdj5dlL7uZw/0RnQrEa1WCUNxeRShth8K9wiG
 KEayT+gPNtLanm7G2nr8X0d+LpPicJF7pGo9Fg8kJTkfY8Bx4KntKT6WyiY7uPdaJta9
 5mTRGWRpZl+mTuy6+7+gT2hL2cetLtQk/oJ7ETVwEEYlnTyNFgyfgywtA79yMY6041ld
 iJ+jgolxbPhhVOJCptycI9LC7XzSlaGIvnM9sJMVhRv23k+lG0LJfcgl9XzZn1iNfOmv
 i6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F4Iy6VrXhR9K+HbN5pwicMX3S23KY9nb4sxLhyP475c=;
 b=EnnRv6+X1uwP0KgnNYGHITMzt8AtbWXQ3THbu1LHaMS+eINwd36O8HHQx8WKub7PEm
 aKctgdaWBkAJn7LLShiv3FUueJ8SncwmiwnEOtvyDA5yWWt5JOy8PsIFgnUPI4JbIyTW
 WauKa3Ae6riTKa6Nr+aA/cS2lo5TD8yPncoq0JpHRubBuza2YXlb++q7Ry8GAD9pcwPd
 QITTSR7BCliaIndtD6FL+EdH7g0e9eRfQPqO0yCgaJCr945Jvy4eilJIaNjRUuYj2Q56
 LGV63UEpIvLzr9mOGE2ooBh8nmpsU8+9l7Ls5ZlRYd3G3N/52+Dmk2DePzGQdk0H2kJy
 /ZQg==
X-Gm-Message-State: AO0yUKVz5HXuXHnIv6o75hn/6VThn61ljqR33rQ+WBUaqpPbkjZ7a6UG
 s2a31LSkcD4lPdQ3LmGpzLuk6olHM1m12opIfZI=
X-Google-Smtp-Source: AK7set+9/3FhxoWnPD78RDowrXAKIqtKTbXhGG18S7omg7H9Cfu+lhZ3mvky+r6iZNT3oTMiCi24+S+oAo3ij8ohP+w=
X-Received: by 2002:a05:6808:16ab:b0:37d:81a9:5103 with SMTP id
 bb43-20020a05680816ab00b0037d81a95103mr1261248oib.38.1677018502383; Tue, 21
 Feb 2023 14:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
 <20230220110820.595cfa37@eldfell>
 <CAF6AEGuo-vmW4Va9=RH+kH9KgNvR2vzjJ8meO-oty56xjDhjgg@mail.gmail.com>
 <20230221104551.60d44d1c@eldfell> <Y/TAr64SpxO712RB@intel.com>
 <CAJs_Fx7n3QrzusdX5yD=39YZ8MzjuwZTriWz8hVxNYGHO=sJ_Q@mail.gmail.com>
 <Y/U6HKD2hbH4Sx1G@intel.com> <Y/U8FcU4SXsJu1/q@intel.com>
In-Reply-To: <Y/U8FcU4SXsJu1/q@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Feb 2023 14:28:10 -0800
Message-ID: <CAF6AEGtkgDNZTr-NS_rUuEDxPy5aoMycPDn2RXFEXfAiA7=E9A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 10/14] drm/vblank: Add helper to get next
 vblank time
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 1:48 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Feb 21, 2023 at 11:39:40PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Tue, Feb 21, 2023 at 11:54:55AM -0800, Rob Clark wrote:
> > > On Tue, Feb 21, 2023 at 5:01 AM Ville Syrj=C3=A4l=C3=A4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Tue, Feb 21, 2023 at 10:45:51AM +0200, Pekka Paalanen wrote:
> > > > > On Mon, 20 Feb 2023 07:55:41 -0800
> > > > > Rob Clark <robdclark@gmail.com> wrote:
> > > > >
> > > > > > On Mon, Feb 20, 2023 at 1:08 AM Pekka Paalanen <ppaalanen@gmail=
.com> wrote:
> > > > > > >
> > > > > > > On Sat, 18 Feb 2023 13:15:53 -0800
> > > > > > > Rob Clark <robdclark@gmail.com> wrote:
> > > > > > >
> > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > >
> > > > > > > > Will be used in the next commit to set a deadline on fences=
 that an
> > > > > > > > atomic update is waiting on.
> > > > > > > >
> > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++=
++++++++
> > > > > > > >  include/drm/drm_vblank.h     |  1 +
> > > > > > > >  2 files changed, 33 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm=
/drm_vblank.c
> > > > > > > > index 2ff31717a3de..caf25ebb34c5 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > > > > > @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(str=
uct drm_crtc *crtc,
> > > > > > > >  }
> > > > > > > >  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> > > > > > > >
> > > > > > > > +/**
> > > > > > > > + * drm_crtc_next_vblank_time - calculate the time of the n=
ext vblank
> > > > > > > > + * @crtc: the crtc for which to calculate next vblank time
> > > > > > > > + * @vblanktime: pointer to time to receive the next vblank=
 timestamp.
> > > > > > > > + *
> > > > > > > > + * Calculate the expected time of the next vblank based on=
 time of previous
> > > > > > > > + * vblank and frame duration
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > for VRR this targets the highest frame rate possible for the =
current
> > > > > > > VRR mode, right?
> > > > > > >
> > > > > >
> > > > > > It is based on vblank->framedur_ns which is in turn based on
> > > > > > mode->crtc_clock.  Presumably for VRR that ends up being a maxi=
mum?
> > > > >
> > > > > I don't know. :-)
> > > >
> > > > At least for i915 this will give you the maximum frame
> > > > duration.
> > > >
> > > > Also this does not calculate the the start of vblank, it
> > > > calculates the start of active video.
> > >
> > > AFAIU, vsync_end/vsync_start are in units of line, so I could do some=
thing like:
> > >
> > >   vsync_lines =3D vblank->hwmode.vsync_end - vblank->hwmode.vsync_sta=
rt;
> > >   vsyncdur =3D ns_to_ktime(vblank->linedur_ns * vsync_lines);
> > >   framedur =3D ns_to_ktime(vblank->framedur_ns);
> > >   *vblanktime =3D ktime_add(*vblanktime, ktime_sub(framedur, vsyncdur=
));
> >
> > Something like this should work:
> >  vblank_start =3D framedur_ns * crtc_vblank_start / crtc_vtotal
> >  deadline =3D vblanktime + vblank_start
> >
> > That would be the expected time when the next start of vblank
> > happens.
>
> Except that drm_vblank_count_and_time() will give you the last
> sampled timestamp, which may be long ago in the past. Would
> need to add an _accurate version of that if we want to be
> guaranteed a fresh sample.

IIRC the only time we wouldn't have a fresh sample is if the screen
has been idle for some time?  In which case, I think that doesn't
matter.

BR,
-R

>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
