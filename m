Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C48D9638C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 17:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019106E404;
	Tue, 20 Aug 2019 15:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F506E404
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 15:00:22 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1FC3140004;
 Tue, 20 Aug 2019 15:00:19 +0000 (UTC)
Date: Tue, 20 Aug 2019 17:00:18 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Thomas Graichen <thomas.graichen@googlemail.com>
Subject: Re: [v5,05/12] drm/modes: Rewrite the command line parser
Message-ID: <20190820150018.uhiquahda6wuxvjd@flea>
References: <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <5978761.uBj7R84RrF@jernej-laptop>
 <CAOUEw13CCVhk9kt_z2VkguX0=TCeARkH-8+qSh_nF-J+r0Rscg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOUEw13CCVhk9kt_z2VkguX0=TCeARkH-8+qSh_nF-J+r0Rscg@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1419767141=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1419767141==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="upeyyhtq7btyttw2"
Content-Disposition: inline


--upeyyhtq7btyttw2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 19, 2019 at 09:20:00PM +0200, Thomas Graichen wrote:
> On Mon, Aug 19, 2019 at 8:54 PM Jernej =C5=A0krabec <jernej.skrabec@gmail=
=2Ecom> wrote:
> >
> > +CC: Thomas Graichen
> >
> > Dne ponedeljek, 17. junij 2019 ob 16:51:32 CEST je Maxime Ripard napisa=
l(a):
> > > From: Maxime Ripard <maxime.ripard@free-electrons.com>
> > >
> > > Rewrite the command line parser in order to get away from the state m=
achine
> > > parsing the video mode lines.
> > >
> > > Hopefully, this will allow to extend it more easily to support named =
modes
> > > and / or properties set directly on the command line.
> > >
> > > Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >
> > Thomas reported to me that this patch breaks "video=3DCONNECTOR:e" kern=
el
> > parameter which he currently uses as a workaround for H6 HDMI monitor
> > detection issue on one STB.
> >
> > I suppose this is the same issue that Dmitry noticed.
> >
> > Thomas Graichen (in CC) can provide more information if needed.
>
> as jernej already mentioned i am currently having to use the kernel
> cmdline option video=3DHDMI-A-1:e to get a working hdmi output on an
> eachlink h6 mini tv box and was wondering that i did not get any hdmi
> output even with this option when switching from the
> https://github.com/megous/linux oprange-pi-5.2 to the orange-pi-5.3
> branch which seems to contain this patch.

Which kernel version is that based on?

> as i had no idea what might have caused the breakage of the hdmi
> output and did a full bisect of the kernel between those two
> versions, which ended reliably at exactly this patch - so i guess
> there is a regression at least with the video=3DCONNECTOR:e option
> (maybe others too?) with this patches code which makes it not
> working anymore.

I'm not sure I'll have the time to look into it this week (or the
next, unfortunately). However, the e parameter is supposed to be
parsed by drm_mode_parse_cmdline_extra, which in turn is supposed to
be called there:
https://elixir.bootlin.com/linux/v5.3-rc5/source/drivers/gpu/drm/drm_modes.=
c#L1810

If you can test that, having an idea of if that function is called,
which return code it returns, and if it isn't if why would be super
helpful.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--upeyyhtq7btyttw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVwLAgAKCRDj7w1vZxhR
xU5jAQCoQQ2yAaOQGsg8OTMgvoNdbtjA4H4nqF4DBTXJ6/8/QQD+L4iC5VrP0gcU
b989j1Th8EdacGteid9NZ8Y9NPnLzw8=
=EtCt
-----END PGP SIGNATURE-----

--upeyyhtq7btyttw2--

--===============1419767141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1419767141==--
