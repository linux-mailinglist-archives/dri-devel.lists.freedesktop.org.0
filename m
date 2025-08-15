Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757DB28073
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 15:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D163510E944;
	Fri, 15 Aug 2025 13:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cr9qae90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0C210E261;
 Fri, 15 Aug 2025 13:17:28 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2445806ca1aso3432365ad.1; 
 Fri, 15 Aug 2025 06:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755263848; x=1755868648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SaYq3BXdk4W0mHcECsikypLL83w7vWxWky4B3sTN/+4=;
 b=cr9qae90lSvtuuv8MxzikhHv5BGzGn49SvmSf89IGZQZLdznFuK/wocT2YzLJ5cKtJ
 ADX+m8Bqslg4Z8le19pYrIy61kMsYJSU2qCvSBwvgB0T7P+C5W5tQYlJ8Wl/oPIVa9uu
 F1Mq46DZZGSGU7qRb/kex5jI7b1xDrN7ZoJVZdh5ngCBbsAqbs44TX0/LiLgOEFxAxw7
 b/lqGILUL/Eu8XaMaTqJMBZhATb9YiM4DW1/6bcSwk2cSCdRPPRxrT7l8IRZ463m5Zjw
 2sc8oXgj+/dBHsqanKqPcy1Uoo7P8VptksxzTlpWmcf4RVFwcNae7/s6o0TXIOBdoR3T
 oRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755263848; x=1755868648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SaYq3BXdk4W0mHcECsikypLL83w7vWxWky4B3sTN/+4=;
 b=B4qOLkKeYJK5emKved83Q4r6fP2mDC6M+dZQaMpjhs9CfR9SsiW2Oi0z1JrXUMVSH5
 ZPRZsNm50J6pDI0e1MlPePp2Nn7bXb+9wHb0dze/2sDOdyLFl/EbACYfs0LtsAorrnT3
 f/ihN6qyHb2jzsLHPHL8bQ9c2Qi1e131WqoUzEKJ8VCHJ+NAx7+e0EEY+2bbXFubHL1t
 DnQLOn50Lox5UhioOV/Te5WaTC/GzEbhQibpqIzwhLrSh6U4xdfH1iFMsipfgpsKtSyj
 zezqgUQNXrZ08Wv4WhmxbmQMOLG1w7DVJnKZ7NANsgI6jvAd5DYToUqB62IvdM6K5H7C
 F1nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK+Nkq3LaQIS2h5zHNJNR4qMnsrKn2wGXQ65cHVquI7jqFPeMp0zXL1N9D6pQkMoZTmtfIDnbe1wiT@lists.freedesktop.org,
 AJvYcCXNB/P5U0m2b1ynngsVHA9dMzUOIH+AMu4wjbfkq7ncA51gJmWnFa+tPV8moiO+nLo18zhT7P7f@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz42jUb/FLXmFikZMtbwKr5DpwATdkKPvvuxhqWoywD826K9PO7
 pMpnB0AYiuvAWuq1XaTZwpCqcxal62r22RKH8XwH8gNIBesPDXQp8bQI1fMYSWhtB00NbpJl1mf
 DEJXe/MA6iYerFyflaR9H7X7k2lbenCs=
X-Gm-Gg: ASbGnctn5nKdSq2uuHN7Zq0xcIzADIaInAHSwJjFpGBGoDFrHkviW9xl1GqCZ4ftnjC
 Hd9hTMpbSPGVUFFXoDAwhbgbCe+fJSDvSt6Gc7XS6xUKW3CFCMhwOwQpMWxwdz99mBfEabZuonB
 W++8UPZY2nzylM+ZArBg4xrnuknWAEknoKL+D7wJwgsk+N8Xiyxep3eFmDQ70G35rhPY908daIZ
 HZDazU=
X-Google-Smtp-Source: AGHT+IH7GHehAz6jm+OtbdZ0QKOtENqBBWnWMR4t4Y41KMeIuGO5yD01p1LE69N5aApixlKWoR59osKT+tonZYwGWls=
X-Received: by 2002:a17:902:f541:b0:240:9ab5:4cae with SMTP id
 d9443c01a7336-2446d5d6193mr13616705ad.1.1755263847339; Fri, 15 Aug 2025
 06:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250619125507.54384-1-kode54@gmail.com>
 <DARA1U86AS72.QOIEVZWCFPYC@kode54.net>
 <DATUOZZD8316.2INSL3KL5RA80@kode54.net> <DATV4CAOHVGV.1UJ803EX21II6@gmail.com>
 <DATYCMWH1X28.NE3M8KJ3SPV9@kode54.net>
 <CADnq5_OjUp+YpXSdvWrYN+6ofFfyES9Jvwkswf3JmTTMGL=MVQ@mail.gmail.com>
In-Reply-To: <CADnq5_OjUp+YpXSdvWrYN+6ofFfyES9Jvwkswf3JmTTMGL=MVQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 15 Aug 2025 09:17:16 -0400
X-Gm-Features: Ac12FXw5jexccg-BAvytZLhI7_WZrN0ERbOBSkiAjGcPSkTJBUCUIwILhlAKSTc
Message-ID: <CADnq5_MdosN34TH=L3Zv1K2_Lroa8Y69JK1wy_zbBFRDT-Q=4Q@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/amdgpu: Enable async flip for cursor planes
To: Christopher Snowhill <chris@kode54.net>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: Christopher Snowhill <kode54@gmail.com>, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

@Wentland, Harry
, @Leo (Sunpeng) Li Can you guys take a look?  This patch fixes a regressio=
n.

Thanks,

Alex

On Mon, Jun 23, 2025 at 11:33=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> + Harry, Leo
>
> On Mon, Jun 23, 2025 at 9:38=E2=80=AFAM Christopher Snowhill <chris@kode5=
4.net> wrote:
> >
> > On Mon Jun 23, 2025 at 4:06 AM PDT, Christopher Snowhill wrote:
> > > On Mon Jun 23, 2025 at 3:46 AM PDT, Christopher Snowhill wrote:
> > >> On Fri Jun 20, 2025 at 3:10 AM PDT, Christopher Snowhill wrote:
> > >>> Here's another alternative change, which may be more thorough. It d=
oes
> > >>> seem to fix the issue, at least. The issue does indeed appear to be
> > >>> no-op plane changes sent to the cursor plane.
> > >>>
> > >>> If anyone wants to propose style changes, and suggest a proper comm=
it
> > >>> message, if this is indeed a welcome fix for the problem, please le=
t me
> > >>> know.
> > >>>
> > >>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/dr=
m_atomic_uapi.c
> > >>> index c2726af6698e..b741939698e8 100644
> > >>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > >>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > >>> @@ -1087,17 +1087,22 @@ int drm_atomic_set_property(struct drm_atom=
ic_state *state,
> > >>>                     }
> > >>>
> > >>>                     /* ask the driver if this non-primary plane is =
supported */
> > >>> -                   if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
> > >>> -                           ret =3D -EINVAL;
> > >>> +                   else if (plane->type !=3D DRM_PLANE_TYPE_PRIMAR=
Y) {
> > >>> +                           ret =3D drm_atomic_plane_get_property(p=
lane, plane_state,
> > >>> +                                                               pro=
p, &old_val);
> > >>> +
> > >>> +                           if (ret || old_val !=3D prop_value) {
> > >>> +                                   ret =3D -EINVAL;
> > >>>
> > >>> -                           if (plane_funcs && plane_funcs->atomic_=
async_check)
> > >>> -                                   ret =3D plane_funcs->atomic_asy=
nc_check(plane, state, true);
> > >>> +                                   if (plane_funcs && plane_funcs-=
>atomic_async_check)
> > >>> +                                           ret =3D plane_funcs->at=
omic_async_check(plane, state, true);
> > >>>
> > >>> -                           if (ret) {
> > >>> -                                   drm_dbg_atomic(prop->dev,
> > >>> -                                                  "[PLANE:%d:%s] d=
oes not support async flips\n",
> > >>> -                                                  obj->id, plane->=
name);
> > >>> -                                   break;
> > >>> +                                   if (ret) {
> > >>> +                                           drm_dbg_atomic(prop->de=
v,
> > >>> +                                                          "[PLANE:=
%d:%s] does not support async flips\n",
> > >>> +                                                          obj->id,=
 plane->name);
> > >>> +                                           break;
> > >>> +                                   }
> > >>>                             }
> > >>>                     }
> > >>>             }
> > >>
> > >> Upon further testing and reflection, I have come to the conclusion t=
hat
> > >> this is indeed best handled by a kernel fix, rather than breaking us=
er
> > >> space.
> > >>
> > >> I attempted to work around this in wlroots, adjusting 0.18, 0.19, an=
d
> > >> 0.20 git with similar patches. First I attempted to stash all the
> > >> written properties for the atomic code, storing an initial value of =
all
> > >> 0xFE so it was always likely to write the first time, and only setti=
ng a
> > >> property if it changed from the last commit.
> > >>
> > >> This resulted in whole commits breaking for one or both framebuffers
> > >> until I ctrl-alt-fx switched to a tty and back again, and this would
> > >> work again temporarily.
> > >>
> > >> So I went back to the drawing board and only withheld seemingly
> > >> duplicate plane properties. This "worked", until I attempted to play=
 a
> > >> game, and then it started glitching spectacularly, and not updating =
at
> > >> all if the game was doing direct scanout and vrr.
> > >>
> > >> Clearly this is wrong.
> > >>
> > >> The wlroots library queues up properties for each commit. On every
> > >> commit where the cursor is disabled, it queues up both fb_id=3D0 and
> > >> crtc_id=3D0. Every commit. Is this wrong? Should it only be queueing=
 up
> > >> the disablement properties once? It also queues up the full plane an=
d
> > >> hotspot properties when enabled, even if the cursor doesn't change
> > >> position or appearance.
> > >
> > > Probably should have CC'd the drm misc maintainers when I started pok=
ing
> > > drm misc instead of amdgpu. Pity there isn't a list for that...
> >
> > I am a dumbass, I didn't notice get_maintainer.pl. Added more people,
> > and the correct list. Not sure if I should remove amd-gfx, since this
> > affects them, somewhat...
> >
> > However, the intention of this thread was to seek commentary on the
> > situation as it is.
