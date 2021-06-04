Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA239B572
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 11:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047666F5E2;
	Fri,  4 Jun 2021 09:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5B76F5E2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 09:02:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 805EB5C0099;
 Fri,  4 Jun 2021 05:02:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 04 Jun 2021 05:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1jc38/kMYOUNay+MdgNpZ95kVoj
 aHlQ7YITnlCiwzew=; b=D0FMWIwKAeylm7rcRHJo0h3cuGEqbKFymISkCyZfOQE
 k7UhYcq0Rvgyq7k1nz+2WBUuyTxmqtrUvLrLBWjpIZEidRgQTwsXw8ge47Uv+Pkt
 j/GCf4/7Uy3kzrDXimcBKeA54jNHMPQFz2GNyCbZVOnQuYcpciQUDZNwFS9TKCrD
 faj0khlrsYilddvQnv9YfZzHdB+Wt7JrErhVpu6oZ70OlWbYI3pHLrfk7WAiNmrK
 NrQy142IbdADl4FdMxwGTy8WnAulyB/N+EjGm3umGXexXIYYmI4qfoBIKqSfcASO
 U+bjvI7udOCVCMSuTdL10ec8t8U6N1t5BKctItAIQlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1jc38/
 kMYOUNay+MdgNpZ95kVojaHlQ7YITnlCiwzew=; b=Lantx2gbJF7PJ8Iog9V/4O
 0Mv4JmyHGPlHknfeH4hsCD7a6b1E5McZKlmje+HCh1GIec22VKh9lZAvzfpmDzIm
 aK75jqvLIdUxNQVek2QI8hl6S1Z+mnL/WLCN19SG1DGZk6l2ZVMFT+OaOMMNrt2R
 55X21s6WLQ6JA4sGemt3El+2Dp+pbhAKjaPryhYSgA4dlH4AbIc5+wp9VQKSSlZR
 5/nO3hLdTjtgRX5IIo1patgBUvbJ6k+T/3Uz9eZKFL/SODh4hnVWOx+Ef228DEfi
 Hv/6ObxmX0DZWrQ9ip73Ejp5rQ/rymf/3fCraoQhy4/UINliHeIK+Kerhzdpnbrw
 ==
X-ME-Sender: <xms:Gey5YHD6CwLEnqnk2nx5wzXpkIzUBZjcy3QLmH_hBCJFNAutB8SFEQ>
 <xme:Gey5YNhdUOmUC-ipW9sqdjyGCVpO-5E7oQPEcH8cGe8GOa1B1GW2vuPagS_0jOEhg
 wl89F8l0QIawPAbEh4>
X-ME-Received: <xmr:Gey5YCldCFZ1tRrv5n6addj9qTEGJvPInYRUgznE1VfeTXusb4FlpE5MzVrIlcv6RQKNXmHkG44GU5HSK5cHB29HJRl6czeeMgEv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtuddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeekkefftdffhffhvedvudetgfdtleejveffvedvvdetgeeltdfggefhhedv
 ieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Gey5YJzs8dnLppNnzKTxnpq8iy3DdalWp7YeUev7RACqHVSVFKCtNA>
 <xmx:Gey5YMSqqcrcpucnhdw5U6bZPiN1SgACK1QHQWej75kC5ILknmv1Mw>
 <xmx:Gey5YMZpQJ8NbBseRceAqZacZJcM43RzG2NC8o2qdRZaHwjEnMWpag>
 <xmx:Guy5YHfMDaj-4QgxYCssv7sUgEXx3iOmRGHussqllP33CKHBAXustg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 05:02:17 -0400 (EDT)
Date: Fri, 4 Jun 2021 11:02:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: vc4: hdmi: audio: ASoC: error at snd_soc_dai_startup on
 fef00700.hdmi
Message-ID: <20210604090215.cpvoryvwrfzj5ikx@gilmour>
References: <612b134c-d356-f027-46d7-322bdaff37a4@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cowixb2ckvc6iema"
Content-Disposition: inline
In-Reply-To: <612b134c-d356-f027-46d7-322bdaff37a4@i2se.com>
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
Cc: alsa-devel@alsa-project.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cowixb2ckvc6iema
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Wed, May 26, 2021 at 12:47:29PM +0200, Stefan Wahren wrote:
> Hi,
>=20
> yesterday i was testing with Linux 5.13-rc3 on my Raspberry Pi 4 B
> (multi_v7_defconfig) and i'm getting the following errors during boot:
>=20
> [=A0=A0 25.947494] vc4_hdmi fef00700.hdmi: ASoC: error at
> snd_soc_dai_startup on fef00700.hdmi: -19
> [=A0=A0 25.947512]=A0 MAI: soc_pcm_open() failed (-19)
> [=A0=A0 25.947883] vc4_hdmi fef00700.hdmi: ASoC: error at
> snd_soc_dai_startup on fef00700.hdmi: -19
> [=A0=A0 25.947891]=A0 MAI: soc_pcm_open() failed (-19)
> [=A0=A0 25.948566] vc4_hdmi fef00700.hdmi: ASoC: error at
> snd_soc_dai_startup on fef00700.hdmi: -19
> [=A0=A0 25.948577]=A0 MAI: soc_pcm_open() failed (-19)
> [=A0=A0 26.500049] vc4_hdmi fef00700.hdmi: ASoC: error at
> snd_soc_dai_startup on fef00700.hdmi: -19
> [=A0=A0 26.500065]=A0 MAI: soc_pcm_open() failed (-19)
> [=A0=A0 26.500608] vc4_hdmi fef00700.hdmi: ASoC: error at
> snd_soc_dai_startup on fef00700.hdmi: -19
> [=A0=A0 26.500617]=A0 MAI: soc_pcm_open() failed (-19)
> [=A0=A0 26.502339] vc4_hdmi fef00700.hdmi: ASoC: error at
> snd_soc_dai_startup on fef00700.hdmi: -19
> [=A0=A0 26.502353]=A0 MAI: soc_pcm_open() failed (-19)
> [=A0=A0 26.502569] vc4_hdmi fef00700.hdmi: ASoC: error at
> snd_soc_dai_startup on fef00700.hdmi: -19
> [=A0=A0 26.502578]=A0 MAI: soc_pcm_open() failed (-19)
>=20
> Rootfs: Raspberry Pi OS 32 bit (April 2021)
>=20
> But according to aplay -l both hdmi devices have been registered. Does
> anyone have seen this, too?

I would assume it's due to this:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/vc4/vc4_hdmi.c#n1083

It pre-dates my time working on the vc4 driver so I'm not really sure
what this is supposed to prevent, but my guess is that it's there to
avoid someone using the audio card before we have a display detected and
connected, and its capabilities known (the first and more obvious one
being does it support audio in the first place).

It's nothing new though, maybe it's the error printing itself that is?

Maxime

--cowixb2ckvc6iema
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYLnsFgAKCRDj7w1vZxhR
xYo7AP4gasQXZNwx0uZo+1T1j85hsw4A2gK7D9fEPvnksbfYdwD+O6sJPi2spLyf
6udavnhBnHFmt2Enn3q5NJD39iNJDQA=
=Rxgh
-----END PGP SIGNATURE-----

--cowixb2ckvc6iema--
