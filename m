Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C86551AAB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 15:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE0A10E1D6;
	Mon, 20 Jun 2022 13:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CF810E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 13:20:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C52163200960;
 Mon, 20 Jun 2022 09:20:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 20 Jun 2022 09:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655731239; x=1655817639; bh=WqFDJsT4dw
 rqi9NOeLu7kratwbSOy4+MK6WozX7kWX8=; b=3+gosPxMvUtiTsYzhyUu3hGqLR
 f1oJ5vxvomij+GGyKJ/8062peBY6Nww+wSo1KooZyz0iilHoKgh7ZoSisnL5INtp
 /0s6rI3gva6mY3E+N4pr4P4rdRGdii8KuK/kqNfTtgm5l2QW42YvVbrFbAacaFkD
 ROGw4dsk6FXLYWy5cqf9yMdjh0UUH+NikAkfFCcQwsrCW8mH6WCQ1zP05GIdiyJc
 h34kDUFH/9uKOqWzBtZLagfscXIG6VXy33Dr0rfVF7tO96HZv1f19WGk5HFY6rHE
 Epk6HJIjCtMgg+xDtaXSgtzf21kuqTtSJxYjbe2yxxXsCQ7GYYG3BcoHJwaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655731239; x=1655817639; bh=WqFDJsT4dwrqi9NOeLu7kratwbSO
 y4+MK6WozX7kWX8=; b=A0FsVW/OIfkoljEDRBgtW9Lv3naGd0aV0RsnGVyAXC2m
 pOdVuQjCcpztQpimfQApNcTi8jpVdX/Ie5M1CpgC86t9Z1vRhnFoJ138qbrU+ipi
 Xh2NjvHJHP8ra1RcHzPrKx1zjDpMeOyF37rjTE0OtFjNsjTwKd5Rt0f6KfMCyNvb
 zEqOQdpzN/KvtYIuFZW7EdjPeTUWKNJbEotygoeOxIpIgp+BF0W1eirO7QbdnqIa
 I1J76N3QlYxhYDObCQ3/3Lx/zVt4Y1P48rd5mMoDhYMrQcH1VdVg5ew8mRJAjo+z
 j6XbUYcj+dYMKdD8LwqEzLknitaw50OJ8Pk39nDVqA==
X-ME-Sender: <xms:JnSwYqDXBPfkc9Z8lnX5NX1wSIsATA2ElG2_FOZ5SEJOY0AHQDR_bQ>
 <xme:JnSwYkirP1ZEzZJah1J0-mLjt4sAtmDSaeOTnZTtekZx504MU3DhINSpq-ifPdK96
 UI2U5o24kOW86emQEo>
X-ME-Received: <xmr:JnSwYtn1vjreryKjh1CpdC4cbHIA-pZdHSXDzSkeu2CTl1V3xDUw-RkjTX0KsqJ08FzPWfN4FO3nrb5KdNkF10emq7tnhaasNtA3WUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JnSwYowPH6sahFFZgACTNOi0uya_ASnDQAj9BDsqasch0V6SmWhi1g>
 <xmx:JnSwYvQqhb2yu38PGZLrwDyrbdBRJQphOeroPXxvXq2rq42g1wRqtA>
 <xmx:JnSwYjYeIQg6FG4-Zsax1-q2Q-sswWnX0aH3acFVZ8jtim-fcuNMfA>
 <xmx:J3SwYtPNx33fRf0xwAg5e-q1o0EZ3guGhMAUP2rIhyJ59iHaXH7GsQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 09:20:38 -0400 (EDT)
Date: Mon, 20 Jun 2022 15:20:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 13/64] drm/vc4: hvs: Protect device resources after removal
Message-ID: <20220620132035.zearfbh6fpgzyshh@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-14-maxime@cerno.tech>
 <CAPY8ntDY3pCbc=zrC7Nx6fVv5CFmxXKPHdSNWGYNJo2dn32XUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="52xhlu7abxi3u3lw"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDY3pCbc=zrC7Nx6fVv5CFmxXKPHdSNWGYNJo2dn32XUA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--52xhlu7abxi3u3lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Jun 14, 2022 at 04:11:20PM +0100, Dave Stevenson wrote:
> On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Whenever the device and driver are unbound, the main device and all the
> > subdevices will be removed by calling their unbind() method.
> >
> > However, the DRM device itself will only be freed when the last user wi=
ll
> > have closed it.
> >
> > It means that there is a time window where the device and its resources
> > aren't there anymore, but the userspace can still call into our driver.
> >
> > Fortunately, the DRM framework provides the drm_dev_enter() and
> > drm_dev_exit() functions to make sure our underlying device is still th=
ere
> > for the section protected by those calls. Let's add them to the HVS dri=
ver.
>=20
> The framework appears to rely on the remove function calling
> drm_dev_unplug instead of drm_dev_unregister, but I haven't seen a
> patch that makes that change in the vc4 driver.
> Have I missed it, or is there some other route to set the unplugged
> flag that drm_dev_enter/exit are relying on?

You're right, we should have called drm_dev_unplug. I fixed it up (and
the fallouts)

Thanks!
Maxime

--52xhlu7abxi3u3lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrB0IwAKCRDj7w1vZxhR
xV/kAQDo2x49YAuwKeroAsmuMN8qo47W0TRdZAIVin5PlsqeoQD9HU9u/1HNuio6
99CJIpCAUNSaG7DiI0JzOUijjxa3Ggo=
=hkDJ
-----END PGP SIGNATURE-----

--52xhlu7abxi3u3lw--
