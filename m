Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CDA314D0A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 11:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A8789FEA;
	Tue,  9 Feb 2021 10:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5D589FEA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 10:32:06 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A893558018B;
 Tue,  9 Feb 2021 05:32:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 09 Feb 2021 05:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Jt1fO61HE02mor/p4/e0vvQVzyp
 UYMVpukrxRr4pIl0=; b=gy8fEdwmYdkeQ8fotFSQU0/tDyfUqgMq2SUYoNaDlpb
 rUJikXAa4pKn4hMdRrJmJAuJ+ujlOORjbAz5VLGwL3OH9xErQquWjsotKMrp/aoA
 fIUjkF5x8cEzBDPL6Xk2+e+BIFW+J3nadR13oLak15wDh5XJre9kgh1kxc4OEXqb
 RHaWXPY4gHL1tKb+mvV6jCmr2miXegc5pOBQdryZDZ+S2fET+NT2f2XYYwyQaEV1
 tTeJ//9RFCXthIoXil/W6obfRqFYODEjnv4ywaEtH1l9H7I/T3XSeCvS93GEkL1A
 MKMpJePR8b58FXSqALe5orCQItF/nx/lJPGhkrNypqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Jt1fO6
 1HE02mor/p4/e0vvQVzypUYMVpukrxRr4pIl0=; b=nIf3OoCE1HypM0jgX2mMyK
 4d+rnAtKa3pDVr7BeGt1EHBk197gCDnXnXO5EUUHkBrsVqjv/C072X3C0pVbXpY6
 T9lpK7lZNyZMBTRHuVoaPUl6zWcb6PsJVophqUDkv9zdcVJKra1UX77bnHX55GG2
 F1HQpy6hcgnJJUBhf8yM5L/k17rhWQ81/WMSPosD9b6yZIp6ZPXW73AsNf7odUjA
 cJQVQr++fjfMFZ6Fgq2N+pFLePGD94t5WwSiDo3CkpRfqGWqKUCX72L2E2umIZeD
 4EBA6C1zAMopyJKHl5AC67Hu9TLk+7hmKGJzL2iaj9g174O3pLs9zYZI133i3wEw
 ==
X-ME-Sender: <xms:oGQiYA_Xcrw8juwkoOqQ12yONbPr0iQJsYr_F8SdL6Xkpx7Foj-qJA>
 <xme:oGQiYIsn5_Wqb4EScVJxOMhv6ynpS4-YnPpiXb6BICSVQLQg4mHNEZbsMgjfdek-r
 3GGTLcYDZrK8JL-Cvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheehgddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueevieeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oGQiYGAQd1Zp7WXBasrwRBrp6s4nMTWRslxZkiif_ig1uO_VIk53sQ>
 <xmx:oGQiYAely2Y5nSJcAQaPGTQr86vK_K2NKl-GkVLGu8Y8P9J--XUDuA>
 <xmx:oGQiYFNSsSteoX-XfQV872n084oT9faDBLAmLtestV-J6S-XHlucrQ>
 <xmx:o2QiYIoVQDU9Cha02tvPUSm5GxxC43ZzQP7n3nihB-meRXHLfzJfhQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4AF51108006A;
 Tue,  9 Feb 2021 05:32:00 -0500 (EST)
Date: Tue, 9 Feb 2021 11:31:58 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1 channel
Message-ID: <20210209103158.rnzvlvo44nnzrmk4@gilmour>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <2156838.FvJGUiYDvf@kista>
 <CAGb2v65cZ7DXzcPzt8ER1ucwhbhTOc0-mCCye3eK-ZgP3a6ivA@mail.gmail.com>
 <3972834.uPFdDeCNB3@kista>
MIME-Version: 1.0
In-Reply-To: <3972834.uPFdDeCNB3@kista>
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
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0387917522=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0387917522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lvwjttyd23hbxwrd"
Content-Disposition: inline


--lvwjttyd23hbxwrd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 07:47:17PM +0100, Jernej =C5=A0krabec wrote:
> Dne petek, 05. februar 2021 ob 17:28:23 CET je Chen-Yu Tsai napisal(a):
> > On Sat, Feb 6, 2021 at 12:21 AM Jernej =C5=A0krabec <jernej.skrabec@sio=
l.net>=20
> wrote:
> > >
> > > Dne petek, 05. februar 2021 ob 17:01:30 CET je Maxime Ripard napisal(=
a):
> > > > On Fri, Feb 05, 2021 at 11:21:22AM +0800, Chen-Yu Tsai wrote:
> > > > > On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec=20
> <jernej.skrabec@siol.net>
> > > wrote:
> > > > > >
> > > > > > Channel 1 has polarity bits for vsync and hsync signals but dri=
ver=20
> never
> > > > > > sets them. It turns out that with pre-HDMI2 controllers seeming=
ly=20
> there
> > > > > > is no issue if polarity is not set. However, with HDMI2 control=
lers
> > > > > > (H6) there often comes to de-synchronization due to phase shift=
=2E=20
> This
> > > > > > causes flickering screen. It's safe to assume that similar issu=
es=20
> might
> > > > > > happen also with pre-HDMI2 controllers.
> > > > > >
> > > > > > Solve issue with setting vsync and hsync polarity. Note that di=
splay
> > > > > > stacks with tcon top have polarity bits actually in tcon0 polar=
ity
> > > > > > register.
> > > > > >
> > > > > > Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine=20
> support")
> > > > > > Tested-by: Andre Heider <a.heider@gmail.com>
> > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > ---
> > > > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 24 ++++++++++++++++++++++=
++
> > > > > >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
> > > > > >  2 files changed, 29 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/d=
rm/
> sun4i/
> > > sun4i_tcon.c
> > > > > > index 6b9af4c08cd6..0d132dae58c0 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > @@ -672,6 +672,29 @@ static void sun4i_tcon1_mode_set(struct=20
> sun4i_tcon
> > > *tcon,
> > > > > >                      SUN4I_TCON1_BASIC5_V_SYNC(vsync) |
> > > > > >                      SUN4I_TCON1_BASIC5_H_SYNC(hsync));
> > > > > >
> > > > > > +       /* Setup the polarity of sync signals */
> > > > > > +       if (tcon->quirks->polarity_in_ch0) {
> > > > > > +               val =3D 0;
> > > > > > +
> > > > > > +               if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > > > > +                       val |=3D SUN4I_TCON0_IO_POL_HSYNC_POSIT=
IVE;
> > > > > > +
> > > > > > +               if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > > > > +                       val |=3D SUN4I_TCON0_IO_POL_VSYNC_POSIT=
IVE;
> > > > > > +
> > > > > > +               regmap_write(tcon->regs, SUN4I_TCON0_IO_POL_REG=
,=20
> val);
> > > > > > +       } else {
> > > > > > +               val =3D SUN4I_TCON1_IO_POL_UNKNOWN;
> > > > >
> > > > > I think a comment for the origin of this is warranted.
> > > >
> > > > If it's anything like TCON0, it's the pixel clock polarity
> > >
> > > Hard to say, DW HDMI controller has "data enable" polarity along hsyn=
c and
> > > vsync. It could be either or none of those.
> > >
> > > What should I write in comment? BSP drivers and documentation use onl=
y=20
> generic
> > > names like io2_inv.
> >=20
> > Just say that we don't know exactly what it is, but it is required for=
=20
> things
> > to work properly? Would be interesting to know what happens if you don'=
t set
> > this bit, but do set VSYNC/HSYNC polarity properly.
>=20
> Nothing seems to happen - tested on H3 with HDMI (4k@30) and CVBS. At lea=
st I=20
> didn't notice anything.

That's pretty normal, an inverted pixel clock would at worst give you
some weird artifacts and / or pixels being of the wrong color. Data
enable on the other hand would very likely stall the HDMI controller
since you would have only the blanking periods that would be considered
valid.

Maxime

--lvwjttyd23hbxwrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYCJkngAKCRDj7w1vZxhR
xedJAQCvyb+V3yoXMwG3DqhG21kI9ivkqbheculNc5PYOa79ZQD/cKZtr++3tXXL
b0t+vjHAf3eohmy56y3F2ZBXFWYzhg8=
=MfCa
-----END PGP SIGNATURE-----

--lvwjttyd23hbxwrd--

--===============0387917522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0387917522==--
