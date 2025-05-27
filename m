Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B7AC526A
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A362810E15B;
	Tue, 27 May 2025 15:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WlXXn/+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB0410E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:57:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F45D60EDF;
 Tue, 27 May 2025 15:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC15AC4CEEB;
 Tue, 27 May 2025 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748361447;
 bh=0Z9C1w5M/TsRnWXH2JrFiJvNsRS2GWWSYL7Uvs3V00o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WlXXn/+csK9sVDR2afQauNdTMsQ019+M+xioJhgXsi2IWX9mKayqR2983BLfE2yo+
 Jj+CKK1PFOa5jEiMSC/dYr3Z5rCpsXvapdImtEn/6D4JS0l6z3b8ZGCdanqBWsFFcQ
 hMhwwb+S/gPpEfY7gavtCWgbWBJk//ltf3gzrTmT28en3nJNu6+131YlKJhCU4g64M
 aO6r4QUGDpr7ZNW0Gx2EUCMlf3YjUJOMa0JhQi3HkcG3ok+2VsIxrkgIL/qUPlVSku
 DlsgMlz4RF42EQ6jN3cDIYIMQNMdh+32Y9QFMkH1EiXfU7lN7l0kx6HhUgpI91/wVU
 wvpqDt1IhGUVw==
Date: Tue, 27 May 2025 17:57:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, seanpaul@google.com, 
 marcheu@google.com, nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v18 6/8] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <20250527-prawn-of-weird-hurricane-91af0f@houat>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
 <20250415-yuv-v18-6-f2918f71ec4b@bootlin.com>
 <adcd3356-5aae-42a8-8b55-9761c95d2e52@bootlin.com>
 <20250522-skilled-brawny-parakeet-e5cccf@houat>
 <ef78f01a-b996-4e44-bb93-b71c6d7526a3@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rw7teijhdglkr4zz"
Content-Disposition: inline
In-Reply-To: <ef78f01a-b996-4e44-bb93-b71c6d7526a3@bootlin.com>
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


--rw7teijhdglkr4zz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v18 6/8] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0

On Tue, May 27, 2025 at 03:36:16PM +0200, Louis Chauvet wrote:
>=20
>=20
> Le 22/05/2025 =E0 17:39, Maxime Ripard a =E9crit=A0:
> > On Mon, May 12, 2025 at 03:07:55PM +0200, Louis Chauvet wrote:
> > > Hi Maxime,
> > >=20
> > > Did you have the time to look at this patch?
> > >=20
> > > Pekka added his Acked-by, but as you made some remarks about this pat=
ch, I
> > > would like to have your validation before applying it.
> >=20
> > Yep, thank you
> >=20
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> >=20
>=20
> Hi Maxime,
>=20
> Some time ago you told me "The rest looked good to me the last time I
> looked." [1]
>=20
> Does it mean that I can add your ack on the rest of the series?

Yes

Maxime

--rw7teijhdglkr4zz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDXg4AAKCRAnX84Zoj2+
dulVAXoD13MCajcNMoBRJxAeK9HS/yXpjp5RlZ6rlybrQ615055N0mgDb5/jymAK
A4hJ4yUBgJB5qctG/Jzs3MZECbUgoMWi4236moVZFYRoINliBBs1+0X9EAvbnteZ
K+WWDjcHvA==
=9WKU
-----END PGP SIGNATURE-----

--rw7teijhdglkr4zz--
