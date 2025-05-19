Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B939DABB798
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B2710E3C4;
	Mon, 19 May 2025 08:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UmRVvjCg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DF310E3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:43:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86E4A5C4B17;
 Mon, 19 May 2025 08:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3A6C4CEE4;
 Mon, 19 May 2025 08:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747644210;
 bh=ZOT0C0K0vPz9f06+lIVOOzuxP0Ka7pZHBD9bPzHiIx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UmRVvjCgl5wYhy2TDehbZ/hmlXluy2bVk24nSycH7kLGPj39FqYMztARpvCnlRQIp
 /pWZI7pKYGPZ4qH6AG6hPG45IzKXVaT07tVG6z8GnzMJeLmDjcYbBo0c7OlCpD9ewa
 sddYOAVCDeDzsJBum3oIUX5l1PPyOT+nTWh/3BKInEyhGEry1W8/rkHnzLoMDIm7wP
 A1EQBElwa2FIQgTN0AKmNDVQUx3Qt+C+oeeJ0PhLtsJ6C0OJ33ByfOUS4WkRUiJtqp
 ikHmua/hlYQWDJ58eiZSaacjvLl6hx2qwxBkgRnx1eFRv2JRNg3cP0KVdhJws92wTc
 2RZBFEQzyr9dQ==
Date: Mon, 19 May 2025 10:43:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org, 
 Eric Auger <eric.auger@redhat.com>, David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux.dev>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/virtio: implement virtio_gpu_shutdown
Message-ID: <20250519-crazy-wisteria-mule-ef8e28@houat>
References: <20250507082821.2710706-1-kraxel@redhat.com>
 <urpxto3fgvwoe4hob2aukggeop4bcsyb7m5wflgru4c3otd6rq@aktopqufgxom>
 <iptz2uxajkl3l62piqu6tq5pembbmqho667otbaj7nneh5vk3r@sxdvm7e57nae>
 <20250518175332-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="owfohtpihfpfbao7"
Content-Disposition: inline
In-Reply-To: <20250518175332-mutt-send-email-mst@kernel.org>
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


--owfohtpihfpfbao7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/virtio: implement virtio_gpu_shutdown
MIME-Version: 1.0

On Sun, May 18, 2025 at 05:53:59PM -0400, Michael S. Tsirkin wrote:
> On Tue, May 13, 2025 at 12:18:44PM +0200, Gerd Hoffmann wrote:
> > > > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm=
/virtio/virtgpu_drv.c
> > > > index e32e680c7197..71c6ccad4b99 100644
> > > > --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> > > > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > > > @@ -130,10 +130,10 @@ static void virtio_gpu_remove(struct virtio_d=
evice *vdev)
> > > > =20
> > > >  static void virtio_gpu_shutdown(struct virtio_device *vdev)
> > > >  {
> > > > -	/*
> > > > -	 * drm does its own synchronization on shutdown.
> > > > -	 * Do nothing here, opt out of device reset.
> > > > -	 */
> > > > +	struct drm_device *dev =3D vdev->priv;
> > > > +
> > > > +	/* stop talking to the device */
> > > > +	drm_dev_unplug(dev);
> > >=20
> > > I'm not necessarily opposed to using drm_dev_unplug() here, but it's
> > > still pretty surprising to me. It's typically used in remove, not
> > > shutdown. The typical helper to use at shutdown is
> > > drm_atomic_helper_shutdown.
> > >=20
> > > So if the latter isn't enough or wrong, we should at least document w=
hy.
> >=20
> > The intention of this is to make sure the driver stops talking to the
> > device (as the comment already says).
> >=20
> > There are checks in place in the virt queue functions which will make
> > sure the driver will not try place new requests in the queues after
> > drm_dev_unplug() has been called.  Which why I decided to implement it
> > that way.
> >=20
> > drm_atomic_helper_shutdown() tears down all outputs according to the
> > documentation.  Which is something different.  I don't think calling
> > drm_atomic_helper_shutdown() will do what I need here.  Calling it in
> > addition to drm_dev_unplug() might make sense, not sure.
> >=20
> > Suggestions are welcome.
> >=20
> > take care,
> >   Gerd
>=20
>=20
> I suggest adding comments in code explaining why it's approriate here.
> Want to try?

Yes, that would be great

Maxime

--owfohtpihfpfbao7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCrvLwAKCRAnX84Zoj2+
dgnnAX41YH5MdklVDoci3LCBdtMOwNXiHuO4oHPW3spALAh+ceP1tjWrDivp1KWs
HIHscPgBgLrrA1SdGDzvZnHluVFSvh0V6BWTaFk5wrcnF3tCW2hOXdbJLnN3ocJI
Jbo2yI9kOQ==
=36F7
-----END PGP SIGNATURE-----

--owfohtpihfpfbao7--
