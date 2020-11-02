Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817E2A2BCA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6F46EB6B;
	Mon,  2 Nov 2020 13:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2426E4C4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:18:04 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 5882CD3C;
 Mon,  2 Nov 2020 06:18:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 02 Nov 2020 06:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=HjiljHXjNqxaw3F9nd4dGel4saN
 IJ+DNFWan1cnwO+g=; b=Lcn2GIgZCdOIwhBwadTUYZ3TLIlal+fPjW/jbD9/yNu
 3ZJwZtr1iWY86hduNMGmyG8pecqcnV0Bjq4QNPED9AqpLFQAxes4vOLM9cJC61bx
 lSQXTmzVyVSrGuWgcZYZirSM7+HRHmnx5Pg5fRWtLq3kw5Tbsy+6bbLAjR+Q31Xv
 +QOSYDTOKknV+/WO653jjvp3AhrJmfjCG49M7zubDg7lb0+2AYQJpGi0E4f1+FUJ
 OeSRpxzNvHt+3JZ5/iv6Tq9+nCXadXm7wIvrQcOVQf5ZQt3PWljlgNI3BNgBrT8S
 9ITcODuyWfAEnC/7rnXovOxg9kY6zuIQXHFyRvUHpMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HjiljH
 XjNqxaw3F9nd4dGel4saNIJ+DNFWan1cnwO+g=; b=ro5XhezU0Zz10Swxlytbcj
 lXGLmG47ehssWTyDHhKvdSH9cSpvrzuGEru1ftxXkH0v6yiMJWhd0H9r0HDtzMjN
 Jv7Y7TOrDWKdEqpjld2SwwrYIMZBwQ+s6hp2uYc3QX4gEHm7bcX1XU8uFUY6qPty
 HeltIMSLIrILZnfzTU++QT4s01qsxku7BCfQfpxCoJKQl25sFeRPFBaheTO8aqVW
 IN+GXqDiB4Zuk0NJCzN79kXvLDqWpZJQpJgZSdJk2EorrtArisys2/HIAqbaG+E7
 LWcBfQUNKJ5sPlrSnbxyRNF28IRQ9EDZWFPJ0pF3QlqzrpEBpte3oAn/zPgG5H7w
 ==
X-ME-Sender: <xms:5-qfX3LbBHWzLTV1l7AEL-tsu-qArVm2ZRo6oTGe65cWFoIl50OwFw>
 <xme:5-qfX7L3R6FJLHpq5xPG4oMMf9mM7FCPY6OOTLAxkcG-aL-NLHEj9kgygB5Atw3LK
 KVeM5yecr7-Dcm4qdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5-qfX_u6pv-m2id1ZhKn_ydb7SkIB2Cpnv-EEpue38ekxj88jjEFnQ>
 <xmx:5-qfXwaLQvR24zW2k-NReSyAhulV9CNdAKHtsXg_ySuVfKRG1hPJUQ>
 <xmx:5-qfX-ZZCGNvGJp9XTzT7WpxoZjl1LcwBXvdzMB7ga5EtG0PkXGzGA>
 <xmx:6uqfX0NYNkgkNXKiWBrql8_NM7HZOUd4OEzKb5xy0SugfV1qxHWaYqtXMF8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF57B3280063;
 Mon,  2 Nov 2020 06:17:58 -0500 (EST)
Date: Mon, 2 Nov 2020 12:17:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 6/6] drm/vc4: kms: Add functions to create the state
 objects
Message-ID: <20201102111757.nvsdlgta6byoubi7@gilmour.lan>
References: <20201029190104.2181730-1-maxime@cerno.tech>
 <20201029190104.2181730-6-maxime@cerno.tech>
 <20201030085931.GF401619@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20201030085931.GF401619@phenom.ffwll.local>
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1333209025=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1333209025==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2w5mm5twvbaqqfgj"
Content-Disposition: inline


--2w5mm5twvbaqqfgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 09:59:31AM +0100, Daniel Vetter wrote:
> On Thu, Oct 29, 2020 at 08:01:04PM +0100, Maxime Ripard wrote:
> > In order to make the vc4_kms_load code and error path a bit easier to
> > read and extend, add functions to create state objects, and use managed
> > actions to cleanup if needed.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Nice. With an s/drmm_add_action/drmm_add_action_or_reset/ over the entire
> series:
>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Applied with drmm_add_action_or_reset

> btw there's a series pending from imx people (Philip Zabel iirc) to add
> drmm support for modeset objects. I think that would really help clean up
> vc4. Or well make it slightly less buggy, since atm you're using
> devm_kzalloc, which strictly speaking, frees the memory too early.

I'll have a look, thanks!
Maxime

--2w5mm5twvbaqqfgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5/q5QAKCRDj7w1vZxhR
xYwnAQC/VhHjpR53FKfB1MeQOHPUNxQqHS4V4p8Ocz5/nxjRpgEA95qVWtgtNspN
MKlQovRqYsBIp2tpzMTbLSkQnVNysQw=
=EKB/
-----END PGP SIGNATURE-----

--2w5mm5twvbaqqfgj--

--===============1333209025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1333209025==--
