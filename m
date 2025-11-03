Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2AEC2D977
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 19:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF60A10E206;
	Mon,  3 Nov 2025 18:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q0CbQbT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B6E10E206
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 18:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762193268;
 bh=lNaH1cLxCRrQqUEbq9zAO98VOpLexMGUJUCXY0q+IUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q0CbQbT3HMj6MWo97wspqkXoaRh2rZ8qUNWeaOV07bAOqcBYgrdpM/RyKX1gwrixT
 06PVMBoy9gaqU1HTckMOA5TJnI+qVjVVISg9nO+Vx1dvLimQkDiwfZ3u22AIas9o9p
 WJ/2iUlVsA21j7yHAHaq0fFg2sFAF+E/wKdWRLGEGzlgWGlLqwUkF0gIZdFrMwZCSG
 Y+KrWOzrRnAPSNoEmRhNZZ/1wWr+0/MNcS8WG4rgdXnN08AZaBRCPK/hb5/XUfwzCT
 txw3GKqAA9CHW+Pih76c612zaQyR8oxSrPtj1AZ3pzVNc2QOBGu/0omXoQPjXwgjIq
 Df6I/BuHBbpeA==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:e41c:5800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AC6C717E1305;
 Mon,  3 Nov 2025 19:07:47 +0100 (CET)
Date: Mon, 3 Nov 2025 20:07:46 +0200
From: Marius Vlad <marius.vlad@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, derek.foreman@collabora.com
Subject: Re: [PATCH 1/2] drm: Introduce a new connector status
Message-ID: <aQjvcgiLekSSe8kO@xpredator>
References: <20250923083636.4749-1-marius.vlad@collabora.com>
 <20250923083636.4749-2-marius.vlad@collabora.com>
 <whsopn2fp4pa6mcomezcib35uxsubxtr5qtltxthbsv2apbuxl@xtxuvuyfaib2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nc1DnXv0GHRT80MH"
Content-Disposition: inline
In-Reply-To: <whsopn2fp4pa6mcomezcib35uxsubxtr5qtltxthbsv2apbuxl@xtxuvuyfaib2>
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


--Nc1DnXv0GHRT80MH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,
On Tue, Sep 23, 2025 at 06:53:01PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 23, 2025 at 11:36:35AM +0300, Marius Vlad wrote:
> > This patch introduces a new boolean variable used to track connector's
> > connect/disconnect status and it is being used on both polling and
> > the HPD (Hot Plug Detect) paths.
>=20
> Please see Documentation/process/submitting-patches.rst, it has special
> paragraph about "This patch".
Yes, removed that.
>=20
> >=20
> > A subsequent patch would make use of this connector status to propagate
> > per-connector udev hot plug events. This allows user-space to receive
> > the connector's ID, rather than having a generic hot-plug event for all
> > connectors, or in the HPD path, just the first one found with a
> > connection status change.
>=20
> It's not clear from the commit message, what is the expected behaviour.
> The flag has to be set when we've detected the status change - e.g.
> monitor being plugged or unplugged. When is it expected to be cleared?
Flag should be cleared when firing up KMS uevents and set when detecting
connected/disconnected events. Added a note in the commit desc for v4.
>=20
> >=20
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c    |  1 +
> >  drivers/gpu/drm/drm_probe_helper.c | 18 ++++++++++++++++++
> >  drivers/gpu/drm/drm_sysfs.c        |  1 +
> >  include/drm/drm_connector.h        |  3 +++
> >  4 files changed, 23 insertions(+)
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
> > index 09b12c30df69..a865d5aa6f73 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -629,6 +629,9 @@ int drm_helper_probe_single_connector_modes(struct =
drm_connector *connector,
> >  			mod_delayed_work(system_wq,
> >  					 &dev->mode_config.output_poll_work,
> >  					 0);
> > +		mutex_lock(&dev->mode_config.mutex);
> > +		connector->status_changed =3D true;
> > +		mutex_unlock(&dev->mode_config.mutex);
> >  	}
> > =20
> >  	/*
> > @@ -732,6 +735,17 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_mo=
des);
> >   */
> >  void drm_kms_helper_hotplug_event(struct drm_device *dev)
> >  {
> > +	struct drm_connector *connector;
> > +	struct drm_connector_list_iter conn_iter;
> > +
> > +	drm_connector_list_iter_begin(dev, &conn_iter);
> > +	drm_for_each_connector_iter(connector, &conn_iter) {
> > +		mutex_lock(&dev->mode_config.mutex);
> > +		connector->status_changed =3D false;
> > +		mutex_unlock(&dev->mode_config.mutex);
> > +	}
> > +	drm_connector_list_iter_end(&conn_iter);
> > +
> >  	drm_sysfs_hotplug_event(dev);
> >  	drm_client_dev_hotplug(dev);
> >  }
> > @@ -748,6 +762,10 @@ void drm_kms_helper_connector_hotplug_event(struct=
 drm_connector *connector)
> >  {
> >  	struct drm_device *dev =3D connector->dev;
> > =20
> > +	mutex_lock(&dev->mode_config.mutex);
> > +	connector->status_changed =3D false;
> > +	mutex_unlock(&dev->mode_config.mutex);
> > +
> >  	drm_sysfs_connector_hotplug_event(connector);
> >  	drm_client_dev_hotplug(dev);
> >  }
> > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > index b01ffa4d6509..bd9161490116 100644
> > --- a/drivers/gpu/drm/drm_sysfs.c
> > +++ b/drivers/gpu/drm/drm_sysfs.c
> > @@ -199,6 +199,7 @@ static ssize_t status_store(struct device *device,
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

--Nc1DnXv0GHRT80MH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmkI72oACgkQ9jQS5glH
1u910g/7B3PhL8sKC+PKiJUfPXSvNFjfkqenA10CzDcBDzZRm1NQSxFJB+9pYBRy
6rn7xdxiztoqLGN53K1pPiWZaG7G3qEyY+3EzSjwJH5sb4tkH0jgkUmflQ1uEs2N
R1m48Xs7qSx5ATuhCZhPGcRG+kO4yMJDw2lAWUKogF1oz2IjArBJvbXUxWY017sG
b1OAhtkkNclwIRTLNqSN7ZB+tV9PnNuggrXmq2otNGCMTb5OICbFrbeHU3KxG4M/
bxbki8vSVrUF3zTt7ZwAzERWizrWB07tz93KJ8ZHkXaxHY1m8TP31WKboGcsCG1N
L0qGtoGl6XDgvoNwgO94ePY6sy/kkSqRnFMxiqEfyGSgizSpQbS+YRA2OH8wcaUS
k0W3x8GtOFYUOCk6nEaMzrT0uL1UoIGOE3r7hFvBMlEY1Ue7l+zB08G811N83CYh
RNCL0Y4kHV4rZZ0O5/AvMs5GJ6WIqYiqyf81vggOm5i3zzG3KA6pbdKpvGqog+0V
5o5V/sIp/kpOn5NxCTfHgfk73Y4QgPOdf5yMtbSsI5XMF7PwCCpCDlfTpgXA0OaY
UysYMNM0SchkTbFWg3eQZ20F7DzFFrMhGSIRu1pUm1i/1Z6ZxxPY4u81NJImUUqB
ktkg8YXfFh/IoTLQb3fBPq+XI+jkUUDjCfJAL5a619pwJKz/Gqk=
=07Bl
-----END PGP SIGNATURE-----

--Nc1DnXv0GHRT80MH--
