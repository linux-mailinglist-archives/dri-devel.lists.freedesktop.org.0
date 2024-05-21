Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABDC8CAA0D
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 10:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C70610E160;
	Tue, 21 May 2024 08:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="skY3o16H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22D710E160
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 08:34:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D271761F83;
 Tue, 21 May 2024 08:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36688C2BD11;
 Tue, 21 May 2024 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716280476;
 bh=Sd00LK8Qnu56l+SJQzbKzwYIAmi+/e6Slk49TOoI6vs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=skY3o16HDT7xZjVQpGOOMdNv8QH90+q6isn2ipNC1TxsD4EywRjVZLn/HBPj0ITHe
 yyEkvFkf38Zc7/LHlBKDKRPr8BYI0pgJJecqSHTWq7cQojI5RUf7u1ZjWacYjV5NeV
 rNOCJAH3GSVOQCKoICGDoWulDsLiVJTwcVRZ6QF6RXhUehIFBXQUWVjiu/7peDiIbQ
 nweYugvYv/4m+4Jnnu+AeKd3m0Fi0DJ0rZ4koCZiDfBDeY1heMj29wQ0EJ925i6L4v
 JXDyY/R1aconlDE8kir4ZLMCL3S24ufUZfp94f3RHnGn/leaLkUB8TjigmWvI0RzK/
 33wTVz/NI6Zxw==
Date: Tue, 21 May 2024 10:34:33 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
Message-ID: <20240521-arcane-husky-of-ampleness-ebad9a@houat>
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
 <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
 <20240515-fair-satisfied-myna-480dea@penduick>
 <d394ee32-4fa4-41a8-a5ca-c1c7f77f44d2@linux.dev>
 <20240515-copper-chimpanzee-of-fortitude-ff3dab@penduick>
 <2c15c859-6b2b-4979-8317-698bf6cc430c@linux.dev>
 <20240516-intrepid-uptight-tench-0df95e@penduick>
 <e955b706-04dd-479f-8327-32771d94f70f@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="psxixkw5t2o4ale3"
Content-Disposition: inline
In-Reply-To: <e955b706-04dd-479f-8327-32771d94f70f@linux.dev>
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


--psxixkw5t2o4ale3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 06:40:45PM GMT, Sui Jingfeng wrote:
> Hi,
>=20
> On 5/16/24 16:25, Maxime Ripard wrote:
> > On Wed, May 15, 2024 at 11:19:58PM +0800, Sui Jingfeng wrote:
> > > Hi,
> > >=20
> > >=20
> > > On 5/15/24 22:58, Maxime Ripard wrote:
> > > > On Wed, May 15, 2024 at 10:53:00PM +0800, Sui Jingfeng wrote:
> > > > > On 5/15/24 22:30, Maxime Ripard wrote:
> > > > > > On Wed, May 15, 2024 at 12:53:33AM +0800, Sui Jingfeng wrote:
> > > > > > > On 2024/5/15 00:22, Maxime Ripard wrote:
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > On Tue, May 14, 2024 at 11:40:43PM +0800, Sui Jingfeng wrot=
e:
> > > > > > > > > Because a lot of implementations has already added it int=
o their drived
> > > > > > > > > class, promote it into drm_bridge core may benifits a lot=
=2E drm bridge is
> > > > > > > > > a driver, it should know the underlying hardware entity.
> > > > > > > > Is there some actual benefits, or is it theoretical at this=
 point?
> > > > > > >=20
> > > > > > >=20
> > > > > > > I think, DRM bridge drivers could remove the 'struct device *=
dev'
> > > > > > > member from their derived structure. Rely on the drm bridge c=
ore
> > > > > > > when they need the 'struct device *' pointer.
> > > > > >=20
> > > > > > Sure, but why do we need to do so?
> > > > > >=20
> > > > > > The other thread you had with Jani points out that it turns out=
 that
> > > > > > things are more complicated than "every bridge driver has a str=
uct
> > > > > > device anyway", it creates inconsistency in the API (bridges wo=
uld have
> > > > > > a struct device, but not other entities), and it looks like the=
re's no
> > > > > > use for it anyway.
> > > > > >=20
> > > > > > None of these things are deal-breaker by themselves, but if the=
re's only
> > > > > > downsides and no upside, it's not clear to me why we should do =
it at all.
> > > > >=20
> > > > > It can reduce boilerplate.
> > > >=20
> > > > You're still using a conditional here.
> > >=20
> > > It's for safety reason, prevent NULL pointer dereference.
> > > drm bridge can be seen as either a software entity or a device driver.
> > >=20
> > > It's fine to pass NULL if specific KMS drivers intend to see
> > > drm bridge as a pure software entity, and for internal use only.
> > > Both use cases are valid.
> >=20
> > Sorry, I don't follow you. We can't NULL dereference a pointer that
> > doesn't exist.
> >=20
> > Please state why we should merge this series: what does it fix or
> > improve, aside from the potential gain of making bridges declare one
> > less pointer in their private structure.
>=20
> We could reduce more.

But *why*? What benefit does it bring that outweights the downsides I
listed earlier?

> Bridge driver instances also don't have to embed 'struct i2c_client *'. We
> could use 'to_i2c_client(bridge->dev)' to retrieve the pointer,
> where needed.

Sure, we could use a function instead of another one. But again, what
benefit does that bring exactly?

--psxixkw5t2o4ale3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkxclAAKCRAnX84Zoj2+
dofaAYDgrXduAci7FSwZj8jUaMiQ8xwaJ7bkZB6XUQuPYLVLnJDfzjop9V3uevZv
KAa/xvMBf1xCT3CHjXldRWq637tJfbxrxAEbuvKz/4upaIyffiB1NMaMIRCnSH3U
rsbERLOXtA==
=e+Ll
-----END PGP SIGNATURE-----

--psxixkw5t2o4ale3--
