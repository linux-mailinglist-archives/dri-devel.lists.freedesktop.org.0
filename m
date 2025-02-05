Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CD0A28FC2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AE810E172;
	Wed,  5 Feb 2025 14:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gUt0Jmhn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EEE10E172
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 14:28:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55B6E5C5C58;
 Wed,  5 Feb 2025 14:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77626C4CED1;
 Wed,  5 Feb 2025 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738765733;
 bh=zzeZOhGIhVuTWQI8e0rfrZaaciL9Dpx4aCw+gLmeJMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gUt0JmhnuVZJx5D4UUxk5xKby0dxaHZJw3hX71kVdto/upXgQ8Hkh8JF6EQnh3KJh
 vj/qa8AFKPnbFYjoOi1kBVdcdp2+UTFJz6jYn86wLwXzM8ZjLPsNYdlg+MKncqJIaH
 0Qw9fMsgO9RbeFSAVW4r1ixmnTWnf3cvUV2P3CR+QcLiDnJvrQYKg9RqtPPNWsM779
 KOI9z3XVcypJVQ3NMtNy1gOteUmhxDZEFCowimyGQbCZm63olpPZ485IdSw5PI/Zq2
 YuFoSqI16+EHRm3Qa5e/3hTl5dG8BuzOdNN76a9qd2D9Ctxlw/pp1SYI94P9VoqCSk
 KBF/koD3mPqow==
Date: Wed, 5 Feb 2025 15:28:51 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/10] drm/connector: add CEC-related fields
Message-ID: <20250205-strong-azure-koel-f5b1f1@houat>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-1-5b5b2d4956da@linaro.org>
 <wchzy3tnppv5ql7k2juhynqz7kwjjsod3taykw3znxrzoomqdw@fudbksambvat>
 <mtzfnr53hug7ina7hf3s6ihzkdl7xswz6ibf46dgei73khj4ms@cfrxg32vdrbw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nrjzilikpi4xkhfi"
Content-Disposition: inline
In-Reply-To: <mtzfnr53hug7ina7hf3s6ihzkdl7xswz6ibf46dgei73khj4ms@cfrxg32vdrbw>
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


--nrjzilikpi4xkhfi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/10] drm/connector: add CEC-related fields
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 03:12:41PM +0200, Dmitry Baryshkov wrote:
> On Tue, Jan 28, 2025 at 11:33:05AM +0100, Maxime Ripard wrote:
> > On Sun, Jan 26, 2025 at 03:29:06PM +0200, Dmitry Baryshkov wrote:
> > > As a preparation to adding HDMI CEC helper code, add CEC-related fiel=
ds
> > > to the struct drm_connector. Include both cec_adapter and cec_notifie=
r,
> > > allowing drivers to select which one to use. The unregister callback
> > > is provided to let drivers unregister CEC-related data in a generic w=
ay
> > > without polluting drm_connector.c with dependencies on the CEC
> > > functions.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c | 13 ++++++++++++
> > >  include/drm/drm_connector.h     | 44 +++++++++++++++++++++++++++++++=
++++++++++
> > >  2 files changed, 57 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..fffb718b09eaaac200e6a=
bc7524bbfe98c4741f4 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_dev=
ice *dev,
> > >  	INIT_LIST_HEAD(&connector->probed_modes);
> > >  	INIT_LIST_HEAD(&connector->modes);
> > >  	mutex_init(&connector->mutex);
> > > +	mutex_init(&connector->cec.mutex);
> > >  	mutex_init(&connector->eld_mutex);
> > >  	mutex_init(&connector->edid_override_mutex);
> > >  	mutex_init(&connector->hdmi.infoframes.lock);
> > > @@ -698,6 +699,16 @@ static void drm_mode_remove(struct drm_connector=
 *connector,
> > >  	drm_mode_destroy(connector->dev, mode);
> > >  }
> > > =20
> > > +static void drm_connector_cec_unregister(struct drm_connector *conne=
ctor)
> > > +{
> > > +	mutex_lock(&connector->cec.mutex);
> > > +
> > > +	if (connector->cec.funcs->unregister)
> > > +		connector->cec.funcs->unregister(connector);
> > > +
> > > +	mutex_unlock(&connector->cec.mutex);
> > > +}
> > > +
> > >  /**
> > >   * drm_connector_cleanup - cleans up an initialised connector
> > >   * @connector: connector to cleanup
> > > @@ -718,6 +729,8 @@ void drm_connector_cleanup(struct drm_connector *=
connector)
> > > =20
> > >  	platform_device_unregister(connector->hdmi_audio.codec_pdev);
> > > =20
> > > +	drm_connector_cec_unregister(connector);
> > > +
> >=20
> > This should either be in a separate patch, or mentioned in the commit t=
itle/log
>=20
> I'll mention it in the commit message.
>=20
> >=20
> > >  	if (connector->privacy_screen) {
> > >  		drm_privacy_screen_put(connector->privacy_screen);
> > >  		connector->privacy_screen =3D NULL;
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index f13d597370a30dc1b14c630ee00145256052ba56..6da840673b1209c84bbc3=
96643c6033679a7ec74 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -46,6 +46,7 @@ struct drm_property_blob;
> > >  struct drm_printer;
> > >  struct drm_privacy_screen;
> > >  struct drm_edid;
> > > +struct cec_adapter;
> > >  struct edid;
> > >  struct hdmi_codec_daifmt;
> > >  struct hdmi_codec_params;
> > > @@ -1191,6 +1192,19 @@ struct drm_connector_hdmi_audio_funcs {
> > >  			   bool enable, int direction);
> > >  };
> > > =20
> > > +/**
> > > + * struct drm_connector_cec_funcs - drm_hdmi_connector control funct=
ions
> > > + */
> > > +struct drm_connector_cec_funcs {
> > > +	/**
> > > +	 * @adap_unregister: unregister CEC adapter / notifier.
> > > +	 *
> > > +	 * The callback to unregister CEC adapter or notifier, so that the =
core
> > > +	 * DRM layer doesn't depend on the CEC_CORE.
> > > +	 */
> > > +	void (*unregister)(struct drm_connector *connector);
> > > +};
> > > +
> > >  /**
> > >   * struct drm_connector_hdmi_funcs - drm_hdmi_connector control func=
tions
> > >   */
> > > @@ -1832,6 +1846,31 @@ struct drm_connector_hdmi {
> > >  	} infoframes;
> > >  };
> > > =20
> > > +/**
> > > + * struct drm_connector_cec - DRM Connector CEC-related structure
> > > + */
> > > +struct drm_connector_cec {
> > > +	/**
> > > +	 * @mutex: protects all CEC-related fields
> > > +	 */
> >=20
> > All fields? Which fields require to be protected by a specific mutex
> > here?
>=20
> Yes, all the fields. adapter, notifier and funcs are all protected by
> the mutex. See the drm_connector_cec_unregister() implementation (and
> corresponding unregister() callbacks implementations.

That's still surprising to me. Like, what concurrency source / code path
will need to make sure funcs is updated properly? or the adapter and
notifier?

Maxime

--nrjzilikpi4xkhfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6N1ogAKCRAnX84Zoj2+
dj00AYDQ3By9Zljlsy4qWLC0EkdTScIkaMEmrn0UYdL2kYmdCAdT7t7E+w5H6Ta1
TEfjloEBf1oeWcLFiS+UXqEZDeqR9U29vvI6hQA2YMqp0obIZECKTZ31ieK9QB0h
TmZyiX/axw==
=VpSp
-----END PGP SIGNATURE-----

--nrjzilikpi4xkhfi--
