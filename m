Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0621B806939
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 09:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E40210E056;
	Wed,  6 Dec 2023 08:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C211210E056;
 Wed,  6 Dec 2023 08:14:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1500261ACE;
 Wed,  6 Dec 2023 08:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2E6C433C8;
 Wed,  6 Dec 2023 08:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701850488;
 bh=ECvUPXaxDahnjrvxTOPA4LHdQIbds1Vq8tr+lgMn6iU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJPT280Bp2c35reI7j/CneCSeRdqkP/kmmsw+yXKVPxyUpKHmpffnxPQM7dcZIZXz
 Zb2w/vSKNoP5KE9LGE/c4UnwzOHVJXmIKVyHbSWBsES0rlCKe5NFtArhKR5TWrjevv
 Yx3c64IOO/UWWIfJND6bhN1W/w4Gc/97gcXyVbRAwJc5Ps9uKtRPivTgAwpumBYTsb
 ZyEBEt2AfnJj1JypKonSFVjNYV6z+ZIOoriWuCxfkCd1WgJ+5YkxdLkQixap7jf1Hy
 pIN9FdoDM+AId0WjfyNvoXezCN0xz9Imk4b4BRwYdJIB4Z8sqFucSxiw8/PQiNY9dX
 zu3locPC5EL8g==
Date: Wed, 6 Dec 2023 09:14:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFT PATCH v2 04/12] drm/nouveau: Call
 drm_atomic_helper_shutdown() or equiv at shutdown time
Message-ID: <6va36dxrtvniondowm73ehuxp7pbo23bssuob7trmbq22rq4lg@ug3i7abmri3a>
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.4.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
 <2f7fbd1b606b4d08b8c8c6eefff5898c8faa697c.camel@redhat.com>
 <CAD=FV=XkeicQ3Gq4yaFtXsF7yM_7pXbpNKB56DbOwBmsEsrF_g@mail.gmail.com>
 <CAD=FV=XDhkstFX3e2qPGeYGkFWefRMH24BjNgRujBX5PQyE6MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="stsdakm3fnwfmzzj"
Content-Disposition: inline
In-Reply-To: <CAD=FV=XDhkstFX3e2qPGeYGkFWefRMH24BjNgRujBX5PQyE6MA@mail.gmail.com>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--stsdakm3fnwfmzzj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 12:45:07PM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Fri, Nov 17, 2023 at 3:00=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Sep 22, 2023 at 2:06=E2=80=AFPM Lyude Paul <lyude@redhat.com> w=
rote:
> > >
> > > actually very glad to see this because I think I've seen one bug in t=
he wild
> > > as a result of things not getting shut down :)
> > >
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > Tested-by: Lyude Paul <lyude@redhat.com>
> >
> > Any idea of where / how this patch should land. Would you expect me to
> > land it through drm-misc, or would you expect it to go through someone
> > else's tree?
>=20
> Still hoping to find a way to land this patch, since it's been
> reviewed and tested. Would anyone object if I landed it via drm-misc?

Nouveau isn't maintained in drm-misc, so I would expect it to go through
the usual nouveau tree. Lyude, Karol, Danilo?

Maxime

--stsdakm3fnwfmzzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXAtdQAKCRDj7w1vZxhR
xRMQAQCWR+dGU9QsUAh5lhsGtHlIvbeZ8HKnfwtiDyQDjYRfmAD/cBVkFywpfJZB
pjlMXQGCtMREy8SFYZ6QzfGK508D/A8=
=jJKl
-----END PGP SIGNATURE-----

--stsdakm3fnwfmzzj--
