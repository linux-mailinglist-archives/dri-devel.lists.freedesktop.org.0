Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1C45F0F6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 16:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB426F8DB;
	Fri, 26 Nov 2021 15:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2526F8DB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 15:43:57 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id EB2543201D0C;
 Fri, 26 Nov 2021 10:43:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 26 Nov 2021 10:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZS/2KR6T9tafL68lEqzElJT0LEb
 WPwUjCYuVOHLCYTk=; b=ap/i8s/AV5HBCV8Oe97V2R2U0SbgL/awK4M+vWmcjoD
 Zh51xEzzmr61Bt74tm5tH6a4McEJ48oa4hkNoqp/+vbUhVhDIz9p8VSyWhjYALog
 GOLkeErg7Zyh9YKWdXOp1k24hcI0QUfwq7C0eGzX+/v6v0ZaNbqOw2xbLLuOxyYO
 rJ5gddgtdWuAF/+2H2B1QZJTrGVZBLHAMRFB72LMBFqMrRINk0vSZNob2VUAj6ou
 1w2JZPFkjOpnbwBNNG+myBg0sGC2otklnwoOgu3FDPTv1jPJ9pjCuXISukX0UZiR
 XZ7BNWEBbHP3FMpBNM1jn3iaXmIghUfhLV2z6Fr7T1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZS/2KR
 6T9tafL68lEqzElJT0LEbWPwUjCYuVOHLCYTk=; b=DJmr4Y92IRiACjzbWQ0xV8
 DbAL0Isd35rZeEE40mhdjdiXMD4jTQv3IX3q+cnAiM9Clw+ugkuR8SP4b12gWw2c
 vZ1DxWdj+ZOGViYog3okUDwTRXVoIE9RKAheoXBp2De3UOXqei3RZqegzRWSEhXT
 s21rGT9xsZ1YYmW98A9czLxW/dEVPtWWihzpkUACQMA1n+zxTWs788QTSkDdfKxK
 ch/3Z7rQvc013DgCOX0l+pm0yASf8UG7tpnTphNobJfRwPxduoicBX9PV7Nl5U6K
 QDnHPpLdWwL9lqRsR1fUqlQJc2RcllJqgueSXSCdzdzmNx7Y4JTlSkx2vOaNzgzw
 ==
X-ME-Sender: <xms:uAChYcK4dNwXESxbvvAgRw1Mzf1C2hfj-zaUdc7XrsQguZkwdLoE4g>
 <xme:uAChYcISf5JkWj2iJLOsU2UHTHSWHVfJEV9G26uGxRQELgqz3HKrPjHyEeaWYbnSD
 DdhAb4a-8tIqnv_VlY>
X-ME-Received: <xmr:uAChYcugLQm1ep3z3lLiz1AartM7e4-o4l1ctr_OIZog2gr9eiwc3XTV12bWY5X-OOliPZW0KNPhqVqH7QVrZvd1rR-oEeJ1mo4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uAChYZZE63DG0fxeh6diy4CKvpsztiuHisX9N-7Ci-2RcIWaHDnGGA>
 <xmx:uAChYTa8Vv4Rc8PDMT1wbspXF5-M2BkV3m2iKnWY0IP8iUCGRfbRJA>
 <xmx:uAChYVBDtQ5oDifPfgt86uuhlqy6wIhTVEXOPUydDwwjP5TePpUBrQ>
 <xmx:uQChYRNSguMSBX-OmcMGKJx8dIzklwvk22nvv_bAK9fiuh0_SA84gA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Nov 2021 10:43:51 -0500 (EST)
Date: Fri, 26 Nov 2021 16:43:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 00/13] drm: Add generic helpers for HDMI scrambling
Message-ID: <20211126154349.aksr4kjhvj3xueir@houat>
References: <20211118103814.524670-1-maxime@cerno.tech>
 <YZfKSmWs3n8zRUd0@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p7qqz73vkr445fu5"
Content-Disposition: inline
In-Reply-To: <YZfKSmWs3n8zRUd0@phenom.ffwll.local>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--p7qqz73vkr445fu5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, Nov 19, 2021 at 05:01:14PM +0100, Daniel Vetter wrote:
> On Thu, Nov 18, 2021 at 11:38:01AM +0100, Maxime Ripard wrote:
> > This is a follow-up of the work to support the interactions between the=
 hotplug
> > and the scrambling support for vc4:
> >=20
> > https://lore.kernel.org/dri-devel/20210507150515.257424-11-maxime@cerno=
=2Etech/
> > https://lore.kernel.org/dri-devel/20211025152903.1088803-10-maxime@cern=
o.tech/
> >=20
> > Ville feedback was that the same discussion happened some time ago for =
i915,
> > and resulted in a function to do an full disable/enable cycle on reconn=
ection
> > to avoid breaking the HDMI 2.0 spec.
> >=20
> > This series improves the current scrambling support by adding generic h=
elpers
> > for usual scrambling-related operations, and builds upon them to provid=
e a
> > generic alternative to intel_hdmi_reset_link.
>=20
> Out of curiosity, can we rebuild intel_hdmi_reset_link on top of these?
> Always better to have two drivers to actually show the helpers help, than
> just one.

Unfortunately, I don't have any Intel system I can test it on, and it
looks like the changes wouldn't be trivial.

Maybe we can use dw-hdmi instead?

Maxime

--p7qqz73vkr445fu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaEAtQAKCRDj7w1vZxhR
xQlQAQDagG2Mg12w28iTWdHXGy3xXWvontjW9PCq75c9fc2VDAEAnYz47H1L39q5
JUOCIULuZKdS1PyFkuLxhydeu3Z1Yw8=
=XjbG
-----END PGP SIGNATURE-----

--p7qqz73vkr445fu5--
