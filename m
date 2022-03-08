Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF34D1C80
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 16:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C0010E221;
	Tue,  8 Mar 2022 15:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D8310E1E3;
 Tue,  8 Mar 2022 15:57:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B72D55C01EC;
 Tue,  8 Mar 2022 10:57:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 08 Mar 2022 10:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=MwUl8+V2rjOZhZ/YbNsmhcOOqKrJmfUnnhPt6L
 MwgsE=; b=IzHIbPkyF22IpTHkXprkkSgj2PY4Q3Gr1YkbD38STEoStSxIP1AjxZ
 XLCO2/fNd8d0QqhrXUR7tm3Sa1pQzu40MmYK8G7befIsoPEGxjKaAD9tZpzuys5X
 5YDbmECcvaOAgLUHi7oFKl0p9cX/vWIRJ04J2Ji6TQnttgiLawyHuRRAFDECdtvp
 ncuplAfSWdiPqad0MgGwjL0m1BSx0vtwF0DAomnhOhJXC1LVB6mH+EHqZ7O37Q3Q
 4sgcHWMgyv7EiEz2+RrbvrhyUCifFahs/t2Ke4YdxQODazPTafOsjo+9df5nhlqs
 CuhwqsvmjjwdwHWNRY/TZpIazWZVyr/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MwUl8+V2rjOZhZ/Yb
 NsmhcOOqKrJmfUnnhPt6LMwgsE=; b=VHfiotHg4FWKNBm9QJMZdn70kNlqTmdaK
 Hw34TRPu9CvX1Cg1PxsjLep8t292rd2FjU7xgxQV/pDVkPh9eqljNPlFCL3ihNUK
 zYqxir0lO2+V0a8onzMh/wVvy+lpw4G5Eb+Zl8WSCEM5clhrzgDgbTp/EnlUKvLD
 ymJcHzfif+xcxyt+PMb8+kE90NnxcdSYKgc3ZPtCWXyRiAY0wUkQzwn5/nWtgVzO
 qk4yEyGmjvyWjf21TR/pw7eckyaBsu3QgNm5qzxsKnkxrAj1/j+hzhvZqtuDTNRr
 Jy/WWResyzi4TY/mXr0dDdQgBGge4poRvRLxhWiAXwELsJyD2FzWw==
X-ME-Sender: <xms:5XwnYn-8bYT2T_bvsK99Fh7WJpVA4aZMUdfYSm96not2njg_0S26NA>
 <xme:5XwnYjt4HSlwqA1XjnN85jNcvYWOjDZ7zXlRsC7jPda_H5sxU0WQI0x3N2A_ljUPW
 S7lUP05uLaJ5bTSo_Q>
X-ME-Received: <xmr:5XwnYlCLVfOmCKKLexcp13QAlk9LGin_MXOMTZTs6Yt6DxOR774VefXTl2flxziOiTYIVZvyTIPdKNXH2Btt3mTB54FM3XrRdLys04I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgedvvdfgkeekffelvdeifeduhfdvfeehieeggedutddtfeejteehjeefheel
 tedvnecuffhomhgrihhnpedtuddrohhrghdpkhgvrhhnvghltghirdhorhhgpdhgihhthh
 husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5XwnYjedOYnxN2XkR6vvvgx3c5qTbuopT7ioylVQCnEpLw-PPQ4x7w>
 <xmx:5XwnYsMevw065WkkpyyKvDepWB4TFmAGDd4-qrimjh5381y87Eg-Zw>
 <xmx:5XwnYlnnrYbbuAYxIaFtBsJ7zg7c-aDcQIZwWrL0bPE2b68-51lW6Q>
 <xmx:5XwnYlYhuMXBq1cS6p0p9PYZU6WdhQ9Ka72A3Wb0jz4Bqe2V5XFxyQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 10:57:25 -0500 (EST)
Date: Tue, 8 Mar 2022 16:57:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [igt-dev] Mandatory Test Suite for KMS Drivers?
Message-ID: <20220308155723.jpgpkbavay5ama2u@houat>
References: <20220303090507.grenwdro7u4fzmoe@houat>
 <YiCeCeNobS2FCiQB@intel.com>
 <CAPj87rOjof_WMT32G3-mb-ukVmOxVWJfXEVB4hYbUj0_VCV6ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lmjlpxwdpy5jli4o"
Content-Disposition: inline
In-Reply-To: <CAPj87rOjof_WMT32G3-mb-ukVmOxVWJfXEVB4hYbUj0_VCV6ng@mail.gmail.com>
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
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lmjlpxwdpy5jli4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, Mar 04, 2022 at 08:45:07AM +0000, Daniel Stone wrote:
> On Thu, 3 Mar 2022 at 10:53, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > On Thu, Mar 03, 2022 at 10:05:07AM +0100, Maxime Ripard wrote:
> > > Back at XDC we floated the idea of creating a test suite for IGT that=
 we
> > > expect any KMS driver to pass, similar to what v4l2-compliance and
> > > cec-compliance provide for v4l2 and CEC respectively.
> > >
> > > I was looking at the list of tests, and it's fairly massive, so it's =
not
> > > clear to me what tests we could start this suite with. I can only ass=
ume
> > > all the KMS (but the chamelium ones) and fbdev related ones would be a
> > > good start?
> > >
> > > What do you think?
> >
> > I believe we should start with the group of the tests that we know that
> > are reliably passing today on most of the platforms and then increase
> > the list as the tests and drivers become more reliable.
> >
> > For instance, many of these would be candidate to be filtered out for n=
ow
> > https://intel-gfx-ci.01.org/tree/drm-next/index.html?testfilter=3Dkms
> >
> > compared to the whole view of kms tests:
> > https://intel-gfx-ci.01.org/tree/drm-next/shards-all.html?testfilter=3D=
kms
>=20
> We are running some of IGT on Panfrost + amdgpu + i915 as part of
> KernelCI as well: go to https://linux.kernelci.org/test/ and search
> for 'igt-gpu'. This gets run for mainline, next, and whatever other
> kernel trees push into i915.

I was mainly interested in KMS, but I saw that there's an igt-kms test
as well, thanks!

> There is a Grafana-based dashboard that the KernelCI team have been
> working on to visualise test runs, but it's currently having some
> backend issues so I can't show you a link for that. I did raise a
> suggestion in their design discussion for a proper testing dashboard
> for making it easier to see the status, so feel free to pile in there:
> https://github.com/kernelci/kernelci-project/discussions/28#discussioncom=
ment-2293696

I'll have a look, thanks
Maxime

--lmjlpxwdpy5jli4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYid84wAKCRDj7w1vZxhR
xYbLAP9THsui2KO5jnwGsFJhap62n8Zlg1aPGtNv/mMmV4dxDgEA8YSp5DIAaXa7
RhH4OR3ZN7AcXx8wvCYAx4uqV7Uoowk=
=y1yh
-----END PGP SIGNATURE-----

--lmjlpxwdpy5jli4o--
