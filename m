Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44122B950BC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9093E10E550;
	Tue, 23 Sep 2025 08:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DOZ8H6Eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BBD10E550
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758616962;
 bh=HgbubFtWcc+I36bVamM/0+LBQaAu9xSrWVvobjVzgXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOZ8H6Eg9i18uPrcog+N0eSL1qonfzY3133oW7jByG8reQtmBoo4DxsBMoC/echJG
 plAptSfwFG6K4rPHuHIolvJeAbtpGE0rkE8Mds98BAJMvNz6pzLzp9x7zt5JdfRqRl
 /V0t5RCpbwITM1bDj4tmIF0uxd/5IL8B6HOw35Tgc8pFIfFuN/T2Grgos6poWt0a7m
 IfGdVwRjR4Iz0Iw3KDemUZJeIwoNRCJLE/udMjd0bkqa9906ALY8cTD7bA7Pd6fFO0
 Mzw9+wWPhsv0VqtzEILFCJ4NaPH4qTrXMnNQI3ji+QgVWOcLkV4VPpwqHn31PtLpTY
 /MQGenswRm/kA==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:ed09:4100:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BFF5317E0A2B;
 Tue, 23 Sep 2025 10:42:41 +0200 (CEST)
Date: Tue, 23 Sep 2025 11:42:40 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch
Subject: Re: [PATCH v2 1/2] drm: Introduce a new connector status
Message-ID: <aNJdgHEsPAvazcJk@xpredator>
References: <20250729165708.9947-1-marius.vlad@collabora.com>
 <20250729165708.9947-2-marius.vlad@collabora.com>
 <kd3hwsrsves5tc42code3r5ueiqzxekjz2strijlcrhhydwic5@otohedg77l6d>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xnnUdUU9S1hSaDwy"
Content-Disposition: inline
In-Reply-To: <kd3hwsrsves5tc42code3r5ueiqzxekjz2strijlcrhhydwic5@otohedg77l6d>
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


--xnnUdUU9S1hSaDwy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Sat, Aug 23, 2025 at 12:30:27AM +0300, Dmitry Baryshkov wrote:
> On Tue, Jul 29, 2025 at 07:57:07PM +0300, Marius Vlad wrote:
> > This patch introduces a new boolean variable used to track connector's
> > connect/disconnect status and it is being used on both polling and
> > the HPD (Hot Plug Detect) paths.
> >=20
> > A subsequent patch would make use of this connector status to propagate
> > per-connector udev hot plug events. This allows user-space to receive
> > the connector's ID, rather than having a generic hot-plug event for all
> > connectors, or in the HPD path, just the first one found with a
> > connection status change.
>=20
> This looks good, the main question would be, what prevents a races
> during modifications of this field? I think it should be toggled under
> the dev->mode_config.mutex.
Thanks the review (been away for awhile and just saw your replies).
      =20
Sent out a v3 update:
https://lore.kernel.org/dri-devel/20250729165708.9947-1-marius.vlad@collabo=
ra.com/
>=20
> >=20
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c    |  1 +
> >  drivers/gpu/drm/drm_probe_helper.c | 12 ++++++++++++
> >  drivers/gpu/drm/drm_sysfs.c        |  1 +
> >  include/drm/drm_connector.h        |  3 +++
> >  4 files changed, 17 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 272d6254ea47..3c6628ee3096 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -274,6 +274,7 @@ static int drm_connector_init_only(struct drm_devic=
e *dev,
> > =20
> >  	/* provide ddc symlink in sysfs */
> >  	connector->ddc =3D ddc;
> > +	connector->status_changed =3D false;
> > =20
> >  	INIT_LIST_HEAD(&connector->head);
> >  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_p=
robe_helper.c
> > index 6b3541159c0f..761766181e99 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -628,6 +628,7 @@ int drm_helper_probe_single_connector_modes(struct =
drm_connector *connector,
> >  			mod_delayed_work(system_wq,
> >  					 &dev->mode_config.output_poll_work,
> >  					 0);
> > +		connector->status_changed =3D true;
> >  	}
> > =20
> >  	/*
> > @@ -731,6 +732,15 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_mo=
des);
> >   */
> >  void drm_kms_helper_hotplug_event(struct drm_device *dev)
> >  {
> > +	struct drm_connector *connector;
> > +	struct drm_connector_list_iter conn_iter;
> > +
> > +	drm_connector_list_iter_begin(dev, &conn_iter);
> > +	drm_for_each_connector_iter(connector, &conn_iter) {
> > +		connector->status_changed =3D false;
> > +	}
> > +	drm_connector_list_iter_end(&conn_iter);
> > +
> >  	drm_sysfs_hotplug_event(dev);
> >  	drm_client_dev_hotplug(dev);
> >  }
> > @@ -747,6 +757,7 @@ void drm_kms_helper_connector_hotplug_event(struct =
drm_connector *connector)
> >  {
> >  	struct drm_device *dev =3D connector->dev;
> > =20
> > +	connector->status_changed =3D false;
> >  	drm_sysfs_connector_hotplug_event(connector);
> >  	drm_client_dev_hotplug(dev);
>=20
>=20
> What would be the rule? Should it be unset before or after calling all
> the notifiers? Otherwise it's really strange. In the chunk below you set
> the flag, then it calls this function and the flags gets immediately
> unset.
Yeah, saw that was well. I've removed it entirely and just kept the unset b=
it
in drm_kms_helper_hotplug_event/drm_kms_helper_connector_hotplug_event.
>=20
> >  }
> > @@ -1041,6 +1052,7 @@ bool drm_connector_helper_hpd_irq_event(struct dr=
m_connector *connector)
> >  	mutex_unlock(&dev->mode_config.mutex);
> > =20
> >  	if (changed) {
> > +		connector->status_changed =3D true;
> >  		drm_kms_helper_connector_hotplug_event(connector);
> >  		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Sent hotplug event\n",
> >  			    connector->base.id,
> > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > index 60c1f26edb6f..77f880654d6a 100644
> > --- a/drivers/gpu/drm/drm_sysfs.c
> > +++ b/drivers/gpu/drm/drm_sysfs.c
> > @@ -196,6 +196,7 @@ static ssize_t status_store(struct device *device,
> >  		return ret;
> > =20
> >  	old_force =3D connector->force;
> > +	connector->status_changed =3D true;
> > =20
> >  	if (sysfs_streq(buf, "detect"))
> >  		connector->force =3D 0;
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 8f34f4b8183d..e4310df3d55c 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -2146,6 +2146,9 @@ struct drm_connector {
> >  	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
> >  	enum drm_connector_force force;
> > =20
> > +	/** @status_changed: if the old status doesn't match current connecti=
on status */
> > +	bool status_changed;
> > +
> >  	/**
> >  	 * @edid_override: Override EDID set via debugfs.
> >  	 *
> > --=20
> > 2.47.2
> >=20
>=20
> --=20
> With best wishes
> Dmitry

--xnnUdUU9S1hSaDwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjSXX0ACgkQ9jQS5glH
1u976BAAyT/KZFIM3kc7Y8NeL/MSzVn/TOEqTj2RCI8A17esUB2UwNjANWINfyAp
1LEOc2sw0Ckifvfi0uW3GcQU2ZY8ZBdSbKQVlUNn4mf2bRHIHlipWF2PrQQ5xdWs
ddxecn+uRGXdQO4fLv6BZBTURBIfyXseE39ggRjqRcsJJJnlMYI4qHbBn6LUPMU/
YpKHY+MBFgiFOslUaKQfqOgS539D8+KyCktsx0JN6BEUcaQ6CIrUlnA5CCt8LT5u
dttF92aB0tmaxLx8yccw7jSzBIGtjsDei6PxITngs+TQXgHY4FIobeE7tE42NFSh
P39W7g4O3ET+Ax6HRh5jUgh+G9wXh3n9xNEcMLtmyG1iqkIBwTwyn/E3uZAbZfiT
8rZzJnYU6NHvaYnMH1JBMZirHqu4ytqgUYug9jr3N4j4iwqGm6zfGkbC+iOX3yGF
+aLVVAyAW4xjKSpI1dY/eVC+p0x3KXL13wLlRwAyCA6YRpiGJChizFPYsja6dS89
3BmpRHJqM9KM8wbM0DtX4dP73/DJiIiJaBWaeFCnepjbZse4ceeHkZtmO4zwOd02
vmHHLaOdz08uznXIRKi2dNjBHtOJVzZuZy+pQngO474z1kDNkf3VrJ+iI1ace2Ky
YCVOrjam0o1i4+F5U/DQ/gAjJ1dJpIi0lO82nJ+XsYWyWuhf/QQ=
=vZSN
-----END PGP SIGNATURE-----

--xnnUdUU9S1hSaDwy--
