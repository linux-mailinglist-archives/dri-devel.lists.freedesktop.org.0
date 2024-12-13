Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56B9F0CE5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 14:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B958E10E0A0;
	Fri, 13 Dec 2024 13:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="muRbWLIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C49210E0A0;
 Fri, 13 Dec 2024 13:03:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0CC11A42B33;
 Fri, 13 Dec 2024 13:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B099C4CED0;
 Fri, 13 Dec 2024 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734095031;
 bh=E8l4/W5Vj6WHbW+ezaL5t0klk/Ev76XzGMo/Shf8G/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=muRbWLITHPb5lwoB/0q0VOTFMIQl2ch9xucudEk9J1F2K7B7nX9DdQVQqKiCYhaWO
 dstxCA+16QH3U5/B/j5RQ2HtPiLB9hGyHQ8+jSjlI4wnIdVMlIa+xPaOddKuEwfAdi
 oBN8WuhypVIbW2ihzmkaE5+vz/QE9ADSlp6lIp0miMY4tKyt6tdwklE445koHYXedY
 o0o2JaptVxtZVtilanL8m/gXUOZJyMpYXBEhZpQJpbckK8S42pw/OxzOmT1OnoPoG3
 EGOohYwj83z7uZiLv/JZCNoHcz0c48grsG8a8xuSoBuXjawDGqX9OSzxiUJSQHEcVx
 wl9252A6VG8aw==
Date: Fri, 13 Dec 2024 14:03:49 +0100
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
Message-ID: <20241213-proud-kind-uakari-df3a70@houat>
References: <20241204134410.1161769-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qnhyf4plgwmkdxao"
Content-Disposition: inline
In-Reply-To: <20241204134410.1161769-1-dev@lankhorst.se>
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


--qnhyf4plgwmkdxao
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
MIME-Version: 1.0

Hi,

Thanks for the new update!

On Wed, Dec 04, 2024 at 02:44:00PM +0100, Maarten Lankhorst wrote:
> New update. Instead of calling it the 'dev' cgroup, it's now the
> 'dmem' cgroup.
>=20
> Because it only deals with memory regions, the UAPI has been updated
> to use dmem.min/low/max/current, and to make the API cleaner, the
> names are changed too.

The API is much nicer, and fits much better into other frameworks too.

> dmem.current could contain a line like:
> "drm/0000:03:00.0/vram0 1073741824"
>=20
> But I think using "drm/card0/vram0" instead of PCIID would perhaps be
> good too. I'm open to changing it to that based on feedback.

Do we have any sort of guarantee over the name card0 being stable across
reboots?

I also wonder if we should have a "total" device that limits the amount
of memory we can allocate from any region?

Maxime

--qnhyf4plgwmkdxao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1wwtAAKCRAnX84Zoj2+
dubaAX422121RCTAGgG1ZhjlmSQKxIe/7lpqNfOY43zO3XA2J1x2bouiIlciUVOf
5N6YqssBf0N8tl9+MriuHzFtTkKuEwIZ2qRWklYOh61j1RkGgiz/2sorYylAXlYp
4KKGLABCEw==
=ehhw
-----END PGP SIGNATURE-----

--qnhyf4plgwmkdxao--
