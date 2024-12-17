Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEACE9F456E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 08:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657E110E868;
	Tue, 17 Dec 2024 07:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FgBBwHHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588A010E19D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 07:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E32BDA41E12;
 Tue, 17 Dec 2024 07:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A37C4CED3;
 Tue, 17 Dec 2024 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734421573;
 bh=+Vm+eC+xSgbsQqva2V7i7wuDgSImt8XYpxOEXdlLywg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FgBBwHHYKZI1UfSFS9QBhn7KVCPW6yXxW25zCAViHTsGX4H2PU6XBB6pcGua9ACFC
 lDp1RIf8KYS1ML5amD4Y3t4q5JdEG+aLKWhGuvLt7KRt3/EuY4iuQM5+aNCwiqG0W2
 owCVnCyvWHwb6Y06ZOzMpZilfZH2vDPBfzPYVMJRSw/C/LykUeH6ihb4K/+Nw3LppA
 P+24b4InOPyMWOE7YuQop6nU29CyJo4mg5t/F1KciT10WDePp35gH4aW0vEYEM2rlx
 ElZkOKQhMbFAUFnm8zh9pTDiQZ1npXDIwGLROYYfTnd6aRrl9DJwzQKW24QMs0rdrr
 IzZgEnd1p4RYQ==
Date: Tue, 17 Dec 2024 08:46:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
Message-ID: <20241217-meek-bullfinch-of-luck-2c3468@houat>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241213-proud-kind-uakari-df3a70@houat>
 <80c49a80-d49c-4ca5-9568-9f7950618275@lankhorst.se>
 <20241213-gentle-glittering-salamander-22addf@houat>
 <5a50a992-9286-4179-8031-ffb514bca34f@lankhorst.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="moaynkbohx6mdcjs"
Content-Disposition: inline
In-Reply-To: <5a50a992-9286-4179-8031-ffb514bca34f@lankhorst.se>
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


--moaynkbohx6mdcjs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
MIME-Version: 1.0

On Fri, Dec 13, 2024 at 05:06:05PM +0100, Maarten Lankhorst wrote:
> Hey,
>=20
> Den 2024-12-13 kl. 16:21, skrev Maxime Ripard:
> > On Fri, Dec 13, 2024 at 03:53:13PM +0100, Maarten Lankhorst wrote:
> > >=20
> > >=20
> > > Den 2024-12-13 kl. 14:03, skrev Maxime Ripard:
> > > > Hi,
> > > >=20
> > > > Thanks for the new update!
> > > >=20
> > > > On Wed, Dec 04, 2024 at 02:44:00PM +0100, Maarten Lankhorst wrote:
> > > > > New update. Instead of calling it the 'dev' cgroup, it's now the
> > > > > 'dmem' cgroup.
> > > > >=20
> > > > > Because it only deals with memory regions, the UAPI has been upda=
ted
> > > > > to use dmem.min/low/max/current, and to make the API cleaner, the
> > > > > names are changed too.
> > > >=20
> > > > The API is much nicer, and fits much better into other frameworks t=
oo.
> > > >=20
> > > > > dmem.current could contain a line like:
> > > > > "drm/0000:03:00.0/vram0 1073741824"
> > > > >=20
> > > > > But I think using "drm/card0/vram0" instead of PCIID would perhap=
s be
> > > > > good too. I'm open to changing it to that based on feedback.
> > > >=20
> > > > Do we have any sort of guarantee over the name card0 being stable a=
cross
> > > > reboots?
> > > >=20
> > > > I also wonder if we should have a "total" device that limits the am=
ount
> > > > of memory we can allocate from any region?
> > >=20
> > > I don't think it is useful. Say your app can use 1 GB of main memory =
or 2 GB
> > > of VRAM, it wouldn't make sense to limit the total of those. In a lot=
 of
> > > cases there is only 1 region, so the total of that would still be the=
 same.
> > >=20
> > > On top, we just separated the management of each region, adding a 'to=
tal'
> > > would require unseparating it again. :-)
> >=20
> > I didn't mean the total for a device, but for the system. It would
> > definitely not make sense for a VRAM, but for CMA for example, you have
> > a single, limited, allocator that will be accessible from heaps, v4l2
> > and DRM devices.
> >=20
> > If an application has to allocate both from v4l2 and DRM buffers, we
> > should be able to limit its total usage of CMA, not just on a single
> > device.
>
> In this case, I think it makes more sense if CMA creates a region, then u=
se
> that region in both v4l2 and DRM instead of a separate region for both, w=
ith
> CMA being responsible for lifetime.

Ack, thanks for your feedback :)

Maxime

--moaynkbohx6mdcjs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2EsQQAKCRAnX84Zoj2+
dhn2AYDyBKh4PeDUj5bFOj4p/RKKL9uN/KUtyl6G3J1+sEdZdLohr1MKIZ5CF7Tl
eUwVXYwBf1HikKKaUe7ZktXkTA34hBlVGvwJz/tHr0CQiuScjRmWjVDwjbQEMBUf
ubiGLbrddg==
=2+Ct
-----END PGP SIGNATURE-----

--moaynkbohx6mdcjs--
