Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B39B9F10CB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 16:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24A510E13B;
	Fri, 13 Dec 2024 15:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kNV5IYVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9CC10E13B;
 Fri, 13 Dec 2024 15:22:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 76810A42BFF;
 Fri, 13 Dec 2024 15:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06DBC4CED0;
 Fri, 13 Dec 2024 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734103363;
 bh=mZZPTQJsNPsTvkisNXOUR5Df8ass8gl+2nYsiM1JXlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kNV5IYVGSiAvg4nneLRmM8EESuL1qYoYf1gYdIYPnhhnv375Yc6Po7KvvI5wVwMCe
 aYoQTdWkXt3NEiY2O8EtAVhAJVg5265KWo8z/ExUjsIk2vpXUFHXLD0HBPWo/xGo85
 D5iBbgU9KnnF7kj2nTGbkC7YoFuhPk9xa6M49WfnRZ9HxT/Qk4TD5Hv+hH/tcBjsCp
 jPrr9/+LA+m/8hz33JRd4nFcDFtOpZdQ1P/z06qNTdTakZWJRSNurkxGuLRNHYrOvV
 VE6KknCGSUAKWjqUn6zFpgNKC1Ll44mFfwwMgMAQ+YTaXEVhR9ymhvez31HSfOKOzG
 yh3d5lZUj/i3A==
Date: Fri, 13 Dec 2024 16:22:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
Message-ID: <20241213-flying-naughty-marmot-6a82a2@houat>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <29a71119-04de-4c76-a98a-d0fcb906390f@gmx.de>
 <20241213-sceptical-maize-gazelle-fadc34@houat>
 <789d78c1-d16a-4cb3-b4ad-ba5f0ddcacaf@lankhorst.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="by62sis77uqd7vzz"
Content-Disposition: inline
In-Reply-To: <789d78c1-d16a-4cb3-b4ad-ba5f0ddcacaf@lankhorst.se>
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


--by62sis77uqd7vzz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
MIME-Version: 1.0

On Fri, Dec 13, 2024 at 03:13:23PM +0100, Maarten Lankhorst wrote:
> Hey,
>=20
> Den 2024-12-13 kl. 14:07, skrev Maxime Ripard:
> > On Sun, Dec 08, 2024 at 01:15:34PM +0100, Friedrich Vock wrote:
> > > Hi,
> > >=20
> > > On 04.12.24 14:44, Maarten Lankhorst wrote:
> > >=20
> > > > Because it only deals with memory regions, the UAPI has been updated
> > > > to use dmem.min/low/max/current, and to make the API cleaner, the
> > > > names are changed too.
> > > >=20
> > > > dmem.current could contain a line like:
> > > > "drm/0000:03:00.0/vram0 1073741824"
> > > >=20
> > > > But I think using "drm/card0/vram0" instead of PCIID would perhaps
> > > > be good too. I'm open to changing it to that based on feedback.
> > >=20
> > > Agree, allowing userspace to reference DRM devices via "cardN" syntax
> > > sounds good.
> > >=20
> > > What about other subsystems potentially using dmem cgroups?
> > > I'm not familiar with the media subsystem, but I imagine we might be
> > > dealing with things like USB devices there? Is something like a
> > > "deviceN" possible there as well, or would device IDs look completely
> > > different?
>
> I'd just take what makes sense for each driver. dev_name() would be a good
> approximation.

Yeah, dev_name() seems good enough to me too.

> I agree that cardN is not stable.
>=20
> > > I have some patches to enable the cgroup in GEM-based drivers, media
> > ones and dma-buf heaps. The dma-buf heaps are simple enough since the
> > heaps names are supposed to be stable.
>=20
> I've used your patch as a base enable cgroup in drivers that use the VRAM
> manager. I didn't want to enable it for all of GEM, because it would
> conflict with drivers using TTM. Some more discussion is needed first.
>=20
> For DMA-BUF heaps, I think it's fine and there is a lot less need of
> discussion. I just felt it should be sent separately from the initial
> enablement.

Definitely.

> > I don't think using card0 vs card1 (or v4l0 vs v4l1 for example) will
> > work because I don't think we have any sort of guarantee that these
> > names will always point to the same devices across reboots or updates.
> >=20
> > If the module is loaded later than it used to for example, we could very
> > well end up in a situation where card0 and card1 are swapped, while the
> > constraints apply to the previous situation.
>
> I agree, just put it out there for discussion. I don't think the benefits
> weigh up against the downsides :-)

Oh absolutely. The way to define a stable name is going to be framework
specific anyway. My point was that we wanted to have a stable name.

Maxime

--by62sis77uqd7vzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1xRQAAKCRAnX84Zoj2+
dnZVAYDQQEA9NR6GrqKYw1CvE58OitlLlx9hVBdBfbxT1+FUZK/xhIjhLN+KQYWn
9pAtNrABf2UM3dWX1eT1pN+ZKq5ToTS6/1SQjpboJ/ny+YN6Ir6UbyPmYugJN0AT
+o+OtxQK8w==
=HILO
-----END PGP SIGNATURE-----

--by62sis77uqd7vzz--
