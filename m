Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C724DC875
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 15:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A953F10E126;
	Thu, 17 Mar 2022 14:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6F610E126
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 14:13:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 045635C013E;
 Thu, 17 Mar 2022 10:13:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 17 Mar 2022 10:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=nXzmy6uSkmV5D/seGpyltMUgspZ8EOpqvWiCsL
 KsI/w=; b=h6GjZ0YaViUV3TRssJQYaA27K7Zke0ebEpWNL1kvoCiQuZLKVFPyAm
 wEasHYxhhIKKIN85e1kWhtVXaZrT4zfQ7FAlAudJTylxHpaL8Ia2/GPY+n9HaB03
 L95YR8ZXYeiTig31lgTjC6ZzESDtx8zTJIf3ayq94aA1MfJmqXhXEbHUGKLNctpk
 M8PKuYych/puaLGvUK7NQadtuN2UHyiP+lQSKaLYUhHxJ4pFuLmcjxA04xM+CMWt
 91pji/o8Eol4QX2xaVtVr/cOImzjak89nQthedl+ZM/4SAVm33DMnKC77KFQE/dp
 9ajUSEoYlOZxVdfdqpt1biRz9ez/GyFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nXzmy6uSkmV5D/seG
 pyltMUgspZ8EOpqvWiCsLKsI/w=; b=ehSwYhC0ErKMT/2NQGnHxxX0CmPRSQbIJ
 Y/aOwih0g2SYHtLXitivTSuq2vyH2G6JWZyDvprFXCtWafCTM+swAxOXK+/jRaVy
 c6nTToUGGmLG8PX5lBBwWlCJFt7yK0WyaBnac4tTwUw1OFZQSb3AdZZnN576zFUP
 Li55V8QfOi24kfOjGZ0v/bRaoCO9oPV7A8CQ0fP+LxBp91G+cOaZJIlG2UUGMZ68
 i7iqDJjRul+BV+tP2PYCk3bkzUo7RPsb/WZAbnX/Ik0jMtNLoAcNBcOQMah0W34b
 aUyeboMS5wro+rmqE9LoVXdyv1g8eei6robsrzy6Przw/2DY1rXaA==
X-ME-Sender: <xms:-0EzYgH1miIFHbxgcWFUf5h4PWCBynywOjoE61ciAZ_yrJEcoiIcuQ>
 <xme:-0EzYpVT-_aNe0mCs9b7YxKMGm5hzACiy4bGUmKyWKWm8RapbHL-x3C-3gEqpvDld
 TFgs3xlJn3UjE4V8jY>
X-ME-Received: <xmr:-0EzYqLM1jCrn92Ho2nRqxz2edOPrtI0X6MwRKnQncjIsra2ZJJpSI2hX3XxEyGfn04vwLeceG13I0UAyIFJflEFCx26G3RCkoMoP8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgedgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-0EzYiEZii3wWCKqI3W6pSVgAbQH_sC3O8B60nagwgJgfgXiuUBVlw>
 <xmx:-0EzYmUdEHuotU02gcKUi4gQs9ZlbBus2cB0q1C3AJ1I_lDwEHS_Aw>
 <xmx:-0EzYlPeRxCwrCqGbfEcPep88RUOLbuk88uTUhWJvovIpVNFvNbYjw>
 <xmx:-0EzYlSbAFEg_b3NDq0W5HCaRz4_Q7VlWw3MxzXLMRGnDH_BgVyYTw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Mar 2022 10:13:14 -0400 (EDT)
Date: Thu, 17 Mar 2022 15:13:13 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chema Casanova <jmcasanova@igalia.com>
Subject: Re: [PATCH] drm/vc4: add tracepoints for CL submissions
Message-ID: <20220317141313.ygkpydmqyw634dhe@houat>
References: <20220201212651.zhltjmaokisffq3x@mail.igalia.com>
 <20220225161126.6n7puj5p7saf57u4@houat>
 <20220301145826.6ofizv226oqzesed@mail.igalia.com>
 <20220310111244.fylou5ckcb2ilexm@houat>
 <8e709425-b79e-0255-9b5c-3a4e75ade7dc@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dk6d3iwgrc25pnjf"
Content-Disposition: inline
In-Reply-To: <8e709425-b79e-0255-9b5c-3a4e75ade7dc@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dk6d3iwgrc25pnjf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 12:54:32PM +0100, Chema Casanova wrote:
> El 10/3/22 a las 12:12, Maxime Ripard escribi=F3:
> > On Tue, Mar 01, 2022 at 01:58:26PM -0100, Melissa Wen wrote:
> > > On 02/25, Maxime Ripard wrote:
> > > > Hi Melissa,
> > > >=20
> > > > On Tue, Feb 01, 2022 at 08:26:51PM -0100, Melissa Wen wrote:
> > > > > Trace submit_cl_ioctl and related IRQs for CL submission and bin/=
render
> > > > > jobs execution. It might be helpful to get a rendering timeline a=
nd
> > > > > track job throttling.
> > > > >=20
> > > > > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > > > I'm not really sure what to do about this patch to be honest.
> > > >=20
> > > > My understanding is that tracepoints are considered as userspace AB=
I,
> > > > but I can't really judge whether your traces are good enough or if =
it's
> > > > something that will bit us some time down the road.
> > > Thanks for taking a look at this patch.
> > >=20
> > > So, I followed the same path of tracing CL submissions on v3d. I mean,
> > > tracking submit_cl ioctl, points when a job (bin/render) starts it
> > > execution, and irqs of completion (bin/render job). We used it to
> > > examine job throttling when running Chromium and, therefore, in addit=
ion
> > > to have the timeline of jobs execution, I show some data submitted in
> > > the ioctl to make connections. I think these tracers might be useful =
for
> > > some investigation in the future, but I'm also not sure if all data a=
re
> > > necessary to be displayed.
> > Yeah, I'm sure that it's useful :)
> >=20
> > I don't see anything wrong with that patch, really. What I meant is that
> > I don't really have the experience to judge if there's anything wrong in
> > the first place :)
> >=20
> > If you can get someone with more experience with the v3d driver (Emma,
> > Iago maybe?) I'll be definitely be ok merging that patch
>=20
> I've checked this patch and I've been using these tracepoints.
> They have been working properly.
>=20
> Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

Thanks for your feedback, I just merged the patch

Maxime

--dk6d3iwgrc25pnjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjNB+QAKCRDj7w1vZxhR
xeA0APwIaAuQaucGjJJR7LE4XGLRaqIr9plCLc5lXdFkpG9J/QEAt0mXvrt3zz0B
yFi2c2yHvlbjQryC+Rd5QI35L7OLdwU=
=rDKU
-----END PGP SIGNATURE-----

--dk6d3iwgrc25pnjf--
