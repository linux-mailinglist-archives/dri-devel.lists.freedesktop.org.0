Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF99A75A8FC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 10:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E106310E577;
	Thu, 20 Jul 2023 08:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C839810E577
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:19:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8222618F3;
 Thu, 20 Jul 2023 08:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BD2C433C7;
 Thu, 20 Jul 2023 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689841186;
 bh=LEYRH+AJ/QqdSK5qdoAlO00DoSaMelRgW8AFErE1MqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tkGb3cahMC7LB2H4YhamM4rwXjT8oJnHeRpVVyueojgXJW2B0DxyZGpDIy8pCt/+0
 DhLLw14nWEq8C8m4VR7xc2QLw/NFydVyQI8MqaVgwGoFNijBX3cWN1DMPqw5FwO/tn
 iqic0Mu2YdC4Qh+ZadX0Nj95QGhMKrYm7cdfXoptZqJXQQtBcN4HEFH04Otehm0BFe
 L9AOEAG38wLrpgt2rKv5z4hcgZU0acFJLnJuNCgK/xRREAYY75WURrHLnqgk5BQMnC
 saimZORIo2QFx/q5sx7q+OlCtwEjQ0f1qvquAxirFrq3OP3HlBD6gtKki+R5wA8QtX
 HZK43uGtPhlew==
Date: Thu, 20 Jul 2023 10:19:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 00/11] drm: kunit: Switch to kunit actions
Message-ID: <niypycsz25r4ywlxeula3cc3padis74hr5gbr2rjw4hrxag7my@f55p7c3unf7o>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <6a92cbb7-e98b-e93c-6e62-ceddd0dfbc06@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7kqetfm2msju6b5l"
Content-Disposition: inline
In-Reply-To: <6a92cbb7-e98b-e93c-6e62-ceddd0dfbc06@loongson.cn>
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
Cc: Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7kqetfm2msju6b5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 17, 2023 at 11:24:13PM +0800, suijingfeng wrote:
> On 2023/7/10 15:47, Maxime Ripard wrote:
> > Hi,
> >=20
> > Since v6.5-rc1, kunit gained a devm/drmm-like mechanism that makes tests
> > resources much easier to cleanup.
> >=20
> > This series converts the existing tests to use those new actions were
> > relevant.
>=20
> Is the word 'were' here means that 'where' relevant ?

Yes :)

> Or it is means that it were relevant, after applied you patch it is not
> relevant anymore ?
>=20
> > Let me know what you think,
> > Maxime
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Maxime Ripard (11):
> >        drm/tests: helpers: Switch to kunit actions
> >        drm/tests: client-modeset: Remove call to drm_kunit_helper_free_=
device()
> >        drm/tests: modes: Remove call to drm_kunit_helper_free_device()
> >        drm/tests: probe-helper: Remove call to drm_kunit_helper_free_de=
vice()
> >        drm/tests: helpers: Create an helper to allocate a locking ctx
> >        drm/tests: helpers: Create an helper to allocate an atomic state
>=20
> a helper or an helper ?
>=20
> Should this two patch be re-titled as following ?
>=20
> I search it on the internet[1], mostly using a helper.
>=20
>=20
>       drm/tests: helpers: Create a helper to allocate a locking ctx
>       drm/tests: helpers: Create a helper to allocate an atomic state
>=20
> [1] https://www.a-or-an.com/a_an/helper
>=20
> Sorry about the noise if I'm wrong.

You're right, I'll fix it

Thanks!
Maxime

--7kqetfm2msju6b5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLjuHwAKCRDj7w1vZxhR
xVLCAQDoNdtlkn5fkt9mcb8tWL1g65x5JVr74/QUKDCaIFJE2QD+KS/NvTymDxRR
OMve6TqPr0ZuQfx3+b4y1NYS9yX6cgc=
=jZNm
-----END PGP SIGNATURE-----

--7kqetfm2msju6b5l--
