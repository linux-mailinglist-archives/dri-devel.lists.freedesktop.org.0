Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147EF88728A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 19:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D47F1126C2;
	Fri, 22 Mar 2024 18:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nowGQWab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3521126C2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 18:05:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A3F36CE188F;
 Fri, 22 Mar 2024 18:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5546AC433F1;
 Fri, 22 Mar 2024 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711130738;
 bh=kkA/i7RpUTQkaWAdwVCyAalUa4sMjIe2XqfhfQNTMYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nowGQWabkhd43pAtUXr23KvFbCqVdbh4Gi4v/gubT5ov7g1PsG2MDvEApphzmiKMg
 wBbrwamjYHH8kgT6PcRYYLXbTBfIVDX6aW+PvJbsWf2GAAKhvs/5M/A5WJXWNicGC2
 hfLR3IBw22qGaJHStL6vCXt3dUAXghbz2NBYaOLVpq6CcMa9QyEjbVkSJMDD1uTXPs
 KtuLYIFrdSxmsb0sEJpIhHNkScaaauh+8TFX/rtMqPnUkqbieGYtwIJl9fE02jR1+p
 iGN/gsCcngUP/dyljfBSld3lB7DFlLmYKhdgktu6qIfIHgm26CNR2/4VaAKONIyQjr
 qsKf3QC1zPs4w==
Date: Fri, 22 Mar 2024 18:05:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
Message-ID: <20240322-absence-endurable-dee8a25643b7@spud>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com>
 <a82d525c-737a-4ac4-9d71-e88f4ba69ea1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="37IzkaOCoVNe34vN"
Content-Disposition: inline
In-Reply-To: <a82d525c-737a-4ac4-9d71-e88f4ba69ea1@linaro.org>
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


--37IzkaOCoVNe34vN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 06:59:18AM +0100, Krzysztof Kozlowski wrote:
> On 21/03/2024 21:43, Anatoliy Klymenko wrote:
> > diff --git a/include/dt-bindings/media/media-bus-format.h b/include/dt-=
bindings/media/media-bus-format.h
> > new file mode 100644
> > index 000000000000..60fc6e11dabc
> > --- /dev/null
> > +++ b/include/dt-bindings/media/media-bus-format.h
> > @@ -0,0 +1,177 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > +/*
> > + * Media Bus API header
> > + *
> > + * Copyright (C) 2009, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
>=20
> That's not true. Your SPDX tells something entirely different.
>=20
> Anyway, you did not explain why you need to copy anything anywhere.

I assume by "copy anything anywhere" you mean "why did you copy a linux
uapi header into the bindings?

> Specifically, random hex values *are not bindings*.
>=20
> Best regards,
> Krzysztof
>=20

--37IzkaOCoVNe34vN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZf3IbAAKCRB4tDGHoIJi
0j5AAP0VRCdRytSAhb3oWZ+TJi65eWcFsjeuz84XbzwZT+yj8wEA+h1+YbUno+qx
SVt2fkO/pFLtLpGekJKt9C2l5ukTUgk=
=NSgf
-----END PGP SIGNATURE-----

--37IzkaOCoVNe34vN--
