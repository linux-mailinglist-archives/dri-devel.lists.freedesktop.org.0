Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F192CBB9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 09:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A1010E695;
	Wed, 10 Jul 2024 07:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dKk429Xf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964D110E690
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 07:13:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39658CE13CB;
 Wed, 10 Jul 2024 07:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EEDC32781;
 Wed, 10 Jul 2024 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720595600;
 bh=x4Iv2ujiTEenjVrms5+vXH7xG9UcavnTmM2LhQnOcG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKk429XfmzcO+XAYY1Ls+tIh/Nc4eZ5CFHGB69JLNECEFWVpEDLi2fhEWaTr2sy8W
 QGvNZhI8DxXcbfworB2a1nBKZ41ch90fto3uv6xsK8eZKyWeFdRM5eQgfq0AtYzh/V
 Ue4KvNf8E7gjEvYQIy/vgzToAixTg0VBnaE2ZLy6A2IpQ783eboosUp5E9DrZjf+8K
 Wdp/I3LW8l109sjNDOxTD5QnKfY43I32WkYsHrueC2hDF769gPJad35SAt8/26gsbC
 Coh2T30E5L1v72W0M/u0sc6JvVeHvQcQdFI5WaGL1KP+XX9EjmOJqEAG+OrwrRenTr
 NdT/zFCeapjEA==
Date: Wed, 10 Jul 2024 09:13:17 +0200
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
Message-ID: <20240710-smooth-hypnotic-raccoon-b91fba@houat>
References: <9b7a9e9b88ad8c7489ee1b4c70b8751eeb5cf6f9.1720049413.git.dsimic@manjaro.org>
 <109c6f19.2559.1907b817a99.Coremail.andyshrk@163.com>
 <0bf4701d98833609b917983718c610aa@manjaro.org>
 <2fd3aabd.785b.190914ec1a6.Coremail.andyshrk@163.com>
 <f0fb9feed2d9262bb4d7c8ade836af62@manjaro.org>
 <909d072.9028.19096c2429a.Coremail.andyshrk@163.com>
 <31062b80d3f9e11c339c400a70464f43@manjaro.org>
 <20240709-exuberant-tentacled-oxpecker-bd1ea0@houat>
 <b6d630447e6c69e913b76650d910f895@manjaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hmozv7bd2sxugxlk"
Content-Disposition: inline
In-Reply-To: <b6d630447e6c69e913b76650d910f895@manjaro.org>
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


--hmozv7bd2sxugxlk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 06:36:08PM GMT, Dragan Simic wrote:
> > > > > As I already wrote earlier, and as the above-linked discussions
> > > > > conclude, solving these issues doesn't belong to any specific dri=
ver.
> > > > > It should be resolved within the kernel's firmware loading mechan=
ism
> > > > > instead, and no driver should be specific in that regard.
> > > >
> > > > IT would be good if it can be resolved within the kernel's  firmware
> > > > loading mechanism.
> > >=20
> > > ... we'll need this as a systemic solution.
> >=20
> > The general policy has been to put drivers that need a firmware as a
> > module, and just never build them statically.
>=20
> I totally agree, but if Buildroot builds them statically and provides
> no initial ramdisk, we need a better solution than having various drivers
> attempt to implement their own workarounds.

Buildroot typically allows custom kernel configurations, so it's not
really "enforcing" anything like another distro does.

It is definitely targetted towards very stripped down systems, so I
guess building the drivers statically is a natural choice, but it works
fine with modules too.

Maxime

--hmozv7bd2sxugxlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZo40jAAKCRAnX84Zoj2+
dk7wAXsGnTzsBpAO71ZkHwlPTy/hfj7mkqJs1dxvs1EHsvTY5R9jsiA0xksKCqAb
ofSC7f0BgLqiZnp5G+2MV0POlp4hoq7m1l/IoTg44FTB0PjPx8MSeR1++MfMdKAk
ugJA0QtGyg==
=v2r+
-----END PGP SIGNATURE-----

--hmozv7bd2sxugxlk--
