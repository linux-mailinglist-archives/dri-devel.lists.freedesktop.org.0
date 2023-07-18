Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D46757A60
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CAC10E31D;
	Tue, 18 Jul 2023 11:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EBE10E313
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:24:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BF45614EF;
 Tue, 18 Jul 2023 11:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8F7C433C8;
 Tue, 18 Jul 2023 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689679470;
 bh=JRwdY5Kht7efaefdL+6X58dgoVjVQFMxAAZQII9r9us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVGuaN1FbdUIblV7AgIBLxeRuavW0GTinYFRjUPw6EjBTUSsLgaa75+Yh0dQOJx8E
 ZHp89bzJjOCPvED4zWz44WtBWgMe05i/WIcbIO4FnKUIqjne3JWMb7MxRT/JJVKOy8
 4yWsUQNT2JWMQvijsXc+G3+eIFFTVIHnySbqahq98j87fkb/Q3LbjBvn4/iI43TDqi
 9/wo1bd1AI07EcfpPLcPWIYRhZ7mfYfW7x4FuAwwU6iMEFjPbIsuxqLf6mU4AtUsfs
 /XDm3wdFISriTpFwVQQLjUIHKrTQbv72dGY2gOvk4MtxSPpYme7FLm37JE1HZ9GAWE
 DXxivT+/jK7yg==
Date: Tue, 18 Jul 2023 13:24:27 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Message-ID: <qdrecp36jp34rrfwrrse4t7q626smyfddgzeozfjaovhemwoxa@nkg5ihejtzsr>
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
 <20230715-paramount-straining-6a486f8af20d@spud>
 <a86f6359706485cf595889a07e513e2b9fd6d71b.camel@imgtec.com>
 <4131759e-9474-48f6-cc05-67b6d4b6559b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b5n2dbrajkhgku5s"
Content-Disposition: inline
In-Reply-To: <4131759e-9474-48f6-cc05-67b6d4b6559b@linaro.org>
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
Cc: "hns@goldelico.com" <hns@goldelico.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Sarah Walker <Sarah.Walker@imgtec.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor@kernel.org" <conor@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--b5n2dbrajkhgku5s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

To expand on what Krzysztof said

On Tue, Jul 18, 2023 at 01:10:14PM +0200, Krzysztof Kozlowski wrote:
> On 18/07/2023 13:08, Frank Binns wrote:
> >> And this
> >> items:
> >>   - const: gpu
> >> can just be
> >> const: gpu
> >>
> >> Although, if there is only one interrupt this is probably not
> >> particularly helpful. Are there other implementations of this IP that
> >> have more interrupts?
> >=20
> > No, all our current GPUs just have a single interrupt. I assume it's mo=
re future
> > proof to keep the name in case that ever changes?=20
>=20
> Why do you need name in the first place? If there is single entry, the
> name is pointless, especially if it repeats the name of the IP block.

Generally speaking, if there's only one resource (interrupt, clock, etc)
we don't put any discriminant.

If you need to extend it later on for some reason, then you'll add an
interrupt-names property and you can either require it for that new GPU
or whatever, or fallback on the nameless on if no name was found.

> > As in, by having the name now
> > we can make it a required property, which I guess we won't be able to d=
o at some
> > later point.
>=20
> Why even making it required?

There's no issue with introducing a new property later on if a GPU needs
it. Then, you can either make it required only for that particular
generation, or you can have some fallback case.

Both are fine and easy to do.

Maxime

--b5n2dbrajkhgku5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLZ2awAKCRDj7w1vZxhR
xa5SAP9utBZxY/awdllxhKZ1cNxNw5Zy6auh5hgXK6ulOQUFkwEA0PHNZyhc2oHW
PzI0e+UqBJvc1u6xggP6JTnqAwhs5A8=
=q26+
-----END PGP SIGNATURE-----

--b5n2dbrajkhgku5s--
