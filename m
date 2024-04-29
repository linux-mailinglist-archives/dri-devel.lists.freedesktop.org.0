Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814948B5739
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 13:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB74112BDC;
	Mon, 29 Apr 2024 11:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GfoyvRaJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD135112BDC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 11:55:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0DC3E60C8B;
 Mon, 29 Apr 2024 11:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59922C113CD;
 Mon, 29 Apr 2024 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714391753;
 bh=XWc37warfUktdwZ3uEIGNxAJLIymrm9KjSvuwewKNs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GfoyvRaJAJR6988WZ9E+K7+mzIhEXDHJ+7uGAIdDP64+qrYvVjKf9vZHONCOhWAkT
 9oegMrOBPtUQrDU2zTb7W4ny1g7f3wsJVr2Jx8hHmL1dtCWCUuioL5Wcg75w8AHTJt
 +xC08UpflXVbug8QAv5buBfs+VBdnkOycomJhrV3UM0N1BrrkeR8Q8CoPrwORbp+fC
 b8lDcCbnFnXkeTEKBOBhxPYDVpY3NlMvEBYA9JjO0Yj7py/EXhWQJZo/ElWdWBgXfF
 CbXbFw7cKebMafbXgM+aXwtAiEERSH/VCI5tIPIJwVsG6Ngg7D3hLapIQ45M2V/deJ
 K+LrLt3pc9ZcQ==
Date: Mon, 29 Apr 2024 13:55:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
Message-ID: <20240429-bouncy-attentive-vole-9964f1@houat>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
 <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
 <20240426-married-augmented-mantis-ff7edd@penduick>
 <509b3822-dcf6-45eb-9516-ba8ff2cc4382@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bzxwtvqlovrzeuyg"
Content-Disposition: inline
In-Reply-To: <509b3822-dcf6-45eb-9516-ba8ff2cc4382@linux.dev>
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


--bzxwtvqlovrzeuyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2024 at 01:57:46PM +0800, Sui Jingfeng wrote:
> Hi,
>=20
>=20
> On 2024/4/26 14:23, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Apr 26, 2024 at 04:43:18AM +0800, Sui Jingfeng wrote:
> > > On 2024/4/26 03:10, Andy Shevchenko wrote:
> > > > On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
> > > > > On 2024/4/25 22:26, Andy Shevchenko wrote:
> > > > > > It seems driver missed the point of proper use of device proper=
ty APIs.
> > > > > > Correct this by updating headers and calls respectively.
> > > > > You are using the 'seems' here exactly saying that you are not 10=
0% sure.
> > > > >=20
> > > > > Please allow me to tell you the truth: This patch again has ZERO =
effect.
> > > > > It fix nothing. And this patch is has the risks to be wrong.
> > > > Huh?! Really, stop commenting the stuff you do not understand.
> > > I'm actually a professional display drivers developer at the downstre=
am
> > > in the past, despite my contribution to upstream is less. But I belie=
ve
> > > that all panel driver developers know what I'm talking about. So plea=
se
> > > have take a look at my replies.
> > Most of the interactions you had in this series has been uncalled for.
> > You might be against a patch, but there's no need to go to such length.
> >=20
> > As far as I'm concerned, this patch is fine to me in itself, and I don't
> > see anything that would prevent us from merging it.
>=20
> No one is preventing you, as long as don't misunderstanding what other
> people's technical replies intentionally. I'm just a usual and normal
> contributor, I hope the world will better than yesterday.

You should seriously consider your tone when replying then.

> Saying such thing to me may not proper, I guess you may want to talk
> to peoples who has the push rights

I think you misunderstood me. My point was that your several rants were
uncalled for and aren't the kind of things we're doing here.

I know very well how to get a patch merged, thanks.

> just make sure it isn't a insult to the professionalism of drm bridge
> community itself though.

I'm not sure why you're bringing the bridge community or its
professionalism. It's a panel, not a bridge, and I never doubted the
professionalism of anyone.

Maxime

--bzxwtvqlovrzeuyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZi+KxgAKCRAnX84Zoj2+
dos3AX9KDNBOnaH5USr1DqHJto1Lpp8FgCa4MHQstBOYN6x3+z1zzntFhlJFeu7X
TNr1/KwBf1ChO/0ETn+0a/MBlXB0FthxBU3YA7z4FVB35ObVsNur/zBS7JL+tBP+
rIWWBloYjg==
=1KB+
-----END PGP SIGNATURE-----

--bzxwtvqlovrzeuyg--
