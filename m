Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95053E4F9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37F810ECF2;
	Mon,  6 Jun 2022 14:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BAD10ECF2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:09:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B2A473200935;
 Mon,  6 Jun 2022 10:09:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Jun 2022 10:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654524560; x=1654610960; bh=2tg/LQuqY/
 dZKlfQNp8Nv2cxpu5KDqfqntDP+vsu7ig=; b=x5d3HP0ThpnI46zljY1w+GcKy5
 tX/Ph9kIAJOKEkF1bbc8bLw9yKmkPrpgNQ/Sbyf3+emwY/qnQ2ZcgOezRvyPUdef
 ul7cqS2c1OZHZsnB1A1cLbvAoaQkJVJqHh7B1gHYN9So0EFfPziRSU3/ZPEaJfeR
 9d66YleW9AVpCksfh+3yLgWwk9GcLgwrsapxGLtwo0fK561EdqRTIogcv+zhP7LJ
 gLNNI+3EjeXArBCB/b2OFT0us7OfbmvFE2Wzcgu/0s4E38lyeVkVKrjl3Mr+xy1l
 FLciu6YkB0z4tCjRrY+8VKyVdfoTgwBt3lrUtCCohb0S+mjPk08L15WVnM9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654524560; x=1654610960; bh=2tg/LQuqY/dZKlfQNp8Nv2cxpu5K
 DqfqntDP+vsu7ig=; b=Cfbr3AFFQ+R9BSykxEa163bL+Pviy4whwsDqARZRAOEK
 RrH36uJFqo4uoFRLFzizD/9d8rURgfUyHvP8DHwbcDUrWKFd2T71ZsOeywf0DaJ+
 22IeSaj5aYoVgyBI6g1if6DUjBycKTNcaRIQhbfhW/YtZHRs3TwuRNbXmXllx6VO
 hIn1tgmKUea3ac0r1Nppsoh/ngJoQATRQgrtlCHhHA6kKBTKfZ5S0xaOKzmz7Sgr
 cOlY3ravPcdKn5n6VpWx1rglcDGPJyJ8Wc+wdFX2RSXTrdPr7i6he1NfVruCFtXT
 pWLNXbHGEtQcu3AbEhyn1vvQZk1KgqmqV1BXiG6lbQ==
X-ME-Sender: <xms:jwqeYuVp6Ry65mew6hY7shKdvqM89WjquzBH6QVArf88vfwKYwdSvg>
 <xme:jwqeYqnwl4HLeq0iHCrQQTiotGgIkFNIC-7GSTkkHcjwqLBebdt8Ssz6Uxf6K-W0D
 FjGLf0lyK8r-zV_c6M>
X-ME-Received: <xmr:jwqeYiamFRE-WJ_GdLRa_MwrvZxUjx3RIpt5uZ3CC_T1N4IyLLAAPrzg4jjLfvzAudiIoV03Y9WZujFigyEPDJWcdui0usHtiyWkBpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedukeevvdehheeuhefhhfefteeiffefgeffuefgkeetffevgeevgeejteei
 gffghfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:jwqeYlVOaR3C6oG6-sNpqbbct6loa5n0RAT3GumnrNnaYi_kBUZJVA>
 <xmx:jwqeYol81kqFsvKtbLIydnTFP4Z0M6aEk4OaednnrhvaC1gb_xVXFQ>
 <xmx:jwqeYqe4aK4Wkz0h0-PTZ33PXGz9CsfVS0FvYrSlMOPVevoaN_nsRg>
 <xmx:kAqeYliu8sXPx5aQNDxS9V0_vAmqIc54D-KmLXk6OZjgK0hgkqntKg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 10:09:19 -0400 (EDT)
Date: Mon, 6 Jun 2022 16:09:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Message-ID: <20220606140917.suwk3uqxzsqeiab2@houat>
References: <20220606095516.938934-1-jose.exposito89@gmail.com>
 <20220606095516.938934-2-jose.exposito89@gmail.com>
 <20220606134242.h6kuqn4zbpmc2rql@houat>
 <576ed6ef-b961-9214-2c9b-56cb5b493b4e@redhat.com>
 <20220606135219.nwhp4fdawg2qjeam@houat>
 <78c1eb65-ea78-8744-5382-ea86a56a66f4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hinoebkwkjhusomc"
Content-Disposition: inline
In-Reply-To: <78c1eb65-ea78-8744-5382-ea86a56a66f4@redhat.com>
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hinoebkwkjhusomc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 03:57:45PM +0200, Javier Martinez Canillas wrote:
> Hello Maxime,
>=20
> On 6/6/22 15:52, Maxime Ripard wrote:
> > hi,
> >=20
> > On Mon, Jun 06, 2022 at 03:49:57PM +0200, Javier Martinez Canillas wrot=
e:
> >> Hello Maxime,
> >>
> >> On 6/6/22 15:42, Maxime Ripard wrote:
> >>> Hi,
> >>>
> >>> On Mon, Jun 06, 2022 at 11:55:16AM +0200, Jos=E9 Exp=F3sito wrote:
> >>>> Test the conversion from XRGB8888 to RGB332.
> >>>>
> >>>> What is tested?
> >>>>
> >>>>  - Different values for the X in XRGB8888 to make sure it is ignored
> >>>>  - Different clip values: Single pixel and full and partial buffer
> >>>>  - Well known colors: White, black, red, green, blue, magenta, yellow
> >>>>    and cyan
> >>>>  - Other colors: Randomly picked
> >>>>  - Destination pitch
> >>>>
> >>>> How to run the tests?
> >>>>
> >>>>  $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/dr=
m \
> >>>>          --kconfig_add CONFIG_VIRTIO_UML=3Dy \
> >>>>          --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=3Dy
> >>>
> >>> It's not clear to me why you would need VIRTIO here? The Kunit config
> >>> file should be enough to run the tests properly
> >>>
> >>
> >> It's needed or otherwise KUnit will complain with:
> >>
> >> ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm/.ku=
nitconfig
> >> [15:47:31] Configuring KUnit Kernel ...
> >> Regenerating .config ...
> >> Populating config with:
> >> $ make ARCH=3Dum O=3D.kunit olddefconfig
> >> ERROR:root:Not all Kconfig options selected in kunitconfig were in the=
 generated .config.
> >> This is probably due to unsatisfied dependencies.
> >> Missing: CONFIG_DRM=3Dy, CONFIG_DRM_KUNIT_TEST=3Dy
> >> Note: many Kconfig options aren't available on UML. You can try runnin=
g on a different architecture with something like "--arch=3Dx86_64".
> >>
> >> The following works correctly but it won't use User Mode Linux:
> >>
> >> ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm/.ku=
nitconfig --arch=3Dx86_64
> >=20
> > But then, can't we add them to .kunitconfig?
> >
>=20
> That's what I asked in the previous RFC too. Daniel mentioned that it sho=
uldn't
> go there because is platform specific (AFAIU, one might want to test it o=
n x86,
> aarch64, etc) but then I asked why we couldn't have a arch/um/.kunitconfi=
g.
>=20
> The answer was that's not that simple and some agreement on how to do it =
is needed:
>=20
> https://lists.freedesktop.org/archives/dri-devel/2022-June/357617.html

Thanks for pointing this out. So yeah, it's indeed not very optimal

We should probably just document it somewhere in KMS then? It doesn't
have to be in this patch series, but I have the feeling that we will end
up with that discussion a lot from people frustrated to have spent too
much time figuring it out :)

Maxime

--hinoebkwkjhusomc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYp4KjQAKCRDj7w1vZxhR
xcJMAP99qsO7FgUwevO9U74+Tm8BrRBDMWERHZvHOG3KcT4wrwD/QBNjSrBbIMvm
xKS0u3DrSP9u+bXKM/YCl/qgLvwRuwM=
=8VNg
-----END PGP SIGNATURE-----

--hinoebkwkjhusomc--
