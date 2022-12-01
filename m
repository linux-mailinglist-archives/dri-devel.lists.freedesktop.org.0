Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF32F63F2E7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 15:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0181F10E5C8;
	Thu,  1 Dec 2022 14:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0AA10E5C8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 14:32:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C6E5DB81F59;
 Thu,  1 Dec 2022 14:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC9FC433D7;
 Thu,  1 Dec 2022 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669905140;
 bh=Pa7QHT6VY6qiNPXdsWcXWv9pGFktxtE5G6MoQvhx4Z8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UFjzqB1oow2Ilr4w5kCuaGgxtfDsJSzGpZQzISOO8nY3wcnV2W/vuH62B38mi0CI5
 AC+zfdJf+TdYyErkzEqNQ9QBHL5vRPgRiDIxLIOLdoCtpBvpnVn52N4GDiGm+o8Zn3
 ioKmk2DonkXrcg1SaVJNwBpr2j6qB1VyW6SKqa7kQXiFBOJfQX6nCTcdM0M+P8s91+
 hCuaLKngXCi7DIKbniEO1Ks5fBeEDRuAHfiXmfUc5AWbkHcGzitbq+CB2AG/m2z+hM
 hxtwRrc4X1QydJl3CMU+HFHsXNAV/FRAvJD8BgnLvTelMJwfC/zqTZ8wkT58ss+IJa
 +eJ+LYeMkPz3g==
Date: Thu, 1 Dec 2022 14:32:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Message-ID: <Y4i672D3GHu2xPS5@sirena.org.uk>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
 <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
 <20221201141642.uvonbrny4rhuacl5@meerkat.local>
 <dad6891d-5ca2-b849-b504-1a37b4741886@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EDoGb3EXLIQux063"
Content-Disposition: inline
In-Reply-To: <dad6891d-5ca2-b849-b504-1a37b4741886@suse.cz>
X-Cookie: Leveraging always beats prototyping.
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
Cc: tools@linux.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--EDoGb3EXLIQux063
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 01, 2022 at 03:27:32PM +0100, Vlastimil Babka wrote:

> I usually do that with git send-email and a custom --cc-cmd script, but
> additionally it sends the cover letter also to everyone that's on any
> individual patch's Cc, so everyone gets at least the cover letter + their
> specific patch(es).

> But that extra logic could be optional.

Yeah, without the cover letter if you've just got an individual patch it
can be unclear what's going on with dependencies and so on for getting
the patches merged.

--EDoGb3EXLIQux063
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOIuu4ACgkQJNaLcl1U
h9A65gf/Zbk112vjsapvsgcV3MZokQBwxTZ00puZdF11qDplABt4WqrH2fk+GxLb
fhPQu0jW8gfMtmORTjWQAFS+f57NxWLoxghmxAKZWw8JpZm0UTo3lx77WkO49aOP
8L3CZSB5ljty8Cert5m1wuIzfsNLA7EcM+WQokhECHaN8mrqpUHiQ8j31fqHJybF
QjH9ZNsYwDFy+vHvF5P0bqONvSmIvKwd9/gl0ChEbXHkZD1nZkaaUF+5DNsA5xQA
z4qF71ee0BBDPlysmO3vBn1fQ4/D97SoDfTU6lTwXwW0mooTF9KpZVUBFZrvqVwW
quFqZoDI+VAXJjpWFXZN9V6c3n4ssw==
=aYf2
-----END PGP SIGNATURE-----

--EDoGb3EXLIQux063--
