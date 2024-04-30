Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154E8B6E69
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 11:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B7410E574;
	Tue, 30 Apr 2024 09:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X8BV29ku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566AF10E574
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 09:34:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 933A2614BC;
 Tue, 30 Apr 2024 09:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3372C2BBFC;
 Tue, 30 Apr 2024 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714469664;
 bh=ZQ+5EBT3mj87pKCkYKSCQLIajeZNkK+o45gfK4zC40s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X8BV29kukDQZWXtcWrEzUZWXlCpnyCaJTASDOXXE4kSHbQgrRA3PZ6DTK9ANvr0WZ
 JUImxvQfYdAmC1BDuMEUvxNDQvRt6/Yn/I9AAXGJKTQeQTwjC1pF2yF1avh0eNFYCq
 +Xakb7p4ZgQuFpekbMkC7d5apGoSFApKS8L/8/xwwPEakJDl/sbm/2oEh36tKY9BaN
 6a+Sff3srIT+hXbxRSrBIEYf3ySc471pOCWDnO5NwJR5Yaq3UIKsTmfBVfnlT5Qcvs
 60Puz4IiICO7ZU22p4jD0PyS+R08TfQrwR/TZGj5kCnvAEHQD37HUxAWP32EgItkDU
 KQZwwcViwK1Eg==
Date: Tue, 30 Apr 2024 11:34:21 +0200
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
Message-ID: <20240430-unnatural-steel-spaniel-dbacef@houat>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
 <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
 <20240426-married-augmented-mantis-ff7edd@penduick>
 <509b3822-dcf6-45eb-9516-ba8ff2cc4382@linux.dev>
 <20240429-bouncy-attentive-vole-9964f1@houat>
 <795bec5d-c7ba-4fc2-9be9-78c4063743d9@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7xe3vdsj4lehxjob"
Content-Disposition: inline
In-Reply-To: <795bec5d-c7ba-4fc2-9be9-78c4063743d9@linux.dev>
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


--7xe3vdsj4lehxjob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 12:54:39AM +0800, Sui Jingfeng wrote:
> On 2024/4/29 19:55, Maxime Ripard wrote:
> > On Sat, Apr 27, 2024 at 01:57:46PM +0800, Sui Jingfeng wrote:
> > > On 2024/4/26 14:23, Maxime Ripard wrote:
> > > > On Fri, Apr 26, 2024 at 04:43:18AM +0800, Sui Jingfeng wrote:
> > > > > On 2024/4/26 03:10, Andy Shevchenko wrote:
> > > > > > On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
> > > > > > > On 2024/4/25 22:26, Andy Shevchenko wrote:
> > > > > > > > It seems driver missed the point of proper use of device pr=
operty APIs.
> > > > > > > > Correct this by updating headers and calls respectively.
> > > > > > > You are using the 'seems' here exactly saying that you are no=
t 100% sure.
> > > > > > >=20
> > > > > > > Please allow me to tell you the truth: This patch again has Z=
ERO effect.
> > > > > > > It fix nothing. And this patch is has the risks to be wrong.
> > > > > > Huh?! Really, stop commenting the stuff you do not understand.
> > > > > I'm actually a professional display drivers developer at the down=
stream
> > > > > in the past, despite my contribution to upstream is less. But I b=
elieve
> > > > > that all panel driver developers know what I'm talking about. So =
please
> > > > > have take a look at my replies.
> > > > Most of the interactions you had in this series has been uncalled f=
or.
> > > > You might be against a patch, but there's no need to go to such len=
gth.
> > > >=20
> > > > As far as I'm concerned, this patch is fine to me in itself, and I =
don't
> > > > see anything that would prevent us from merging it.
> > > No one is preventing you, as long as don't misunderstanding what other
> > > people's technical replies intentionally. I'm just a usual and normal
> > > contributor, I hope the world will better than yesterday.
> > You should seriously consider your tone when replying then.
> >=20
> > > Saying such thing to me may not proper, I guess you may want to talk
> > > to peoples who has the push rights
> > I think you misunderstood me. My point was that your several rants were
> > uncalled for and aren't the kind of things we're doing here.
> >=20
> > I know very well how to get a patch merged, thanks.
> >=20
> > > just make sure it isn't a insult to the professionalism of drm bridge
> > > community itself though.
> > I'm not sure why you're bringing the bridge community or its
> > professionalism. It's a panel, not a bridge, and I never doubted the
> > professionalism of anyone.
>=20
>=20
> I means that the code itself could be adopted, as newer and younger
> programmer (like Andy) need to be encouraged to contribute.

Andy has thousands of commits in Linux. He's *very* far from being a new
contributor.

> I express no obvious objections, just hints him that something else
> probably should also be taken into consideration as well.

That might be what you wanted to express, but you definitely didn't
express it that way.

> On the other hand, we probably should allow other people participate
> in discussion so that it is sufficient discussed and ensure that it
> won't be reverted by someone in the future for some reasons. Backing
> to out case happens here, we may need to move things forward. Therefore,
> it definitely deserve to have a try. It is not a big deal even though
> it gets reverted someday.
>=20
> In the end, I don't mind if you think there is nothing that could
> prevent you from merge it, but I still suggest you have a glance at
> peoples siting at the Cc list. I'm busy now and I have a lot of other
> tasks to do, and may not be able to reply you emails on time. So it up
> to you and other maintainers to decide.
> Thank you.

So far, you're the only one who reviewed those patches. I'm not sure
what you're talking about here.

Maxime

--7xe3vdsj4lehxjob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjC7HQAKCRAnX84Zoj2+
dlygAYDwpB9QdIcoX03Jn0U+0+k2hI2zTYADwgCF/5Nq+3QJYG8Hv+eeS5oLwvo/
GKpraScBf1F8i5+AIgGYdsSFbXEqh0o4eQkpyqA5q+DrXOSDkwT33YGsyZlrjEgC
gzymFvTlQw==
=/21b
-----END PGP SIGNATURE-----

--7xe3vdsj4lehxjob--
