Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0311B6EDCE0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 09:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FDC10E6AE;
	Tue, 25 Apr 2023 07:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFA710E6B6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 07:38:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DFF0B5C0088;
 Tue, 25 Apr 2023 03:38:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Apr 2023 03:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1682408334; x=1682494734; bh=RT
 qHKH5kW3d3hEeif41q3EZzXW9t1gA8K2PaRLkKVZg=; b=qeofkEuO9/Lijbwef4
 uY0IEaM6DwlkO3Gjogc1XCCRHNnBNaAbY/PBP4fXl63ugTBmN05g/sOYVwQTis4f
 SgfcRU2JNUNFZ7wmb2DUtngLpxjNYJ/0VxRIJvNR0hPNaZgpm40X/CCu+yd40nDJ
 NCLHIdIYKlMtZ/QjpLzXf/Ht9UuY9A9xQ5UFL2/2uSpsk3i/hh9ieowEVmZXiu/Y
 BPLKL4iEW1v5tOSwQp14qkxrvDE04Xm4OlLG4j7+M9pg2XEgW+lDEP90vdbpdmJf
 Lecdb+P4xof/nk+JTVdPJ96tOvA2yBu9taYYlVsIyOJh3GgnF+F80YqM5zQ4D9YC
 T4+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1682408334; x=1682494734; bh=RTqHKH5kW3d3h
 Eeif41q3EZzXW9t1gA8K2PaRLkKVZg=; b=OvJEZhoJesRORA74KJ6VAW0UdoCi+
 n8vtYGFRZ4cFg4qyD4udh4TW2VvgyoB6iBFKJ8606vGiW6aMdlZebXCKQtUGkKJt
 gb4YnBfeIiNLJeaSOjH0EWyGbKWe0RqBnR9McJyqX4G4xUhPsfuqifx0dPl/nzZ6
 VysFHevGRtTPT1ZGzwusvdpUsRakmK+sEfUOZ+6Je6IRNISPfJepEJliqqF3LBOW
 vHCuMY58QXEyy4EKMR/MxVlH7Pgj5O8puQB+HsVm7Bjuduz3MI5u482gI+yIJB/k
 j+DlicL6ZDhp3Ej/Ty994MeOy/uSOIkF1HoGWszrWccZ36HT/+xJUdOFw==
X-ME-Sender: <xms:joNHZPkVOMvaxDtQDF4HojkF9eY0wjF4QzQ11jhE7TiLwnD3A_FIHQ>
 <xme:joNHZC0tIWIQyI1nXjMnKOqIN0v6rrRJ4G7Mg6UFCgBJW7LTKh4AYt4ZiXT0-eGK2
 xfOiF4IPcSBXhTr5w8>
X-ME-Received: <xmr:joNHZFoCkzkOtQfSZSNd2PWJE9j7o3JYcVlFH1hzRBPUvCzoZACJI2jDMKmydAV4VmSftGQxH-O7rytJ45jHPg0Bhggkf7E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueevudehuedtkeevgfduveejueefvddvvefhjefglefgtdekveeugeet
 kefgleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:joNHZHlIkBP0YqO_sXvjsikG-EJCyvVsHOSB29lZWbWULvIWbcz4Xg>
 <xmx:joNHZN1VW--gFcJ_6Rlz31rZoHAZnt9S8Lqhg7xmFmXa1Itwmq2TOg>
 <xmx:joNHZGu5qkdtfOGmLPOR95Py6K2nPHRPhOkj774wV8mNvdwRCsg9UQ>
 <xmx:joNHZHMI3mMtDDsPLvEyn97zSaqP8C2UqdFCR070_vKWhdE_SYb6Bg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 03:38:54 -0400 (EDT)
Date: Tue, 25 Apr 2023 09:38:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 1/9] drm/vc4: Switch to container_of_const
Message-ID: <6ckl6zmizxsm52imeau55bicb4hmd3p46btsqih64qaoeptvww@bktsqhuq4lek>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
 <20221207-rpi-hdmi-improvements-v3-1-bdd54f66884e@cerno.tech>
 <87354sij2i.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jsmbnufzclhulggs"
Content-Disposition: inline
In-Reply-To: <87354sij2i.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jsmbnufzclhulggs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Javier,

On Sat, Apr 22, 2023 at 07:26:13AM +0200, Javier Martinez Canillas wrote:
> Maxime Ripard <maxime@cerno.tech> writes:
> > container_of_const() allows to preserve the pointer constness and is
> > thus more flexible than inline functions.
> >
> > Let's switch all our instances of container_of() to
> > container_of_const().
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
>=20
> [...]
>=20
> > -static inline struct vc4_dpi *
> > -to_vc4_dpi(struct drm_encoder *encoder)
> > -{
> > -	return container_of(encoder, struct vc4_dpi, encoder.base);
> > -}
> > +#define to_vc4_dpi(_encoder)						\
> > +	container_of_const(_encoder, struct vc4_dpi, encoder.base)
> >
>=20
> A disadvantage of this approach though is that the type checking is lost.

Not entirely, the argument is still type-checked, but yeah, it's true
for the returned value.

> Since you already had these, I would probably had changed them to return
> a const pointer and just replace container_of() for container_of_const().
>=20
> But I see that there are a lot of patches from Greg all over the kernel
> that do exactly this, dropping static inline functions in favor of using
> container_of_const() directly. So it seems the convention is what you do.

More importantly, container_of_const() isn't always returning a const
pointer or always taking a const argument, it's returning the pointer
with the same const-ness than the argument.

This is why it makes sense to remove the inline function entirely,
because it removes the main benefit it brings.

> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks, I've applied this series

Maxime

--jsmbnufzclhulggs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZEeDjAAKCRDj7w1vZxhR
xWKJAP9i+arWN3T/cwrP5SbdIhY2zgDcWVyy/DWNXipJSFCEpQEAu5/219HTRpQn
eeMJY41X7MyUhwOYkK3GWkkMJjBcHQE=
=MpDn
-----END PGP SIGNATURE-----

--jsmbnufzclhulggs--
