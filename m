Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D444D8806
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 16:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D085910E9CF;
	Mon, 14 Mar 2022 15:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5F510E9CF;
 Mon, 14 Mar 2022 15:26:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id l20so27766808lfg.12;
 Mon, 14 Mar 2022 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=fKgE1rnRG4HBtj5SvFh+Y+9SUta1M7cwhSXZkkFBy9Y=;
 b=J9ZnlWYbCraumGbyZy4ERvMfp63bshVAzQO6Dy8AisZd9sWwUv8ZqWATFeA7b66faV
 gWd0b6Z8vvwtGLUygUmHfDechhvBV2cHGplet1i4Q+YuTWWnvCeTVFu5+/Gu+r8Pvnvi
 /pE3WK8MGaGdDquTyWa3JNGkfGYPhLS4RwcFNr5RgbNt9KcfwQIu7DzXoIE8bJX5t/BB
 w0HwnERpNeRcoC0a6UHQhV9ZGbNE2fUsCakEFNTuS2kEJVjgZPdYEQhhX1+T2u5pt3Ur
 FD/L2Nfhk6e1jlAV7Hm4LJtCwFdfRBNpeYT3Yvo7bEgBWbJVcQGae3AiIr+HKZBthJWe
 3hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=fKgE1rnRG4HBtj5SvFh+Y+9SUta1M7cwhSXZkkFBy9Y=;
 b=kQPD55lAX72VDuJfVCEAspvLpvUZ7rINmpYZhlFxykqfdqOi0f03BmV9KHWquhDo1o
 Nwu8LFGo21MTQBLijeWDy2CQJVllejZECUeVT5ipdgj9+CkZjDEd5JpCP6e5PxR4n04x
 qPt2fTxP9v4ntLSzonvzdAbImgPp4y6S/npB/f+gax4zUp7YnYUKxc4dmHjxFg8SHISF
 M/cDLFOG97scyN4KrSmw9LOMnuGzGiT16um00IMftvChvvqBiowKkwShrZob0k393rm/
 5yLEp5ZrsmJqHt+AgvSV8qkkeaZ1vA12S5ScGZuClX2TFyEpdX7fqRZGlhGj8gr3SMoR
 gwrA==
X-Gm-Message-State: AOAM5302woPJwZuq5Ox6xPhFCyoziSifhx+lCM5dKKLk++raXQWvXsrE
 m5JkqaTLTKEhOkrOxPSn0NI=
X-Google-Smtp-Source: ABdhPJwIQpDnLSX4P3q6wyWIb5hnHE4MPAI8S3rFBzJcTRMmgEqLY/96v9pR9LtkfntHUkTfv4ngEg==
X-Received: by 2002:a05:6512:3a83:b0:448:9135:d9f4 with SMTP id
 q3-20020a0565123a8300b004489135d9f4mr4400694lfu.259.1647271611337; 
 Mon, 14 Mar 2022 08:26:51 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h8-20020ac25d68000000b00447b5cad2a7sm3330161lft.228.2022.03.14.08.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 08:26:50 -0700 (PDT)
Date: Mon, 14 Mar 2022 17:26:47 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <20220314172647.223658d2@eldfell>
In-Reply-To: <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sc/D9Hyi11POm+mfvaxjWi=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Christian =?UTF-8?B?S8O2?= =?UTF-8?B?bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Sc/D9Hyi11POm+mfvaxjWi=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Mar 2022 10:23:27 -0400
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Fri, Mar 11, 2022 at 3:30 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Thu, 10 Mar 2022 11:56:41 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> > =20
> > > For something like just notifying a compositor that a gpu crash
> > > happened, perhaps drm_event is more suitable.  See
> > > virtio_gpu_fence_event_create() for an example of adding new event
> > > types.  Although maybe you want it to be an event which is not device
> > > specific.  This isn't so much of a debugging use-case as simply
> > > notification. =20
> >
> > Hi,
> >
> > for this particular use case, are we now talking about the display
> > device (KMS) crashing or the rendering device (OpenGL/Vulkan) crashing?
> >
> > If the former, I wasn't aware that display device crashes are a thing.
> > How should a userspace display server react to those?
> >
> > If the latter, don't we have EGL extensions or Vulkan API already to
> > deliver that?
> >
> > The above would be about device crashes that directly affect the
> > display server. Is that the use case in mind here, or is it instead
> > about notifying the display server that some application has caused a
> > driver/hardware crash? If the latter, how should a display server react
> > to that? Disconnect the application?
> >
> > Shashank, what is the actual use case you are developing this for?
> >
> > I've read all the emails here so far, and I don't recall seeing it
> > explained.
> > =20
>=20
> The idea is that a support daemon or compositor would listen for GPU
> reset notifications and do something useful with them (kill the guilty
> app, restart the desktop environment, etc.).  Today when the GPU
> resets, most applications just continue assuming nothing is wrong,
> meanwhile the GPU has stopped accepting work until the apps re-init
> their context so all of their command submissions just get rejected.
>=20
> > Btw. somewhat relatedly, there has been work aiming to allow
> > graceful hot-unplug of DRM devices. There is a kernel doc outlining how
> > the various APIs should react towards userspace when a DRM device
> > suddenly disappears. That seems to have some overlap here IMO.
> >
> > See https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#device-hot=
-unplug
> > which also has a couple pointers to EGL and Vulkan APIs. =20
>=20
> The problem is most applications don't use the GL or VK robustness
> APIs.

Hi,

how would this new event help with that?

I mean, yeah, there could be a daemon that kills those GPU users, but
then what? You still lose any unsaved work, and may need to manually
restart them.

Is the idea that it is better to have the app crash and disappear than
to look like it froze while it otherwise still runs?

If some daemon or compositor goes killing apps that trigger GPU resets,
then how do we stop that for an app that actually does use the
appropriate EGL or Vulkan APIs to detect and remedy that situation
itself?

>  You could use something like that in the compositor, but those
> APIs tend to be focused more on the application itself rather than the
> GPU in general.  E.g., Is my context lost.  Which is fine for
> restarting your context, but doesn't really help if you want to try
> and do something with another application (i.e., the likely guilty
> app).  Also, on dGPU at least, when you reset the GPU, vram is usually
> lost (either due to the memory controller being reset, or vram being
> zero'd on init due to ECC support), so even if you are not the guilty
> process, in that case you'd need to re-init your context anyway.

Why should something like a compositor listen for this and kill apps
that triggered GPU resets, instead of e.g. Mesa noticing that in the app
and killing itself? Mesa in the app would know if robustness API is
being used.

Would be really nice to have the answers to all these questions to be
collected and reiterated in the next version of this proposal.


Thanks,
pq

--Sig_/Sc/D9Hyi11POm+mfvaxjWi=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIvXrcACgkQI1/ltBGq
qqdksw/+KOp3Py4F1yttes+fGrLUl6NwhO/Kvt5pQsjSlpdY1UwlG4hyfcedUYdA
TDeAuarXX5CJjIoSci7W/rYv8lnSEbLaIcRdfC+4iq0XncF/GCZBk20Pde4lrc6K
NQptQcP6QQU9F6s8r5UYc36XnQkbWhM+AP6x3FkP2MndYkvboNP8/NwnmpaOCQHM
G1llViL3Ge+TBeOq57lczfYMpUjE5JH6WR+kLstnzmjfwnZefrebGrjVDCduWbOG
h96HaPSOxs+ABIwoWux/XoGDqhBRfjWPiMLB+Evol0UXhdTLDOoZ2B8EjImHYJCZ
cfU5kch8ixd6IaTFRAtq7u4uRYLvSFyi7rUcTbmObLTUF7FpK/quSQoOiOD6kajo
nsKMIZgaufkc+QSvVdt0ztH3k4Sfx/iNmDpc7sr3Mx3c0PaLEVcEuOFvPLtIWrMW
XA9klIifwXKKcSdGJYgPq0U4jrgsxolHIa7iF+alKNTS0rRLBREzVNgIpJOpeRn6
W4ITPgvWBuiGAes7HvYerh0KnUewhEMSLlRfqnpgVZBbJGnrk/wJDro5sU3CXwuA
XEnWPBgXho0NxPcFJLqXZJXdDmMnZGqKWB34TavU/Oqk+HrahUvDiRPADSj+6eoj
tgwEqS9p/DV7v9ETm20TsHl7QOONgjJPNLYcw4OTMIKkYcQQNSI=
=seoj
-----END PGP SIGNATURE-----

--Sig_/Sc/D9Hyi11POm+mfvaxjWi=--
