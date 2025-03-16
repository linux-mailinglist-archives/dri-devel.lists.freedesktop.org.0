Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF3DA6344E
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 07:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6A410E084;
	Sun, 16 Mar 2025 06:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cDPCaFi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B3A10E084
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 06:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=GFMu
 I/i8RqHZ5FxcHveqpSf7m+TSCq0zAHS3qDWrPtQ=; b=cDPCaFi5oRyjBPSDvR4V
 sQ3HDuXhnzqwFS5KHPj8t9ZZXjprjLG9VqywlQuEvBliqg03lN4C9so2N9pzb1Bo
 Ws8GLgQpGhE/iz91cIBHLN4iGfD1genKNervXZ3kyR5J67YKF2zBwnnbhCLGzu3K
 IGSN3fsfAOWVtV3k/UMvv0R8eBNBJu6+kdb7nmHf0tTzodpZbxIHUXxU+LNll2zm
 s0PI5upGGSmzoNgJtXFQ9/v8VIu1Jf8+Ah2QR5fGv91/vnAWPCei85bS3wOKu/+9
 8/4xmqsU+vyFd7XQLC8EWMDJ8VWnP4icCRjlauwO9bsJUAmlhklYaGWHeCdO7EEK
 iA==
Received: (qmail 2597127 invoked from network); 16 Mar 2025 07:26:08 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 16 Mar 2025 07:26:08 +0100
X-UD-Smtp-Session: l3s3148p1@uBs6v28wdqMujnuL
Date: Sun, 16 Mar 2025 07:26:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFT v2] drm/bridge: ite-it6505: make use of debugfs_init
 callback
Message-ID: <Z9Zu_5K0DK_egHl4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250315201946.7428-2-wsa+renesas@sang-engineering.com>
 <xd3purmdhn34guhconvpuvw5n7nfhkt2vg4c3pdyn6f4ksgu25@ssxzqbysngww>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Gi+Ru5WAH0A/Pp90"
Content-Disposition: inline
In-Reply-To: <xd3purmdhn34guhconvpuvw5n7nfhkt2vg4c3pdyn6f4ksgu25@ssxzqbysngww>
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


--Gi+Ru5WAH0A/Pp90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	struct dentry *debugfs =3D debugfs_create_dir(dev_name(it6505->dev), =
root);

I will switch away from dev_name() here, too, of course.

> >  	int i =3D 0;
> > =20
> >  	while (debugfs_entry[i].name && debugfs_entry[i].fops) {
> >  		debugfs_create_file(debugfs_entry[i].name, 0644,
> > -				    it6505->debugfs, it6505,
> > -				    debugfs_entry[i].fops);
> > +				    debugfs, it6505, debugfs_entry[i].fops);
> >  		i++;
> >  	}
> >  }
>=20
> Ni: I'd say, it's better to move this function rather than moving
> it6505_bridge_funcs. LGTM otherwise.

I started like this but it meant to move all the sysfs file ops code as
well. That was quite a chunk. You still prefer to do it?


--Gi+Ru5WAH0A/Pp90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfWbv8ACgkQFA3kzBSg
KbYiLxAAn9YPNDFZFYK0QZmdbFcSR22jvw0IWSEBqt/PWANMQISynMS0xgv567i+
E9O9bc8Dc7h5wxFs1D1A7odCcnpNRMUhR78jKrBnHiBMMptcdW1hr9NcRbf3jqdz
Dw0PSi2u37lLP2EmvZMRyuothJvlMFSHEFNCQpup4+tVn6cSw0vsJZTtS4U1XAqH
wQx9d2FrRVyw/j3NrdVDbKAnIMG19cCKB5E9/WRFZuyl59ZOHPgFgEiVs5fPp1Dz
SCByrzp6ZTL1AnEa6gR4PiN0CnOf5uwE+acoOIGJpNLldYboZ/Kow2V6jgAtmmuU
U/gFfv0EZY+wBO5YpQNWZ/c/mzzcrJSNdDfUDRsJdLVWkmKF3bNpZZbKuSXWK9uz
s0d6+pPH2XHA3HwZOOmKgSImoqWMPE5tBgjyhIl8VsN09LxI6o8L2XpSS4kaPHIL
xqdEJDsnTblHYxcnBLKtlIc/snSkzVkl3hNbzspCKX0EVkdDd8PGEk/Af85f7o6H
nNM9hSLpRcZdsmcC1jUSOw8Pm/ZcnTvBfFiaye/BwX7BeEk36epl5ywSYQc8+5DJ
rbWKKyA5V+k2jAEVDhjC2BBbMv+hTkaCIXArK67Su3k2FTQ7fSydGtSKNSGgZ27D
kNmmPYNpcYMfqRLBCjSlJVt7ASq8RbPIrxM/C5fFqvr8MXZGOWw=
=jSKA
-----END PGP SIGNATURE-----

--Gi+Ru5WAH0A/Pp90--
