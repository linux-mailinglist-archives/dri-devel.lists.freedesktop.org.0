Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ACE7FD70C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FD910E1C2;
	Wed, 29 Nov 2023 12:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D3210E1C2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:46:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 62198CE1E8B;
 Wed, 29 Nov 2023 12:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B43C433C8;
 Wed, 29 Nov 2023 12:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701261958;
 bh=7GpH+TiBsb7ZTMyTnWn4bb0sTawrJWl0/1Vu8evdraI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VHSu3G/5wnK0O9WDSlMDlZZ0Z9qwb3ViotdfoUimo8BlACWOSI5ZFRacIn5GH2BvV
 xhq2pje8iMPRz4bqlt/kDrhpWJS2iqFjuHfWHCtUwePgI5hK8rx+595IO2Z64nnZx2
 vza8+5Pl01NNvAh6hSiL5UWLkMZMhtHuiUJykuPJyZV/4vEgqVWRAMFVm0Ak671beI
 eEtazxGxJK3XI+PYXC+EOWnz+O/S9JvWp0kVTaFC0NDr3PCghJuLHyAD18Iaj7HIqc
 LIqhPuyiOCq1hB+50lZ7IsI7aeZBM77QnwNqiKM+LJ7rNC2TfSJFH8N9A9shU2X9wT
 cnGPar3tUtD4g==
Date: Wed, 29 Nov 2023 13:45:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <wsdxippxzmtjujlcpp5t2tp2dvr2xmhwtogrvvhj3huyj73yj7@cg2uniryh2co>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <SsSohScL3nokTnLEzO0FXd2Mhxq9IYM3_qjKhHD8-rynieR_0otvP-WmHQ18UNJuf1Dp7u4iaRB-XPZU4eAxZADSFODzbXxYPFuoJNJ6GcU=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o6ndupujo4ptkqde"
Content-Disposition: inline
In-Reply-To: <SsSohScL3nokTnLEzO0FXd2Mhxq9IYM3_qjKhHD8-rynieR_0otvP-WmHQ18UNJuf1Dp7u4iaRB-XPZU4eAxZADSFODzbXxYPFuoJNJ6GcU=@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 "T.J. Mercier" <tjmercier@google.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o6ndupujo4ptkqde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for writing this down

On Thu, Nov 16, 2023 at 03:53:20PM +0000, Simon Ser wrote:
> On Thursday, November 9th, 2023 at 08:45, Simon Ser <contact@emersion.fr>=
 wrote:
>=20
> > User-space sometimes needs to allocate scanout-capable memory for
> > GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> > is achieved via DRM dumb buffers: the v3d user-space driver opens
> > the primary vc4 node, allocates a DRM dumb buffer there, exports it
> > as a DMA-BUF, imports it into the v3d render node, and renders to it.
> >=20
> > However, DRM dumb buffers are only meant for CPU rendering, they are
> > not intended to be used for GPU rendering. Primary nodes should only
> > be used for mode-setting purposes, other programs should not attempt
> > to open it. Moreover, opening the primary node is already broken on
> > some setups: systemd grants permission to open primary nodes to
> > physically logged in users, but this breaks when the user is not
> > physically logged in (e.g. headless setup) and when the distribution
> > is using a different init (e.g. Alpine Linux uses openrc).
> >=20
> > We need an alternate way for v3d to allocate scanout-capable memory.
> > Leverage DMA heaps for this purpose: expose a CMA heap to user-space.
>=20
> So we've discussed about this patch on IRC [1] [2]. Some random notes:
>=20
> - We shouldn't create per-DRM-device heaps in general. Instead, we should=
 try
>   using centralized heaps like the existing system and cma ones. That way=
 other
>   drivers (video, render, etc) can also link to these heaps without depen=
ding
>   on the display driver.
> - We can't generically link to heaps in core DRM, however we probably pro=
vide
>   a default for shmem and cma helpers.
> - We're missing a bunch of heaps, e.g. sometimes there are multiple cma a=
reas
>   but only a single cma heap is created right now.
> - Some hw needs the memory to be in a specific region for scanout (e.g. l=
ower
>   256MB of RAM for Allwinner). We could create one heap per such region (=
but is
>   it fine to have overlapping heaps?).

Just for reference, it's not the scanout itself that has that
requirement on Allwinner SoCs, it's the HW codec. But if you want to
display the decoded frame directly using dma-buf, you'll still need to
either allocate a scanout buffer and hope it'll be in the lower 256MB,
or allocate a buffer from the codec in the lower 256MB and then hope
it's scanout-capable (which it is, so that's we do, but there's no
guarantee about it).

I think the logicvc is a much better example for this, since it requires
framebuffers to be in a specific area, with each plane having a
dedicated area.

AFAIK that's the most extreme example we have upstream.

Maxime

--o6ndupujo4ptkqde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWcyggAKCRDj7w1vZxhR
xRCKAQDQKOd4QWVKD5GriesGWdvu0uc262krnyecwhnq5YiswgEAv3Llb7a6bNBd
iLEpAwfAtAhkdP53JXFDWJ++Fh1JwQE=
=HIqQ
-----END PGP SIGNATURE-----

--o6ndupujo4ptkqde--
