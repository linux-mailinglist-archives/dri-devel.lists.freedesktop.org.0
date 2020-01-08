Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F5135FBB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312336E931;
	Thu,  9 Jan 2020 17:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F956E2D7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 13:33:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 04E8022011;
 Wed,  8 Jan 2020 08:33:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 08 Jan 2020 08:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ePL195XlZDIn/F4OJ/RihCFhamM
 VHCEro57b1/xFtrE=; b=d5SxUYztAoySeIbVORmF9bHHxJOj1tNAGOjI7N1kqxE
 CyoO3m1zrzHavXSBc2AJmCz9NVuMOJ41o4Lb3VpQfPI6Kwo4JVf6U7xUMTPu2rwR
 p0jAECzKNBKlCd1GJdFYsALuxFQbDpZWuqyid9/c8wTZzSlgSmoM9iet6Rq4hWLy
 a8WABWGzne+h0W0qwfY+XoikyTeJHvmqn3lhaFOvNNQXjbummgl2+h8YOS+LfEJX
 kOdhOEGl5Q2dca3fx45ODY+ADPsQOa1EoOHb5TuC4+FJwRoblO/nP6pHxXmiCE3u
 yQ+oIxUGLbni8FpbLHZAZuL7yUAC1jT8MZ6f3cUwu4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ePL195
 XlZDIn/F4OJ/RihCFhamMVHCEro57b1/xFtrE=; b=sh2fdn9DB89rZwMbmeSLkg
 npJxY6J1WrJT8W/iTbU7EdFbJoBhs8F5Wmtz06qLuK0PKo3leQsVhVd9H8fWCldB
 Wtp63PcxLt2MTAVnZBQr8oytJvkI4qW75IoeFXH89K+RvAuWmWiy6x2yRNnThR8N
 rMLHk6azdIJxuO079zo44escrVxepGLkpTcRypR31wupof5E11YgSPvNONCjgamC
 08pzMbBDhdopyFJJkgGE5wNiWCGmYXw0wHNq+Q6qs+dnHODQ57XtHLkZP7aLg7qL
 xVnuMaDPvhdvxyxmiKi+k4tRS3x7m+r4Lq0N3FoEUapK7EvxCzJbPcMrLW4jXNDQ
 ==
X-ME-Sender: <xms:PNoVXgsM6j1dvsHGSGEqYt3DwYCsLrhiIwfR0SOOlW24-Tdj94dxow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehkedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:PNoVXnkgol6CFknIRioH1UUWaoGurf6ik63Pbyr7XqMWQXyjNkxm4w>
 <xmx:PNoVXtcSmqV0a_ol9t8TfRAyLd3o33IJ1xKpKMxcY3Nkc6ybrHfZDQ>
 <xmx:PNoVXh4B90ELOPJ1bRXlvkCxlX4ShiYOwsIVHZNBhpLg3QRU8zX9cQ>
 <xmx:PNoVXtdItlte1nYoCEzP6LX8tRJYuAVKEHAEvgWRkF41SM1TromlMg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3CA68005B;
 Wed,  8 Jan 2020 08:33:47 -0500 (EST)
Date: Wed, 8 Jan 2020 14:33:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 2/2] drm/sun4i: drc: Make sure we enforce the clock rate
Message-ID: <20200108133345.lv6ranewfp6t3g6g@gilmour.lan>
References: <20200107165957.672435-1-maxime@cerno.tech>
 <20200107165957.672435-2-maxime@cerno.tech>
 <CAGb2v676EMruj4ZW4iERnNdBiZykk_ebZdMB_DTK4Lb2J2k5Gg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v676EMruj4ZW4iERnNdBiZykk_ebZdMB_DTK4Lb2J2k5Gg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1657939856=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1657939856==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="46reoxwvv73kz3x7"
Content-Disposition: inline


--46reoxwvv73kz3x7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 08, 2020 at 01:28:34AM +0800, Chen-Yu Tsai wrote:
> On Wed, Jan 8, 2020 at 1:00 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The DRC needs to run at 300MHz to be functional. This was done so far
> > using assigned-clocks in the device tree, but that is easy to forget, and
> > dosen't provide any other guarantee than the rate is going to be roughly
> > the one requested at probe time.
> >
> > Therefore it's pretty fragile, so let's just use the exclusive clock API to
> > enforce it.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

APplied both, thanks!
Maxime

--46reoxwvv73kz3x7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhXaJgAKCRDj7w1vZxhR
xWG4AQDUnZ+m5xVaKDuSGxWJtS0ojU+YK/zHrf4ApMki+o+gPgD/ZMFMWAp5ssi1
sTFrgDZWRMTJ5mnG8ih5sCXHItifuQI=
=XxNN
-----END PGP SIGNATURE-----

--46reoxwvv73kz3x7--

--===============1657939856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1657939856==--
