Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B07DB78D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5EA10E27F;
	Mon, 30 Oct 2023 10:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A787610E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:14:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0A2D611B4;
 Mon, 30 Oct 2023 10:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3313CC433BA;
 Mon, 30 Oct 2023 10:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698660841;
 bh=/PZ0DPuK2+dRsvqqflmCZcgi0jdZthU0+owMGrtV4cg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dI795qS1D0EIxs3JKE8SCw58aJkHo97jOjXG+D2oG4MkkuaKjYhERfaJIeD8aahxp
 tVY7IYdfe2q7DSQRYpGtTEC/vGS10Wy+3C+GGkijUEgQvnptLd1I9xdVp4A2mkmCXP
 VpV3d3s1iFlzXfFO5pT9zrx13nAb2b4DVqR85DhcOunG10BcoVO9SCnlTl1q5hJTpF
 sGxvotAhIdsqKTzcC0j2BMcToRrQ8XW0NKic20oewLoAQWxheoKHAd3vS5CmIGPbVY
 M9cdgXJvWB7AJVTa0G7B3t32doouJMR7bm0rUT/FaxipDKDqi4ilDnzroKp1ZlH93Z
 X5ilr+kp7l+rg==
Date: Mon, 30 Oct 2023 11:13:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for
 it66121 HDMI transmitter
Message-ID: <jcdzlawpmlllfzvn6rcninhlh3ltc6hew6s6gfzzc4dnjpu4ul@ohjrl4cleyfp>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-3-suijingfeng@loongson.cn>
 <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
 <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4esgxz7yzjhi7nzs"
Content-Disposition: inline
In-Reply-To: <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4esgxz7yzjhi7nzs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 30, 2023 at 05:42:28PM +0800, Sui Jingfeng wrote:
> On 2023/10/30 06:53, Dmitry Baryshkov wrote:
> > On Sun, 29 Oct 2023 at 21:46, Sui Jingfeng <suijingfeng@loongson.cn> wr=
ote:
> > > The IT66121 is a DVO to HDMI converter, LS3A5000+LS7A1000 ML5A_MB use=
 this
> > > chip to support HDMI output. Thus add a drm bridge based driver for i=
t.
> > > This patch is developed with drivers/gpu/drm/bridge/ite-it66121.c as =
base.
> > Please use the original bridge driver instead of adding a new one.

FTR I agree with Dmitry here, duplicating drivers because it's easier is
a show-stopper

> I'm agree with the spirit of code sharing, but this is nearly
> impossible for non-DT system.
>=20
> Because the original bridge driver(say it66121.ko) is fully dependent
> on the DT. UEFI+ACPI based system can not use with it.
>
> Our I2C adapter is created by the drm/loongson.ko on the runtime.
> The potential problem is that *cyclic dependency* !
>=20
> I2C adapter driver is depend on drm/loongson
> drm/loongson depend on drm bridge driver (say it66121.ko)
> drm bridge driver (say it66121.ko) depend on I2C adapter to setup.
>
> This plus the defer probe mechanism is totally a trap,
> incurring troubles and don't work.

I'm sure all those issues can be fixed :)

Maxime

--4esgxz7yzjhi7nzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZT+B5gAKCRDj7w1vZxhR
xUu+AQDibs4qYnlNpi+9fWtEDzq0jcK1A42LnQIh+N0JBcu0FwD+PtS1h/A0YLqC
lI4n/tM1VS1hmoORSLbIFj6d0loRaw4=
=n3AP
-----END PGP SIGNATURE-----

--4esgxz7yzjhi7nzs--
