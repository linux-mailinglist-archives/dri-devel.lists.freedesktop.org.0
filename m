Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31D63C656
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 18:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBB310E0F4;
	Tue, 29 Nov 2022 17:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D4B10E0F4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 17:22:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9C3E6185F;
 Tue, 29 Nov 2022 17:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC4EC433D6;
 Tue, 29 Nov 2022 17:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669742531;
 bh=Lb4SESpHMOhPIMCGrj+WFGcavPsOts6fRzahyn7Voxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PjTj6DhMx9pbN6mtsEBac0RpBaIgx0ceKlawxs+e723Pfw3jj6mOMdV77XaMIhWfg
 hMb7PgKA0m0sm0En1h6+9dw4XaBiiNvZVmKq07dAcGOWUGrcgeJ2QqpNHHoGUlrQu9
 r9eDvvbD5OUdP0M940aNyZA+36L2jgE70sgKTYXzQ2sOxiFDH2SEJSG8OpWSz64NIE
 UipxIbRQ5UAihMlMTwBWPd4RJCIC3wrwGEikJjdG+i/cw3ILVrc0ylT6SbE9ErI9CM
 BrElCNX+gkrCcjvJGwSZnuiPFUkKNY+rdzX5hV72TeJw81iawEU2UyEGTM0v5ZySqv
 RkfuEDuUxjSpg==
Date: Tue, 29 Nov 2022 17:22:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qzMUDJamuQN8FqwP"
Content-Disposition: inline
In-Reply-To: <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
X-Cookie: An apple a day makes 365 apples a year.
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
 Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qzMUDJamuQN8FqwP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2022 at 03:07:22PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Fri, 2022-11-25 at 12:18 +0000, Mark Brown wrote:
> > On Fri, Nov 25, 2022 at 05:44:11PM +0800, Jiaxin Yu wrote:

> > I'm a little unclear why this is being implemented as a DAPM
> > operation
> > rather than having the driver forward the PCM trigger op if it's
> > needed?
> > Or alternatively if a DAPM callback is needed why not provide one
> > directly rather than hooking into the trigger function - that's going
> > to
> > be called out of sequence with the rest of DAPM and be potentially
> > confusing given the very different environments that trigger and DAPM
> > operations run in.  A quick glance at the it6505 driver suggests it'd
> > be
> > happier with a DAPM callback.

> Let me describe the hardware connection about mt8186 with it6505(hdmi)
> and rt1015p(speakers).

>                        =3D=3D>it6505=20
>                      =3D=20
> DL1(FE) =3D=3D>I2S3(BE) =3D
>                      =3D
>                        =3D=3D>rt1015p

> They shared the same one i2s port, but we'd like to control them
> separately. So if hdmi-codec use the PCM trigger op, whne we turn on
> the speaker, hdmi-codec's PCM trigger op is also executed, resulting in
> sound on both devices.
> Is there another way to control them separately? Thank you.

If you just need power control for one or both devices then the machine
driver can add a _PIN_SWITCH() on the output of the device, that'll
cause DAPM to keep the device powered down when not in use.  That should
work well with the suggestion to provide a DAPM callback instead of a a
trigger operation.

--qzMUDJamuQN8FqwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOGP7wACgkQJNaLcl1U
h9DZ8gf+PisMggrT6FuPtNTRpRKtS7VgpBbYiJRYI4/X3DFs3Vlj30D150dJWC/g
WqIhVaoDn6R5wsvhGw9YmtJKNT/A2SKeoUGksnstpvkd9KXkCeaKgfiFL877s9mK
+YHxZOH6Eb/w5XFAEo+3TEr+LEDj6ooKflpE/DEXs1rfcVPr0wwVdLoXp1I7b6jw
jQkRxRPfPSaszug+TYwzb6aXlXl2iAerXKo8pSkjSYI/GbLSEUb7Od/tCgoIXOmz
hP2ksKt/u+NNptKSgXMv6ZMDTyRcioBZPUZgDhBrOWQ6hwxEDD9XioMA/6tSRqtE
zRqubSrRrmnLXC2AeI1DJ0NKBo1gjQ==
=qgcp
-----END PGP SIGNATURE-----

--qzMUDJamuQN8FqwP--
