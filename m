Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB8AA1096
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD6010E4BE;
	Tue, 29 Apr 2025 15:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IHRGGLJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C3310E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 15:35:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DC49744075;
 Tue, 29 Apr 2025 15:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96441C4CEE3;
 Tue, 29 Apr 2025 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745940941;
 bh=u/RqHIbWw29AlLRvqgqJ85ykokCGdXn5LkWWcNMVH78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IHRGGLJEatmvmUk+jQqh7Obj0x32GBVz7ZL86Q91O3dTcQpmh8MyLOg73btdHs1b3
 7353UKQKs6P1SzVWaqyPPP6WxsRKama1rTO6wTdnEyWX6T1c2InX9VdRLjxtbGD6Y4
 /wzd50iT9xhG7SW24bZZgjU8zo/zI69kBie5LcPXhGXfKZvtPdoKqdQHg1hLwGi/87
 HXq4DBILkipC2mHLcbrL7SGL55BE4tcR57G980FxH8AOaSe1xAKJAQyPNwC4HovWTy
 6hhJAE6ouecQ3vlUavnIYVHAcqcR/sXko0K7qnwe2ZKveh0knvx6DhKM9JEZOWTJNQ
 Y0rVSp1AsYi5w==
Date: Tue, 29 Apr 2025 17:35:39 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
Message-ID: <20250429-whimsical-thankful-chowchow-dfaa5f@houat>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
 <20250414-hissing-auspicious-goldfish-78b9dc@houat>
 <f59c0ab6-2391-4712-a3d5-18e67f538d4f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="67qbdqkhlhrqpp5c"
Content-Disposition: inline
In-Reply-To: <f59c0ab6-2391-4712-a3d5-18e67f538d4f@oss.qualcomm.com>
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


--67qbdqkhlhrqpp5c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 12:03:23PM +0300, Dmitry Baryshkov wrote:
> On 14/04/2025 17:47, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Apr 07, 2025 at 06:11:01PM +0300, Dmitry Baryshkov wrote:
> > > In order to make sure that CEC adapters or notifiers are unregistered
> > > and CEC-related data is properly destroyed make drm_connector_cleanup=
()
> > > call CEC's unregister() callback.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/drm_connector.c | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index ba08fbd973829e49ea977251c4f0fb6d96ade631..ae9c02ef9ab102db03c28=
24683ece37cfbcd3300 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -743,6 +743,13 @@ void drm_connector_cec_phys_addr_set(struct drm_=
connector *connector)
> > >   }
> > >   EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
> > > +static void drm_connector_cec_unregister(struct drm_connector *conne=
ctor)
> > > +{
> > > +	if (connector->cec.funcs &&
> > > +	    connector->cec.funcs->unregister)
> > > +		connector->cec.funcs->unregister(connector);
> > > +}
> > > +
> > >   /**
> > >    * drm_connector_cleanup - cleans up an initialised connector
> > >    * @connector: connector to cleanup
> > > @@ -763,6 +770,8 @@ void drm_connector_cleanup(struct drm_connector *=
connector)
> > >   	platform_device_unregister(connector->hdmi_audio.codec_pdev);
> > > +	drm_connector_cec_unregister(connector);
> > > +
> >=20
> > Actually, since we know that the HDMI connector is drm-managed, why
> > can't we make the call to connector->cec.funcs->unregister a drm-managed
> > action registered by drm_connector_hdmi_cec_register?
>=20
> I haven't settled yet in my mind whether we can/should also use this
> infrastructure for drm_dp_cec management. So, at this point, I'd prefer to
> keep a non-managed unregister function. Once we settle on something for
> drm_dp_cec, we can switch to drmm.

I'd rather do the opposite. Let's go for drmm for now, and if we need to
change it for DP, we can always change it.

"Nothing is so permanent as a temporary solution", so I'd rather have
the natural and consistent one for now :)

Maxime

--67qbdqkhlhrqpp5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBDxywAKCRAnX84Zoj2+
dquGAX9diCR3VHKnmjjJg557ORbagHWbX+hSSbs7r2R2tkJ+Ja/x0YDaBCgmU2Cj
d7sn0WQBgPywwwfmIroWW0LGXY0oHKK477iuV1o1zhVEf7oc3A3/19HcKHcSMqmz
Okz/T/Nr2w==
=sZQr
-----END PGP SIGNATURE-----

--67qbdqkhlhrqpp5c--
