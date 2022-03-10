Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C44D4566
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 12:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1B710EC17;
	Thu, 10 Mar 2022 11:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D56410EC17
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 11:12:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5D1863201E78;
 Thu, 10 Mar 2022 06:12:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 10 Mar 2022 06:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=xxPmsOI/aHi7Eo8c7Dca4Vvq3teOO+/+I/9dWy
 gA/L4=; b=bWHOLywsftcUojvYpl0EcphO8dDvTWX0PKFlTuOXKY1vgZMcLkmE5W
 /TD7FIZ5vSrEQsNEaz8ftlI2eP1/4QiK46BaqTKxx8QY9iGqQzM/5LBIAtQUjKrj
 l9PQS4iYCiFd246gm6YFI+RN+twVwYB7k8y2sD+wHRRqqRp1YpZPbuZNQNFFZwKF
 qrRgeCJs5TXr9z+9cgQV+bexlJxDLhC3/A5K4RxxXO3mlVcfHwqXGCUt/9nwOB51
 gJ4n4d+zzkEua5ETOjmcl1BQkvKCJVGhH2dcbJZYFYjZZt3uPOstA11fzGft6lx7
 5d8eGVmWL2fYll84j1R88Ae4EXoFfjdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xxPmsOI/aHi7Eo8c7
 Dca4Vvq3teOO+/+I/9dWygA/L4=; b=m9/a2UdH2qyQRj4bYP0AA5mi9MWRjp7Fz
 vVBIocjJHfPyfU5JEGV3f2LwtSU5G0pg4Gp5NnrZ1PHv0NVilI1GXpEqxI8dqnEi
 XzA5ltJSzF1XLXgNpVFyhHnLCza1/pVgkqi3MSCuliDqUt+RoZeZ8ygfVd3OUOr+
 QzmBztROLMcR0kJibHdnkCeG65P29sRieIs1HtG6KFi7r9olpsDG1WGusjikHP2m
 IVO3+E+ouAVJSgp4uNC0adn/gjLwKMkKGDDxOWHSQHX1nb3ZREP5iXoCzIqfTdgP
 pwCjOTrVCtvQJq4El0nBWzsXgl5tkY9gwJRPcCPKf8u0iu1ZjJZyw==
X-ME-Sender: <xms:Lt0pYmGUDks62z-UbYn1eAmrtTUJzt-h-z5V7-kYZa4kNo3N7-o4gQ>
 <xme:Lt0pYnVv5j2550GnqiNAP3H3Phu80FbzZ5Ka9xWxFg-PkFKxsuMMIJFcyd_9e6_Jt
 Jz8BiXXgoJfvqjj7WY>
X-ME-Received: <xmr:Lt0pYgLrfJDCpxs6DWCGiGsAI_rgD8ncGLizneolaY50PbRlT30JScupILNBgXZ4--xWWdnTJwpUtjQjClOCsor_3ZRsk-ta63ChiQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Lt0pYgFID2fHNwjyhXHDiOt3BDY53TtU3kGjyK3gaAXeOznVWK5qtA>
 <xmx:Lt0pYsVSYhfkw-iEHUMz1VpYGaT03BuOUnWwhrIb8Y2x0oDLeLv_hw>
 <xmx:Lt0pYjPYvO9-opZaCQ-JVp9vvzB1i7-tsdS6CBcFCp51sHPJTqxzIg>
 <xmx:Lt0pYjTxpgNC39xaCWQv0Nd_GsFg3bvdTvN4UqUdLsxq0KSjOSXl2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 06:12:46 -0500 (EST)
Date: Thu, 10 Mar 2022 12:12:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH] drm/vc4: add tracepoints for CL submissions
Message-ID: <20220310111244.fylou5ckcb2ilexm@houat>
References: <20220201212651.zhltjmaokisffq3x@mail.igalia.com>
 <20220225161126.6n7puj5p7saf57u4@houat>
 <20220301145826.6ofizv226oqzesed@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iy2oly5ee42fuuud"
Content-Disposition: inline
In-Reply-To: <20220301145826.6ofizv226oqzesed@mail.igalia.com>
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
Cc: David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iy2oly5ee42fuuud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 01:58:26PM -0100, Melissa Wen wrote:
> On 02/25, Maxime Ripard wrote:
> > Hi Melissa,
> >=20
> > On Tue, Feb 01, 2022 at 08:26:51PM -0100, Melissa Wen wrote:
> > > Trace submit_cl_ioctl and related IRQs for CL submission and bin/rend=
er
> > > jobs execution. It might be helpful to get a rendering timeline and
> > > track job throttling.
> > >=20
> > > Signed-off-by: Melissa Wen <mwen@igalia.com>
> >=20
> > I'm not really sure what to do about this patch to be honest.
> >=20
> > My understanding is that tracepoints are considered as userspace ABI,
> > but I can't really judge whether your traces are good enough or if it's
> > something that will bit us some time down the road.
>
> Thanks for taking a look at this patch.
>=20
> So, I followed the same path of tracing CL submissions on v3d. I mean,
> tracking submit_cl ioctl, points when a job (bin/render) starts it
> execution, and irqs of completion (bin/render job). We used it to
> examine job throttling when running Chromium and, therefore, in addition
> to have the timeline of jobs execution, I show some data submitted in
> the ioctl to make connections. I think these tracers might be useful for
> some investigation in the future, but I'm also not sure if all data are
> necessary to be displayed.

Yeah, I'm sure that it's useful :)

I don't see anything wrong with that patch, really. What I meant is that
I don't really have the experience to judge if there's anything wrong in
the first place :)

If you can get someone with more experience with the v3d driver (Emma,
Iago maybe?) I'll be definitely be ok merging that patch

Maxime

--iy2oly5ee42fuuud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYindLAAKCRDj7w1vZxhR
xd41AP9E/1VQa2SGz5I1RHmwbPhg6CGMC4rQ0w40UaEdbVY3aAD9GplxGeDLEQvk
rAk+A/uXyDM2DAuh+hBvonBJwyzYMAU=
=F2oO
-----END PGP SIGNATURE-----

--iy2oly5ee42fuuud--
