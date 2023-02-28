Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C059B6A5AEA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 15:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC5910E201;
	Tue, 28 Feb 2023 14:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFF810E201
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 14:35:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C1D4E5C0227;
 Tue, 28 Feb 2023 09:35:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 28 Feb 2023 09:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1677594909; x=1677681309; bh=NJJYD1jwPJ
 lXOSFZxmowcw0Alp1fCG1YD9yWs52rw4k=; b=RRzUD2K77fISrNDGPlSvyX4utA
 MVA7uQTtn4+F/kZGxZzx03NzT9n1Erm42UETPcN/lbzmCjVhKZMgI6f04JIYC3jE
 jZi3PP7YL5Gv6xiRjmvDaieB56ppV5g7Rfe5n4pQpg1a1WLfp9mwCYX3rlne1xhX
 ILylB7+3k09TboFCdYDyOLjXjGIySWlsGYSwbGQjCRGN6zaAAY7xyibX1niQMVUD
 A21UFrQZ2/N96BPFEhSfGCljQLw9ZZlRw2aARtnuMIz343mnfSzSqHm48sZgFACa
 g2bINn9O9lLTcbdh+C9SCRxhNzh/taK620UCebR1N+4FJi/g08g3WD/eiKtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677594909; x=1677681309; bh=NJJYD1jwPJlXOSFZxmowcw0Alp1f
 CG1YD9yWs52rw4k=; b=P3UBiXpXwi+PeIN3XoidgS90E/ygChufxZM0iHMUMoeI
 frGNBxW1y6iGLY01JCHX5OSlOEyzslt/LiC3UkCL0PeU7+obM8g3YBzSLGYykPnR
 CDcOeCOup1bEe+em+Ljh7WTIiEzbZeOyph8y+3Swd2hE9WDZlE0U3qcM3v+Z68M7
 13ahWLGb8NOJJ7q5xacBXSqnPDhnVTrBLcWWCCRYU/gDp90FHy2ssHQQY/aYhVZu
 Kfsb7rbudOFRircFs3jF/Y2bw4RZxv8gf9DhIJVTf/5ub4jjW0Q99QD1TvCOPJIv
 Wz1iupsLBZRxL0DqhlZjJxb/daxySwIj1Naez1nULw==
X-ME-Sender: <xms:HBH-Y5FhYSomcWifPaAGvRU5SthqhizrKZ5x5VVD7c-wKiaxm42U6A>
 <xme:HBH-Y-XswIAsVlhdprRcWbJfublTTVyZsBK1rJWEiHbpNP-z7mnYILX3bBfL3MB71
 2bzYX0v6SDw_YnR5a4>
X-ME-Received: <xmr:HBH-Y7LzdhdDfbecg2Z3LiegEen_oH5rLpG5nM8XMhLR3VxaZH1k39tVBf550XxxP_M9rv3Sbzpo3XOWX5U_1EyPtjxHMD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:HBH-Y_EakyVHmZ1DRXC7o2NQeOnDveNYGd6sshO74TqOHcHtdPSBVg>
 <xmx:HBH-Y_XCRjpu12rYcBLxZVtm2DD1L77VBvg2tp_XBer64tfMF8E8sg>
 <xmx:HBH-Y6O8CxTfXKr5WRAf7UAOCtqabZNBdKP26xk-FFPW5YJ8hizMeA>
 <xmx:HRH-Y1MKIHMSuDAhVHa7Opf7zLuMNpXw7LB2WnYn43NtxpXQyXo4_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 09:35:08 -0500 (EST)
Date: Tue, 28 Feb 2023 15:35:06 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or
 bridge find helper
Message-ID: <20230228143506.x73ojgtuld2yzrv3@houat>
References: <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
 <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
 <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
 <20230228121046.jfq6dqyuphfmqemi@houat>
 <CAMty3ZAYAsShnBPRirLCb+S-Ysg5TaNP9OC3xszNWwtJH5VREg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3fb3xzhrpqoiqzoe"
Content-Disposition: inline
In-Reply-To: <CAMty3ZAYAsShnBPRirLCb+S-Ysg5TaNP9OC3xszNWwtJH5VREg@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3fb3xzhrpqoiqzoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 06:04:39PM +0530, Jagan Teki wrote:
> On Tue, Feb 28, 2023 at 5:40 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Feb 27, 2023 at 08:41:22PM +0100, Marek Vasut wrote:
> > > > If we go ahead with no need for DRM-managed helper at the moment, t=
hen
> > > > find the panel hook in host.attach and then drop 2/18.
> > >
> > > The panel lookup must happen in .bind/.probe for exynos/imx respectiv=
ely ,
> > > that's really all that is required here. Then you can drop 1,2,3/18 a=
nd get
> > > this series applied (I hope) .
> > >
> > > Can you implement just this one change ?
> > >
> > > There is no need to use drmm_* helper for now, that can be improved l=
ater if
> > > possible.
> >
> > Yeah... The drmm helper isn't needed per se, but not using it will
> > create a use-after-free pattern that is very easy to miss.
> >
> > I'd really prefer not to add a new helper that favors an unsafe pattern,
> > but the driver seems to have a whole bunch of them anyway so it's not
> > really a big deal.
> >
> > Which also raises another question: if it's code that is only really
> > relevant in the context of that driver, why are you creating a helper
> > for it in the first place?
>=20
> I can answer this question as I did add these helpers.
>=20
> 1. DSI-specific helper added since it is a good candidate for
> common/helper code, based on the comments in V9 by Marek. V
> https://patchwork.kernel.org/project/dri-devel/patch/20221209152343.18013=
9-8-jagan@amarulasolutions.com/
>=20
> So, I have added this to the common drm_of code in V10.
> https://patchwork.kernel.org/project/dri-devel/patch/20221214125907.37614=
8-2-jagan@amarulasolutions.com/
>=20
> 2. DRM-managed discussion was commented on in V11 by you, so from
> where all discussion moved.
> https://patchwork.kernel.org/project/dri-devel/patch/20230123151212.26908=
2-3-jagan@amarulasolutions.com/
>=20
> 1) helper wouldn't be an unsafe helper as it can reuse many DSI
> drivers but 2) helper might be an unsafe helper at the moment.

You're wrong. The first one is unsafe, for the same reason than the devm
one you did is unsafe: the assumption everyone will get (and the one you
implemented in your driver) is that the bridge reference will be put
back at remove time.

The DRM/KMS structures however are free'd only when the last user closes
the file descriptor of the KMS device, so your driver functions will get
called after remove has been called.

If you are using the panel or bridge in any of your KMS hooks
implementations, this is now a use-after-free.

The drmm variant is safe though, because drmm actions run not when the
device is removed but when the DRM device is last closed.

Maxime

--3fb3xzhrpqoiqzoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/4RGgAKCRDj7w1vZxhR
xUl7AQDNgOteQVeK/J44oA238pf9m6fu7elyxxltEiqNc0E7BQD+MtY2d8nQeuaM
zBQ224qeGkauze41aCIyTzUMOxWeeQc=
=Vo7+
-----END PGP SIGNATURE-----

--3fb3xzhrpqoiqzoe--
