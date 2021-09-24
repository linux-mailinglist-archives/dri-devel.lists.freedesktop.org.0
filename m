Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152234175BD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 15:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888696E1BE;
	Fri, 24 Sep 2021 13:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294176E1BE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 13:30:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 944E75C023F;
 Fri, 24 Sep 2021 09:30:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 24 Sep 2021 09:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=rmFCW6ZuxIrb79NTnSIiEtkkJU4
 MOUi+xsG2b39d6ns=; b=fEG7Rw8/steTz3jpGn01Vp3mVpADeZdaHlYbXjHlrPC
 keBcIy+7yBUyzlOYGbmwcSFlBui61iU68oyZCzf55HXNWJrBlHL2RIWi7Uae1UgV
 Yfc1c04CIwPfucJfi+ChU35MYkEAS10oymQWXgE4M1FGyhy/vdVusGtM72O1LJks
 vMqHB6Q/2VNYQzDDJLfGRtCorFkgaLiMRL21MOhkcY0qNKqNSPB5AG2snWeMn+Sq
 /c58FZO+8s9xOrs61yFdowYQujVRlbkR+4BcCK77U+2jgWFp9hKQsNpYRSV4msDD
 zl5nOlRqRAKfF5bGcIYhTcSn3hOQZOTmb0xLh9cqi/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rmFCW6
 ZuxIrb79NTnSIiEtkkJU4MOUi+xsG2b39d6ns=; b=b5HaHeEE8QXSAYzVimmriD
 VrWw7D113IU5MzprHiOqoWCc9vaWlo+rxCeWcjOTQD+wTxS8nJ7HvVZgqhQ3Dlcn
 d7Vq0YyuAO0JqDHRgrCfcN1zeTC52ZumUpQS2IKQywsbd/Ae0HnWt3LUxCgPEL8e
 2Q8hz0vqqMVy3DUpF1/i67kCNF66YYHkdhhp1SFWkB8YRxWD8IZBj4WWcWlH1Oh/
 M/fHEBd/NFZZblyqogdWDGiKJTmERnWoLBVC4MN23OCS5LQJBYb0N0uRCqtdrjrZ
 EbqLIJ2+WQ1g9jjH57nLijluToHtuzlRB66cHEPAHXwaHMGQQPVbd6fY7f3j19Zw
 ==
X-ME-Sender: <xms:8NJNYQ-Dm8PZ732yRU2gPHCQGKI4BfXhOYXEm1_VqRNIw2Ksz5i6Eg>
 <xme:8NJNYYtjwBxahQMhqeUu4KMMkcnGyNw6S8DS0wZvheNWcHTZsBC5-VtuEa5aySeCZ
 J_jGYcUo1DvNnq_Rdc>
X-ME-Received: <xmr:8NJNYWCc3VzgJqVCC2KziO_ywnVE1hgthDJL4ld-UH5IPKG7RnyVrHcclM9_Xa34_lmYlJzH6_saPFGMEwMN7wbySNLJ8yRwps6o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8NJNYQdBPVIw7hHP9XYksQB6E7AjN7Pox6e4_X63-Xp_zGn-H9nv5w>
 <xmx:8NJNYVO-OE1zwad97KVceRcsTWN87JBXV7N7t11MdCOXwTS_rexI-w>
 <xmx:8NJNYak3ksvvtFAr84pCSoMIN4opItTFTmFL8QvUj1FBcpuNxjHung>
 <xmx:8dJNYRDKu4-bbFLYg6gnBw_zbVH-xtw0xDNQNGHJsTIozOZVD60EIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 09:30:24 -0400 (EDT)
Date: Fri, 24 Sep 2021 15:30:22 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20210924133022.waqgtr5xjjxigong@gilmour>
References: <CADVatmNi+jN+EwiWuoDoocZFyErDVNt1ND0BxtjuKiV63aNuJg@mail.gmail.com>
 <20210920171042.oq3ndp3ox4xv5odh@gilmour>
 <CADVatmOs7Cc1EdCZXMyXcWM-3-J4bU_3zF1thkOohVUL-G6ZrQ@mail.gmail.com>
 <20210922095725.dk4vk42zb3kh7y6s@gilmour>
 <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
 <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
 <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
 <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
 <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
 <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yrxubp22xzbq55f2"
Content-Disposition: inline
In-Reply-To: <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
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


--yrxubp22xzbq55f2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 01:25:21PM -0700, Linus Torvalds wrote:
> On Wed, Sep 22, 2021 at 1:19 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > I added some debugs to print the addresses, and I am getting:
> > [   38.813809] sudip crtc 0000000000000000
> >
> > This is from struct drm_crtc *crtc =3D connector->state->crtc;
>=20
> Yeah, that was my personal suspicion, because while the line number
> implied "crtc->state" being NULL, the drm data structure documentation
> and other drivers both imply that "crtc" was the more likely one.
>=20
> I suspect a simple
>=20
>         if (!crtc)
>                 return;
>=20
> in vc4_hdmi_set_n_cts() is at least part of the fix for this all, but
> I didn't check if there is possibly something else that needs to be
> done too.

Thanks for the decode_stacktrace.sh and the follow-up

Yeah, it looks like we have several things wrong here:

  * we only check that connector->state is set, and not
    connector->state->crtc indeed.

  * We also check only in startup(), so at open() and not later on when
    the sound streaming actually start. This has been there for a while,
    so I guess it's never really been causing a practical issue before.

I'm still not entirely sure how we can end up in that situation though.
The only case I could think of is that:

  * The firmware enables the HDMI controller, then boots Linux

  * The driver starts, registers its audio card. connector->state is
    NULL then, and if the HDMI monitor is actually an HDMI monitor (vs a
    DVI monitor), the VC4_HDMI_RAM_PACKET_ENABLE bit that we test in
    startup will be set.

  * The driver will create the connector->state (through a call to
    drm_mode_config_reset in vc4_kms_load), connector->state isn't NULL
    anymore, VC4_HDMI_RAM_PACKET_ENABLE is still set.

  * The driver then disables the HDMI controller (in
    vc4_crtc_disable_at_boot) but never clears the
    VC4_HDMI_RAM_PACKET_ENABLE bit.

  * Pulseaudio opens the audio device, startup succeeds because both
    conditions we test succeed.

  * However, since we either never enabled the HDMI connector (or if it
    was disabled at some point), connector->state->crtc is NULL and we
    get our NULL pointer dereference.

    The Ubuntu configuration has the framebuffer emulation and the
    framebuffer console enabled, so it's likely to be enabled and
    something (X.org?) comes along and disables the connector right when
    pulseaudio calls prepare().

Maxime

--yrxubp22xzbq55f2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYU3S7gAKCRDj7w1vZxhR
xeVIAQD2AUn3BVOVCrU4+8axwSfAkcjiA/rNb13iVfIK7ZMMeAEArlwsr/DrSGYB
klcK6bJ1fReQtRe3EXYIjYViOgdQaww=
=es8R
-----END PGP SIGNATURE-----

--yrxubp22xzbq55f2--
