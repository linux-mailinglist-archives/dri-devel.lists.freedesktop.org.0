Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56996B5781F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1827210E2D5;
	Mon, 15 Sep 2025 11:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MdjCM7PT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7232D10E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:28:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ED3F9444D1;
 Mon, 15 Sep 2025 11:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A30EC4CEF7;
 Mon, 15 Sep 2025 11:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757935729;
 bh=ORv2//TEudHYm4PwsOQ0EaMG/K/TEzLwzZfTz+OY748=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MdjCM7PTr/F2Dej+nvLLNfoEcJYfgIU/KvfEvM6/kJ/wKr7DvgeNHO4TB/hGh6Eac
 lPJf0gB2TEBNZI4Uwn2TpQBNwnszRVL+LXGu1iLFycXTKzIiQ8Nag50quwzyISSfN2
 ZOgLscrOKhYfCALLknKK1MDk4O+4YfvcUCPS7fnqUhFCZpZoheI+0AlyYk5kqxqvad
 Q+j4pGSZJh1YVku9SJctvalQsZ0MGXvjX/NqIF6LwPQfw8aHuEd6gxPSw7Cykm68kT
 yFkjmsNFaVFICLBiXpxpk9vPLgbZ9zy8Oolt0hArzpmWVqPUis2O+YVJcb93DVVTVq
 wjmlwNLbCmuOQ==
Date: Mon, 15 Sep 2025 13:28:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/29] drm/bridge: Implement atomic_print_state
Message-ID: <20250915-intrepid-quaint-bullfrog-bb68b8@penduick>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-6-14ad5315da3f@kernel.org>
 <056b0335-f104-4b67-9882-6beaecd21c76@suse.de>
 <20250902202212.GU13448@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qak6uh7m5kswzx5p"
Content-Disposition: inline
In-Reply-To: <20250902202212.GU13448@pendragon.ideasonboard.com>
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


--qak6uh7m5kswzx5p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/29] drm/bridge: Implement atomic_print_state
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 10:22:12PM +0200, Laurent Pinchart wrote:
> > > +	struct drm_bridge *bridge =3D drm_priv_to_bridge(s->obj);
> > > +
> > > +	drm_printf(p, "bridge: %s", drm_get_connector_type_name(bridge->typ=
e));
>=20
> It would be nice to identify the bridge more precisely, but bridges have
> no object ID :-/ The raw pointer may not be very useful. I wonder if we
> should give an object ID to drm_private_obj instances, even if we don't
> expose them to userspace. That's not a topic for this series of course.

I agree, and would have liked to have something a bit more descriptive
indeed. But bridges have neither a name or an ID, so I couldn't come up
with anything better :/

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!
Maxime

--qak6uh7m5kswzx5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMf4bgAKCRAnX84Zoj2+
dpWWAX9+L9Pc2d++TXw4d76ib/BA9jnjklIlpvFzQhdWo/Iqy5ipGgej51nC2EQ5
4H/MHkgBgNPLHxflrW/rYvxe1BmuVHxZFKWB8o7t37zIxDPgW9vW4WKAHD9Eb1yD
Uc5w5MjYkA==
=gSDA
-----END PGP SIGNATURE-----

--qak6uh7m5kswzx5p--
