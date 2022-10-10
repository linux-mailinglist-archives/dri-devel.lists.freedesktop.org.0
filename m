Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD95F9DCB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 13:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D4910E099;
	Mon, 10 Oct 2022 11:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCD810E099
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 11:44:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id CA3652B06782;
 Mon, 10 Oct 2022 07:44:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 10 Oct 2022 07:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665402263; x=1665409463; bh=PePRHbnlds
 gbADzmJKxC8qP8GNyi0LwPoQTtijNlm68=; b=eJy94UfKZ+YBy4IXodD2BW/nwq
 mEglXe4R32ICkaIkP08mU5Vf8eXSBPz2BC7p2HNpgljIP2D7lQYpKtVntcTttRzV
 BKMjHwUS+0bg4jUTRUWNRyaX/8BuGKMyzrN1woYq+n/Qsp4C/F3TOZg0a4WdCewd
 dkJDxe1sFvXTF5+RbTXtHnkFMKtAQA6Qy20iMzaqqSP/f/eVxABLb66Av/WL5o2h
 f+oqdrd4+mVkAyXLfQXp1AXpph65eeLTOe6dQ/5xePUN/nPcKNykqyimBv7eLR81
 wd+45k+TsBaUJCLnYrnKPfdtHdP1mqexgJbve+fU+9MBUBctf0ek+sTxj8xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665402263; x=1665409463; bh=PePRHbnldsgbADzmJKxC8qP8GNyi
 0LwPoQTtijNlm68=; b=fNQNl2u+WXoXKnjv/I7XaD9WJcwq80mfYd7qg9JnuQQL
 PfEYXNlotplNCmbTxpqr0IsPmlsZM8sIK6OsTWDWtsYtv+2LyYbZSMauASebt/5V
 8HFmWNKqVURM39m79rXJixLOmYdBG+GZDUWyXhN9qEVcx6AhvFm+Ct/yhPZeFjXN
 lzylLO0nh8xM0RnhC10xH2hDZx/XKHb5wgsyKCg5qb1UranhSvebjfP9ZLVpzrzK
 Xy+vp0aR+iU8u/Q6S80njncQBWXIN0nmptL+SIJ2Fwc89XS2CrJde2LYDhBiUudx
 C02un3jbJ2aC4kiNXAOidkvrDhTT8sU0cCyR+oXi9g==
X-ME-Sender: <xms:lgVEY46pr--FcwdqsI0PrBNs2_ptw3bzV_oNSrns5CzUo1KiZF-WlQ>
 <xme:lgVEY57h_pr9jQ6cx1QRKsqxyGqAIgUEVTHKQ6dpVpfosHS-IdT-HaAM9enHmULBv
 GR8pUui4m6uVQPWg5M>
X-ME-Received: <xmr:lgVEY3dcQvZ6Ik9s-IHNAlcNf8TykifuBYDnvOOcDFCb6nC_7MdqYjmrhOF4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:lgVEY9K06y2SR5b6SfdS7_LKOakX0hMLFdHqO3U8H0jvwkPQ_KmmSA>
 <xmx:lgVEY8JtrFvbzdlDjjYVOT8LlolKdKYJ97yQ-uMwMw0wu1c3zgQUrQ>
 <xmx:lgVEY-yjxd5-A3CyGpWQ48rQzCThzDh9_I_u5S8jU4icztqsBsUuCA>
 <xmx:lwVEYy13mDR5fGJMRhy_jRZ3-MbaadergKB2Y54OsrTympp8xptMdMJJukU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 07:44:22 -0400 (EDT)
Date: Mon, 10 Oct 2022 13:44:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>,
 Scott Branden <sbranden@broadcom.com>,
 Stephen Boyd <sboyd@kernel.org>, Emma Anholt <emma@anholt.net>,
 Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v2 0/7] drm/vc4: Fix the core clock behaviour
Message-ID: <20221010114420.beytjynzshjgiy6y@houat>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="szndb5jw7xhprqd6"
Content-Disposition: inline
In-Reply-To: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--szndb5jw7xhprqd6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Florian,

On Tue, Sep 20, 2022 at 02:50:19PM +0200, Maxime Ripard wrote:
> Those patches used to be part of a larger clock fixes series:
> https://lore.kernel.org/linux-clk/20220715160014.2623107-1-maxime@cerno.t=
ech/
>=20
> However, that series doesn't seem to be getting anywhere, so I've split o=
ut
> these patches that fix a regression that has been there since 5.18 and th=
at
> prevents the 4k output from working on the RaspberryPi4.
>=20
> Hopefully, we will be able to merge those patches through the DRM tree to=
 avoid
> any further disruption.

Could you review this? Ideally this would be merged through drm-misc due
to the dependencies between the new firmware functions and the DRM
patches.

Thanks!
Maxime

--szndb5jw7xhprqd6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0QFlAAKCRDj7w1vZxhR
xVJDAQCQMencnB+k1hevkJ/oaHU3uaE6b8ragIv6N81T2VEMewEAuSUd8jpRVSai
nRX8hZFWuLoX0OSBsltzWoU0QNyheAI=
=bkfy
-----END PGP SIGNATURE-----

--szndb5jw7xhprqd6--
