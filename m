Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908DA8C72B7
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 10:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC11B10E1F1;
	Thu, 16 May 2024 08:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EO1cHYgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C202210E1F1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:25:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 089A0614A2;
 Thu, 16 May 2024 08:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454F1C113CC;
 Thu, 16 May 2024 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715847910;
 bh=wQSeNVyD2+LGMI1KSxHgOvUM6yNAJ+OyWsiLwLfXdGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EO1cHYgcSiyEgzOkCWNMhSk9JWysjcFy/0GEKirdIi1YG5LvOa9YIyrOSEjV8FQfh
 6QJdIrd4qD24cJQwdh3xVJ98gOd+lM8VXkLD5xMqY6dP44hbN79W87RoJtjjxWhkjK
 +EJZ9/yoZSARSObIcjh9HIYRmp0s+bruSbiUP/HikocggfO+2bSgrdVlbrxth1kltf
 0RxHcmkiOevML+ju4hsLjuIUU6QtE5mwmnSMNd2Dg2ScM06zJuo6YvAB725psvuyyE
 1/7E/5oO/LqIC87zin8OT1s2sX6o3ob57vgfV8zFFHkxqUSLnkKGWCFIGqKc07CChl
 jhAqfI+RxTpiQ==
Date: Thu, 16 May 2024 10:25:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
Message-ID: <20240516-intrepid-uptight-tench-0df95e@penduick>
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
 <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
 <20240515-fair-satisfied-myna-480dea@penduick>
 <d394ee32-4fa4-41a8-a5ca-c1c7f77f44d2@linux.dev>
 <20240515-copper-chimpanzee-of-fortitude-ff3dab@penduick>
 <2c15c859-6b2b-4979-8317-698bf6cc430c@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="toq7dtu3l53x2mb5"
Content-Disposition: inline
In-Reply-To: <2c15c859-6b2b-4979-8317-698bf6cc430c@linux.dev>
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


--toq7dtu3l53x2mb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 11:19:58PM +0800, Sui Jingfeng wrote:
> Hi,
>=20
>=20
> On 5/15/24 22:58, Maxime Ripard wrote:
> > On Wed, May 15, 2024 at 10:53:00PM +0800, Sui Jingfeng wrote:
> > > On 5/15/24 22:30, Maxime Ripard wrote:
> > > > On Wed, May 15, 2024 at 12:53:33AM +0800, Sui Jingfeng wrote:
> > > > > On 2024/5/15 00:22, Maxime Ripard wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > On Tue, May 14, 2024 at 11:40:43PM +0800, Sui Jingfeng wrote:
> > > > > > > Because a lot of implementations has already added it into th=
eir drived
> > > > > > > class, promote it into drm_bridge core may benifits a lot. dr=
m bridge is
> > > > > > > a driver, it should know the underlying hardware entity.
> > > > > > Is there some actual benefits, or is it theoretical at this poi=
nt?
> > > > >=20
> > > > >=20
> > > > > I think, DRM bridge drivers could remove the 'struct device *dev'
> > > > > member from their derived structure. Rely on the drm bridge core
> > > > > when they need the 'struct device *' pointer.
> > > >=20
> > > > Sure, but why do we need to do so?
> > > >=20
> > > > The other thread you had with Jani points out that it turns out that
> > > > things are more complicated than "every bridge driver has a struct
> > > > device anyway", it creates inconsistency in the API (bridges would =
have
> > > > a struct device, but not other entities), and it looks like there's=
 no
> > > > use for it anyway.
> > > >=20
> > > > None of these things are deal-breaker by themselves, but if there's=
 only
> > > > downsides and no upside, it's not clear to me why we should do it a=
t all.
> > >=20
> > > It can reduce boilerplate.
> >=20
> > You're still using a conditional here.
>
> It's for safety reason, prevent NULL pointer dereference.
> drm bridge can be seen as either a software entity or a device driver.
>=20
> It's fine to pass NULL if specific KMS drivers intend to see
> drm bridge as a pure software entity, and for internal use only.
> Both use cases are valid.

Sorry, I don't follow you. We can't NULL dereference a pointer that
doesn't exist.

Please state why we should merge this series: what does it fix or
improve, aside from the potential gain of making bridges declare one
less pointer in their private structure.

Maxime

--toq7dtu3l53x2mb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkXC4wAKCRAnX84Zoj2+
duwLAYDJLwwZxC6nv2o6co5SHZA890EEJ4sBl7/6pKRAdMofidpb1VuuXsFJ6wuy
1mwpPikBfjwAVJvlg/Adew0kmxARdh6BhgjhM8/XpUlkME8b39Me89obXMSOJ3U7
iPUlp/ORmQ==
=JFrx
-----END PGP SIGNATURE-----

--toq7dtu3l53x2mb5--
