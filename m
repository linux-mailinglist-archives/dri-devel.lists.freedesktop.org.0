Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69135802DBF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDD910E2FB;
	Mon,  4 Dec 2023 09:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01EA10E0AA;
 Mon,  4 Dec 2023 09:00:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E73760F51;
 Mon,  4 Dec 2023 09:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DF7C433C8;
 Mon,  4 Dec 2023 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701680441;
 bh=NHppATTzdQBKuC3hOQxnsiBMV4fyRqrL8p5HNiVQcps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oWgSsA9rji0i+syjJ1FMaR5URFRP6mcka0q1wHVgE7RPFcqSxof/st2w8qfn0a6qG
 3mvlHegu1S2+fVaP5C2pXSgYn8pLTO8AOcE3SRZmxwTX5DkRjPyhyVFINZ0SMd/V14
 xlP8VOeOQ6jlAWE+9Zx0NcTgNqTYq78Kpug5b5ko0pAZHZtH/UbP7ZaHqadee4LBIZ
 Qb+sZzzsfS8KYypN8WQMRUaKhyibq3xf+Q3gPgbn0gNjnTvpaPzDXj/8nXcENnVoPe
 /b+A72Ozx49IoCiOighJzQy3rbKlgVPzuwoCrrpGPZsqQi6jNGbH6wmV9dMMwJylMN
 rQff2873D5alw==
Date: Mon, 4 Dec 2023 10:00:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
Message-ID: <hinlseiuf2l4y2tbaoasx7slaoewnoil2fitavgarrekxhhzte@zood7lj6sbn5>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
 <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
 <CAA8EJpom-guy0p_u2kLhXgLZnJaVXCXaHAUGhv2EH=xyrHtL6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d7zlmb36ttt6m7sm"
Content-Disposition: inline
In-Reply-To: <CAA8EJpom-guy0p_u2kLhXgLZnJaVXCXaHAUGhv2EH=xyrHtL6A@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>, sebastian.wick@redhat.com,
 wayland-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, ppaalanen@gmail.com,
 Sean Paul <sean@poorly.run>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--d7zlmb36ttt6m7sm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2023 at 08:10:31PM +0200, Dmitry Baryshkov wrote:
> On Sun, 3 Dec 2023 at 14:15, Simon Ser <contact@emersion.fr> wrote:
> >
> > On Saturday, December 2nd, 2023 at 22:41, Dmitry Baryshkov <dmitry.bary=
shkov@linaro.org> wrote:
> >
> > > On Fri, 27 Oct 2023 15:32:50 -0700, Jessica Zhang wrote:
> > >
> > > > Some drivers support hardware that have optimizations for solid fill
> > > > planes. This series aims to expose these capabilities to userspace =
as
> > > > some compositors have a solid fill flag (ex. SOLID_COLOR in the And=
roid
> > > > hardware composer HAL) that can be set by apps like the Android Gea=
rs
> > > > test app.
> > > >
> > > > In order to expose this capability to userspace, this series will:
> > > >
> > > > [...]
> > >
> > >
> > > Applied to drm-misc-next, thanks!
> >
> > Where are the IGT and userspace for this uAPI addition?
>=20
> Indeed. I checked that there are uABI acks/reviews, but I didn't check
> these requirements. Frankly speaking, I thought that they were handled
> already, before giving the ack. How should we proceed? Should I land a
> revert?

Yes

Maxime

--d7zlmb36ttt6m7sm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW2VNgAKCRDj7w1vZxhR
xRD9AP9L9eZW/RH/TvF7TEDGDHV3nZjFxt4l2zx4F6EAb9QfXQD/SjP0MhyZzZ+W
nqFhDLoXMhCDz5x+hbAy5SgVdjLrjwQ=
=wTnT
-----END PGP SIGNATURE-----

--d7zlmb36ttt6m7sm--
