Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB61CC6445B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 14:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4D110E371;
	Mon, 17 Nov 2025 13:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fLlUUhtv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5414A10E371
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763384819;
 bh=e4ZK070NOSBCNWb0kYDdyrXcWtSkZmm8MeHidLG2kcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fLlUUhtvWoV3WOxV8gNZQdZbVJx6Y4GmPFQ8rMNbi2pFFB95nXGMe+jiVlA/uaEqz
 8g6okd7exhOwv3D3keAFykaZlRR/tWH0SlnflXbNo+og8Ecy/FF57k6KCQgP6ESu3a
 RkGZp2NtcHSGt3pXEugSEGtFz8Qk8JiadloaN92u1Z9Fnane8VtApACqfsWaZJc6hz
 CkmEnyuZ9EiTe4Eq77yQNNV5tjMiziCHpF/XT2eMlXsyeefxShRcR5KnjGYuLdghRg
 Hrz6a/uWkLWUaI+gllZyhkvrhRiqFlguC0+VulyuwEkf5GHtdzEUdDMECn6lMblZ71
 N+nXwppIhHJtg==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:eb0f:ad00:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9148617E10F3;
 Mon, 17 Nov 2025 14:06:59 +0100 (CET)
Date: Mon, 17 Nov 2025 15:06:58 +0200
From: Marius Vlad <marius.vlad@collabora.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch,
 jani.nikula@linux.intel.com, ian.forbes@broadcom.com,
 louis.chauvet@bootlin.com, daniel.stone@collabora.com
Subject: Re: [PATCH 1/4] drm: Introduce a new connector status
Message-ID: <aRsd8hL2-zhOFC-U@xpredator>
References: <20251111162338.15141-1-marius.vlad@collabora.com>
 <20251111162338.15141-2-marius.vlad@collabora.com>
 <aROGg9-ra30e4HRZ@intel.com> <aROKwmZxFt52g4ed@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2ATeF0pOl5C8UM9m"
Content-Disposition: inline
In-Reply-To: <aROKwmZxFt52g4ed@intel.com>
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


--2ATeF0pOl5C8UM9m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 09:13:06PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Nov 11, 2025 at 08:54:59PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Tue, Nov 11, 2025 at 06:23:35PM +0200, Marius Vlad wrote:
> > > Introduce a new boolean variable used to track connector's
> > > connect/disconnect status and it is being used on both polling and the
> > > HPD (Hot Plug Detect) paths.
> > >=20
> > > A subsequent change would make use of this connector status to propag=
ate
> > > per-connector udev hotplug events.
> > >=20
> > > The connector status is set in the drm_connector_funcs.fill_modes/vkms
> > > ConfigFS connector's status and cleared out when firing out KMS ueven=
ts.
> > >=20
> > > Allows user-space to receive the connector's ID, rather than having a
> > > generic hot-plug event for all connectors, or in the HPD path, just t=
he
> > > first one found with a connection status change.
> > >=20
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c      |  1 +
> > >  drivers/gpu/drm/drm_probe_helper.c   | 17 +++++++++++++++++
> > >  drivers/gpu/drm/drm_sysfs.c          |  1 +
> > >  drivers/gpu/drm/vkms/vkms_configfs.c |  6 ++++++
> > >  include/drm/drm_connector.h          |  3 +++
> > >  5 files changed, 28 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index 272d6254ea47..3c6628ee3096 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -274,6 +274,7 @@ static int drm_connector_init_only(struct drm_dev=
ice *dev,
> > > =20
> > >  	/* provide ddc symlink in sysfs */
> > >  	connector->ddc =3D ddc;
> > > +	connector->status_changed =3D false;
> > > =20
> > >  	INIT_LIST_HEAD(&connector->head);
> > >  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
> > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm=
_probe_helper.c
> > > index 09b12c30df69..f0474368e98d 100644
> > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > @@ -629,6 +629,8 @@ int drm_helper_probe_single_connector_modes(struc=
t drm_connector *connector,
> > >  			mod_delayed_work(system_wq,
> > >  					 &dev->mode_config.output_poll_work,
> > >  					 0);
> > > +
> > > +		connector->status_changed =3D true;
> >=20
> > .fill_modes() gets exectued from the getconnector() ioctl which userspa=
ce
> > issues in response to the uevent. Not the other way around. So looks
> > like you have the chicken and egg the wrong way around here.
>=20
> Oh, and we already have a connector->epoch_counter which is supposed
> track whether anything on the connector has changed. So I'm not sure
> what extra this new boolean is supposed to achieve on top of that?
epoch_counter doesn't take all cases into consideration. For the
instance the connector list loop in output_poll_execute will be a no-op
if we try to simulate a hot-plug event with drm_sysfs. I suppose we
could've have used it for (real) HW hot-plug.

There's a few use-cases:

- 2 with real HW hot-plug - one for polling and one for HPD=20
- 2 for with virtual connectors - one for VKMS and one for drm_sysfs

The bool helps to know -- in case you have multiple connectors -- which
of them had a hot-plug event.
>=20
> > >  	}
> > > =20
> > >  	/*
> > > @@ -732,6 +734,17 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_=
modes);
> > >   */
> > >  void drm_kms_helper_hotplug_event(struct drm_device *dev)
> > >  {
> > > +	struct drm_connector *connector;
> > > +	struct drm_connector_list_iter conn_iter;
> > > +
> > > +	mutex_lock(&dev->mode_config.mutex);
> > > +	drm_connector_list_iter_begin(dev, &conn_iter);
> > > +	drm_for_each_connector_iter(connector, &conn_iter) {
> > > +		connector->status_changed =3D false;
> > > +	}
> > > +	drm_connector_list_iter_end(&conn_iter);
> > > +	mutex_unlock(&dev->mode_config.mutex);
> > > +
> > >  	drm_sysfs_hotplug_event(dev);
> > >  	drm_client_dev_hotplug(dev);
> > >  }
> > > @@ -748,6 +761,10 @@ void drm_kms_helper_connector_hotplug_event(stru=
ct drm_connector *connector)
> > >  {
> > >  	struct drm_device *dev =3D connector->dev;
> > > =20
> > > +	mutex_lock(&dev->mode_config.mutex);
> > > +	connector->status_changed =3D false;
> > > +	mutex_unlock(&dev->mode_config.mutex);
> > > +
> > >  	drm_sysfs_connector_hotplug_event(connector);
> > >  	drm_client_dev_hotplug(dev);
> > >  }
> > > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > > index b01ffa4d6509..bd9161490116 100644
> > > --- a/drivers/gpu/drm/drm_sysfs.c
> > > +++ b/drivers/gpu/drm/drm_sysfs.c
> > > @@ -199,6 +199,7 @@ static ssize_t status_store(struct device *device,
> > >  		return ret;
> > > =20
> > >  	old_force =3D connector->force;
> > > +	connector->status_changed =3D true;
> > > =20
> > >  	if (sysfs_streq(buf, "detect"))
> > >  		connector->force =3D 0;
> > > diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/v=
kms/vkms_configfs.c
> > > index 506666e21c91..6d6dd1a2c3a6 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> > > @@ -537,8 +537,14 @@ static ssize_t connector_status_store(struct con=
fig_item *item,
> > >  {
> > >  	struct vkms_configfs_connector *connector;
> > >  	enum drm_connector_status status;
> > > +	struct vkms_connector *vkms_connector;
> > > +	struct vkms_device *vkms_dev;
> > > =20
> > >  	connector =3D connector_item_to_vkms_configfs_connector(item);
> > > +	vkms_connector =3D connector->config->connector;
> > > +	vkms_dev =3D connector->config->config->dev;
> > > +	scoped_guard(mutex, &vkms_dev->drm.mode_config.mutex)
> > > +		vkms_connector->base.status_changed =3D true;
> > > =20
> > >  	if (kstrtouint(page, 10, &status))
> > >  		return -EINVAL;
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 8f34f4b8183d..e4310df3d55c 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -2146,6 +2146,9 @@ struct drm_connector {
> > >  	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
> > >  	enum drm_connector_force force;
> > > =20
> > > +	/** @status_changed: if the old status doesn't match current connec=
tion status */
> > > +	bool status_changed;
> > > +
> > >  	/**
> > >  	 * @edid_override: Override EDID set via debugfs.
> > >  	 *
> > > --=20
> > > 2.47.2
> >=20
> > --=20
> > Ville Syrj=E4l=E4
> > Intel
>=20
> --=20
> Ville Syrj=E4l=E4
> Intel

--2ATeF0pOl5C8UM9m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmkbHeoACgkQ9jQS5glH
1u9lDBAAz/sRxgSOmKO1SwZwO/smxhuh/1dOgYTbju7Z/SJBP4/zRRkNNOU2LpWW
KKkXI1IkqE3AEMHdWiuIM7MoveglPi9x6ci/sLa5q0ml3ECRKpQSyuS6HvfjMGTu
FB9epOfvJJDqWcHE5AHKM3vAnhMI1X205/uYWTdyW5AJBGHOPdS7YKtf0Ib67YuK
RICukmG61afqFWeEQFdsdhjxel8FIa+diglf9SWkGcl3UILCbR+Ga+Fo/UGIkKX9
RokFB4kgF98MDoJQgNwMCahjJB7+3pbxw52yia7COM1L3vQBGyjA9G03cge29obZ
aNECWeHbYegu451rRpG4C2W4wX/yzsQrONCJEh6hqZspeukgTE3DjILrH0Sx117+
bfz2usBoYinjfj20/8Cq7Z5cfHf9OWxe/qDPX/HZIqfAetm+ZvUFwudYRHMa8itM
FTFzmI70z4Guulz5o5J1En0XDzlDks+nkAOQr8mHf0fDobIK2MqQ0VtxSyKmrzfM
/EeqVrJ44dJxhjswITT3S1D/9OMyoTC02uJv6A9VIbSys6KJC1UvkdYQJCHLQW6y
YR7QAJDOhCvMmp9qquGa8LooxO5pocACr37DCxnMY/9WUWo8Fyws9sGIFs88BvPu
pe7kdhOOChrtZGCZdUCjXmqbOilJiDdXr5GMgCVv/BiuyTfEG0Y=
=FWIW
-----END PGP SIGNATURE-----

--2ATeF0pOl5C8UM9m--
