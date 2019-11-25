Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2776108D07
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 12:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D236E12A;
	Mon, 25 Nov 2019 11:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400EB6E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 11:32:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id n5so5418510wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 03:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bAr5B4V7KQJvKFlqLdDouXVf8raaXDVItsfKHc3uuNw=;
 b=CMuEE+FkyRWjl6sqs1S3nb6NflnZVlat4jwMEsv1qRc4QyK0E0YtQxxghIR6t5sFvA
 aDAXKlQ8GHhaAZsUiYQIU8aymMgo5eZJNCitFWuFBVR8L1X3BLYRd0MHo6QJ7+8GdsLx
 PGjdbLoVqJGnAL0LAUr0lrq6HLTFP8gXj13v0W9CPv3gmDizproxphclAsz6X1i7HREk
 7wXsxX6/mPHyRAvpfAiR7/1FOxhLQA+rzYawHVmwH67E9ccmPCr8Wb0lQwU9QiGPXWRR
 e/T1AtTqhcO9uWxNXYzmUIGY+izjvStdf2Lf0z4KHuAltrRnMsRN1kG8FSCsHM0j0dfw
 bk1A==
X-Gm-Message-State: APjAAAVk3elJxNZb+5xe/jtqC9K1hUcDuKVo6l1HslgXY7NLkrMsP3Xb
 hR+JPuwLY3/2UkVTzgDaDUk=
X-Google-Smtp-Source: APXvYqwfLZ5yz7Rn53eoU9MIBtpDsKT0J4c2BxjFDMNNhVZYy3Vb8LRdiBnsnjePwnlNCzGB8WowUw==
X-Received: by 2002:a7b:c411:: with SMTP id k17mr27648121wmi.119.1574681540599; 
 Mon, 25 Nov 2019 03:32:20 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id j7sm10837148wro.54.2019.11.25.03.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 03:32:19 -0800 (PST)
Date: Mon, 25 Nov 2019 12:32:18 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 08/29] dt-bindings: interconnect: tegra: Add initial IDs
Message-ID: <20191125113218.GK1409040@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-9-digetx@gmail.com>
 <20191119062535.GC2462695@ulmo>
 <8cff3af3-42c7-3312-5f98-cd5eb98b7b7a@gmail.com>
 <f0f36176-8070-08a6-a61f-77221d916f04@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f0f36176-8070-08a6-a61f-77221d916f04@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bAr5B4V7KQJvKFlqLdDouXVf8raaXDVItsfKHc3uuNw=;
 b=Pnvum9nDsllIaY9MKvqxluMwvK5VpET9S90Fm0h4YImbt3LnIruPXoH0I5fxM8T58g
 EDM8G8KZDnhY8Z95E1X5ktj5f3ZIMvhUitzzvyuDy83X6kGXi4kva1z5adla7dh93yDC
 m3o0l+JXzk4E0Szezk3QMzvSHDAZoCkVcRTbols11ziSK4fBJ9yQICjrnJQib+8gavUj
 GQujQIu5Ah78Ru6ulVwHaTNYRBrC4klf7aljiQ6YuaSKOVKzQtdwnfNeunYCq6PiITl6
 2S/SevlcAKlnwYj3L0EWgWECfgNnbbrxfGJQPAav06i/1Zw6rFJBWIMz0BV2u5v5vGpJ
 XFSw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: multipart/mixed; boundary="===============0951443912=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0951443912==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8tUgZ4IE8L4vmMyh"
Content-Disposition: inline


--8tUgZ4IE8L4vmMyh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 08:14:35PM +0300, Dmitry Osipenko wrote:
> 19.11.2019 19:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 19.11.2019 09:25, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On Mon, Nov 18, 2019 at 11:02:26PM +0300, Dmitry Osipenko wrote:
> >>> Define interconnect IDs for memory controller (MC), external memory
> >>> controller (EMC), external memory (EMEM) and memory clients of display
> >>> controllers (DC).
> >>>
> >>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>> ---
> >>>  include/dt-bindings/interconnect/tegra-icc.h | 11 +++++++++++
> >>>  1 file changed, 11 insertions(+)
> >>>  create mode 100644 include/dt-bindings/interconnect/tegra-icc.h
> >=20
> >=20
> > Hello Thierry,
> >=20
> >> There was a bit of discussion regarding this for a recent patch that I
> >> was working on, see:
> >>
> >> 	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D140318
> >=20
> > Thank you very much for the link.
> >=20
> >> I'd rather not use an additional set of definitions for this. The memo=
ry
> >> controller already has a set of native IDs for memory clients that I
> >> think we can reuse for this.
> >=20
> > I missed that it's fine to have multiple ICC connections defined
> > per-path, at quick glance looks like indeed it should be fine to re-use
> > MC IDs.
>=20
> Well, it is not quite correct to have multiple connections per-path.
>=20
> Please take look at interconnect's binding and core.c:
>=20
>   1. there should be one src->dst connection per-path
>   2. each connection should comprise of one source and one destination no=
des
>=20
> >> I've only added these client IDs for Tegra194 because that's where we
> >> need it to actually describe a specific hardware quirk, but I can come
> >> up with the equivalent for older chips as well.
> >=20
> > Older Tegra SoCs have hardware units connected to MC through AHB bus,
> > like USB for example. These units do not have MC client IDs and there is
> > no MC ID defined for the AHB bus either, but probably it won't be a
> > problem to define IDs for them if will be necessary.
> >=20
>=20
> Since interconnect binding requires to define both source and
> destination nodes for the path, then MC IDs are not enough in order to
> define interconnect path because these IDs represent only the source
> nodes. Destination node should be either EMC or EMEM.

This doesn't really map well to Tegra. The source of the path is always
the device and the destination is always the memory controller. We also
can have multiple paths between a device and the memory controller. The
typical case is to have at least a read and a write path, but there are
a number of devices that have multiple read and/or multiple write paths
to the memory controller.

Or perhaps I'm looking at this the wrong way, and what we really ought
to describe is the paths with MC sitting in the middle. So it'd be
something like:

	MC ID --- source ---> MC --- destination ---> EMC

for write paths and:

	EMC --- source ---> MC --- destination ---> MC ID

for read paths. I have no idea what would be a good connection ID for
EMC, since I don't think MC really differentiates at that level. Perhaps
#interconnect-cells =3D <0> for EMC would be appropriate.

This would make the bindings look more like this, taking a random sample
=66rom the above series:

	ethernet@2490000 {
		...
		interconnects =3D <&emc &mc TEGRA194_MEMORY_CLIENT_EQOSR>,
				<&mc TEGRA194_MEMORY_CLIENT_EQOSW &emc>;
		interconnect-names =3D "dma-mem", "dma-mem";
		...
	};

In words, the above would mean that for the ethernet device there is one
path (a read slave interface) where data flows from the EMC through the
MC to the device with memory client ID TEGRA194_MEMORY_CLIENT_EQOSR. The
second path (a write slave interface) describes data flowing from the
device (with memory client ID TEGRA194_MEMORY_CLIENT_EQOSW) through the
MC and towards the EMC.

Irrespective of the above, I think we definitely need to keep separate
IDs for read and write paths because each of them have separate controls
for arbitration and latency allowance. So each of those may need to be
separately configurable.

Does that make sense?

Thierry

--8tUgZ4IE8L4vmMyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3bu78ACgkQ3SOs138+
s6F58A//bfXOJ/BzLenJjEvFOuPAl+SpyAh15gGoh1L7ni5lKhYSfMvIixNK0Mdg
KKwS9OLek8+b5GTPtoDiXTUgL9WHcYxWHvHOI06EddoCYBU4unPJU6LXqyghqMQI
XbaqpFVKOZbdWdeinVYpv8uLX761l23X7bTZq6i4mbAjFtag4gmNnobZkVySxxR3
psVmMC1HzLh7y+lJ7gLha1Nc1q/CQZDuBIxjWpTlfKxgZsyOhY4YYAi0S0zDJJD3
oQLED5KxCyVA/wK/WiOdAnjwo0RGKK7V3dLyMa2Y2DELbQXV/ArL9YN1gcCboLw5
rwkZIzqOTwtZ17l2DisVjBC6hPcvgTIQqvcZ/8DUtEZ3bcJkSyB7ylIG8jTxmqHE
nCz2QAonnxfA5SaecMKjJPO57RSnP/Bjnbs1VYdnbb/hhfrP0GQFX/HHvfrPYhNH
OsWR8V8PRBA5DEg48v7N/nbOjEgkm7EHBom8ODTc7tWWWEywhJjiw/S3W9yxBKSK
GpO5YnAIz0qcbE6JGmQgI35F58U1JYfiCPggODGLn3H+5GwTgexL4uPQuhY8CcTb
EUW3yEL4AYoqYwQOzyVQwQBtfA0WvtbsEBsSe+RW/MsWTRLkgPeQJ51hz30mCS2t
D7sgHh7qBN37k8pWFihsmpzUbVce2jehLdh2v2MGhwSblA2phZs=
=k8Vo
-----END PGP SIGNATURE-----

--8tUgZ4IE8L4vmMyh--

--===============0951443912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0951443912==--
