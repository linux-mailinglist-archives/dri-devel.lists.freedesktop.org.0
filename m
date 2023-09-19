Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568617A6642
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 16:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350DD10E275;
	Tue, 19 Sep 2023 14:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vulcan.natalenko.name (vulcan.natalenko.name [104.207.131.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C475810E24F;
 Tue, 19 Sep 2023 14:14:35 +0000 (UTC)
Received: from spock.localnet (unknown [94.142.239.106])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id EB91D1505CD8;
 Tue, 19 Sep 2023 16:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1695132873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IdvszLJqDb9chviIGv2JahG+XK2N5WpvCdqRZN6V1vs=;
 b=bTLN2a9myURzPaJ6GKtqPFr6h3Qa8BPmjnUMuloG+KyGz6duaouw0mrOb86sdeeG3no0Fc
 WY+pdAWKvCRaLy0jVMU3+XdVl20KMcO2X7vuYEChqaFQ08lmNq6p+CgBbo4q5TsHKqBnGc
 PceUAcBNWH6O5LxCC7wZ+ZeQ2Yv2CEw=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [Intel-gfx] [REGRESSION] [BISECTED] Panic in
 gen8_ggtt_insert_entries() with v6.5
Date: Tue, 19 Sep 2023 16:14:21 +0200
Message-ID: <3565884.aeNJFYEL58@natalenko.name>
In-Reply-To: <ZQmqF7oyrZ32Qdhb@debian.me>
References: <4857570.31r3eYUQgx@natalenko.name>
 <2612319.ElGaqSPkdT@natalenko.name> <ZQmqF7oyrZ32Qdhb@debian.me>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3572117.44csPzL39Z";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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
Cc: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Linux Regressions <regressions@lists.linux.dev>,
 Matt Roper <matthew.d.roper@intel.com>,
 Linux Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Nathan Chancellor <nathan@kernel.org>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart3572117.44csPzL39Z
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
Date: Tue, 19 Sep 2023 16:14:21 +0200
Message-ID: <3565884.aeNJFYEL58@natalenko.name>
In-Reply-To: <ZQmqF7oyrZ32Qdhb@debian.me>
MIME-Version: 1.0

On =C3=BAter=C3=BD 19. z=C3=A1=C5=99=C3=AD 2023 16:03:03 CEST Bagas Sanjaya=
 wrote:
> =E2=80=A6
> > > [1] https://gitlab.freedesktop.org/drm/intel/-/issues/9256
> >=20
> > Bagas,
> >=20
> > would you mind adding this to the regression tracker please?
> >=20
>=20
> Will add shortly, thanks!

Thank you.

Please consider correcting the title though. Lenovo T14s (Tiger Lake) is no=
t affected.  Affected are: Lenovo T460s (Skylake) and Lenovo T490s (Whiskey=
Lake)

=2D-=20
Oleksandr Natalenko (post-factum)
--nextPart3572117.44csPzL39Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmUJrL0ACgkQil/iNcg8
M0vMshAAmTYLH8DFD+m7rWIIQquwNlbxqUD0Q/6YwgXkLSbySgxN2twgg4FXTPjd
sw7ru11rdJIH7kxqiigqdVX0/TDO9ErGVNJSdo3u2jQepWZRbhXy051iioi0s2Nc
ASstkQl3xirIhPsTeZXpQHkZtufN1ERg4RiATs15MCWzJJC7+igQedWiHJLjYJjy
V8zWCWR6NbE9Eik5A1ZXHsOE7qbpM0pEofyeaNVSdduLrwULILreEu9hbPIHG8/O
CHKju3zU+k+LHN9xAldQLL2eDA7BrAkIfMj514dkXtrAbLDVVUXvEHTAEFRx+76e
RMokVQcTo/4dNb3uGfezA8wl537qOu/tAsuie9a7zL9LH6gYq4AbsiAUt0+iq3yY
MZoNdMYTnUAN6ghK2wwQfIDjOD1kjYynKCkQ+YFT/DmUbNb72nUBXUywkDSshs0L
bKeOuawoH7uWhViWHTmKFOguFI23vKBd+uj1/d5UPU3QAp000ek168MDrkZSE8w2
S4b+RJ5YTcp7Bx1ELCBUzHw75PEmiAhRnUE5xkdhZeH1Q2nyQuW++GIR5RmYQGtf
Jh9s77DlzdbqZ8rYy0f7AZjsQZYhB+Z6ZUGrcDc1qxkNUzV9jGlAuCzN28LH5LOD
hVTRD08dz0XX6xw/BTLcyHfGNY0paKRCJUP4rXuQq3YL7DCfwLE=
=YpdN
-----END PGP SIGNATURE-----

--nextPart3572117.44csPzL39Z--



