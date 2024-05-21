Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BAC8CAA26
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 10:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980AA10E058;
	Tue, 21 May 2024 08:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FY/wedjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838D910E058
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 08:38:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1BBB5CE0159;
 Tue, 21 May 2024 08:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA51FC2BD11;
 Tue, 21 May 2024 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716280680;
 bh=+eCL9LUGmDlBHd7IqTmjfK/OIkg768Tq3dp2ih3bza4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FY/wedjoCp4X2DFnwkpWwC94Zd1Sa6zKfl+hpbczNJ14iojaOzWiqgKUSmjqBrdlR
 sXEHpFnProHnB4skpcmgGRYgT78+D8UWVimfyUT+wDvLE4ffpEF+nQ0aTngr/BsZsN
 OR1LF5rSCyx9nrwP3O/icjzrCZiGIMF16SlxR/yZYg9mbe479CDfsA2QVoT6KH5Iuq
 +sVmo+qnb4R4RLLDCbMKm5/kgXLBQg+4zsZUJM/uWgNggHvF6AuB+4K/k6cj8GWxK0
 0we5dMx2MCVMkSOO+VRAbsN4j5UfLbVryP36SI3rQ5fQOLW69ZUAPpSvhar1QDMiTP
 HLGMV1L9HTQEw==
Date: Tue, 21 May 2024 10:37:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
Message-ID: <20240521-uptight-toucan-of-assurance-edbaa3@houat>
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
 <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
 <20240515-fair-satisfied-myna-480dea@penduick>
 <d394ee32-4fa4-41a8-a5ca-c1c7f77f44d2@linux.dev>
 <20240515-copper-chimpanzee-of-fortitude-ff3dab@penduick>
 <2c15c859-6b2b-4979-8317-698bf6cc430c@linux.dev>
 <20240516-intrepid-uptight-tench-0df95e@penduick>
 <e955b706-04dd-479f-8327-32771d94f70f@linux.dev>
 <07b931d9-b11f-4829-a6c4-d5025fc071b5@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="54xi4xmokt3wuyve"
Content-Disposition: inline
In-Reply-To: <07b931d9-b11f-4829-a6c4-d5025fc071b5@linux.dev>
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


--54xi4xmokt3wuyve
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 08:04:59PM GMT, Sui Jingfeng wrote:
>=20
>=20
> On 5/16/24 18:40, Sui Jingfeng wrote:
> > use 'to_i2c_client(bridge->dev)' to retrieve the pointer
>=20
> to_i2c_client(bridge->kdev).
>=20
> Besides, this also means that we don't need to add the fwnode
> pointer into struct drm_bridge as member. Relief the conflicts
> with other reviewers if the work of switching to fwnode is still
> needed. As for majorities cases (1 to 1), of_node and fwnode can
> be retrieved with 'struct device *' easily. The aux-bridge.c and
> aux-hdp-bridge.c can also be converted too easily.

So that's what you're going for.

> of_node, fwnode, swnode and device properties are all belong to
> the backing device structure itself. It can be more natural to use
> device_proterty_read_xxx() APIs after init time, Which in turn
> avoid the need to acquire and duplicate all properties another
> time in the driver private structure.
>=20
> We could do the programming around the 'struct device *.', remove
> a batch of boilerplate.

Please make that happen once the device_property_read_* API is there,
and we can get rid of of_node, swnode, and fwnode then.

Maxime

--54xi4xmokt3wuyve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkxdZQAKCRAnX84Zoj2+
dpVVAX0X1N/fhcX18zV5rkgPcOjx1AaUM52FK7mndoOc3g6lJbQHjZ694bhbNBk6
tvPoagYBf3aOMiFWvLNDrCZQl7cNNAqNTFkj2HEExUvF80lgvJ4btMhpcv6ZH3Jq
vWct8dPwbQ==
=tfik
-----END PGP SIGNATURE-----

--54xi4xmokt3wuyve--
