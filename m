Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60841E939
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 10:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03F16E44A;
	Fri,  1 Oct 2021 08:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583906E44A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=j+lTz0eErQeaewOS8liuySTvzmXEGaSTB36MRlZp49k=; 
 b=KqhaGFUGhXVwo5iJxE2kkMOnq6tyyWMvv1HSX+peNjrQvYt1fTC8fIrsv+4T3atunlKT9NfoAhChYpnnJS9WEM99AZtqbyHukxHpP4+VRGy/2W8K2V3TY9iADUY3eefenqxRZc0hnFPUlBl6ElHU3SR8zoDAs92CXMxKIFvq7PgxJcfXX+hITiXtgVOwiRYBk7aQVDgG0jC3wGueSCDnrRH4l38XwatDMA4WIxvhVbQ7yvMtRpL5S8YxWsTfugYlMVqWjGA9ruGH02l78FM+tYJCyw8N42w3L8gRLbWM7+73yR3aiM7k7fp/UEg57WjNWrA4doqq5AqSLZ/peaA4NA==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mWEJD-0005rk-BI; Fri, 01 Oct 2021 10:54:23 +0200
Date: Fri, 1 Oct 2021 09:53:41 +0100
From: Melissa Wen <mwen@igalia.com>
To: Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 4/4] drm/v3d: add multiple syncobjs support
Message-ID: <20211001085341.zwt7x5hah7mmjzbm@mail.igalia.com>
References: <cover.1633016479.git.mwen@igalia.com>
 <ffd8b2e3dd2e0c686db441a0c0a4a0181ff85328.1633016479.git.mwen@igalia.com>
 <fd6acbe570d02f53b34973516556a15a1909cbf8.camel@igalia.com>
 <20211001083744.l2hnoga6xj645jpk@mail.igalia.com>
 <daa1c1b15b0766759597a62e882d302885d9f312.camel@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gce352oohvyy2k2d"
Content-Disposition: inline
In-Reply-To: <daa1c1b15b0766759597a62e882d302885d9f312.camel@igalia.com>
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


--gce352oohvyy2k2d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10/01, Iago Toral wrote:
> On Fri, 2021-10-01 at 09:37 +0100, Melissa Wen wrote:
> > On 10/01, Iago Toral wrote:
> > > On Thu, 2021-09-30 at 17:19 +0100, Melissa Wen wrote:
> > > > Using the generic extension from the previous patch, a specific
> > > > multisync
> > > > extension enables more than one in/out binary syncobj per job
> > > > submission.
> > > > Arrays of syncobjs are set in struct drm_v3d_multisync, that also
> > > > cares
> > > > of determining the stage for sync (wait deps) according to the
> > > > job
> > > > queue.
> > > >=20
> > > > v2:
> > > > - subclass the generic extension struct (Daniel)
> > > > - simplify adding dependency conditions to make understandable
> > > > (Iago)
> > > >=20
> > > > v3:
> > > > - fix conditions to consider single or multiples in/out_syncs
> > > > (Iago)
> > > > - remove irrelevant comment (Iago)
> > > >=20
> > > > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > > > ---
> > > >  drivers/gpu/drm/v3d/v3d_drv.c |   6 +-
> > > >  drivers/gpu/drm/v3d/v3d_drv.h |  24 +++--
> > > >  drivers/gpu/drm/v3d/v3d_gem.c | 185
> > > > ++++++++++++++++++++++++++++++
> > > > ----
> > > >  include/uapi/drm/v3d_drm.h    |  49 ++++++++-
> > > >  4 files changed, 232 insertions(+), 32 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> > > > b/drivers/gpu/drm/v3d/v3d_drv.c
> > > > index 3d6b9bcce2f7..bd46396a1ae0 100644
> > > > --- a/drivers/gpu/drm/v3d/v3d_drv.c
> > > > +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> > > > @@ -96,6 +96,9 @@ static int v3d_get_param_ioctl(struct
> > > > drm_device=20
> > >=20
> > > (...)
> > >=20
> > > > @@ -516,9 +536,11 @@
> > > > v3d_attach_fences_and_unlock_reservation(struct
> > > > drm_file *file_priv,
> > > >  					 struct v3d_job *job,
> > > >  					 struct ww_acquire_ctx
> > > > *acquire_ctx,
> > > >  					 u32 out_sync,
> > > > +					 struct v3d_submit_ext *se,
> > > >  					 struct dma_fence *done_fence)
> > > >  {
> > > >  	struct drm_syncobj *sync_out;
> > > > +	bool has_multisync =3D se && (se->flags &=20
> > >=20
> > > We always pass the 'se' pointer from a local variable allocated in
> > > the
> > > stack of the caller so it is never going to be NULL.
> > >=20
> > > I am happy to keep the NULL check if you want to protect against
> > > future
> > > changes just in case, but if we do that then...
> > >=20
> > > > DRM_V3D_EXT_ID_MULTI_SYNC);
> > > >  	int i;
> > > > =20
> > > >  	for (i =3D 0; i < job->bo_count; i++) {
> > >=20
> > > (...)
> > >=20
> > > > +static void
> > > > +v3d_put_multisync_post_deps(struct v3d_submit_ext *se)
> > > > +{
> > > > +	unsigned int i;
> > > > +
> > > > +	if (!se->out_sync_count)
> > >=20
> > > ...we should also check for NULL here for consistency.
> > yes, consistency makes sense here.
> > > Also, I think there is another problem in the code: we always call
> > > v3d_job_cleanup for failed jobs, but only call v3d_job_put for
> > > successful jobs. However, reading the docs for drm_sched_job_init:
> > >=20
> > > "Drivers must make sure drm_sched_job_cleanup() if this function
> > > returns successfully, even when @job is aborted before
> > > drm_sched_job_arm() is called."
> > >=20
> > > So my understanding is that we should call v3d_job_cleanup instead
> > > of
> > > v3d_job_put for successful jobs or we would be leaking sched
> > > resources
> > > on every successful job, no?
> >=20
> > When job_init is successful, v3d_job_cleanup is called by scheduler
> > when
> > job is completed. drm_sched_job_cleanup describes how it works after
> > drm_sched_job_arm:
> >=20
> > " After that point of no return @job is committed to be executed by
> > the
> > scheduler, and this function should be called from the
> > &drm_sched_backend_ops.free_job callback."
> >=20
> > On v3d_sched.c, .free_job points to v3d_sched_job_free(), which in
> > turn
> > calls v3d_job_cleanup() (and then drm_sched_job_cleanup). So, it
> > looks
> > ok.
> >=20
> > Also, we can say that the very last v3d_job_put() is in charge to
> > decrement refcount initialized (set 1) in v3d_job_init(); while the
> > v3d_job_cleanup() from v3d_sched_job_free() callback decrements
> > refcount
> > that was incremented when v3d_job_push() pushed the job to the
> > scheduler.
> >=20
> > So, refcount pairs seem consistent, I mean, get and put. And about
> > drm_sched_job_cleanup, it is explicitly called when job_init fails or
> > after that by the scheduler.
> >=20
>=20
>    A. Ah ok, thanks for explaining this!
nice!
>=20
> With the consistency issue discussed above fixed, for the series:
>=20
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

ok, thanks for reviewing and all improvement suggestions,

Melissa
>=20
> Iago
>=20

--gce352oohvyy2k2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFWzI0ACgkQwqF3j0dL
ehzAbg/+J7HSsvCbMzy+Vdi8Lur7lD/rlz0KFm3E5911N3FAm4NsDJFDTThnufO/
uW1WVpQDCidsYu890vknkadzidSFjJkYYynWfzn6soJFhrp9DaSv6BFK5q1l0KbC
4jyPocyaBZydOqby7fydnVKjxfd3cD9Yp+hMZv2usXUo9qF1b9QdSEHdoO4PJz8B
X9gsSPR66S/XllNC/gP37cNrpbgd1J2Wu2/TsSlwlXv3CFOVa9K3wGesCmjhNdEW
1f/TG534kPyD+R/w12VR4XOTToehAQ/dvHb3I5FmFQJgCeqe/3hH81UXOz5pW5xN
JEwxKCgi/Ud3FHbyqr2L00Aaeii7GPVzGfWwQa6Y3ZOvUA4ayBD591smRYhVgxu0
eY7RBGi/8p6YMm64l+2OayoNxmlP6cGm/vGjYPf8w3gzAjNJ0Fk5sNgFJkZOuqPe
LsiLhaSsSwUAytOkZxHWv7e6yUDfjPgnamBSUR0xtXvY3mAVlKbzHtH/yg3tB2wo
iI2XfqWMk/Fzpd71LXwTpxKcclitcM3SbjGkTeXrPTLIWqaobX/awH0ztTZZcJI9
ZG5gTeuLF7/EOJKzqYMYrxR9ZGx3TtjZAfu1joTQDcVpTY3VDTG70bfCOo8vsqcN
DV9C4IJFhWsCUcM3zc68lOWHL7qyA/6wTrb4GZZBW/4HpqdiqKw=
=mV3u
-----END PGP SIGNATURE-----

--gce352oohvyy2k2d--
