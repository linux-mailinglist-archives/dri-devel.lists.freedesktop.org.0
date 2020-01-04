Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13BF130226
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F005E6E436;
	Sat,  4 Jan 2020 11:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5BE6E3BB
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 08:45:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A23622028;
 Sat,  4 Jan 2020 03:45:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 04 Jan 2020 03:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=50yXllbu8VHNaCuctcXj0xRdsy6
 TBcAhvMaBja/qzec=; b=Ys6oVlYV2PZiLvjRqJIPidsLBAXL9m/QdrYonZaAOHf
 t7yK6EerS9cwscwPayS50g89Mf+EdMuuHDPM2BUZSrn+lSDQXkCDb7PqShtqhfiQ
 9KdtL4BJdzeW8P2UH90wLT0vd3w0P02roQdgnzlfqps+mvP5EmjF8pnlrWOckQ8f
 FDmsbH8m12BStrcwwi1mJ6l2dYpRBVVQy3P3m3JHnLRwBOinxAHwGztTmRbbZgvj
 YsMs9fi+7i3LwZXBwdzy1mDtZ/V6irodvSFhHFk0OYND6pg/rfZlzFmUGlFwKB7c
 RnwoA4q/Iwb+1ths3tIbDBt1FyRPtCq5dp9mRY5nYiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=50yXll
 bu8VHNaCuctcXj0xRdsy6TBcAhvMaBja/qzec=; b=FF0zJlU8mn6snG9ZwZpXxr
 cgpnpnPeltmSHq/oYq2EKsSqGxzpkBO7kLyv6z7wnPdRH0/aIqC4ysYfhkWR0C9h
 XSoq5EpaFXQ4Py3fvPd6l1EvnNP8F2HUaCHhyzv3O5GYpzSU13CbHXmLdyMfzcAZ
 BhGdWiNXxOGpDsMM7Fo88I3NFpuXWjBE6bpJhudk6Muqrrs3jm0tVCRNdn8vhWHp
 as2vx3elW8Zl3eDKgR/8vdHqRxyuo/wXJyPnqjgpvKwh3Y31k3JMdojG6O7uC5D0
 4W8FV9QhwqSKh9/KxeKJztNPcH1zmXFZHvFf3/GxEnBfaOY1RP05VDRJ2SYyhbBQ
 ==
X-ME-Sender: <xms:rVAQXqg1CMyRf4YPo7Y70nVvTBiO4BG9SgcQYKiPcuU6azTJt7lrIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeggedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
 dtrdekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegt
 vghrnhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:rVAQXt4qH1W1gPQwaU13Hi2wJ8nadoZBjEogF0gCsprAel4TAOdEEQ>
 <xmx:rVAQXi5U5Cgjw6YL-6JfvLUsGYyxulcaNZD6jMmDvCRZYzwQcuCTRw>
 <xmx:rVAQXlEB_jypASFH9AC5Qz6xdtFEcDEsxlTbnEWrBlijrrq3TDHJrQ>
 <xmx:rlAQXiMxIbSITfSPELTjuJ8ojHy3N1wdmdF1QMeGAeT8Ltznx6JorA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B1B8D8005C;
 Sat,  4 Jan 2020 03:45:32 -0500 (EST)
Date: Sat, 4 Jan 2020 09:45:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 2/4] clk: sunxi: a31: Export the MIPI PLL
Message-ID: <20200104084531.npas3issrfznitoi@gilmour.lan>
References: <20200103152801.47254-1-maxime@cerno.tech>
 <20200103152801.47254-2-maxime@cerno.tech>
 <CAGb2v679hRb+068xcA7DvnwYjp1V9MP9rOWWy_MqXwAG1_d_Zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v679hRb+068xcA7DvnwYjp1V9MP9rOWWy_MqXwAG1_d_Zw@mail.gmail.com>
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0742668576=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0742668576==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jhpwe4ug7hd6r55g"
Content-Disposition: inline


--jhpwe4ug7hd6r55g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 03, 2020 at 11:30:12PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jan 3, 2020 at 11:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The MIPI PLL is used for LVDS. Make sure it's exported in the dt bindings
> > headers.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--jhpwe4ug7hd6r55g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhBQqwAKCRDj7w1vZxhR
xaiBAP9dc1FBVQ46lxRQCakpUvqKyOL9xtjyjH1AZ+Wx+uAprAD/TQ5SI19lYCmd
ALb0rF6dCIQ520S1K/PL2vkiF+aehg4=
=EcQR
-----END PGP SIGNATURE-----

--jhpwe4ug7hd6r55g--

--===============0742668576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0742668576==--
