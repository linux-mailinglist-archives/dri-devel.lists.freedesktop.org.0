Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7956C31785
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9506810E5F7;
	Tue,  4 Nov 2025 14:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Lu9msceh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7A710E5F7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762265995;
 bh=vqsb8KwSOO2mkk4dSN6be5CdE/u3SiQfbYCPRnXfqKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lu9mscehuWaDIPcgZv/TiljagH+0kzKatABTZx5TzU/Ts+e+bHcpnDbNJnnRh2mwr
 pVSUL05hD2diJdyhxrrzZI5BF/dEFt2ikl+yDKQJqYV7TtneYpyqX/Jet7iTPtXgyf
 CDCiSv4vF6YjhcLALnsgidq9DySsDnW9ij/sthR4Zf/xq9EaL5UMkaZYtYwLvmGVSo
 MWnn44pfJZz2dIKRAWDk2KRxbZpv5Rp7n78nRDGzEhLuPu/ja+fkKiO0Fd+gDwq114
 UPJI8GrJlzES3e/pO6p9uR4ihphoIOompuEEgdG4W22v/a9f0QW3Kw/WnD54X4m5mM
 3MSCRBodMu0RA==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:e41c:5800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EBD517E1091;
 Tue,  4 Nov 2025 15:19:55 +0100 (CET)
Date: Tue, 4 Nov 2025 16:19:53 +0200
From: Marius Vlad <marius.vlad@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch,
 jani.nikula@linux.intel.com, ian.forbes@broadcom.com,
 daniel.stone@collabora.com
Subject: Re: [PATCH v4 3/3] drm/vkms: Add polling for HPD
Message-ID: <aQoLifqzUrYpZnWW@xpredator>
References: <20251103174558.7709-1-marius.vlad@collabora.com>
 <20251103174558.7709-4-marius.vlad@collabora.com>
 <cb53bb27-66d8-44ef-beec-48b093f50d8c@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ru7z6gUoRbpOWVow"
Content-Disposition: inline
In-Reply-To: <cb53bb27-66d8-44ef-beec-48b093f50d8c@bootlin.com>
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


--ru7z6gUoRbpOWVow
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 11:21:28AM +0100, Louis Chauvet wrote:
>=20
>=20
> Le 03/11/2025 =E0 18:45, Marius Vlad a =E9crit=A0:
> > vkms is missing any kind of HPD (polling/irq), so add polling to handle
> > hotplug events.
>=20
> Hi,
Hi Louis, thanks for the quick reply!
>=20
> I am a bit surprised by this addition, we currently have hotplug/unplug in
> VKMS using configFS, and it seems to work. The current "irq" system is
> writing in configFS the status and call drm_kms_helper_hotplug_event after
> the status is updated [1].
The situation is that the VKMS connectors/card are also being exposed
through sysfs similar to real devices. That's where we trigger/simulate
a connector hot-plug without physically unplugging cables. Wasn't aware
that VKMS had something similar to that with ConfigFS, so that needs
adjusting.
>=20
> I think the polling will not work, I read in the drm_kms_helper_poll_init
> documentation that the connector is not polled if some connector flags are
> not set [2]/[3].
In this case the loop will be no-op, but prior to the loop
`changed` is set to `changed =3D dev->mode_config.delayed_event` [1] so
the code at [2] will do run.
>=20
> If the polling works, I don't think it will be enough for the current VKMS
> implementation. Currently setting status using configFS will do everything
> synchronously:
> - Set the connector status (next call to connector->detect will have the =
new
> value)
> - Call drm_kms_helper_hotplug_event
>=20
> With your implementation, I think you expect something to update
> connector->status_changed in between, using polling if I understood
> correctly, which will probably happen after the call to
> drm_kms_helper_hotplug_event.
Right, that's another path for VKMS.

[1] https://elixir.bootlin.com/linux/v6.17.7/source/drivers/gpu/drm/drm_pro=
be_helper.c#L769
[2] https://elixir.bootlin.com/linux/v6.17.7/source/drivers/gpu/drm/drm_pro=
be_helper.c#L846

>=20
> [1]:https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/d=
rivers/gpu/drm/vkms/vkms_connector.c?ref_type=3Dheads#L91-96
> [2]:https://elixir.bootlin.com/linux/v6.17.7/source/drivers/gpu/drm/drm_p=
robe_helper.c#L917-L918
> [3]:https://elixir.bootlin.com/linux/v6.17.7/source/drivers/gpu/drm/drm_p=
robe_helper.c#L793
>=20
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_drv.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkm=
s_drv.c
> > index e8472d9b6e3b..ec815c42ef04 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -198,6 +198,9 @@ static int vkms_create(struct vkms_config *config)
> >   	if (ret)
> >   		goto out_devres;
> > +	/* init kms poll for handling hpd */
> > +	drm_kms_helper_poll_init(&vkms_device->drm);
> > +
> >   	drm_client_setup(&vkms_device->drm, NULL);
> >   	return 0;
> > @@ -240,6 +243,7 @@ static void vkms_destroy(struct vkms_config *config)
> >   	fdev =3D config->dev->faux_dev;
> > +	drm_kms_helper_poll_fini(&config->dev->drm);
> >   	drm_dev_unregister(&config->dev->drm);
> >   	drm_atomic_helper_shutdown(&config->dev->drm);
> >   	devres_release_group(&fdev->dev, NULL);
>=20
> --=20
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20

--ru7z6gUoRbpOWVow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmkKC4IACgkQ9jQS5glH
1u/rfQ/9ERT2V3avZiXfz1iBF2D7PST+oTq9QgeZXTSsi5LRmwcgoXymrfyuPcv+
MACkjz5aZRcemdPBpdnlFNpbPr635WGzltq+5OeI3QVeY/BXXvO1VckW98iZkGUT
MzFC1VgPqnrEqhPuNR0YfvbuiGyQRENosR+YX2yLq7bqv9KxVFxeGv9zt1VP1cM6
mlYuTURCTneX3nl1NETpwTPNWS4pucH/0AZRgtRga53SfndSIPjCh0vylrGwmF1Y
7t4GEhBkpxQ8pHF5AWpsj7PcB7N78bG9dm6KqIjcE3vYrNdcit+zUKgvk503ZAeA
7Ly/EOKgbLD7oPhbHX1Ihkr6bC4EUgrvoS2zP0wXbip02KuYPAWjjA3ZA81lJPV9
TO4fPLtlzNud0NgKo0njBXAGTEKEjUGPlhT0iUgFYm1cEabgRxz9e+kRR0CT8Nuq
K2W0EcVIs+8VGofNqLLAZT3y2S+HEOU3Q3eZC/Ql/uDiuVWxuUBJWCnYDrhzpW0F
95+nycuMVBO2w1nLgMbHIcg5OFLWkvnK9kSw8b8VID205XS4Sfhbi7QZ1IOJLo1n
FXmGfQR2EOIWG5Cqdf4w/CCe/InfnOVb9UAuo7YkjXudjzEl9nxWUDZ2AlF8Pub3
kmRxO+rHHwoFy6RRpOyJa0lxjZRzkypHTDOAxXjbqavRScBmKVg=
=htFa
-----END PGP SIGNATURE-----

--ru7z6gUoRbpOWVow--
