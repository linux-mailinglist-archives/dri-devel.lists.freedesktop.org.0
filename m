Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F641483C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 13:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BF96EB88;
	Wed, 22 Sep 2021 11:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844A56EB88
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 11:54:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DED225C014E;
 Wed, 22 Sep 2021 07:54:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Sep 2021 07:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=lBcp7OcKy5PMWRjVhtX7DTY7jV4
 ay8qKRqwus8X+yDs=; b=u/nzD6nyYEEYWb1u2Urv1q9OzhzKI5niny4lr7GLqNc
 bSyDCgAWwR2zeRQ7h7lJmL0BJhDL8+1+9ht7Tp/pN58bsTcyLmriN0F4g+Kd3QOZ
 64yim3I4Wu/EQUNfYA2C+adlfwa/iiyPf43DFrU/d2/PVn793JPBEtaT7orpkV5Z
 gh/vUI6ay8rXDvgB0SUh5zT62bXFCABd6E5uV0qh97m3T45bGGMREGNy78C6zPhB
 AlBuy3sD6hRBePC6fanRNnlRlu9tVpncDNwkBnNIhDwKgveDQDi84dV2M3ZUqkH4
 SptikHLdc9W9Ng/m10/ewywaW2F8jX/8ysaFuDF2B1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lBcp7O
 cKy5PMWRjVhtX7DTY7jV4ay8qKRqwus8X+yDs=; b=mW2u+TkR1f9gmf5+YnvqoR
 hRuU1s0Wx4UMCZBBkX2FuS1DrTr2KMpQZgSexBnJrKbigLacOZDVlQ1l0zFE5rFz
 pBwQyl43XActjKP8LFB1wezf/MITvgSSB2qkkkMqu82ncYsPgEV+wJz9si+UUzb8
 oXkDXhE5L4MxU+v80c68yYlyXTF5a4y3G78gEb+Vw4FoI4P9ezoPGM2/eAY5EsD+
 2HFatlFFU9CNfGfkC8tzk77+30Ej0tjH0jhScBgLwYhSHIBs+JfmBJcaON4+Ri3k
 CT0Hx/gv/wZJlwPy5b8CMPLIbNOcLTHIAdJStxM/vA1Evax1j34gqlqlZDu2y4+w
 ==
X-ME-Sender: <xms:ZxlLYdNKs40OBgeobMWNIQtp4PIsteo-0j5CguNymvXBS4y1HDaTXw>
 <xme:ZxlLYf-JCqddq_Cy4MJRcE8pQFUqOsEVzwJEroZVfbHd1KMfFxycbvZh0gL50gTJU
 abAcd_6Iki_dHbBmVE>
X-ME-Received: <xmr:ZxlLYcQz7OcXnpSiP2-kVvWIrZF9xHmfye_Cd6Cl5J4ZvrwdNTHOJ00usBBEb0yuw8OH2DWbx8o5rK3km784-Z6Dv95xkqmnFmlF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZxlLYZuOp-uRUL0RLVE5Y-djebG8oouHGmaM4LW77wkyziULjzUUZw>
 <xmx:ZxlLYVe-nv0JrC50nazCvoCfBCG_nlqBoIqDMGutIMGv6BmQgW0_OQ>
 <xmx:ZxlLYV3Rswa-KknokhzGw1Qd2S-vrqO6_n9NUe5-mrsRxMOjfzZX6Q>
 <xmx:ZxlLYeGsb1Lg7CXRxwbqOv1bfJb6epg6IuSaO9wCkTCpgzNY9nvxkA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 07:54:15 -0400 (EDT)
Date: Wed, 22 Sep 2021 13:54:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Michael Stapelberg <michael@stapelberg.ch>, Emma Anholt <emma@anholt.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Felix Kuehling <felix.kuehling@amd.com>, Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
Message-ID: <20210922115412.ectgjtyhgmeaxqxn@gilmour>
References: <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
 <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
 <CADVatmNTKof8jMyx4xx9b2fQ=zVb2ZtXZh1uoYE2R-6DkaHj8w@mail.gmail.com>
 <CAHk-=wjZ_EXdfongpgRV3BrrNm6CX6CmKYT5TixK-nOsaGG81Q@mail.gmail.com>
 <CADVatmN5EpRshGEPS_JozbFQRXg5w_8LFB3OMP1Ai-ghxd3w4g@mail.gmail.com>
 <CAHk-=whno5+L4pANmwzeT0oT==C179pCJe7_3VwDw=EQ73nSmQ@mail.gmail.com>
 <20210920121725.37es5k3t2p2bg4ml@gilmour>
 <CAHk-=wjG7ZYgZLiRb4boJKOMo16UHO+zNoaxi3B6a9qBtxvzHg@mail.gmail.com>
 <20210920173255.pp5dyaxqy4x2eo65@gilmour>
 <CAHk-=wgOvmtRw1TNbMC1rn5YqyTKyn0hz+sc4k0DGNn++u9aYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zxs4kwl67mxjpz7e"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgOvmtRw1TNbMC1rn5YqyTKyn0hz+sc4k0DGNn++u9aYw@mail.gmail.com>
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


--zxs4kwl67mxjpz7e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 10:47:43AM -0700, Linus Torvalds wrote:
> On Mon, Sep 20, 2021 at 10:33 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > What I was interested in was more about the context itself, and I'd
> > still like an answer on whether it's ok to wait for a review for 5
> > months though, or if it's an expectation from now on that we are
> > supposed to fix bugs over the week-end.
>=20
> Oh, it's definitely not "over a weekend". These reverts happened on a
> Sunday just because that's when I do rc releases, and this was one of
> those pending issues that had been around long enough that I went "ok,
> I'm reverting now since it's been bisected and verified".
>=20
> So it happened on a weekend, but that's pretty incidental.

Ok.

> You should not wait for 5 months to send bug-fixes. That's not the
> point of review, and review shouldn't hold up reported regressions of
> existing code. That's just basic _testing_ - either the fix should be
> applied, or - if the fix is too invasive or too ugly - the problematic
> source of the regression should be reverted.
>=20
> Review should be about new code, it shouldn't be holding up "there's a
> bug report, here's the obvious fix".
>=20
> And for something like a NULL pointer dereference, there really should
> generally be an "obvious fix".
>=20
> Of course, a corollary to that "fixes are different from new
> development", though, is that bug fixes need to be kept separate from
> new code - just so that they _can_ be handled separately and so that
> you could have sent Sudip (and Michael, although that was apparently a
> very different bug, and the report came in later) a "can you test this
> fix" kind of thing.

I still don't have a way to reproduce Sudip's bug, so I can't even
provide that.

> I don't know what the review issue on the vc4 drm side is, but I
> suspect that the vc4 people are just perhaps not as integrated with a
> lot of the other core drm people. Or maybe review of new features are
> held off because there are bug reports on the old code.

It's not really about drm here, it's a dependency on the clock framework.

Maxime

--zxs4kwl67mxjpz7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUsZZAAKCRDj7w1vZxhR
xVpNAQCzSrfBHtX8AE+d12mCpvwA6Dmp7WixdV7uoRRsfQDF5AD/caAiJLf/nEXy
yzxs+w3ZGYuRbCPCLxlHiK0+Fz1UzwE=
=IEKk
-----END PGP SIGNATURE-----

--zxs4kwl67mxjpz7e--
