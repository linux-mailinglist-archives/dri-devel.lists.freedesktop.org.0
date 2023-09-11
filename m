Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999579A78C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 13:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFFB10E2C7;
	Mon, 11 Sep 2023 11:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A847710E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:14:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00AB461050;
 Mon, 11 Sep 2023 11:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102F3C433C8;
 Mon, 11 Sep 2023 11:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694430888;
 bh=YFgY0/Om0vxSLqBs69K8BlfP82SdlHtGV7vXw++h7iU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CQsmaCHFbwAhdl16LZOYhAp/yu8gRTRMHLmEPwot0ZaWs7tyAZoWDmbzzOI9fqePS
 5mS5J8dEw/H11FH9Y0HZYJLivCtlcXiiFJFbSDi0rDzV4wxrh/SmMZ3do4yCf/S3xI
 vACzulw39T4csrhfC0/Qc/uUIwIij5M/GVapIU/+HRfLIvVfaJUfhADm5MwmZY3I8b
 0W67tzu2Lf0C3W2gC1mJYLJ7VTdaJxtP/gSwwKQIesfMo4sOYLXYi8jTtL+OAAso0G
 z3wgMA26vnHwj0ChwFERVQSllHpjGqUGy1O0vh9fppMVOOs4FHB849KbDfYXKFTTEB
 53kQnsLx0mf+Q==
Date: Mon, 11 Sep 2023 13:14:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Message-ID: <wacxp5imwch76fsacp4uim3d526t5nmaqldnhkk35q6xb7lyr7@souh4bvhs3vv>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
 <d19e0242-da31-1e48-8ff8-7381530bd193@redhat.com>
 <3fba00ec-d4bc-e7f9-4a7c-8a6a9141a591@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iesx3fq6qz4prfuq"
Content-Disposition: inline
In-Reply-To: <3fba00ec-d4bc-e7f9-4a7c-8a6a9141a591@suse.de>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iesx3fq6qz4prfuq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 05:37:27PM +0200, Thomas Zimmermann wrote:
> > > Please note that the kernel's conversion code uses memory allocation
> > > of intermediate buffers. We even recently had a discussion about
> > > allocation overhead during display updates. Userspace can surely do
> > > a better job at keeping such buffers around.
> > >=20
> > > And finally a note the hardware itself: on low-end hardware like
> > > those Matrox chips, just switch to RGB16. That will be pretty and
> > > fast enough for these chips' server systems. Anyone who cares about
> > > fast and beautiful should buy a real graphics card.
> >=20
> > There are still sysadmin users that occasionally have to browse the web
> > to find answer, or read their mail in a GUI client. It turns out that
> > rgb16 is pretty ugly for today standard, and buying an external card
> > would be a bit too much, and won't work for remote control.
>=20
> I'm sure sysadmins have a computer for work with a decent GPU and don't n=
eed
> to browse the web on their server systems.

If your expectation is that there's no capable display stack running on
those systems, what user-space component would you expect to optimize
the format/transfers like you previously hinted at exactly?

Maxime

--iesx3fq6qz4prfuq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZP72pQAKCRDj7w1vZxhR
xWiTAQCyTaEEr8ewXRotvjT4yOEgOH9p8bntGwkUK//oPEqxMgEAh/UP0N5x9iSa
mCNZQl6tJfxaxdPWt9MGfWoGVSTtsg0=
=lZ5c
-----END PGP SIGNATURE-----

--iesx3fq6qz4prfuq--
