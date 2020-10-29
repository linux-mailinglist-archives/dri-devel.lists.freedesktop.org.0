Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCCC29FF9A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749906E989;
	Fri, 30 Oct 2020 08:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299EC6EB97
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 10:47:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A6A9D580469;
 Thu, 29 Oct 2020 06:47:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 06:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Z8zz4Sw2w1Z9yvccsunvL+wNDLx
 sQfpppas1cdB1jxQ=; b=tsvy0sZX5cpY1KT+1WzOoIVNOp1V77v2bjcjJsYZo9B
 BGAdYfBXbsxcnykE+UWPZVdokOvdCJEAN+G7enE3aQYMAlq7Jc07ReQOZPsqK3ZN
 VrVDXuu/NTciZl609wAbDC3vWzsGMrli8hlvfqJMQ5+jJNV4Way5uZ2oqvDQ4I5p
 VdLtkGhLZA46IsI8srNBr7Z1RlJfprwtMNVuOFjmWAJ1ExYLzANvigyT5uqTCgJb
 fc/1EM68fj8O9zUcok93ijtSZNryfZGnOKdsBxSwVBmh0J6QBx2L8+ldKpfGvR+Y
 jRN/v02LlqMKh0eIXzywM0ytBSejtFkVuNCCn3u5LjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Z8zz4S
 w2w1Z9yvccsunvL+wNDLxsQfpppas1cdB1jxQ=; b=XpPtmBDwWyf3yTH+hJc7TA
 RyfBox1U84lxtZlzVf/c3NPwgojoDYjBgL4Isl4qWJkQqm1x/DlnMz4+ArNI79kX
 0Kthhm+pUNQGh7k7C6ug5Yq/ipX559SGuf2tvNWo0NI+i/Z/GGMGNa5vQS350IPo
 iBOXvGMp7gu94A24QvIU9VRgK6CTezmcLgxDMpDyh9g479s0RjeD0N3HYMPPtbCO
 4LmeTGPnIeLDlrkbt6LZ0IR8Rv3tNgx7fhYgf0zDL+X4glTb2MC8F9Q0guHBLF1u
 I42iywZIQb3BnT5530gbF0xdPQHCO7K7eRNLNloRUqxClEN06qNwobq9pa7owiqg
 ==
X-ME-Sender: <xms:w52aX-auZCUeDPetlf7N89XRMFUW4Mo6TUXof4mG2Tul9bpnsu7H6A>
 <xme:w52aXxY4_1hKojeKZf8hCz7q_A5y3s-XuJ8Lkiuamq-4BFE-6GSbWaq7bFnrYYbIu
 56wbwj1jCstd-icHc8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:w52aX4_9tvAH7gct2N8-ifAwFqEGJ8hM5LMq0GFEAjaQMlolWstzlw>
 <xmx:w52aXwrcb-xuDnaaRuIU7atFBLvh-DWyClLsNrL1av6wkToxyT3Zxw>
 <xmx:w52aX5pwzezM6o-rRrAY0lhWQf9IXwL4iZ1pKCVE-lVy5thWv-QT1A>
 <xmx:xJ2aXxboJBTGpCcnQyScPaYvTMh-KPpsP_sfeZHuITuaXnns5xzB2A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD8F53280064;
 Thu, 29 Oct 2020 06:47:30 -0400 (EDT)
Date: Thu, 29 Oct 2020 11:47:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 4/7] drm/vc4: kms: Document the muxing corner cases
Message-ID: <20201029104728.xrrqug5zjmbhpf5c@gilmour.lan>
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
 <aa88b754887b0a53b33e6a2447a09ff50281fd54.1603888799.git-series.maxime@cerno.tech>
 <20201029085104.GA401619@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20201029085104.GA401619@phenom.ffwll.local>
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1177698733=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1177698733==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e4k75x2rswcudup6"
Content-Disposition: inline


--e4k75x2rswcudup6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Thanks for your review

On Thu, Oct 29, 2020 at 09:51:04AM +0100, Daniel Vetter wrote:
> On Wed, Oct 28, 2020 at 01:41:01PM +0100, Maxime Ripard wrote:
> > We've had a number of muxing corner-cases with specific ways to reprodu=
ce
> > them, so let's document them to make sure they aren't lost and introduce
> > regressions later on.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_kms.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> > index 4aa0577bd055..b0043abec16d 100644
> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > @@ -612,6 +612,28 @@ static const struct drm_private_state_funcs vc4_lo=
ad_tracker_state_funcs =3D {
> >  };
> > =20
> > =20
> > +/*
> > + * The BCM2711 HVS has up to 7 output connected to the pixelvalves and
> > + * the TXP (and therefore all the CRTCs found on that platform).
> > + *
> > + * The naive (and our initial) implementation would just iterate over
> > + * all the active CRTCs, try to find a suitable FIFO, and then remove =
it
> > + * from the available FIFOs pool. However, there's a few corner cases
> > + * that need to be considered:
> > + *
> > + * - When running in a dual-display setup (so with two CRTCs involved),
> > + *   we can update the state of a single CRTC (for example by changing
> > + *   its mode using xrandr under X11) without affecting the other. In
> > + *   this case, the other CRTC wouldn't be in the state at all, so we
> > + *   need to consider all the running CRTCs in the DRM device to assign
> > + *   a FIFO, not just the one in the state.
> > + *
> > + * - Since we need the pixelvalve to be disabled and enabled back when
> > + *   the FIFO is changed, we should keep the FIFO assigned for as long
> > + *   as the CRTC is enabled, only considering it free again once that
> > + *   CRTC has been disabled. This can be tested by booting X11 on a
> > + *   single display, and changing the resolution down and then back up.
>=20
> This is a bit much.

What do you find to be a bit much?

> With planes we have the same problem, and we're solving this with the
> drm_plane_state->commit tracker. If you have one of these per fifo
> then you can easily sync against the disabling crtc if the fifo
> becomes free.
>=20
> Note to avoid locking headaches this would mean you'd need a per-fifo
> private state object. You can avoid this if you just track the
> ->disabling_commit per fifo, and sync against that when enabling it on a
> different fifo.
>=20
> Note that it's somewhat tricky to do this correctly, since you need to
> copy that commit on each state duplication around, until it's either used
> in a new crtc (and hence tracked under that) or the commit has completed
> (but this is only an optimization, you could just keep them around forever
> for unused fifo that have been used in the past, it's a tiny struct with
> nothing hanging of it).

I'm not really following you here. The hardware that does the blending
(HVS) and the timing generation (pixelvalve) is mostly transparent to
DRM and plugged as a CRTC, with the pixelvalve being the device tied to
that CRTC, and the pixelvalve hooks calling into the HVS code when
needed.

The FIFO is in the HVS itself since it can only blend 3 different
scenes, and then you get to choose the output of that FIFO to send it to
the proper pixelvalve that matches the encoder you eventually want to
use.

So yeah, this FIFO is entirely internal to the CRTC as far as DRM is
concerned.

Maxime

--e4k75x2rswcudup6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5qdwAAKCRDj7w1vZxhR
xbbFAQDy/S0zhn1z/LVK0PzoUmNscFqjiPz9ALe9LP4uLI1bKwEAv4uaqODVyDPn
GFzGbPzY90JX+t9mR3l9CUcLbbtHZQQ=
=dvgj
-----END PGP SIGNATURE-----

--e4k75x2rswcudup6--

--===============1177698733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1177698733==--
