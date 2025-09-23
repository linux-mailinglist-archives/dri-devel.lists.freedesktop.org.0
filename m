Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2448B950E0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B14D10E59F;
	Tue, 23 Sep 2025 08:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AdSLhWGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FDC10E5A1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758617079;
 bh=tAcslKKiA+w1TaSdAC1PI/bS+8PQi3LZipZPXnx1WT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AdSLhWGtQQsa6izztHvoDEopqgN0cIZMRV/TF2CTd1eHqbLSvJ+J+WRHmZr90P2Lp
 GKwKnhIb/bkkPf5AXCVj2yo3r/jjhyIoNWW3OasaiawN/jhd2yCEWziz4PUfFyClqP
 6887rccGG+IzPW/RrGQwjTJC5Cp0KNtZCMI1qjnwmcLy943STecCrqrOx40yhJcKdD
 N9v+QyrDjPpc8SQ0mi27T7PbJXYdTh7CerIG8s3Qg5JN10i631zBsa+F1hzzzpJIqM
 3urLwwScGLJLRL+oMk+05ZD73dFALbg4C9kUePVUxUM1C7Aqj84qhNW68GXreEWIMf
 GbeyBtzniFsgg==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:ed09:4100:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 067C517E0A2B;
 Tue, 23 Sep 2025 10:44:38 +0200 (CEST)
Date: Tue, 23 Sep 2025 11:44:37 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch
Subject: Re: [PATCH v2 1/2] drm: Introduce a new connector status
Message-ID: <aNJd9a-vBeoPZqtH@xpredator>
References: <20250729165708.9947-1-marius.vlad@collabora.com>
 <20250729165708.9947-2-marius.vlad@collabora.com>
 <kd3hwsrsves5tc42code3r5ueiqzxekjz2strijlcrhhydwic5@otohedg77l6d>
 <aNJdgHEsPAvazcJk@xpredator>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mgEIN4ZwvkbXJR8i"
Content-Disposition: inline
In-Reply-To: <aNJdgHEsPAvazcJk@xpredator>
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


--mgEIN4ZwvkbXJR8i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 11:42:42AM +0300, Marius Vlad wrote:
> Hi Dmitry,
>=20
> On Sat, Aug 23, 2025 at 12:30:27AM +0300, Dmitry Baryshkov wrote:
> > On Tue, Jul 29, 2025 at 07:57:07PM +0300, Marius Vlad wrote:
> > > This patch introduces a new boolean variable used to track connector's
> > > connect/disconnect status and it is being used on both polling and
> > > the HPD (Hot Plug Detect) paths.
> > >=20
> > > A subsequent patch would make use of this connector status to propaga=
te
> > > per-connector udev hot plug events. This allows user-space to receive
> > > the connector's ID, rather than having a generic hot-plug event for a=
ll
> > > connectors, or in the HPD path, just the first one found with a
> > > connection status change.
> >=20
> > This looks good, the main question would be, what prevents a races
> > during modifications of this field? I think it should be toggled under
> > the dev->mode_config.mutex.
> Thanks the review (been away for awhile and just saw your replies).
>       =20
> Sent out a v3 update:
> https://lore.kernel.org/dri-devel/20250729165708.9947-1-marius.vlad@colla=
bora.com/
Err, this one points to the correct version: https://lore.kernel.org/dri-de=
vel/20250923083636.4749-1-marius.vlad@collabora.com/T/#t
> >=20
> > >=20
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c    |  1 +
> > >  drivers/gpu/drm/drm_probe_helper.c | 12 ++++++++++++
> > >  drivers/gpu/drm/drm_sysfs.c        |  1 +
> > >  include/drm/drm_connector.h        |  3 +++
> > >  4 files changed, 17 insertions(+)
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
> > > index 6b3541159c0f..761766181e99 100644
> > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > @@ -628,6 +628,7 @@ int drm_helper_probe_single_connector_modes(struc=
t drm_connector *connector,
> > >  			mod_delayed_work(system_wq,
> > >  					 &dev->mode_config.output_poll_work,
> > >  					 0);
> > > +		connector->status_changed =3D true;
> > >  	}
> > > =20
> > >  	/*
> > > @@ -731,6 +732,15 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_=
modes);
> > >   */
> > >  void drm_kms_helper_hotplug_event(struct drm_device *dev)
> > >  {
> > > +	struct drm_connector *connector;
> > > +	struct drm_connector_list_iter conn_iter;
> > > +
> > > +	drm_connector_list_iter_begin(dev, &conn_iter);
> > > +	drm_for_each_connector_iter(connector, &conn_iter) {
> > > +		connector->status_changed =3D false;
> > > +	}
> > > +	drm_connector_list_iter_end(&conn_iter);
> > > +
> > >  	drm_sysfs_hotplug_event(dev);
> > >  	drm_client_dev_hotplug(dev);
> > >  }
> > > @@ -747,6 +757,7 @@ void drm_kms_helper_connector_hotplug_event(struc=
t drm_connector *connector)
> > >  {
> > >  	struct drm_device *dev =3D connector->dev;
> > > =20
> > > +	connector->status_changed =3D false;
> > >  	drm_sysfs_connector_hotplug_event(connector);
> > >  	drm_client_dev_hotplug(dev);
> >=20
> >=20
> > What would be the rule? Should it be unset before or after calling all
> > the notifiers? Otherwise it's really strange. In the chunk below you set
> > the flag, then it calls this function and the flags gets immediately
> > unset.
> Yeah, saw that was well. I've removed it entirely and just kept the unset=
 bit
> in drm_kms_helper_hotplug_event/drm_kms_helper_connector_hotplug_event.
> >=20
> > >  }
> > > @@ -1041,6 +1052,7 @@ bool drm_connector_helper_hpd_irq_event(struct =
drm_connector *connector)
> > >  	mutex_unlock(&dev->mode_config.mutex);
> > > =20
> > >  	if (changed) {
> > > +		connector->status_changed =3D true;
> > >  		drm_kms_helper_connector_hotplug_event(connector);
> > >  		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Sent hotplug event\n",
> > >  			    connector->base.id,
> > > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > > index 60c1f26edb6f..77f880654d6a 100644
> > > --- a/drivers/gpu/drm/drm_sysfs.c
> > > +++ b/drivers/gpu/drm/drm_sysfs.c
> > > @@ -196,6 +196,7 @@ static ssize_t status_store(struct device *device,
> > >  		return ret;
> > > =20
> > >  	old_force =3D connector->force;
> > > +	connector->status_changed =3D true;
> > > =20
> > >  	if (sysfs_streq(buf, "detect"))
> > >  		connector->force =3D 0;
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
> > >=20
> >=20
> > --=20
> > With best wishes
> > Dmitry



--mgEIN4ZwvkbXJR8i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjSXfUACgkQ9jQS5glH
1u8hjg/+M3D4EGHwkTgyEMS3g0ZGjzw66ALnRwAXzFXQEUdsbl4zC4+YrPE5rIS1
Rm1629fOceUCRN9eWJIxdCk5dSlAcrZYG+0lPgr9utI4FtdranX+LkzI+PBq7Pgf
ST/k132VXPbR+SQ8FVWVrwyQph+RTjYuNH4/rYOcUEhCJkJg+Voaw617ZU52XTIZ
IucJJGHBXyggy2KVaheVhh/8twWruhSW96g3rUxROHaIAGkubqM3u9017oR1SeSR
EEqBL9ZY/3GppJ9pWTUYJiKwHydrS2kU4pB9mtmWsmrVcyPF7DvEN5tj3riig+Sm
3w6chGqWgsp/zScKYrs+woaONaxDXi7efmU4eTZJg0f29Rhye52YASvTQ3N1DDqe
UQvl9xUfWZ+hOGq4MSvpRE2kiWSS/GxBhlJXpJ0UcfdGlqhmtxVsA61PDBnEodcY
UrR+llKiwODvClNgtf8JY0zRwNB2F0IhGhhYavT0bd++IbQAYschVUSqHDqBTDdu
DoRAf/w92a7l4SWsHpSDFY7DvDXxoZ2x9E4LTYfSCgfoeZeX+L21d9R7kwaq+24b
IB8mdDv2l6FLz2ck2OaoNxYNA7hc8SAT0Gn/pC7RvFYYuHGNHN1CckMKP+TK4nYF
2TbiGsrnF+EUmNf/K4Qf/0KjV2uqwCknHO4YCrlhaeQQ0EvvJ94=
=5VmR
-----END PGP SIGNATURE-----

--mgEIN4ZwvkbXJR8i--
