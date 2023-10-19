Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3487CF1E4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 10:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3A10E04D;
	Thu, 19 Oct 2023 08:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F70610E04D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 08:02:50 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CCDD83200954;
 Thu, 19 Oct 2023 04:02:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 19 Oct 2023 04:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1697702568; x=1697788968; bh=vu
 TOH3/2tVCQoO3Sfg+hgiwzaz7pDb0adFP2TsvaC70=; b=CLXSSgpTcFwh8r2WJp
 ZMQ1nst84XiEak6ivZ9pYq/yI8O6KpEQVonvvALdv79oL3I6SYcyGCZUiu8PE1xQ
 4ZWaNuVuqn+KZKo32V9DJspOskq/VVcEnA0uK2e+P8oG+BQtX4qn+fHzP53szvym
 S+Z+/r40n4kmQfAVmSzpHcxIcYfewB1vO+qQ4sLQ49v9rCawrCul8qro1gYVuw/g
 xBEec48RK+h7g3AF8fW8aBvZ+hfzfbOYU5fjCGAuQqdsVBU0x6zjDsH68ld5q/0K
 T0N3wQvhotjRmO2tpyAo/U+uMNgbh+/VV506URAHvSDXw9+hcosxfAZXJ58u40UD
 kc+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1697702568; x=1697788968; bh=vuTOH3/2tVCQo
 O3Sfg+hgiwzaz7pDb0adFP2TsvaC70=; b=cFOhTPKoRern7eegMHEO7VZDMLR+i
 dQm6iR+gNzjT/ld2bWOHCDSQRF+P9R1Zu4z16llVM7kJiTZaaE9rEM0qP+K2MDID
 wLD2votzBqrzrOgQklU6xjzaNKShsxozLTQmfrhcIFbwOYeYklSlXZES1oJ0yLqo
 g5rxmIr/f9TYV0+0LDXG8U2Iu+ilukpj9l6H+1mTU/SJJes+xrcjnylDMAvTVDi5
 AFox1qa+89aTtJ6SvAIebaJMKh8ubAVzXTwfIjqMORRAKl1ipl7S8meh0P830PIU
 MgHQPjT0/QNidnfLDUaRnWzKvOOkZu8bTpZR6TzC2Jrvp/Z7yxO0uObUA==
X-ME-Sender: <xms:p-IwZYrFnjnVAMeqzEXoXFPHevH9tnHHhJpnB2j5GE7ox4qBebvVZw>
 <xme:p-IwZeozQj0TGmPIIna_elqcIDlDLuCRFMKC-qIgJo68rtylHcWvZJAU67Mg520Kc
 Ua1lJ2PcThoYyYyZiQ>
X-ME-Received: <xmr:p-IwZdOu7E5lnod1eWVgWIPEXRiORVmm8BSxhVS-QY-AEM1WGU6LVpgUarGh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjeehgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtgfdukeeigeeuhfelheeftdfhgfegfefgudeuiefhueeuleekveetvdei
 tddvieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:qOIwZf5tP6nv0CgLnRsRsTg2voxjbJPUd-NdhTDjvjGBJg2zOibdQw>
 <xmx:qOIwZX7NP_OBkic8ttkEHbcTOfbPaiNf6-OIbiLkb6KoCBnXUePbxw>
 <xmx:qOIwZfhO2BkqDQ_l177Hv_4ahcpBgHFNFg5cWKFhrd8cRoPxewzLeA>
 <xmx:qOIwZdTeqYfffNgotzaYnxW-LdG1wWtLsYUGxdoBLy08Zhq9Bpa_2Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Oct 2023 04:02:47 -0400 (EDT)
Date: Thu, 19 Oct 2023 10:02:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 3/9] drm/vc4: hdmi: Add Broadcast RGB property to
 allow override of RGB range
Message-ID: <fwcn3vlgxq5uygi32pyjuktj62wa7zvdgu7xxlpqr7an3kjn7i@25axhlrrkk6z>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
 <20221207-rpi-hdmi-improvements-v3-3-bdd54f66884e@cerno.tech>
 <CAKMK7uFQ8yJLKgTrQdmhwmq9uL-hbUsfUeU6cxWdB2AW3i4vOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s5qnpkq7s22eut2i"
Content-Disposition: inline
In-Reply-To: <CAKMK7uFQ8yJLKgTrQdmhwmq9uL-hbUsfUeU6cxWdB2AW3i4vOg@mail.gmail.com>
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


--s5qnpkq7s22eut2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 11, 2023 at 03:23:18PM +0200, Daniel Vetter wrote:
> On Mon, 6 Mar 2023 at 11:49, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Copy Intel's "Broadcast RGB" property semantics to add manual override
> > of the HDMI pixel range for monitors that don't abide by the content
> > of the AVI Infoframe.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Stumbled over this grepping around, but would have been nice to lift
> this into drm code and document the property. It's one of the legacy
> ones from the table of horrors after all ...
>=20
> Shouldn't be an uapi problem because it's copypasted to much, just not gr=
eat.

We already discussed it on IRC, but just for the record I have a current
series that should address exactly that:

https://lore.kernel.org/dri-devel/20230920-kms-hdmi-connector-state-v2-3-17=
932daddd7d@kernel.org/

Maxime

--s5qnpkq7s22eut2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTDipQAKCRDj7w1vZxhR
xbgJAQCEmGjEjf/SjLGRdP42kDS6wjSd6PyQOgd8BvwoA5Q5EgD/Yp30L10FCkoz
aRUIw6WPwHmlWfnWJDOhXxy2A7edHAw=
=7gJs
-----END PGP SIGNATURE-----

--s5qnpkq7s22eut2i--
