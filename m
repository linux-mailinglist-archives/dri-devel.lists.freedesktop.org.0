Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9C3D91BC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C365D6E1D6;
	Wed, 28 Jul 2021 15:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A2B6E1D6;
 Wed, 28 Jul 2021 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=1WnwC+3EXs5c8VfBZDFJ7PRTMAGdpqCKrOWn6WyssQM=; 
 b=LUytcxR2nCFmj4M/m9Bfs7ollqulcS4j9XhLo19EvtUuIg+08LhkHn6ETW7uSK4YHf5//nGWXwkgl9zY6oXtyu7ph0tG62miVryuTl2e7ohcV9ss1LVulaJnriKJXI0JsD3SuVf5nfagNypD/siTUbXWveUoD0ctW2N63QXMP8AnkCw7v3v7k2loZaSYOhMphyn4bstLnzC8dShccqiAdVZsTS3i+079LoMFvxzn5UnS9pksbhQ5QNuGycNrwhsof+2x32rNNj2pdhN3rTvog3KSFzCdTpoVx6huCvAwb0Hx0HGaA/U24XGjsUh3J/DGbjwwXwS7dhaBAqdfAkredg==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1m8lMm-0002xE-LB; Wed, 28 Jul 2021 17:21:04 +0200
Date: Wed, 28 Jul 2021 16:20:44 +0100
From: Melissa Wen <mwen@igalia.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Linaro-mm-sig] [PATCH v4 03/18] drm/sched: Add dependency
 tracking
Message-ID: <20210728152044.ygq4cw7i2tm5mcyy@mail.igalia.com>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-4-daniel.vetter@ffwll.ch>
 <CAKMK7uG8bMuDP=7-z9nZ38WgMdbeUk96eNx3buTCiaKatYOJxw@mail.gmail.com>
 <2bcfba05-b7d5-1bd9-d74a-b9aac1147e20@gmail.com>
 <CAKMK7uE7GBZYih=KZm5t7-_0P8i7M0tA2KgSOgJsm+-HUE+HzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xrz7dfzdxflucf5v"
Content-Disposition: inline
In-Reply-To: <CAKMK7uE7GBZYih=KZm5t7-_0P8i7M0tA2KgSOgJsm+-HUE+HzA@mail.gmail.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 David Airlie <airlied@linux.ie>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Melissa Wen <melissa.srw@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xrz7dfzdxflucf5v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/28, Daniel Vetter wrote:
> On Wed, Jul 28, 2021 at 1:29 PM Christian K=F6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> > Am 27.07.21 um 13:09 schrieb Daniel Vetter:
> > > Adding a few more people to this bikeshed.
> > >
> > > On Mon, Jul 12, 2021 at 10:02 PM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
> > >
> > >> @@ -349,6 +367,13 @@ int drm_sched_job_init(struct drm_sched_job *jo=
b,
> > >>                         struct drm_sched_entity *entity,
> > >>                         void *owner);
> > >>   void drm_sched_job_arm(struct drm_sched_job *job);
> > >> +int drm_sched_job_await_fence(struct drm_sched_job *job,
> > >> +                             struct dma_fence *fence);
> > >> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> > >> +                                struct drm_gem_object *obj,
> > >> +                                bool write);
> > >> +
> > >> +
> > > I'm still waiting on the paint delivery for these two functions so I
> > > can finish this shed.
> >
> > Well I wouldn't call that bike shedding, good names are important.
> >
> > Just imaging we would have called the exclusive-fence write-fence inste=
ad.
>=20
> Sure naming matters, but at least to my English understanding there's
> not a semantic different between telling something to await for
> something else (i.e. add a dependency) or to tell something to add a
> dependency (i.e. await that thing later on before you start doing your
> own thing).
>=20
> Exclusive vs write fence otoh is a pretty big difference in what it means.
>=20
> But also if there's consensus that I'm wrong then I'm happy to pick
> the more preferred of the two options I deem equivalent.
>=20
> > What speaks against calling them add_dependency() and
> > _add_implicit_depencencies() ?
>=20
> Nothing. I just like another ack on this before I rename it all. Also
> I wasnt sure what you'd want to name the implicit dependency thing.
>=20
> Lucas, Boris, Melissa, any acks here?

so, my English is far from good; but _add_dependency sounds good to me.

Melissa

> -Daniel
>=20
> > Regards,
> > Christian.
> >
> > >
> > > Thanks, Daniel
> > >
> > >>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > >>                                      struct drm_gpu_scheduler **sche=
d_list,
> > >>                                      unsigned int num_sched_list);
> > >> --
> > >> 2.32.0
> > >>
> > >
> >
>=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--xrz7dfzdxflucf5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEBdccACgkQwqF3j0dL
ehyj8g/+NHSkYxFoA0/Cwejk1IUV9MmWHSH6GJ4Ri5WEI12QjJobZjaA3elSeseo
EBSKRNf6Vlc/8qDfr0ngsKBt17MhjrvMy9RzQrc/c82097PQW1he/df2pMluLmBb
caqvFQjyq8yo9pGXofnEO8otBLchuByLAhhAYCXLyTIfbfcglI7fe0y9kIcjfo6d
vR0BEcfeZN3RHG2VAK3W383U8N29ChfO7fa3Z4UlMb+YYgYhDMqj0jkuTgyubvWl
WDGdj4YM3rfBWQw62f5kc1bDgRHJa52/jGE2ZkeIxHYFihvvdnEPvKbTBQhY4fD2
LZrKyzEmdMRrlHxzyEBZzhcu+ceyM4bMb04ETYkueVwYCcPsclKirNcmOkM7Vb8a
XX6TGzj/u/Ho+/3bzsrHASi8EKHgWizzFSSoy+wlADtEZC2LedW5q6WjSBzSY0rS
BVEDk61nc5bfyIvTJj6+E4qZy4uwmsbCTl4LVoZwFu5422oFEJ25vRdOsyU523xD
MKs8IlfZ8HoC/A++CLO3luv+GDC8JuNLwal5ShZOuB+ej02TFM1W/NXE/8M5lUuv
MQMarxCw5X4EhfuMi92SglwXo4Jw77von1L1ncOY3m0EBlcliRDObDf9TFe3jSte
q6gZ7uhqats2HMrVm/zCOhpC295Z1qpYWy9hvIZu7j6ZNCeIcKA=
=cI4x
-----END PGP SIGNATURE-----

--xrz7dfzdxflucf5v--
