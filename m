Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98CA5432AB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845F5112141;
	Wed,  8 Jun 2022 14:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC74112141
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:36:08 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C2585C00C7;
 Wed,  8 Jun 2022 10:36:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 08 Jun 2022 10:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654698968; x=1654785368; bh=PT9W5SBjSv
 vMosv2DiRDrUQM/xrup3C/BSwljoKZACY=; b=nCOeEw18+qSmU37GkB5FjTZMwr
 UZB30I+dzGYYbB8KhsNyYHZdj2xhl9kI8SLXwaUZAx2Qh6DItbGI2TQboEbC5mEx
 GbmUEzsYNocNwOpBOevwwonJn6yQmfjQ5Xxcqz/pURPpY7WOxGhQQTpzabQqJKvs
 Abf8ff6H0bsEav2BV1lD/wpGBDY/yI7ZdciuvdAq6eEpO9k8C4A9KI0c08ekrr+w
 EDEfr1dLKIwdfgnY5f6Mel22780ruboJ/36y99moFuf0gExGMrHXGK82f3kHheX1
 ZO2aFRQeLLSbNxkkSAEBOR4mibkhpLywLSXjYXmrbK6LPmMWZ6RuQa+9JK+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654698968; x=1654785368; bh=PT9W5SBjSvvMosv2DiRDrUQM/xru
 p3C/BSwljoKZACY=; b=XXd7XvXxpbAPapjUTXPDhROcUUlZsxaZJYOlEr3rSBYM
 Q5yOqIe8wqmd2S7+ZCwx9qrTPKbQyuECz8v/2pnGNpnjpQ1ObZdf6cF3S7V0Raza
 7JlqiKWryHPv/mkGupi72vBhSkvVcZKstLcm3houbZG+6Kk+V7e5RyH9k6ec9nuN
 RF7U0Cj5felCwvq89/WmBsriArbm/piS814Xq1TSK2KGp0/g0Nb7FW4i+DOQqqvv
 0BwgGwuYSBb9aSqq/gXZsP9Bn61PZY9q/HSspgZfmaPPUn//NeW0idgAfBfIvcJH
 L2pYNZTRZ4sQmHQgY49F+XQi++6ZIF08NLcC8zRy+w==
X-ME-Sender: <xms:17OgYhl6RGf_tjMTAWigRIr3ZWDcKId41mja7V7gTMWrV8GAQzx1ZA>
 <xme:17OgYs2O3ALgLt1jNBrgb8R_rMs-kt8YMi-vBckYPY8KSojYEui-oaqxw0FQFwBE8
 deIZVSTQ-ZbOG6DGaE>
X-ME-Received: <xmr:17OgYnpTkcIRZ76cRE9Em8bJ7nb4qIMQE_hZsCasmy63aL1YLCRdatuQBPVcsUXhYcmqOGnzgMpt4ch3FqiOS3RC9feVtk9vq6yxv1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejgeeiveevvdfgffeftdevuefhheduveejieefgeejveeuhfetkeelgfev
 teefffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:17OgYhmTO25f6ugN0MfHXKj6YFR8J_IhM4nm500CJN0W3fKhtjYm7A>
 <xmx:17OgYv3b1frFpliW_eNlYMKfc3IicqFFTsmjK1JwBZp-aMpFpu55SQ>
 <xmx:17OgYguV1qT3Tmmyfzeaiv7XFUyNYp5X1AfqzgONGOJ9SXTuFJ41Zg>
 <xmx:2LOgYtCLj9TkFguFYbWYaw4-oWVQoa9X13YnSTj-xrRkZEOiI6xtOg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 10:36:07 -0400 (EDT)
Date: Wed, 8 Jun 2022 16:36:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Message-ID: <20220608143605.x4arwudst3nqeg7b@houat>
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o7z2pgpciwxuuchm"
Content-Disposition: inline
In-Reply-To: <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
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
Cc: stefan.wahren@i2se.com, Peter Mattern <pmattern@arcor.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o7z2pgpciwxuuchm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter(s)

On Wed, Jun 08, 2022 at 02:10:19PM +0100, Peter Robinson wrote:
> Hi Peter,
>=20
> Adding Stefan and Maxime
>=20
> > As of Linux 5.18.0, module vc4 apparently isn't working on Raspberry Pi
> > 3B any more.
> >
> > If a monitor is attached to the device, the boot messages show up as
> > usual, but right when KMS starts, the screen turns black. Similarly, the
> > screen also turns black when the module is blacklisted at boot time and
> > loaded from the running system.
> > The problem looks quite similar to the one posted some months ago in [1=
].

If I understand you properly, it results in a blank screen if the
monitor is connected, but the system is still responsive?

If so, it's a very different problem than the link you provided, since
it was occurring when no monitor was connected and resulted in a total
system hang.

> > Unfortunately, looking through systemd's journal didn't seem to yield
> > any real hint. Nevertheless, the results from grepping vc4 are
>=20
> I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
> can confirm the regression. Maxime would know what might be up here?

I tested on 5.18 on my 3B and it works well. Could you paste your kernel
configuration and config.txt somewhere?

> > =E2=86=92 5.17.1
> >  > kernel: vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
> >  > kernel: rc rc0: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0
> >  > kernel: input: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0/inp=
ut0
> >  > kernel: vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops
> > [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops
> > [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops
> > [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
> >  > kernel: fb0: switching to vc4 from simple
> >  > kernel: [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
> >  > kernel: vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
> >  > systemd-logind[338]: Watching system buttons on /dev/input/event0 (v=
c4)
> > =E2=86=92 5.18.0
> >  > kernel: fb0: switching to vc4 from simple
> >  > kernel: vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
> >  > kernel: rc rc0: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0
> >  > kernel: input: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0/inp=
ut0
> >  > kernel: vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops
> > [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops
> > [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops
> > [vc4])
> >  > kernel: vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
> >  > kernel: [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
> >  > kernel: vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
> >  > systemd-logind[337]: Watching system buttons on /dev/input/event0 (v=
c4)

Yeah, it doesn't look that different.

Maxime

--o7z2pgpciwxuuchm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqCz1QAKCRDj7w1vZxhR
xbM+AQCkY7QYZzqIMRtvBYqwt7K+yCBOahimlglOMp2qT6qUuQD+PkD/6+VItCy8
Vw2wd3r4AhTrQVIrpfvAWcQNv3x+pgI=
=GGCz
-----END PGP SIGNATURE-----

--o7z2pgpciwxuuchm--
