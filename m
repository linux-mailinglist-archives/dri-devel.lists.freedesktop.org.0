Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B84FAC4807
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0392C10E086;
	Tue, 27 May 2025 06:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qwa2c1kd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3A10E086
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:02:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31F37A4E122;
 Tue, 27 May 2025 06:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6EDC4CEED;
 Tue, 27 May 2025 06:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748325770;
 bh=qISlboKk4uRfgOMxq2Rgh1OXuXgZ5KgX/A378wlEpr8=;
 h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
 b=qwa2c1kdsqyegHkk4qLUbgBYwZaNtBeaItiq9yxjWODSAaR53Lj+kFToT4QZLCpDW
 B06/r0xUHzLH6Xt3JbR49R5SRoQZBXzBMqg0ussEQ8JjBh7O4HiZOWfB2REKrCqudp
 kuKVWw2rMVmecv7VILwe0wgeaXIL8+QNhCsnqtLiHUDekuXncfXMg5fKKkjsmmukJI
 lyP+DtYtEs4EbXK0ImB73UGYDOpIsjsrEqZoJjBgIEK/Pnspxmkkm396PwSwxICyuy
 5Trkv+2/0Hfls6ScoaK1PXD5tc52kG/+jN5FoRJEM/YrdUvI8rKZpEFr9AAjolBkct
 8UuOrqP7yn8Vw==
Content-Type: multipart/signed;
 boundary=65cd387e55d44b9b0aadb92b1e235d48dfa3a9d21eb56b6ace79ef4188a0;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 27 May 2025 08:02:46 +0200
Message-Id: <DA6PRDARLY70.1CILNJ8YLIOA1@kernel.org>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Devarsh Thakkar" <devarsht@ti.com>, "Praneeth Bajjuri" <praneeth@ti.com>,
 "Udit Kumar" <u-kumar1@ti.com>, "Jayesh Choudhary" <j-choudhary@ti.com>,
 "Francesco Dolcini" <francesco@dolcini.it>, "Alexander Sverdlin"
 <alexander.sverdlin@siemens.com>, "DRI Development List"
 <dri-devel@lists.freedesktop.org>, "Devicetree List"
 <devicetree@vger.kernel.org>, "Linux Kernel List"
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Aradhya Bhatia" <aradhya.bhatia@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Jyri Sarha" <jyri.sarha@iki.fi>
Subject: Re: [PATCH v8 4/4] drm/tidss: Add OLDI bridge support
X-Mailer: aerc 0.16.0
References: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
 <20250525151721.567042-5-aradhya.bhatia@linux.dev>
 <DA5ZNDCHXC6M.1CDYDG6KKMAP0@kernel.org>
 <a98ad2e7-50de-4d04-8d99-2cf77354b1d6@linux.dev>
In-Reply-To: <a98ad2e7-50de-4d04-8d99-2cf77354b1d6@linux.dev>
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

--65cd387e55d44b9b0aadb92b1e235d48dfa3a9d21eb56b6ace79ef4188a0
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Aradhya,

On Mon May 26, 2025 at 4:17 PM CEST, Aradhya Bhatia wrote:
> Thank you for reviewing and testing the patches! =3D)

Thank you for your dedication to bring this feature upstream :)

> On 26/05/25 15:05, Michael Walle wrote:
> >=20
> >> +static int get_oldi_mode(struct device_node *oldi_tx, int *companion_=
instance)
> >> +{
> >> +	struct device_node *companion;
> >> +	struct device_node *port0, *port1;
> >> +	u32 companion_reg;
> >> +	bool secondary_oldi =3D false;
> >> +	int pixel_order;
> >> +
> >> +	/*
> >> +	 * Find if the OLDI is paired with another OLDI for combined OLDI
> >> +	 * operation (dual-link or clone).
> >> +	 */
> >> +	companion =3D of_parse_phandle(oldi_tx, "ti,companion-oldi", 0);
> >> +	if (!companion)
> >> +		/*
> >> +		 * The OLDI TX does not have a companion, nor is it a
> >> +		 * secondary OLDI. It will operate independently.
> >> +		 */
> >> +		return OLDI_MODE_SINGLE_LINK;
> >=20
> > How is this supposed to work? If I read this code correctly, the
> > second (companion) port is always reported as SINGLE_LINK if its
> > device tree node doesn't have a ti,companion-oldi property. But
> > reading the device tree binding, the companion-old property is only
> > for the first OLDI port.
>
> With this series, the dt-schema for oldi changes a bit as well. Both the
> OLDIs, primary or secondary, need to pass each other's phandles now.
> The "ti,companion-oldi" and "ti,secondary-oldi" properties are not
> mutually exclusive anymore.

Ok, I thought so. But then you'll have to update the binding doc and
example (Patch 2/3) ;)

> Something like this.
>
> &oldi0 {
> 	// primary oldi
> 	ti,companion-oldi =3D <&oldi1>;
> };
>
>
> &oldi1 {
> 	// secondary oldi
> 	ti,secondary-oldi =3D true;
> 	ti,companion-oldi =3D <&oldi0>;
> };
>
>
> If there is no companion for any OLDI dt node, then the OLDI TX will be
> deemed as acting by itself, and in a single-link mode.

And it's possible to still have these properties and treat them as
two distinct transmitters? I'm wondering if it's possible to have
the companion-oldi and secondary-oldi property inside the generic
SoC dtsi, so you don't have to repeat it in every board dts.

If I read the code correctly, the panel has to have the even and odd
pixel properties to be detected as dual-link. Correct? Thus it would
be possible to have

oldi0: oldi@0 {
 	ti,companion-oldi =3D <&oldi1>;
};

oldi1: oldi@1 {
 	ti,secondary-oldi;
 	ti,companion-oldi =3D <&oldi0>;
};

in the soc.dtsi and in a board dts:

panel {
	port {
		remote-endpoint =3D <&oldi0>;
	};
};

Or with a dual link panel:

dualpanel {
	ports {
		port@0 {
			dual-lvds-odd-pixels;
			remote-endpoint =3D <&oldi0>;
		};

		port@1 {
			dual-lvds-even-pixels;
			remote-endpoint =3D <&oldi1>;
		};
	};
};

> >=20
> > FWIW, I've tested this series and I get twice the clock rate as
> > expected and the second link is reported as "OLDI_MODE_SINGLE_LINK".
> > I'll dig deeper into this tomorrow.
> >
>
> I was able to reproduce this behavior as you mention when the second
> oldi dt does not have a companion-oldi property.
>
> However, upon analysis, I realize that even having the correct dt as I
> mention above, will fall into another bug in the code and fail during
> the OLDI init.
>
> Unfortunately, two wrongs in my setup yesterday caused my testing to
> pass!
>
> I will post another revision, if you want to hold out on debugging
> further!

Sure!

-michael

--65cd387e55d44b9b0aadb92b1e235d48dfa3a9d21eb56b6ace79ef4188a0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaDVVhxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hdDgF/Yev5Tr8AWKSFESnK5WDs8Pe8vkMJU9Q2
Bh6kf8vEG8cgRJ+ncdwBR6QcGtCD4bc6AYCafH1+Or++gocjoz93LmtbsPyXBbdK
4K0iPP+zyl42bK6ZvIjXgCMPbxtCfwSr0Mc=
=vLIP
-----END PGP SIGNATURE-----

--65cd387e55d44b9b0aadb92b1e235d48dfa3a9d21eb56b6ace79ef4188a0--
