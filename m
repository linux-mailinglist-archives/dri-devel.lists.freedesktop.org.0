Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D541E91DFDB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 14:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1B410E400;
	Mon,  1 Jul 2024 12:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hPDkoDsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438AE10E3FB;
 Mon,  1 Jul 2024 12:49:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98384612E3;
 Mon,  1 Jul 2024 12:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94D1C116B1;
 Mon,  1 Jul 2024 12:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719838154;
 bh=v6qUUZXZ9LbqXsuxzw3IntQUC5PzQoBOqCofNfztNiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPDkoDsHsKhklFFx66Tw9CPJ6Y35w1C2i00Ixvq3038M2mKIVwhTlPXmQL6qea+nw
 nBUrpvaH9kIGPud3BaCKuIGOLXRK6S7HbvDwb0Ma74NyTKqJojhXm2LEd1QbkhICgU
 oGgWIq5Ky5yeuh8HRGLPty+Y09/BIvF+q7QYRVf9/7yI1//IA1Fth6SPM2aVV9YGHh
 G/LgZky8C1XmEFfl4bfuGTwN6ZIwmOvrTTZW7VtDtOb7amjh/nhCZME+t4hX/0NkXD
 NYTcLIts7K9b2AhWyKdVkTfmfceuRKqF8OnKi0T2jEArFWQNUGq4mX7hraYoVrGk4W
 Eo6dWXqTQHjAw==
Date: Mon, 1 Jul 2024 14:49:11 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/bridge-connector: reset the HDMI connector
 state
Message-ID: <20240701-little-sociable-iguana-effa3c@houat>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-1-8590d44912ce@linaro.org>
 <20240625-feathered-loon-of-health-ec7e6d@houat>
 <CAA8EJpq314tQFZpkXgL1cYDPfoFRukhB_KiaDvmsqdzHFD512g@mail.gmail.com>
 <20240625-jackrabbit-of-major-ampleness-e0becb@houat>
 <ov4uvlcyzfqw55g567jikyceivpkl7l3ijuol53fqsv2asdgrl@miggxlyyeiek>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="me2klb7invzxbisc"
Content-Disposition: inline
In-Reply-To: <ov4uvlcyzfqw55g567jikyceivpkl7l3ijuol53fqsv2asdgrl@miggxlyyeiek>
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


--me2klb7invzxbisc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 07:38:22PM GMT, Dmitry Baryshkov wrote:
> On Tue, Jun 25, 2024 at 05:49:54PM GMT, Maxime Ripard wrote:
> > On Tue, Jun 25, 2024 at 06:05:33PM GMT, Dmitry Baryshkov wrote:
> > > On Tue, 25 Jun 2024 at 18:02, Maxime Ripard <mripard@kernel.org> wrot=
e:
> > > >
> > > > Hi,
> > > >
> > > > On Sun, Jun 23, 2024 at 08:40:12AM GMT, Dmitry Baryshkov wrote:
> > > > > On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_=
OP_HDMI
> > > > > IGT chokes on the max_bpc property in several kms_properties test=
s due
> > > > > to the the drm_bridge_connector failing to reset HDMI-related
> > > > > properties.
> > > > >
> > > > > Call __drm_atomic_helper_connector_hdmi_reset() if there is a
> > > > > the drm_bridge_connector has bridge_hdmi.
> > > > >
> > > > > Note, the __drm_atomic_helper_connector_hdmi_reset() is moved to
> > > > > drm_atomic_state_helper.c because drm_bridge_connector.c can not =
depend
> > > > > on DRM_DISPLAY_HDMI_STATE_HELPER. At the same time it is impossib=
le to
> > > > > call this function from HDMI bridges, there is is no function that
> > > > > corresponds to the drm_connector_funcs::reset().
> > > >
> > > > Why can't it depend on DRM_DISPLAY_HDMI_STATE_HELPER?
> > >=20
> > > Is it okay to have DRM_KMS_HELPER to depend unconditionally or select
> > > DRM_DISPLAY_HDMI_STATE_HELPER?
> >=20
> > No, but it's not clear to me why drm_bridge_connector is part of
> > DRM_KMS_HELPER? It doesn't seem to be called from the core but only
> > drivers, just like DRM_PANEL_BRIDGE which has a separate config option
>=20
> But then DRM_PANEL_BRIDGE is also linked into drm_kms_helper.ko.

And we don't seem to have any reason for that, it could be a separate
module afaik.

> I can't really say that I understand the definition of various helper
> modules, but my taste tells me that code from drm/*.c should not
> depend directly on the code from drm/display/*.c.

Sure, but the bridge connector could be under bridge just as well, or
part of the display helpers.

It's really a "leaf" driver as far as helpers are concerned.

Maxime

--me2klb7invzxbisc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoKlxgAKCRDj7w1vZxhR
xbLGAP9QjGMpGQ4lcq2vmRKwxTrBTwk4ljyI0gIkLVgij7GQ0wEAgUMgxhlK5cT7
vsRyGCD9EB+uJa0VYuy+xOPe+dneSAs=
=OmLd
-----END PGP SIGNATURE-----

--me2klb7invzxbisc--
