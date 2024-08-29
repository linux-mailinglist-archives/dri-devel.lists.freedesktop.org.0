Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CD896474C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AFD10E0FE;
	Thu, 29 Aug 2024 13:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8E310E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 13:54:13 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e13c23dbabdso656635276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724939650; x=1725544450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzzYKNiGPyBUG5ppZhjhaLdiN2i8XiaFzKiex+m/I8U=;
 b=P6LqYuNqsvosU+iiUu3+pGxlMTjbPSWqbBWKoVbjWq8ZKnmbvG6iWUEk2E4VHx3Iu3
 Yi0qRNJB35ROJIcVIUaXEAnFEXm/SonAma9RoE/fGrILw5jEU9B4CmK4RTuAx0MMH6Wt
 0PrXQcw9z94hCvNYjytekruOdeXnv4XH1q4LHirbuLzgF68EGFUQQ6oZp0OARZaEUnZC
 3xsQfS5Tk2A8JqjO3x4WAJ8j4ZgMlnyFt/sXujjbx5tLHPhg+d7G8Xptd3REdcbHMwet
 fuFQt+cIMo/6n2836Hq0dzDHRqHZ5l4k7Eh043SsHMi9qdXslTOGT+m57rEycSbmcmnY
 RdWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjX2IaWcT4O59zIIv7NXe9IHSNlLQJbo9z2OQV7gmmpo+hekhdmHdgbEjUrNiIS/iEgQlyylZe6VU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1xkR6ec9SKhoF2Y50cpnK+0lz4rmW2ZAN8H+ejjnVANspv6dP
 Y4dXzne23I25gWFuFJxWOFf3A5QxfMzRRarJboiDqitt6kDLVVYZNNHy4MWf
X-Google-Smtp-Source: AGHT+IHnjMzgiWZ+LTHBg1yx8qHiGDbNvIGrtQ4zXHPsiGM5XfmyqZvKd50iePh/dGAVvF5tGQ9SWA==
X-Received: by 2002:a05:6902:2004:b0:e16:6742:6eaf with SMTP id
 3f1490d57ef6-e1a5ab4f72dmr2074228276.4.1724939649755; 
 Thu, 29 Aug 2024 06:54:09 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6d2d39c8c93sm2474437b3.28.2024.08.29.06.54.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 06:54:08 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e115eb44752so737736276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXIShn11vac9wlAfnJ2qQiF2la97HPlvT+RiSvDkrK3/CMMv82ODmhFdl42OCxdk2EpGdzzTOnaq78=@lists.freedesktop.org
X-Received: by 2002:a05:6902:2b05:b0:e13:df00:2830 with SMTP id
 3f1490d57ef6-e1a5ac9e448mr3353529276.30.1724939647866; Thu, 29 Aug 2024
 06:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
 <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
 <20240529095506.GC19014@pendragon.ideasonboard.com>
 <ikryifdxh5hfbjl6c4yinyy52f2pr4pm4g4564jq4cob7ics2p@wa37stxn3sqm>
 <20240529133309.GO1436@pendragon.ideasonboard.com>
 <e1cc6c86-d042-400c-b995-a8b78f62dbdd@redhat.com>
 <CAA8EJpoC9SiLr4QyksKLq796vdq7pFywwn9pPyrkj6-uo5zVog@mail.gmail.com>
In-Reply-To: <CAA8EJpoC9SiLr4QyksKLq796vdq7pFywwn9pPyrkj6-uo5zVog@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 15:53:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1SQT4Lnah3-H6r19_xUuKO7iLcTw1PApg7v6naEF5Sg@mail.gmail.com>
Message-ID: <CAMuHMdV1SQT4Lnah3-H6r19_xUuKO7iLcTw1PApg7v6naEF5Sg@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

On Thu, May 30, 2024 at 10:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Thu, 30 May 2024 at 11:16, Jocelyn Falempe <jfalempe@redhat.com> wrote=
:
> > On 29/05/2024 15:33, Laurent Pinchart wrote:
> > > On Wed, May 29, 2024 at 04:28:44PM +0300, Dmitry Baryshkov wrote:
> > >> On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
> > >>> On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
> > >>>> On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> > >>>>> On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> > >>>>>> On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote=
:
> > >>>>>>> On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wr=
ote:
> > >>>>>>>> Add support for the drm_panic module, which displays a message=
 on
> > >>>>>>>> the screen when a kernel panic occurs.
> > >>>>>>>>
> > >>>>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >>>>>>>> ---
> > >>>>>>>> Tested on Armadillo-800-EVA.
> > >>>>>>>> ---
> > >>>>>>>>   drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 ++++=
+++++++++-
> > >>>>>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
> > >>>>>>>>
> > >>>>>>>> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.=
c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > >>>>>>>> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > >>>>>>>> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > >>>>>>>> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > >>>>>>>> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_func=
s shmob_drm_plane_helper_funcs =3D {
> > >>>>>>>>        .atomic_disable =3D shmob_drm_plane_atomic_disable,
> > >>>>>>>>   };
> > >>>>>>>>
> > >>>>>>>> +static const struct drm_plane_helper_funcs shmob_drm_primary_=
plane_helper_funcs =3D {
> > >>>>>>>> +      .atomic_check =3D shmob_drm_plane_atomic_check,
> > >>>>>>>> +      .atomic_update =3D shmob_drm_plane_atomic_update,
> > >>>>>>>> +      .atomic_disable =3D shmob_drm_plane_atomic_disable,
> > >>>>>>>> +      .get_scanout_buffer =3D drm_fb_dma_get_scanout_buffer,
> > >>>>>>>> +};
> > >>>>>>>> +
> > >>>>>>>>   static const struct drm_plane_funcs shmob_drm_plane_funcs =
=3D {
> > >>>>>>>>        .update_plane =3D drm_atomic_helper_update_plane,
> > >>>>>>>>        .disable_plane =3D drm_atomic_helper_disable_plane,
> > >>>>>>>> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(=
struct shmob_drm_device *sdev,
> > >>>>>>>>
> > >>>>>>>>        splane->index =3D index;
> > >>>>>>>>
> > >>>>>>>> -      drm_plane_helper_add(&splane->base, &shmob_drm_plane_he=
lper_funcs);
> > >>>>>>>> +      if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> > >>>>>>>> +              drm_plane_helper_add(&splane->base,
> > >>>>>>>> +                                   &shmob_drm_primary_plane_h=
elper_funcs);
> > >>>>>>>> +      else
> > >>>>>>>> +              drm_plane_helper_add(&splane->base,
> > >>>>>>>> +                                   &shmob_drm_plane_helper_fu=
ncs);
> > >>>>>>>
> > >>>>>>> It's not very nice to have to provide different operations for =
the
> > >>>>>>> primary and overlay planes. The documentation of
> > >>>>>>> drm_fb_dma_get_scanout_buffer() states
> > >>>>>>>
> > >>>>>>>   * @plane: DRM primary plane
> > >>>>>>>
> > >>>>>>> If the intent is that only primary planes will be used to displ=
ay the
> > >>>>>>> panic message, shouldn't drm_panic_register() skip overlay plan=
es ? It
> > >>>>>>> would simplify drivers.
> > >>>>>>
> > >>>>>> What about the drivers where all the planes are actually univers=
al?
> > >>>>>> In such a case the planes registered as primary can easily get r=
eplaced
> > >>>>>> by 'overlay' planes.
> > >>>>>
> > >>>>> Good point.
> > >>>>>
> > >>>>> Another option, if we wanted to avoid duplicating the drm_plane_f=
uncs,
> > >>>>> would be to add a field to drm_plane to indicate whether the plan=
e is
> > >>>>> suitable for drm_panic.
> > >>>>
> > >>>> ... or maybe let the driver decide. For the fully-universal-plane
> > >>>> devices we probably want to select the planes which cover the larg=
est
> > >>>> part of the CRTC.
> > >>>
> > >>> Are there devices where certain planes can only cover a subset of t=
he
> > >>> CRTC (apart from planes meant for cursors) ?
> > >>
> > >> On contemporary MSM devices any plane can cover any part of the scre=
en,
> > >> including not having a plane that covers the full screen at all.
> > >
> > > Ah, you meant picking the plane that is currently covering most of th=
e
> > > screen. I thought you were talking about devices where some planes we=
re
> > > restricted by the hardware to a subset of the CRTC.
> > >
> > > I agree it would make sense to take both plane position and z-pos, as
> > > well as visibility and other related parameters, to pick the plane th=
at
> > > is the most visible. Ideally this should be handled in drm_panic, not
> > > duplicated in drivers.
> >
> > I'm not sure that drm_panic can figure out reliably on which plane it
> > needs to draw. I think the driver has more information to take the righ=
t
> > decision.
>
> I think there should be a default implementation which fits 80% of the
> cases (single fixed PRIMARY plane per output) but if the driver needs
> it, it should be able to override the behaviour.

Did anything like this materialize, or is this patch (and its rcar-du
counterpart [1]) good to apply as-is?

Thank you!

[1] https://lore.kernel.org/r/b633568d2e3f405b21debdd60854fe39780254d6.1716=
816897.git.geert+renesas@glider.be/
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
