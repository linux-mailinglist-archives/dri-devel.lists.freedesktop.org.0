Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F08850F06
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 09:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9FD10EAE8;
	Mon, 12 Feb 2024 08:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="gp00H0pu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC7510EADA;
 Mon, 12 Feb 2024 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7c3q2sIKHEf9zj9In7EzhXZmgLfdkuguIhI/jEwgCr8=; b=gp00H0puuaSBvveqqhImrB254S
 32Zaguu/0Db5JZTYEDr9ZGOmaOdTgFKeoREVh74IfvT8Hl/atIlhLPhnmXXKZ9KqJ+tk/Uc2+g/e/
 5ttxpKnU2fJlHhv/OZM/kE7IDo6wNv0f3ytYjpvaKW6Q4pcTZBRyA1QS5Hd/LL+Bv508glntTT/Yr
 UWzAgRl7Q78qLlHTIz+DDRL+1lH2RlbtRFB/ERxxwRuaa4ti66PFElLf5LH74NxsZRn9cDFWgccD8
 5RgsE5HmLs6DJkgpYmrP4hDX7UAN3jKzPvmtTYBUzXQPtfyp6FM1kNGl3sR+anEzrWJq31+1kEMsQ
 bB3TxSVw==;
Received: from [194.136.85.206] (port=49688 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rZRui-0002oY-2g;
 Mon, 12 Feb 2024 10:43:44 +0200
Date: Mon, 12 Feb 2024 10:43:30 +0200
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
Message-ID: <20240212104330.7de30010@eldfell>
In-Reply-To: <6b033c46-284d-41df-ac80-cc96d2f05032@riseup.net>
References: <20240207-bench-v1-1-7135ad426860@riseup.net>
 <20240208115050.73d04796@eldfell>
 <738490ac-56a9-4408-8de7-63de059d0a54@riseup.net>
 <20240209103211.4f7e9fc6@eldfell>
 <6b033c46-284d-41df-ac80-cc96d2f05032@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vigNP9OE2EpShjXpd6+w1wS";
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

--Sig_/vigNP9OE2EpShjXpd6+w1wS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Feb 2024 14:29:30 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 09/02/24 05:32, Pekka Paalanen wrote:
> > On Thu, 8 Feb 2024 16:38:31 -0300
> > Arthur Grillo <arthurgrillo@riseup.net> wrote:
> >  =20
> >> On 08/02/24 06:50, Pekka Paalanen wrote: =20
> >>> On Wed, 07 Feb 2024 17:17:15 -0300
> >>> Arthur Grillo <arthurgrillo@riseup.net> wrote:
> >>>    =20
> >>>> Create a benchmark for the VKMS driver. Use a KMS layout with delibe=
rate
> >>>> odd sizes to try to avoid alignment accidents and run it for FRAME_C=
OUNT
> >>>> frames flipping framebuffers in each plane.
> >>>>
> >>>> Link: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.loc=
aldomain/
> >>>> Suggested-by: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> >>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> >>>> ---
> >>>> This benchmark was suggested by Pekka Paalanen on [1] to better anal=
yse
> >>>> possible performance regression on the Virtual Kernel Modesetting(VK=
MS)
> >>>> driver.
> >>>>
> >>>> With this benchmark I was able to determine two performance regressi=
on:
> >>>>
> >>>> - 322d716a3e8a ("drm/vkms: isolate pixel conversion functionality")
> >>>> - cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functi=
ons")
> >>>>
> >>>> [1]: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.loca=
ldomain/
> >>>> ---
> >>>>  benchmarks/meson.build   |   1 +
> >>>>  benchmarks/vkms_stress.c | 203 ++++++++++++++++++++++++++++++++++++=
+++++++++++
> >>>>  2 files changed, 204 insertions(+)
> >>>>
> >>>> diff --git a/benchmarks/meson.build b/benchmarks/meson.build
> >>>> index c451268bc44f..3aa66d6dffe2 100644
> >>>> --- a/benchmarks/meson.build
> >>>> +++ b/benchmarks/meson.build
> >>>> @@ -20,6 +20,7 @@ benchmark_progs =3D [
> >>>>  	'kms_vblank',
> >>>>  	'prime_lookup',
> >>>>  	'vgem_mmap',
> >>>> +	'vkms_stress',
> >>>>  ]
> >>>> =20
> >>>>  benchmarksdir =3D join_paths(libexecdir, 'benchmarks')
> >>>> diff --git a/benchmarks/vkms_stress.c b/benchmarks/vkms_stress.c
> >>>> new file mode 100644
> >>>> index 000000000000..b9128c208861
> >>>> --- /dev/null
> >>>> +++ b/benchmarks/vkms_stress.c =20
> >=20
> > ...
> >  =20
> >>>> +
> >>>> +igt_simple_main
> >>>> +{
> >>>> +	struct data_t data;
> >>>> +	enum pipe pipe =3D PIPE_NONE;
> >>>> +
> >>>> +	data.kms =3D default_kms;
> >>>> +   =20
> >>>
> >>> Hi Arthur,
> >>>
> >>> all the above looks really good!
> >>>
> >>> Some things below look strange to me, but I don't know the igt API.
> >>>    =20
> >>>> +	data.fd =3D drm_open_driver_master(DRIVER_ANY);
> >>>> +
> >>>> +	igt_display_require(&data.display, data.fd);
> >>>> +
> >>>> +	kmstest_set_vt_graphics_mode();
> >>>> +
> >>>> +	igt_display_require(&data.display, data.fd);   =20
> >>>
> >>> Are you supposed to call igt_display_require twice?
> >>>    =20
> >>
> >> Only this way the writeback connector appears. I took this from
> >> `tests/kms_writeback.c`.
> >>
> >> I now did a bit of lore.kernel.org archaeology and found why this is
> >> necessary:
> >>
> >> Rodrigo Siqueira sent this patch:
> >> https://lore.kernel.org/all/20190306213005.7hvbnwl7dohr3vuv@smtp.gmail=
.com/
> >>
> >> It places drmSetClientCap() before drmModeGetResources(). (The patch
> >> description is wrong, as noted by [1])
> >>
> >> Without this, you don't need to call igt_display_require() twice. I
> >> don't know if this patch is wrong, but it is good to bring it up for
> >> discussion. =20
> >=20
> > Hi Arthur,
> >=20
> > did you mean "*With* this, you don't need to call igt_display_require()
> > twice."? =20
>=20
> No, I really meant _without_. The patch has already been applied, it was
> added inside commit 3642acbb74f5 ("lib/igt_kms: Add writeback support")
> (it says on the commit message).
>=20
> If you remove this change you don't need to call igt_display_require()
> twice. But, based on you explanation, I don't think it's right to remove
> it. Although, for some reason, you need call igt_display_require() twice
> with this fix.

If you set client caps before GetResources, there should not be any
need to call igt_display_require() twice, unless there is yet another
problem. Sounds like something to fix.

However, I cannot understand how reverting the change could *not*
require calling igt_display_require() twice. The call to GetResources
before setting client caps will not expose writeback connectors.


Thanks,
pq


>=20
> Best Regards,
> ~Arthur Grillo
>=20
> >=20
> > All DRM client caps do need to be set before any call to GetResources
> > or anything else, exactly because the client caps change the kernel
> > side behaviour. Client caps may also hide things, not only expose
> > things, at least in the future if not already (color pipelines will
> > replace legacy color properties).
> >=20
> > If you need to check DRM (kernel) caps, that should be done immediately
> > after setting DRM client caps. I think that's the most logical and
> > safest order.
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> >>
> >> [1]: https://lore.kernel.org/all/20190318104128.GH26454@e110455-lin.ca=
mbridge.arm.com/
> >> =20
> >>>> +	igt_require(data.display.is_atomic);
> >>>> +
> >>>> +	igt_display_require_output(&data.display);
> >>>> +
> >>>> +	igt_require(data.wb_output);
> >>>> +	igt_display_reset(&data.display);
> >>>> +
> >>>> +	data.wb_output =3D find_wb_output(&data);   =20
> >>>
> >>> Should igt_require(data.wb_output) be after find_wb_output?
> >>>    =20
> >>>> +
> >>>> +	for_each_pipe(&data.display, pipe) {
> >>>> +		igt_debug("Selecting pipe %s to %s\n",
> >>>> +			  kmstest_pipe_name(pipe),
> >>>> +			  igt_output_name(data.wb_output));
> >>>> +		igt_output_set_pipe(data.wb_output, pipe);   =20
> >>>
> >>> Isn't this strange if there are multiple pipes?   =20
> >>
> >> Yeah, I forgot to place a `break;` there.
> >>
> >> All the others comments will be addressed on v2.
> >>
> >> Best Regards,
> >> ~Arthur Grillo =20


--Sig_/vigNP9OE2EpShjXpd6+w1wS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXJ2jIACgkQI1/ltBGq
qqd8fw//f40jWSRopFxHYX7o5WUyvw6aQOIiFEg+auWSkk4BdeCqRWYQ504r/kib
9VcRklwFZ/+AkFz8oadwtGBvKltQsdu9Vi69G7kUbIVPOlVtJTgP5denGfKKxCwc
/D0nyfDJxmRPFN1L2Hhg/ISYbhrY0QcDMZdYlvGLw4CBe0Lold5YeYCzhv440mcS
iNNj6m1n5miWyVuYxCzx583oSzpqUM9asqoNIx0P4yOqhyXCSDwdKC93Kv7ua++g
2kU1XCgRKXXVWKaUGMvZMnAN7raTtEDU8z6l2ME1Queei+w4aphtC+YTzCrPKbmS
z88cC3XUbjRk2AdB4GKYQA0QR9W8B57mgghJrpUbXyYsgx2QAbm473dyjstcQVBT
LWGdG0L9Rykq0EUXzsne8Vf+nJ/YktP47/4tTXehvsvcaMjRwXniLKwJhX8nvjGi
976tHOqNcumjeT+dXq14T3Pmm5L1Js8sXQiEIH6kN3wLSU3OYp6cl/8sTgbOg1N4
0KAYuTJytZvdcUsRlm0dhEVVm8wd2FdanzRusAZGTLNdTCWrUjZuYYk725c3ybe3
jbC9xW+IfXtLVOU2m9XxHhLxiKBvZLdF0ahXBiKfJjFYwB7kMNuL6Bf3TGTo3TMx
z3f21aGs8Kl6Bkt7guirH2Rj5s13vR1a/oT9kDH+ksKBcAhmWtg=
=Xsgp
-----END PGP SIGNATURE-----

--Sig_/vigNP9OE2EpShjXpd6+w1wS--
