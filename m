Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57BD260BB2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E0C6E4CD;
	Tue,  8 Sep 2020 07:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC80E6E4C4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 16:21:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id AA314A63;
 Mon,  7 Sep 2020 12:21:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Sep 2020 12:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=A60HhPZ+gFJdxyk3h9bO7xfmZgf
 j0/CfuVUABAVyKqk=; b=njTXFrhJ893ktCHqZwlnD9epwuVBir0+SQdGyc92uWd
 ehRimf4IYPny7j7IfUcCFSy91p8q70n0r6jxgv9RRpn269QKkoRfcp5Bayj9Lswz
 dU+WA1Je+uhhuUZKnJc/mJWpFWgPgGHBY8HMyNApcK2MGhs94lYDNA7ef/BpJBD4
 T/OOFRwEYHgCQtpx17eZaTXLlTamgrgqw0RnCjHo2t7juQfvAqdMjRdXhpehpMRk
 fs9Tqbq0HU2V/vfcI3wMRe+Dh4bA1hMlabk2rBNuiX7hc/4siKpR/howoEK+BJAq
 8f3jHrcsV1NF/lAnog7juTU6YTVWUombXOBTfYyw1Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=A60HhP
 Z+gFJdxyk3h9bO7xfmZgfj0/CfuVUABAVyKqk=; b=T6DtmFr8ugFHH4Ey2ZjBlA
 vF7lEB9jKd5f1JBLmhfwr/maDyUGQ/0ldFe49ra9Nx7KCaAMN7j0ZTioGPjVnRjB
 tX2Jhx5INOA6Akc/7HY/atSuynvUMwY70HUZM/SpZIk5DnuJJypA7UbRyYmLoalz
 hmvfI6D/tt/zWJ/eh5kRNyoITL/uKGBikfYPP5d94L+cupJXBsSCRCgmtWbJUs1Z
 g551gjKX9OfncasOsnZ3SzL4pD/m0dOaALHTt44ir9n2+Q4PmteEb+E3Z1bXmNii
 DrMtc6kYizRvIJagTwx/Cglrq+RYNngIFKhgJyXhS8P+U+PZ7rpG2mHuCvLT4Hzg
 ==
X-ME-Sender: <xms:H15WX_MtvtjiqLoO2UxQMqOnjXTZdJVzXNuKHTl6ZiSI-hY4LrjSDw>
 <xme:H15WX5_-O4TFaN8m5B5x1TQqdkoZ_37WrUPEEEu_dG8EcUKWIRv2etEIziUnYCjgV
 fisAOT9u_o4q4L0b4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehtddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleff
 gfejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:H15WX-SbQsh5RU1jYM9yn5HAQXmNedU8qhFsODr4KVJuUjIKFMYPww>
 <xmx:H15WXzukfs-iEOqn1TdZuzhNuiCem1ZNGICN8ZfknIadiUIjKwPQNg>
 <xmx:H15WX3ezIO29bCzWx0QD0DjgABJEHJWhySgg2JMnMFCNvrH8w5VuDA>
 <xmx:IF5WX2xFILkOcuf1Ky8UGmNFLe08GYiMTj4nyDAwV23drChQQKdyQ7KnUbQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE49F328005D;
 Mon,  7 Sep 2020 12:21:50 -0400 (EDT)
Date: Mon, 7 Sep 2020 18:21:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 75/80] drm/vc4: hdmi: Add pixel BVB clock control
Message-ID: <20200907162149.plabkjrgajjqbtiu@gilmour.lan>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <d757ddd6549da140f178563e5fd2bf1d129913fd.1599120059.git-series.maxime@cerno.tech>
 <CAPY8ntC_Tobv+4TtgtYhvAst00_zsfxZdZd=torcb57SQ0CMQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntC_Tobv+4TtgtYhvAst00_zsfxZdZd=torcb57SQ0CMQA@mail.gmail.com>
X-Mailman-Approved-At: Tue, 08 Sep 2020 07:17:17 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1113168592=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1113168592==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rvxp5il2lqnzas2n"
Content-Disposition: inline


--rvxp5il2lqnzas2n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 04, 2020 at 10:46:26AM +0100, Dave Stevenson wrote:
> On Thu, 3 Sep 2020 at 09:03, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> >
> > The BCM2711 has another clock that needs to be ramped up depending on t=
he
> > pixel rate: the pixel BVB clock. Add the code to adjust that clock when
> > changing the mode.
> >
> > Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > [Maxime: Changed the commit log, used clk_set_min_rate]
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > Link: https://lore.kernel.org/r/20200901040759.29992-3-hoegeun.kwon@sam=
sung.com
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 23 +++++++++++++++++++++++
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index ab7abb409de2..39508107dafd 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -54,6 +54,7 @@
> >  #include "vc4_regs.h"
> >
> >  #define CEC_CLOCK_FREQ 40000
> > +#define VC4_HSM_MID_CLOCK 149985000
>=20
> I didn't flag it earlier, but this is a bit of a weird name for the
> define. I know it wants to be concise, but it made me do a double take
> as to what it is for.
> I'm currently applying all these patches to our Raspberry Pi tree and
> actually CEC needs a fixed HSM on Pi0-3 to avoid recomputing all the
> timings. So I have a VC4_HSM_CLOCK define which is the fixed clock
> rate for Pi 0-3.
> This one is more a threshold for HSM to control BVB, and my brain
> starts to hurt over what it should be called.
>=20
> Unless there are other comments around this patchset (and I hope to
> read through the remaining ones today), then I don't consider it a
> blocker, but we can probably do better as and when we add the next
> threshold for 4k60.
> My current understanding is that the clock has to be an integer divide
> of 600MHz, and at least the pixel rate / 2, so the only link to HSM is
> due to HSM being 101% of pixel rate, but I will try to find
> confirmation of that.

I'm currently working on the 4k60 support, so it will go away soon
(using your suggestion) so there's no need to overthink it :)

> >  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
> >  {
> > @@ -344,6 +345,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(st=
ruct drm_encoder *encoder)
> >         HDMI_WRITE(HDMI_VID_CTL,
> >                    HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
> >
> > +       clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
> >         clk_disable_unprepare(vc4_hdmi->hsm_clock);
> >         clk_disable_unprepare(vc4_hdmi->pixel_clock);
> >
> > @@ -516,6 +518,27 @@ static void vc4_hdmi_encoder_pre_crtc_configure(st=
ruct drm_encoder *encoder)
> >                 return;
> >         }
> >
> > +       /*
> > +        * FIXME: When the pixel freq is 594MHz (4k60), this needs to b=
e setup
> > +        * at 150MHz.
> > +        */
>=20
> Typo here. For 4k60 we need 300MHz (pixel clock / 2)
>=20
> Otherwise
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I've fixed it, thanks!
Maxime

--rvxp5il2lqnzas2n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1ZeHQAKCRDj7w1vZxhR
xe1NAQDBoDF7y+tHlr5DcJFlIwZ3QQRh7Hc5OIfBiA9mYLIdkwD/fneGxtomigY5
/txCXfqzYna4dCVjluu3UqPV14GrHwg=
=gt4+
-----END PGP SIGNATURE-----

--rvxp5il2lqnzas2n--

--===============1113168592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1113168592==--
