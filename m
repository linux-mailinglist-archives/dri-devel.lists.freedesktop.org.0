Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D6A8920CD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 16:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A8710E41A;
	Fri, 29 Mar 2024 15:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jOUaZZNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B59310E41A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 15:47:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3003E61957;
 Fri, 29 Mar 2024 15:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65400C433F1;
 Fri, 29 Mar 2024 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711727225;
 bh=mGMCbTudpO//dsMmAJuxrfDrUsM2TLQi58qOzKNQl9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOUaZZNdtIIh47EJVI810yivxPhgr04bdCv5G8syQ9pIqc96Lk1QfVhs1Zg2F3MZ+
 8ycCTwvcR7dRIz5PyImHowSY7nGzeP1Fa1weOpI4PXdyLUvxXVh2YM77J4ZnnPZcDJ
 eme6BIklM4Cr/HfOfALdVa6oRCZCmeBZtrBoRBVZbsLPBXivn+VE/geDCnH5fo9Zke
 OVY0GzrZctB+LLGPa0koCkG1wtWO4ZbrbHmwwCiqDN2QTp9OtB5D5a66J9WoH2fQFT
 yLAjAKn/xV6lVUfPEsNTYspoy5GK+5rfK+JLddPBFkJwE2U4/eMbfV7x4pwxuS5A2z
 x59T2XaUWyIDA==
Date: Fri, 29 Mar 2024 15:46:59 +0000
From: Conor Dooley <conor@kernel.org>
To: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
Message-ID: <20240329-overture-tank-d20888f2cb6e@spud>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com>
 <a82d525c-737a-4ac4-9d71-e88f4ba69ea1@linaro.org>
 <MW4PR12MB7165889CE7F27A3F0B29DC7EE6312@MW4PR12MB7165.namprd12.prod.outlook.com>
 <c0d70ba9-34ef-4121-834d-4d107f03d7f0@linaro.org>
 <MW4PR12MB716570A3676218F0C6375E37E63A2@MW4PR12MB7165.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Aig4naILjr3w2J70"
Content-Disposition: inline
In-Reply-To: <MW4PR12MB716570A3676218F0C6375E37E63A2@MW4PR12MB7165.namprd12.prod.outlook.com>
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


--Aig4naILjr3w2J70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 12:38:33AM +0000, Klymenko, Anatoliy wrote:
> Thank you for the feedback.
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Subject: Re: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
> > On 22/03/2024 20:12, Klymenko, Anatoliy wrote:
> > >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >> On 21/03/2024 21:43, Anatoliy Klymenko wrote:
> > >>> diff --git a/include/dt-bindings/media/media-bus-format.h
> > >>> b/include/dt-
> > >> bindings/media/media-bus-format.h
> > >>> new file mode 100644
> > >>> index 000000000000..60fc6e11dabc
> > >>> --- /dev/null
> > >>> +++ b/include/dt-bindings/media/media-bus-format.h
> > >>> @@ -0,0 +1,177 @@
> > >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > >>> +/*
> > >>> + * Media Bus API header
> > >>> + *
> > >>> + * Copyright (C) 2009, Guennadi Liakhovetski
> > >>> +<g.liakhovetski@gmx.de>
> > >>> + *
> > >>> + * This program is free software; you can redistribute it and/or
> > >>> +modify
> > >>> + * it under the terms of the GNU General Public License version 2
> > >>> +as
> > >>> + * published by the Free Software Foundation.
> > >>
> > >> That's not true. Your SPDX tells something entirely different.
> > >>
> > >
> > > Thank you - I'll see how to fix it.
> > >
> > >> Anyway, you did not explain why you need to copy anything anywhere.
> > >>
> > >> Specifically, random hex values *are not bindings*.
> > >>
> > >
> > > The same media bus format values are being used by the reference
> > > driver in patch #9. And, as far as I know, we cannot use headers from
> > > Linux API headers directly (at least I
> >=20
> > I don't understand what does it mean. You can use in your driver whatev=
er
> > headers you wish, I don't care about them.
> >=20
> >=20
> > noticed the same pattern in ../dt-bindings/sdtv-standarts.h for instanc=
e).
> > What would be the best approach to reusing the same defines on DT and
> > driver sides from your point of view? Symlink maybe?
> > >
> >=20
> > Wrap your messages to match mailing list discussion style. There are no
> > defines used in DT. If there are, show me them in *THIS* or other
> > *upstreamed* (being upstreamed) patchset.
> >=20
>=20
> Sorry, I didn't explain properly what I'm trying to achieve. I need to
> create a DT node property that represents video signal format, one of
> MEDIA_BUS_FMT_* from include/uapi/linux/media-bus-format.h. It would be
> nice to reuse the same symbolic values in the device tree. What is the
> best approach here? Should I create a separate header in
> include/dt-bindings with the same or similar (to avoid multiple
> definition errors) defines, or is it better to create a symlink to
> media-bus-format.h like include/dt-bindings/linux-event-codes.h?

Isn't there already a property for this, described in
Documentation/devicetree/bindings/media/xilinx/video.txt
?

--Aig4naILjr3w2J70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgbicwAKCRB4tDGHoIJi
0vIxAQDTGIb39pZ2GgViTifY62vMB8y8nobcQ16j//LjfSv8+AD/di6X30rcf2qm
aucSKfOlVRUnjE+ZOb0HLGjnjVZzFQ4=
=0Xod
-----END PGP SIGNATURE-----

--Aig4naILjr3w2J70--
