Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4F736054A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 11:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737CD6EA14;
	Thu, 15 Apr 2021 09:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5756EA16
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 09:09:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C8FBD580732;
 Thu, 15 Apr 2021 05:09:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 15 Apr 2021 05:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=f9xNlW94bXKtHQ7VEokJAT3kze5
 U1y0S6MsZACvD48M=; b=vEUIxIYLGCcSHcP4DmDFXZ9AYUaaSKq7OgPflDw3FSv
 I+QdHQXmRsMSXDy692Vcurp4HsfjKzD8TG3Rmv1kgbYUy+sxPKivQ42P/qfUJ1aC
 J4WU7ldZicYZ5FkUh3Hc9xb+FhsHhtcguaJy7mpsV04ySgy2YJx/686BRybIYL/w
 ICc9RqpasWbNBhTY3YWAgMerurEbyKmghfb8h97ZKjgAaZZ9FxiL/d1slUuQFOWh
 NBdrw6IvyI8tyKWFVAPSEdAhFMwBF0BbRMLCi9KZIAD1JBWHyEF6ChNwbKb6G3cc
 PoCWK5G2Qy2MWNRfxAx3SyHGy3z8cChtwzrYGQtwAhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=f9xNlW
 94bXKtHQ7VEokJAT3kze5U1y0S6MsZACvD48M=; b=q6coCEfjbx39w8i+UiUlBw
 2i04erJWb7K1nq8nA0IGYNGZcHyaLzTiWNHB5AFNCdNFH1eXjwTq+ddprFqrcS2z
 WEHhAYVy7NDUqC8L9LdeiEvuxx3zep9x2Z7tFQdK6ygISVJ04+osAldNwTm+DoFl
 awyyrEKeIXll5/y/3kwKwPGC+WDVqdRPqOsU46tW1V5EX/uk6lvqGtdEuB5IIGkl
 egDv7g8jdxJIxR4ACRlqBOGkOx1bnSos9YdLJtQiRa1NCVG6+VE1zBLCBDeyzars
 KqzEwGVVUDpUs6kPMa2QXf1s2hoFtvUaw5wjNjPNn589E9jHazF/SoyGq8XAa1Mg
 ==
X-ME-Sender: <xms:twJ4YD7hHahEVJY-5XgZ6ALhWFQdIBfVXSlkM_SAafJC6skWBPV08w>
 <xme:twJ4YI63NB7Cvdmq0PMGWuwGX2L5YP62-h4_grA6UY6ZmBs9ryoQ84G8tty9IB-as
 UxxWZRQyLjvh1fSoLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:twJ4YKcTpIt7aSdHWJShor-jeO79uTFT_5_0I4vhN6bdLFCHaqYuhw>
 <xmx:twJ4YELUWxPD7jCsfSWlDFi3YsI9JIONzZMy3tzjtcgLyO53tt5Flg>
 <xmx:twJ4YHJw6OPR5ti-pxTsIpN-unIEFbyldeOufzwK6bsnMPDMtYkR7Q>
 <xmx:uAJ4YIWJ9qy5zVB6gYQb65jUxnil0TTLlTn-78kmIpBofH2uJZU7JQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 31DD9240057;
 Thu, 15 Apr 2021 05:09:11 -0400 (EDT)
Date: Thu, 15 Apr 2021 11:09:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Message-ID: <20210415090908.lmu372lzzjb5hz2b@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-5-kevin3.tang@gmail.com>
 <20210324111019.og6d3w47swjim2mq@gilmour>
 <CAFPSGXZ3DjKt87Kc=wc9YKVzTjkQ38Ok6HnHm+VEdqXyHv54Eg@mail.gmail.com>
 <20210407104538.cvssdck26rejrfye@gilmour>
 <CAFPSGXa3xsxmfVquN_pTyBJ4+kL4jQAj6sK+86G3SA2OhB7Jtg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFPSGXa3xsxmfVquN_pTyBJ4+kL4jQAj6sK+86G3SA2OhB7Jtg@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0687647431=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0687647431==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iqjdlfj2zil34vaj"
Content-Disposition: inline


--iqjdlfj2zil34vaj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 09, 2021 at 09:35:07PM +0800, Kevin Tang wrote:
> > > > > +     }
> > > > > +
> > > > > +     return MODE_OK;
> > > > > +}
> > > > > +
> > > > > +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> > > > > +                                struct drm_atomic_state *state)
> > > > > +{
> > > > > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > > > > +
> > > > > +     sprd_dpu_init(dpu);
> > > > > +
> > > > > +     sprd_dpi_init(dpu);
> > > > > +
> > > > > +     enable_irq(dpu->ctx.irq);
> > > >
> > > > Shouldn't this be in enable_vblank? And I would assume that you wou=
ld
> > > > have the interrupts enabled all the time, but disabled in your devi=
ce?
> > > >
> > > It seems better to put in enable_vblank, i will try and test it... Th=
ks
> > >
> > >   And I would assume that you would
> > > have the interrupts enabled all the time, but disabled in your device?
> > > [kevin]I don=E2=80=99t quite understand this, can you help me explain=
 it in
> > > detail?
> >
> > You seem to have a register that enables and disables the interrupt in
> > that device. The way we usually deal with them in this case is just to
> > call request_irq in your bind/probe with the interrupts enabled at the
> > controller level, and mask them when needed at the device level by
> > clearing / setting that bit.
> >
>  Yeah, we have display controller interrupts setting and clear register.
> But the interrupts all been enabled in bootloader(eg, lk or uboot),
> if the interrupt handler is active in the probe/bind phase by request_irq,
> but the whole display pipeline is not ready, there maybe have some proble=
ms.

It's fairly common to clear / ack the interrupts from the device before
calling request_irq precisely to avoid that issue.

Maxime

--iqjdlfj2zil34vaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHgCtAAKCRDj7w1vZxhR
xXBaAQC3ACb0Go3hl2khk93hUI2vLUrRqFpmr9tlUyb7hqba7QD+NkO+fFD5Ue+7
9aQgbCXUIw4o3IFlfY8J7s5gjehvog8=
=JU1P
-----END PGP SIGNATURE-----

--iqjdlfj2zil34vaj--

--===============0687647431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0687647431==--
