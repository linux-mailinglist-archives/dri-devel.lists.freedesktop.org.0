Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA9161CD5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 22:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F5D6E0FD;
	Mon, 17 Feb 2020 21:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 965976E0FD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 21:39:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E721FB;
 Mon, 17 Feb 2020 13:39:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73E253F703;
 Mon, 17 Feb 2020 13:39:13 -0800 (PST)
Date: Mon, 17 Feb 2020 21:39:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [RFC 1/9] regmap: Add USB support
Message-ID: <20200217213911.GV9304@sirena.org.uk>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-2-noralf@tronnes.org>
 <20200217121149.GB9304@sirena.org.uk>
 <f9cb6d05-300b-f6c8-8f88-2e6c014c1ba3@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <f9cb6d05-300b-f6c8-8f88-2e6c014c1ba3@tronnes.org>
X-Cookie: There was a phone call for you.
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, lee.jones@linaro.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0271651967=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0271651967==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4QzzFpAwbwI4hdN6"
Content-Disposition: inline


--4QzzFpAwbwI4hdN6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 10:33:58PM +0100, Noralf Tr=F8nnes wrote:
> Den 17.02.2020 13.11, skrev Mark Brown:

> > This looks like you just don't support a straight write operation, if
> > you need to do this emulation push it up the stack.

> After going through the stack I realise that I have a problem.
> What I have failed to fully comprehend is this regmap requirement:

> 	if (val_len % map->format.val_bytes)
> 		return -EINVAL;

> There will be a spi and i2c driver down the line which will transfer
> buffers of any size, and having to use 8-bit register values will not be
> great.

Out of interest why are 8 bit registers going to be a problem?

--4QzzFpAwbwI4hdN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5LB/8ACgkQJNaLcl1U
h9CjnQf/WqXHZ+HYhaq9rua4mPrl31R3MHfe58SVBofCsrAp1awFn/nzYpOgGTj3
GYD5KH9FgSG9icZTx7RP8+0k00O8yEsuLLy+1lf72mbid6iE9VxwdhYWfAKHHeV+
mTXQcSoCJmXzOrfLN1cZvTihVjAqfJTZieaywu/BJhqOOGOPmECyhAMhIXHok8Q/
XvP/pRS5RiXWD/RtEfM2rEP6e2c1X7bNjyiRrSJ75AnnhKq4yYdWR7AoUaSckn6x
W+djRroZ+Rgel+Mv8Ts+WFDQNRWViXSwd58LUK/qAvItiTjz3aA997sx9LDxdzJ8
hjS3crc2kuvqYYvTn0r3FFi/6zQldg==
=+16T
-----END PGP SIGNATURE-----

--4QzzFpAwbwI4hdN6--

--===============0271651967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0271651967==--
