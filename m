Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800F023ADC0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 21:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7C56E314;
	Mon,  3 Aug 2020 19:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB53C6E314
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 19:48:52 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6025320672;
 Mon,  3 Aug 2020 19:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596484132;
 bh=YecuTPfNnruj05nThOLiKPrbUJy+kBwBZWv1W8ECBMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mu4qefFN7nZUutfbKanW6f20gjy2s6IGlJiWd6FOfB+4VDB+LUOdErD1DyJfR90T0
 uu6UKdv18UYzWydnSVbZPg180wwI1cjH3d6sl1LnvaM1HHhNLObiNsrNLjFqWukCbG
 A0udCvdTcN5SqV2MnKyMBes+PfQz2aVfeXufuZU4=
Date: Mon, 3 Aug 2020 20:48:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH] regulator: rpi-panel: Add regulator/backlight
 driver for RPi panel
Message-ID: <20200803194831.GF4502@sirena.org.uk>
References: <20200729214645.247185-1-marex@denx.de>
 <20200730155944.GA1477410@ravnborg.org>
 <87447ebd-2838-c6bb-1dd4-28104f09dbb9@denx.de>
 <20200730191300.GJ5055@sirena.org.uk>
 <5cfc1d07-c8ce-47d7-8763-1efa0316d05a@denx.de>
 <20200801011653.GD4510@sirena.org.uk>
 <20116f3c-64d7-0f52-b38a-56c62398a5e9@denx.de>
MIME-Version: 1.0
In-Reply-To: <20116f3c-64d7-0f52-b38a-56c62398a5e9@denx.de>
X-Cookie: They just buzzed and buzzed...buzzed.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2102407120=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2102407120==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7cm2iqirTL37Ot+N"
Content-Disposition: inline


--7cm2iqirTL37Ot+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2020 at 09:21:25AM +0200, Marek Vasut wrote:
> On 8/1/20 3:16 AM, Mark Brown wrote:

> > I see, so this is the remaining bits.  Perhaps the binding might help me
> > see how things fit together - I don't know anything about the system
> > really.  It's not doing anything that looks like it should cause the
> > framework too many problems so I'm not overly worried from that point of
> > view but equally well it's obviously not ideal.

> See below:

OK, basically I've got no real objection from a regulator point of view
- it's not ideal but not the end of the world.

--7cm2iqirTL37Ot+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8oag4ACgkQJNaLcl1U
h9BXSwf/cP6YNqYbxvzH9nOdOTJbPpWxTAJCpo/nFBT07Q4yXDwccBAXfEGitgk/
ElnHDu5U5HgOad0QkLlOM3ZtjVKrpUeCraMaIP5OpaElzDVccYXnzdj6qljl/mKV
QuxbRaDPiO6clWG10v1BTRfuEdKuWGUqF6cPSbIArmgXGBlvB36vOx1oZLelZXIO
y3S3oB897x36qdsyyBleLVaTV1drWNdnfjjA0naaUmaIKX2EzoOUAo/bADzS63Em
al30+7ETK9dJI/JKai4toT6YK5ztIgzdYFTxSS22x/8sv1tYtmS8u0mmYlBEhRA9
ZZlSdHggg5Dd+BG9x5jimuQoC/MIeg==
=EtBw
-----END PGP SIGNATURE-----

--7cm2iqirTL37Ot+N--

--===============2102407120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2102407120==--
