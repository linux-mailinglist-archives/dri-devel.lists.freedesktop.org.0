Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B948255552
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768326E2E1;
	Fri, 28 Aug 2020 07:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE45A6E0D6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 16:04:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2D7923ED;
 Thu, 27 Aug 2020 12:04:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 27 Aug 2020 12:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=NHHayL7FzJFGabahc+D7A957Txj
 kN/nGjt3D9NEa0/g=; b=SBY4XDAqDjPYKgXBljIEFIOcSPzlxcFP+d4pPqeBCXB
 +8cmZjzt+vpyy3ITS3OB4IN4eet/QFBecsCl6bt/plSaMQ9mPVCZ71eI5TCQ0/gD
 3HTT6ViZy6g1dObpovY2Q13v24WTAxVKIfhh8ZfZuw0x+BUnJ60P3ZPSb6vKinLE
 Y5qTBpuJrlx7xKNA5CcZaxS6AeYBAmDxS7CIC5D1zHbCEQNjB6g8hxyo5JhmxSit
 N/+CHDhUXKzwKmvJpwD0DZWIy0RIQDy2PbWpM05WBXkaeqMl2JduWaDD/3bpL2zs
 rpEWlXdYq6+fTKcjK8RMTVVFs6/gcZPR3P+qL/RtfVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NHHayL
 7FzJFGabahc+D7A957TxjkN/nGjt3D9NEa0/g=; b=G414WUo1gr5FX28LLSQuLu
 1Uc4SPnmsT4C1Y2M3nQCv3rAssJIPOMTp7wmVmy8EItXjB09ogTP7aR16SLKSVGq
 caMCkVWrm3y5xkkibgDbP89fniMNBi6wsLHsMCzj3v7IjTjUnidgMAtWWoXWJDSA
 zCU1AqL0/nQxHz0D30CLsrGsgJJ8xEWf/lQ5WVTG+5zezQWvYNSBS+kOvqR/EWfh
 EbopwbyaPpkIK24sXE/JKxXK1N+sAn8KqXzc9yWRo+VCbt4bRG78U1YXxq3x8dVB
 yck190gVYe02Xk8l+l1mnjhNyfeSdsaQ24vL+PGDx30GxDBXzxsGVL8SVVoXcovw
 ==
X-ME-Sender: <xms:edlHXx-CK8_8qoXGw5mCs8neYAHZYwccBPqJNzeAvoXDhCpDl1hIuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeelkeeghefhuddtleejgfeljeffhe
 ffgfeijefhgfeufefhtdevteegheeiheegudenucfkphepledtrdekledrieekrdejieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:edlHX1td-GpIjayJjKtDD1LT72vvEQEqkHSrjt3gjdnQ06Dje3_hhA>
 <xmx:edlHX_DZ46ConwDEL4G3YA0Q_0EJPV5MbnybY_LvebyFHJMDZ_wWSA>
 <xmx:edlHX1fX9IQbDOS129nBhOLJljERf_314ruaNyTrDe6rTpixKlch2g>
 <xmx:etlHXwVFuPnkLbsl1HtpE9Nvus6HWmSJ6Y9pST0sXo_v8KuOSy-FrQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 57F323280059;
 Thu, 27 Aug 2020 12:04:09 -0400 (EDT)
Date: Thu, 27 Aug 2020 18:04:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] drm/sun4i: lvds: Invert the LVDS polarity
Message-ID: <20200827160407.6nebzt6cpkvhidw5@gilmour.lan>
References: <20200704133803.37330-1-maxime@cerno.tech>
 <CAGb2v65aFX4jEdrJY==GGQxvB0qzKmNNEi0a1m_3H7uYF5F1uA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v65aFX4jEdrJY==GGQxvB0qzKmNNEi0a1m_3H7uYF5F1uA@mail.gmail.com>
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: Ondrej Jirman <megous@megous.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1863574416=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1863574416==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f5cov34zgyz2r63h"
Content-Disposition: inline


--f5cov34zgyz2r63h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 01:13:33AM +0800, Chen-Yu Tsai wrote:
> On Sat, Jul 4, 2020 at 9:38 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The LVDS controller can invert the polarity / lanes of the LVDS output.
> > The default polarity causes some issues on some panels.
> >
> > However, U-Boot has always used the opposite polarity without any repor=
ted
> > issue, and the only currently supported LVDS panel in-tree (the TBS A71=
1)
> > seems to be able to work with both settings.
> >
> > Let's just use the same polarity than U-Boot to be more consistent and
> > hopefully support all the panels.
> >
> > Cc: Ondrej Jirman <megous@megous.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--f5cov34zgyz2r63h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0fZdwAKCRDj7w1vZxhR
xaLTAP9NDWLQ9AOAmqw2AUgin+RzSy1r3tSeSewBr/HgsUrZ5AD/eso1ZgrDtQKb
IrkCQ8X8Ax/4Gd37xy0xK2LC54z2CgU=
=6aVF
-----END PGP SIGNATURE-----

--f5cov34zgyz2r63h--

--===============1863574416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1863574416==--
