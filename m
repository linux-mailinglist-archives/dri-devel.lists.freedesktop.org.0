Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1A92E516
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 12:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80CB10E162;
	Thu, 11 Jul 2024 10:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vG1Cvh4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAC310E162
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 10:51:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B72EACE0F9A;
 Thu, 11 Jul 2024 10:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9B2C116B1;
 Thu, 11 Jul 2024 10:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720695101;
 bh=jC+MUII/VUDTpAXbhDbSMtm7zmMjOZiHeuaNeYbo7uQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vG1Cvh4UThE+31U4IPJNPKGKyVZyd5g9xYKaiEaYwqzEey+IsiC1atQ9w0N/1nPrp
 +BUayBEDx6eC0OykLJlfe55FXrTBe+1QNaorEHGyu/8fnc06xhNSCf+fwied2zBtli
 T3UqS9TI3ZI1m/AR8JRW+H+TSMk1z/tk2T4YBPdj/TFFlp0gK6Y65V7ZpchlH+l9xa
 Mnukv2NufgPYlF0VpEw58ZB6YZZhJgF8VgScTuF2Cm0IiMnlXf/soEVxCcGWLHowkT
 f6ZxLV7q5Qvqc/AprabTo/5tafVj5eJy8UulZeqZuPEVRY0g1is2jDsDvpn1jgZEWa
 OxLClsFrmv3Lw==
Date: Thu, 11 Jul 2024 12:51:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Andy Yan <andyshrk@163.com>, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 javierm@redhat.com
Subject: Re: [PATCH] drm/rockchip: cdn-dp: Remove redundant workarounds for
 firmware loading
Message-ID: <20240711-therapeutic-space-bonobo-b4fed8@houat>
References: <109c6f19.2559.1907b817a99.Coremail.andyshrk@163.com>
 <0bf4701d98833609b917983718c610aa@manjaro.org>
 <2fd3aabd.785b.190914ec1a6.Coremail.andyshrk@163.com>
 <f0fb9feed2d9262bb4d7c8ade836af62@manjaro.org>
 <909d072.9028.19096c2429a.Coremail.andyshrk@163.com>
 <31062b80d3f9e11c339c400a70464f43@manjaro.org>
 <20240709-exuberant-tentacled-oxpecker-bd1ea0@houat>
 <b6d630447e6c69e913b76650d910f895@manjaro.org>
 <20240710-smooth-hypnotic-raccoon-b91fba@houat>
 <a30067db11e586d8eb2c124abe32052a@manjaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xsbqjcnrsppws4gq"
Content-Disposition: inline
In-Reply-To: <a30067db11e586d8eb2c124abe32052a@manjaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xsbqjcnrsppws4gq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 04:22:12PM GMT, Dragan Simic wrote:
> Hello Maxime,
>=20
> On 2024-07-10 09:13, Maxime Ripard wrote:
> > On Tue, Jul 09, 2024 at 06:36:08PM GMT, Dragan Simic wrote:
> > > > > > > As I already wrote earlier, and as the above-linked discussio=
ns
> > > > > > > conclude, solving these issues doesn't belong to any specific=
 driver.
> > > > > > > It should be resolved within the kernel's firmware loading me=
chanism
> > > > > > > instead, and no driver should be specific in that regard.
> > > > > >
> > > > > > IT would be good if it can be resolved within the kernel's  fir=
mware
> > > > > > loading mechanism.
> > > > >
> > > > > ... we'll need this as a systemic solution.
> > > >
> > > > The general policy has been to put drivers that need a firmware as a
> > > > module, and just never build them statically.
> > >=20
> > > I totally agree, but if Buildroot builds them statically and provides
> > > no initial ramdisk, we need a better solution than having various
> > > drivers
> > > attempt to implement their own workarounds.
> >=20
> > Buildroot typically allows custom kernel configurations, so it's not
> > really "enforcing" anything like another distro does.
> >=20
> > It is definitely targetted towards very stripped down systems, so I
> > guess building the drivers statically is a natural choice, but it works
> > fine with modules too.
>=20
> It all leads to a conclusion that we need better in-kernel support
> for delayed firmware loading, instead of drivers implementing various
> workarounds, for the layouts in which drivers are built statically
> into the kernel image, but the required firmware blobs reside on the
> root filesystem.
>=20
> I'll start working on it, hopefully today. :)

I don't want to prevent you from trying, but be aware that similar
attempts have been shut down repeatedly in the past.

Maxime

--xsbqjcnrsppws4gq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZo+5NAAKCRAnX84Zoj2+
du2GAYCtFTc7CaphEQgCfqWHKMmGzxp6MqPjwU1kfoPddNDxF8VaZ3EI58nrUdUi
BytnnJcBf1UldJ4yRFP4F+3O6STBxwc38kR/ZT90xF0JtcAZz52j3JN7AUqtkBkm
3G+Ypgthcw==
=9HPF
-----END PGP SIGNATURE-----

--xsbqjcnrsppws4gq--
