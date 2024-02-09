Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A484F162
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 09:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7F510EB7C;
	Fri,  9 Feb 2024 08:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="mbPsA2n3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9793310EB29;
 Fri,  9 Feb 2024 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DXy4eEGFSWdGh8qDXNQh2Ef4AQFbMRCkpfq2+g/Ei5Y=; b=mbPsA2n3EWsyYf4G7MufJJmBTn
 rWyC6S8u2skzB3P/YnLtAxy0mOW9OYHQBCeKKBoYfu1RSNrEeRR/INWBmC7WQiryOAyMRNPtrdqhY
 OVZKagMMLzzLZf+442QyfdQjr0VSib85ovjwgPsoLOBosdU92sle8GIcRKwSWs+U7QR0vtZsQ1D40
 INZ88vmwPIYFLFzMdcGZQ8fqnFSAObKHwxvglwK7vGDlHhdwRbn5CMGmpHOh1dgh5knscKlan1Xbd
 SwEoxz9aD8sUI/12rA6FmH0HdbtpShWLbtDdrS/l4CNOEDcz3BT1XlYv7npxM0XlSj0d17Eoa76Rr
 7wvRAk1g==;
Received: from [194.136.85.206] (port=51610 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rYMJ4-0007or-2D;
 Fri, 09 Feb 2024 10:32:22 +0200
Date: Fri, 9 Feb 2024 10:32:11 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, Petri
 Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil
 Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH i-g-t] benchmarks: Add VKMS benchmark
Message-ID: <20240209103211.4f7e9fc6@eldfell>
In-Reply-To: <738490ac-56a9-4408-8de7-63de059d0a54@riseup.net>
References: <20240207-bench-v1-1-7135ad426860@riseup.net>
 <20240208115050.73d04796@eldfell>
 <738490ac-56a9-4408-8de7-63de059d0a54@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vB67.EaY8dZKF7gI3HyggWA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/vB67.EaY8dZKF7gI3HyggWA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Feb 2024 16:38:31 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 08/02/24 06:50, Pekka Paalanen wrote:
> > On Wed, 07 Feb 2024 17:17:15 -0300
> > Arthur Grillo <arthurgrillo@riseup.net> wrote:
> >  =20
> >> Create a benchmark for the VKMS driver. Use a KMS layout with delibera=
te
> >> odd sizes to try to avoid alignment accidents and run it for FRAME_COU=
NT
> >> frames flipping framebuffers in each plane.
> >>
> >> Link: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.local=
domain/
> >> Suggested-by: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> >> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> >> ---
> >> This benchmark was suggested by Pekka Paalanen on [1] to better analyse
> >> possible performance regression on the Virtual Kernel Modesetting(VKMS)
> >> driver.
> >>
> >> With this benchmark I was able to determine two performance regression:
> >>
> >> - 322d716a3e8a ("drm/vkms: isolate pixel conversion functionality")
> >> - cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion function=
s")
> >>
> >> [1]: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.locald=
omain/
> >> ---
> >>  benchmarks/meson.build   |   1 +
> >>  benchmarks/vkms_stress.c | 203 ++++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  2 files changed, 204 insertions(+)
> >>
> >> diff --git a/benchmarks/meson.build b/benchmarks/meson.build
> >> index c451268bc44f..3aa66d6dffe2 100644
> >> --- a/benchmarks/meson.build
> >> +++ b/benchmarks/meson.build
> >> @@ -20,6 +20,7 @@ benchmark_progs =3D [
> >>  	'kms_vblank',
> >>  	'prime_lookup',
> >>  	'vgem_mmap',
> >> +	'vkms_stress',
> >>  ]
> >> =20
> >>  benchmarksdir =3D join_paths(libexecdir, 'benchmarks')
> >> diff --git a/benchmarks/vkms_stress.c b/benchmarks/vkms_stress.c
> >> new file mode 100644
> >> index 000000000000..b9128c208861
> >> --- /dev/null
> >> +++ b/benchmarks/vkms_stress.c

...

> >> +
> >> +igt_simple_main
> >> +{
> >> +	struct data_t data;
> >> +	enum pipe pipe =3D PIPE_NONE;
> >> +
> >> +	data.kms =3D default_kms;
> >> + =20
> >=20
> > Hi Arthur,
> >=20
> > all the above looks really good!
> >=20
> > Some things below look strange to me, but I don't know the igt API.
> >  =20
> >> +	data.fd =3D drm_open_driver_master(DRIVER_ANY);
> >> +
> >> +	igt_display_require(&data.display, data.fd);
> >> +
> >> +	kmstest_set_vt_graphics_mode();
> >> +
> >> +	igt_display_require(&data.display, data.fd); =20
> >=20
> > Are you supposed to call igt_display_require twice?
> >  =20
>=20
> Only this way the writeback connector appears. I took this from
> `tests/kms_writeback.c`.
>=20
> I now did a bit of lore.kernel.org archaeology and found why this is
> necessary:
>=20
> Rodrigo Siqueira sent this patch:
> https://lore.kernel.org/all/20190306213005.7hvbnwl7dohr3vuv@smtp.gmail.co=
m/
>=20
> It places drmSetClientCap() before drmModeGetResources(). (The patch
> description is wrong, as noted by [1])
>=20
> Without this, you don't need to call igt_display_require() twice. I
> don't know if this patch is wrong, but it is good to bring it up for
> discussion.

Hi Arthur,

did you mean "*With* this, you don't need to call igt_display_require()
twice."?

All DRM client caps do need to be set before any call to GetResources
or anything else, exactly because the client caps change the kernel
side behaviour. Client caps may also hide things, not only expose
things, at least in the future if not already (color pipelines will
replace legacy color properties).

If you need to check DRM (kernel) caps, that should be done immediately
after setting DRM client caps. I think that's the most logical and
safest order.


Thanks,
pq

>=20
> [1]: https://lore.kernel.org/all/20190318104128.GH26454@e110455-lin.cambr=
idge.arm.com/
>=20
> >> +	igt_require(data.display.is_atomic);
> >> +
> >> +	igt_display_require_output(&data.display);
> >> +
> >> +	igt_require(data.wb_output);
> >> +	igt_display_reset(&data.display);
> >> +
> >> +	data.wb_output =3D find_wb_output(&data); =20
> >=20
> > Should igt_require(data.wb_output) be after find_wb_output?
> >  =20
> >> +
> >> +	for_each_pipe(&data.display, pipe) {
> >> +		igt_debug("Selecting pipe %s to %s\n",
> >> +			  kmstest_pipe_name(pipe),
> >> +			  igt_output_name(data.wb_output));
> >> +		igt_output_set_pipe(data.wb_output, pipe); =20
> >=20
> > Isn't this strange if there are multiple pipes? =20
>=20
> Yeah, I forgot to place a `break;` there.
>=20
> All the others comments will be addressed on v2.
>=20
> Best Regards,
> ~Arthur Grillo

--Sig_/vB67.EaY8dZKF7gI3HyggWA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXF4wsACgkQI1/ltBGq
qqexIxAAhhc5T/9Vpu9H9p5lr8o93tJO2QkQzKOzVP26QAQTxUeAGAVhDRWA+0yG
OYBiXK3vv2oLGOk1PShepAH8MnMjohihS2Smkkxlr0LxVKfLlpCS5x4z+AyjQcmm
ddVoee9Mfu8mz5YbXjjoW7U0I7eEbF5n4h18U5eaSQVGDXZve1G0JxFbIa5ihWEk
agYQcfbEbT9MJXW0KX8DMzYqW6tBtBpxcFc7ihWgprdxtmsd2mOTajSaLDC61WzL
Xf6YgG3lqvQIfvn/VXWYUFHhgPg1s4hNyTq9RCokUPOtxqvojeELMEY5NxT35RkV
Mo2zPxoo08LHnYeu5FqrxgxIYLArg8x/zOFnnwUuH5yrn58S8MMeuIb5px3sOo4i
gr5hCc5r1ynBR3KnNvyDmr7yCIGrwVq1pTlh67W8EWxaKxX7Htpp7ySLMioMocWh
1LxFZwSJmSNrQVXU+vBfgvjqQYdfVjvgU76M9mHF/t8dfbwzvGJixhD9NR1gPKtK
qWYIOLCI0TAEmk3oUyGbB6i8FxM3Lnath83N56/fbdwz5beNJAFq969h2dJ+Y1bT
sMTK6JhfZy1nYcEOWQX0rGnGbwQ5mBdntmOXCmk7pKxWZDOKZfHE9cy5yf/bzQpr
FtA2BO4gZRVFWweX+U6g3OOFpaUx0U/MVZ59KqNdkAWQuXvFqPo=
=NMoj
-----END PGP SIGNATURE-----

--Sig_/vB67.EaY8dZKF7gI3HyggWA--
