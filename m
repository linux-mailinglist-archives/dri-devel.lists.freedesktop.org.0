Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D651D812
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 14:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB34112146;
	Fri,  6 May 2022 12:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF95112146
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 12:42:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B0C6FCE3603;
 Fri,  6 May 2022 12:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2363C385A8;
 Fri,  6 May 2022 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840965;
 bh=dialwtzqCFi0oRmhI+4Glifj+pcjDvGDIgt5F7nCefI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mrVMJ62kIqIIOcOD9z3HOcPJ0uUhqxWYRT+YbwINRL5q0mR8ZJPKENnK7l3wWQB6a
 dWy5fvq0x8p0SLqT3D4PdLakjpI9IdXZiY3qKnE33gZzm/IEjfStDukdiTFPmgGFk0
 gJ+eEIY+v5RCqtDK3FpjUnR3PXrwPhurtyGB9377O5zvUNQJa51qRZGjDWXz5QeGOj
 qARQpDoMPT7imEofUkRTQN3su6SXxyQb0rSqJWOa068lDHiOVwuySZYqOAV9qfnsT7
 zm6nXV1W53fw8baunmYw41HOfWt+spCTrAxs8uvJhPSLvyJWS+D0/18TQkzkYz+a17
 Sok3QOJQSdoYw==
Date: Fri, 6 May 2022 13:42:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: (subset) [PATCH 1/2] [RFC] regmap: Add bulk read/write callbacks
 into regmap_config
Message-ID: <YnUXvXmDgLccTRNP@sirena.org.uk>
References: <20220430025145.640305-1-marex@denx.de>
 <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
 <877d6zkjw5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xw3SCwlahQq3ujNI"
Content-Disposition: inline
In-Reply-To: <877d6zkjw5.fsf@intel.com>
X-Cookie: <Culus-> libc6 is not essential :|
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
Cc: marex@denx.de, maxime@cerno.tech, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, sam@ravnborg.org,
 jagan@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xw3SCwlahQq3ujNI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 06, 2022 at 01:58:18PM +0300, Jani Nikula wrote:

> Hey Mark, sorry for hijacking the thread a bit. regmap.h seems to have
> comprehensive API documentation, but there's very little in terms of
> higher level documentation that I could find. Is there any?

Not outside of the source.  I did a presentation at ELC-E ages
ago which you can probably find but I'm not sure how much it
would add.

> I've been toying with the idea of adding a regmap based interface for
> accessing Display Port DPCD registers, with caching, and regmap seems
> like it's got the kitchen sink but I find it a bit difficult to
> navigate...

The bus code is generally very thin so you shouldn't need to
worry about what the core is up to much if you just want to
support some bus.  If this is a bus that has registers at
hardware level then looking at something like regmap-sdw.c should
be helpful, for something that's just a bit stream at the bus
level then something like regmap-i3c.c is a simple example.

--xw3SCwlahQq3ujNI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ1F7QACgkQJNaLcl1U
h9B1jQf/Rz2acXrC8ZLbV49VQa5SRjkHXwHjGWv2xzpOmvLvG3IurDqfZZ0MYUVY
zW5EWKSEUaBEoO12YTeIiDIzx21d1PBz/EvY49mRojTK22uz/BWZYQWwoSMi4h9J
IChClOqxZ2dOWbOtPClwXMXcGClDdqmj4vpKiP6z+0nsg4MD1ohSQFceebkKbPQX
JQtFd+d15OpIIBnI3gAcUaRVpDTDKaZ0aO1I+kuiOuPISi/1xvhxCvEorCnZgNFj
wVFTUIXV7j0qV8yXEOg8tbIJuuffoPV7thUCEkREGadUIn8Z4Piaqd/VVsnxK47J
DEQ42+ZN8KIY6r+gQ9I9vET407Sr9A==
=DBJg
-----END PGP SIGNATURE-----

--xw3SCwlahQq3ujNI--
