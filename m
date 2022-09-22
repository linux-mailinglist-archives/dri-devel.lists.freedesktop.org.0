Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480D95E5C5E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CAD10EA5C;
	Thu, 22 Sep 2022 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0643C10EA5D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:28:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 24F312B059F9;
 Thu, 22 Sep 2022 03:28:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Sep 2022 03:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663831688; x=1663838888; bh=9+zOvyfksA
 251WIvkjW/QnZqpctASy/cR3TjFBEJGn4=; b=myRn0aulDM5L8tUe4fqe/7J45i
 cY8+5osPo0QVR1EZ5vaKIa8eIQEXqx9xuKq0tcPPxSbDBw3YRF2yKYnw9O6+rmmP
 4FSXKJpcR3qYtO7EWbFTTRGMHKAe9GoDA5+FipV5o/S3mO6S+D2Qon5yQTz4WSVc
 wkcXDb9X0ZZiJCzKxV0he4afcH8W42gcIIeclRFnw92WqitEzttwe2NcBIthViqj
 PpefGZdUiNJDHxE325/XpnqToQZAt7vmsqPOQFa8pdaoZHNfBDYWdtZtJJ6c4EpL
 rwdc3GDFbnvaEdbhoyF5gOzRSZi1VGGo/YLPRUzy+JFzjbTqmBX9L9cXwpjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663831688; x=1663838888; bh=9+zOvyfksA251WIvkjW/QnZqpctA
 Sy/cR3TjFBEJGn4=; b=FnZ2BBMO+1CCzdG1QUm+LdR4chFNDH+nhivWP82ell21
 IU7Lb0gS795PvwovSwnXMJdvn9yXs5e9/VseeJ8FQDB0y46qHnq9cDV8VHTVM4bq
 cnbb45kxvGQZvfoS7zPgtwKZnP+ESOKeRG62jeyyEvzvQR0YQjSCH1XO2dcFrkFp
 mUQhmniZr3b48fotFRqqidDxipWW4eHk/zKIwPPpmPoTA686kZ68xZU/cN26Joic
 KVtoUDlw60de6NOf1e8lTg3wkPVwMLrHnZ8cxUZVgo2M8jKR+qT9dcPNwZ2lXo2f
 7ZBzw09GimHZx3wfrhfdsfqWbuFa1QF2UdZuB5nCjw==
X-ME-Sender: <xms:hg4sY1AkevPWD9JVRhSJriAUugw6vlHVel773lEsld0tABsxGN1RKw>
 <xme:hg4sYzhyV4nDTt_vlTfrlj8bQlSj9wj3dskde5TjZYdA_DTXceY11y4Civbbobx4p
 HHvQUKF5PsXKgBOUc4>
X-ME-Received: <xmr:hg4sYwlK2t3qQEHHaOnlf-9fNsc37C-A_uGDLfkRYWi5GNi-XoBE6prZiH9M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hg4sY_wHpefOELoyJiOWz2e17nsG3beLnWJ2ycO0usxrsJL8kddQbg>
 <xmx:hg4sY6SSBAez_cvFkCNIQWDF1lTt_wjT197-iOq3t2JEvAlwhy-nkQ>
 <xmx:hg4sYyZkyADq8xcZezHVUL_fNXt68MGNYB3B62YcNnHyhv-UApoaaQ>
 <xmx:iA4sY9-s0jEl4Am3LvHFgY4Isxu0FyS01rbp4j-p-BnFYgG2U46RoPypG_k>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 03:28:05 -0400 (EDT)
Date: Thu, 22 Sep 2022 09:28:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
Message-ID: <20220922072803.giqo6dhqktnyjncv@houat>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
 <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
 <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
 <e6326381-0f5e-1fe3-e72e-fdfa804e6574@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2sg26q6ygbmxgpjm"
Content-Disposition: inline
In-Reply-To: <e6326381-0f5e-1fe3-e72e-fdfa804e6574@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de,
 linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, mpe@ellerman.id.au,
 paulus@samba.org, msuchanek@suse.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2sg26q6ygbmxgpjm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2022 at 08:42:23AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 21.09.22 um 18:48 schrieb Geert Uytterhoeven:
> > Hi Thomas,
> >=20
> > On Wed, Sep 21, 2022 at 2:55 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> > > Am 05.08.22 um 02:19 schrieb Benjamin Herrenschmidt:
> > > > On Wed, 2022-07-20 at 16:27 +0200, Thomas Zimmermann wrote:
> > > > > +#if !defined(CONFIG_PPC)
> > > > > +static inline void out_8(void __iomem *addr, int val)
> > > > > +{ }
> > > > > +static inline void out_le32(void __iomem *addr, int val)
> > > > > +{ }
> > > > > +static inline unsigned int in_le32(const void __iomem *addr)
> > > > > +{
> > > > > +       return 0;
> > > > > +}
> > > > > +#endif
> > > >=20
> > > > These guys could just be replaced with readb/writel/readl respectiv=
ely
> > > > (beware of the argument swap).
> > >=20
> > > I only added them for COMPILE_TEST. There appears to be no portable
> > > interface that implements out_le32() and in_le32()?
> >=20
> > iowrite32() and ioread32()?
>=20
> Do they always use little endian, as these *_le32 helpers do? I though th=
ey
> use host byte order.

They use either outl or writel under the hood, which are always little-endi=
an

Maxime

--2sg26q6ygbmxgpjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYywOgwAKCRDj7w1vZxhR
xc9KAQCMr0zR6IAKUmzuCZlUwOV3XuBDcqbYhVsa28Oti2b1hgEA9jZk4RV7+p/W
TCyVh2a1nFK4iRcTGNsKIk6mmF08Owo=
=wGmI
-----END PGP SIGNATURE-----

--2sg26q6ygbmxgpjm--
