Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A03D1030
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 15:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B801D6E247;
	Wed,  9 Oct 2019 13:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3E6E247
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 13:31:41 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D448320B7C;
 Wed,  9 Oct 2019 13:31:40 +0000 (UTC)
Date: Wed, 9 Oct 2019 15:31:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
Message-ID: <20191009133138.scz3i5jjcqt3gnjd@gilmour>
References: <20190725105132.22545-2-noralf@tronnes.org>
 <20191001123636.GA8351@ziepe.ca>
 <1fffe7b1-a738-a9e3-ea5f-9d696cb98650@tronnes.org>
 <20191001134555.GB22532@ziepe.ca>
 <75055e2d-44f7-0cba-4e41-537097b73c3c@tronnes.org>
 <20191009104531.GW16989@phenom.ffwll.local>
 <1bc77839-c47a-6e79-dd6e-e26e05b34eae@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <1bc77839-c47a-6e79-dd6e-e26e05b34eae@tronnes.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570627901;
 bh=oZzfMFCR/j7Wy5PTVMA5uQX2L9GGCFSn0pppXeOTmn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0hvHSAxdEvU3eQFJbCNTHqxGpclBsrkmEQIoY6D9TPohbGcsawUwe/9diqs9p0t6/
 tP4yB1NShXDz88eLxAFzZ+hVSfLsQKjUUOfbLKMOMXsow+I1nsuJ4VJ4SGPB9405oy
 u+X7FGxkIQ4RB6Cx0rTsBuZqZD2x1LSD/X97pZz0=
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
Cc: hdegoede@redhat.com, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0330133785=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0330133785==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2a3a74y3f5owva3n"
Content-Disposition: inline


--2a3a74y3f5owva3n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2019 at 02:48:20PM +0200, Noralf Tr=F8nnes wrote:
> Den 09.10.2019 12.45, skrev Daniel Vetter:
> > On Tue, Oct 01, 2019 at 04:07:38PM +0200, Noralf Tr=F8nnes wrote:
> >> Hi drm-misc maintainers,
> >>
> >> I have just applied a patch to drm-misc-next that as it turns out shou=
ld
> >> have been applied to -fixes for this -rc cycle.
> >>
> >> Should I cherry pick it to drm-misc-next-fixes?
> >
> > Yup, cherry pick and reference the commit that's already in -next (in c=
ase
> > it creates conflicts down the road that reference makes the mess easier=
 to
> > understand).
> >
>
> I remembered that Maxime just sent out a fixes pull and the subject says
> drm-misc-fixes. The prevous one he sent out was -next-fixes.
> So it looks like I should cherry pick to drm-misc-fixes for it to show
> up in 5.4?

drm-misc-next-fixes is the branch where we gather fixes supposed to be
applied on top of drm-misc-next during the merge window. If you have
something targeting the current release, it should be drm-misc-fixes
indeed.

Maxime

--2a3a74y3f5owva3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZ3hOgAKCRDj7w1vZxhR
xcoFAP9hmbX/w4RrCCKqQTCWRP1Ft+AL7c/nMJYOR0IRZ3qrCwEA7/Pl7InBhhZI
wtLFUjQymChPxBbMXs1GgwfpUD7ZTgg=
=iry/
-----END PGP SIGNATURE-----

--2a3a74y3f5owva3n--

--===============0330133785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0330133785==--
