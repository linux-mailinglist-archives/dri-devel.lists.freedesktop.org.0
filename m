Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776409B5DA8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 09:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6809B10E757;
	Wed, 30 Oct 2024 08:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vo/Yi9UH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B155010E757
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 08:25:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B577B5C5EAC;
 Wed, 30 Oct 2024 08:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50F7C4CEE6;
 Wed, 30 Oct 2024 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730276754;
 bh=m+vPqbj0th9XDhYG7rHSXkRc5GYX5cnIWjH54alg/vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vo/Yi9UHyRqKbCan9ZBlQcbdEBggvr93kfm59xyiATBKwr09WuqKZM2PVSG1UWfzr
 PH/blxtM+XAIGD16DssnR2TWDZ6rRLfeeWk7Snt7jY48BNc+IOayDiPrYVbfaW5AWA
 QcNowf8yS6J6XmC9wZE1SJXVgf3tugTUP7HZOzh/aB8FQStfCiK1wjLGylQSsZaodU
 7+l+pr6n+WChPNRsAucU6jlPaGHkZqmTk0WP2DUzirjF+mYy+HJjgndG5rUVyOaYN/
 UX5/WwX8Pzz4HeSPkCV6zM1pYyuM7m2Z4lxq5xmSs+bDelmsTEuMgUW9wG07ov/1xB
 QM3eYlQTQeFJg==
Date: Wed, 30 Oct 2024 09:25:51 +0100
From: "mripard@kernel.org" <mripard@kernel.org>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "wenst@chromium.org" <wenst@chromium.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
Message-ID: <20241030-hot-peridot-falcon-57bdbb@houat>
References: <20241029111309.737263-1-wenst@chromium.org>
 <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="huqxlu2kfajx2pij"
Content-Disposition: inline
In-Reply-To: <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
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


--huqxlu2kfajx2pij
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
MIME-Version: 1.0

On Wed, Oct 30, 2024 at 03:30:34AM +0000, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=
=89) wrote:
> Hi, Chen-yu:
>=20
> On Tue, 2024-10-29 at 19:13 +0800, Chen-Yu Tsai wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >=20
> >=20
> > The recent attempt to make the MediaTek DRM driver build for non-ARM
> > compile tests made the driver unbuildable for arm64 platforms. Since
> > this is used on both ARM and arm64 platforms, just drop the dependency
> > on ARM.
>=20
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>=20
> I find this days ago, but I don't know there is someone who apply it.
> Let this patch go through drm-misc tree which already has the bug patch.

If you are ok with this patch, why didn't you apply it yourself?

I think that's very much the expectation, so it's probably took a while to =
merge.

Maxime

--huqxlu2kfajx2pij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyHthwAKCRAnX84Zoj2+
dtNoAYCMCDvgwF9nHrinZfKHHWOLsicaXYf5ccom78linosyV9X/egXygJ4ryUPd
QqoQWFgBgO5FCorpFXFLZu6SVQg/ShD2DSGHjXQTFLgEBKuW8acqguqnMdlfW1n3
lCVPJCfolw==
=OfXZ
-----END PGP SIGNATURE-----

--huqxlu2kfajx2pij--
