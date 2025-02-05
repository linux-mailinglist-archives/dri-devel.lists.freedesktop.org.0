Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14879A28FCE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0B610E7C9;
	Wed,  5 Feb 2025 14:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qntclzv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB3610E7C9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 14:29:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B9F5EA4369C;
 Wed,  5 Feb 2025 14:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29396C4CEE2;
 Wed,  5 Feb 2025 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738765773;
 bh=eVeaTdpnOirbpMyaydQmbB7gizEyGhZBFyWrLI0D9Wg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qntclzv0y3WGko+YSgK+ZC/ug+5vv+FnO2rAfqFRrTVSJz6ClfXYfVGlXEvPjj+Wu
 ywkPWwWfXHFbGwlAnURWoJFY+5FFm7L9sbYG2TovDCJLuCfdnRffFGPSsXywPNSmYh
 tSd08naH68xs3YnePxibSsqawvNGTHl8agiW9SlRVD7vYa01Z7G9kCIpjwZivLwuFx
 8i4kfPMBSpwZzRmaeO1Aakyek0Vc8wzBZyMalfrNCwQbhn2LRsTfo5f9fiWSogfqTM
 ftTlT2PjASsahCF3eppzefqMx7tH4c3JBNGvNDHhRz4+rMm9Kbksd7Oj2lakc397nS
 4EYVemdO6zX2w==
Date: Wed, 5 Feb 2025 15:29:31 +0100
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
Subject: Re: [PATCH v3 09/10] drm/bridge: allow limiting I2S formats
Message-ID: <20250205-eager-laughing-nightingale-de5cab@houat>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-9-5b5b2d4956da@linaro.org>
 <bd2eou4qqxwqn3bypvpvkcrw56m555jwlnlni277phds7vfklh@aacywioenkkq>
 <7nawswhaddasa4a2sytwspq62s4a2di3ukemfqsc3ueh2lftzl@kjq42eoq3ram>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zl6wjwxauob5as6t"
Content-Disposition: inline
In-Reply-To: <7nawswhaddasa4a2sytwspq62s4a2di3ukemfqsc3ueh2lftzl@kjq42eoq3ram>
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


--zl6wjwxauob5as6t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 09/10] drm/bridge: allow limiting I2S formats
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 01:45:56AM +0200, Dmitry Baryshkov wrote:
> On Tue, Jan 28, 2025 at 05:11:16PM +0100, Maxime Ripard wrote:
> > On Sun, Jan 26, 2025 at 03:29:14PM +0200, Dmitry Baryshkov wrote:
> > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > index b55e80a57758e8b652eac0cd01cb245a04e221f5..d16af5fe90cb48f6671e7=
98d9dee61a359c9233f 100644
> > > --- a/include/drm/drm_bridge.h
> > > +++ b/include/drm/drm_bridge.h
> > > @@ -920,6 +920,11 @@ struct drm_bridge {
> > >  	 */
> > >  	int hdmi_audio_max_i2s_playback_channels;
> > > =20
> > > +	/**
> > > +	 * @hdmi_audio_i2s_formats: supported I2S formats, optional
> > > +	 */
> > > +	u64 hdmi_audio_i2s_formats;
> > > +
> >=20
> > We should document what the default value is if it's optional.
>=20
> "The default is to allow all formats supported by the corresponding
> I2S bus driver." Does that sound fine from your POV?

Yep, sounds good.

Maxime

--zl6wjwxauob5as6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6N1ygAKCRAnX84Zoj2+
dlrgAX9aDNuZXzFPiM/bM/7BcO7J8XzlRwFVr+i1N/QsnMdSLGZj87Zx/r639FZ2
9xJiy4sBgJhgpOdA5fnB/hcAxS9dmow52Aqfbt7V+aCWL7aFCDnTWtgBAdQ7/Ook
Ix+DjFHZKA==
=pHPw
-----END PGP SIGNATURE-----

--zl6wjwxauob5as6t--
