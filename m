Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134305518C1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30A210E07B;
	Mon, 20 Jun 2022 12:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1816A10E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:21:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E559E3200657;
 Mon, 20 Jun 2022 08:21:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 20 Jun 2022 08:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655727703; x=1655814103; bh=ERWrS3M5iO
 eOncKyuUD0J+tASYvH8XvhnXdf15z2980=; b=I04IaUJu2Jo0DUF8aahVGC48Cc
 67wvoKX751pqSTtC4PW3eaWKOCE6OYsQTIu73NkcCxjnFe3kvCa5uKETVrRAqUFL
 7Nniqd710DTKVlFcNQzNyqZm3Yfjh4pINwAPY1Pi1T9QywP5U4WOD08U122wya0j
 z+fLxUmcAhJWWfmLaPcehNqUlkREz6+Au3peQJIIxYVnFsLy3eAvdrskS0Z8SEIc
 mk6rpNncCa4UN5ksGMWyrmiZp+KGu8HTNO3e1XosnNirZTcFslW6ym8Cg37AJRVG
 MhN3F3j0Wc3nnVxOlAR5+ABCDt1l5S2d4gkRHAiOcL/L4HB8Uzpz7gWUS0Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655727703; x=1655814103; bh=ERWrS3M5iOeOncKyuUD0J+tASYvH
 8XvhnXdf15z2980=; b=jwvi1zrKDcOjE4jxhevCLzmL8TyjsToaSDUbofY+dm6h
 uS7QPxYD4l1sUCcA/dq4u0LUeTQiz9kJmRxNoK22e4RG314aRslU1oHbyoqz6L3b
 EfO4FXurG1ihe0/U2j4+9eEkf0JMTKGEDtvFtWIHc3rQzKu0XRFLsWlhGG+VVTV3
 KwJpCa7f/gRIWqsxpju9grximrPP5PTj+jjd+y2z0dCfC9bpNMHeJ3GF1d0aX8vQ
 xstKSxPFU/SF9+n+4bWnFXm8/wYHfnrG6PrNnli7uYkjbGbcl1ivydZpZr3/Og4C
 hqQ9PKmWqIyoNhtEDwvovnA+sInLQi30wt038dL95A==
X-ME-Sender: <xms:VWawYg3GOZx8TQx-0BRNKpztuHUOxzAXT-HYRCvXeo7mlCNk9nEzLg>
 <xme:VWawYrEde47ffs9V4MoLYG4wv21NIGpjKEaaDDCbn_f-NbLKAPGA03yrM7InqMroo
 k4DLlKGefqwURKa3bA>
X-ME-Received: <xmr:VWawYo4CpRtNdXl0SRHBhDM91KA8SjRdsx90i11i3pr8OpyPiN-VhiDcM49HMbh0NrqWYILU4tAphVnxuFPlD5nIAOz3Y0bUN-77pbY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VWawYp0WWckxnAv1wxB_fYhdzYzsSNtvaQjFI8skF_8bQUpLIUKmhA>
 <xmx:VWawYjFzPwDCnCG-ZmOkdV2xy60hl88OTXFyq8NhXFaxO7zkkxIeKw>
 <xmx:VWawYi-ulEy7yLeNrwXU7cVjkYYKa17IWqqwitUq5x2czAq32Z11MQ>
 <xmx:V2awYnhMu9OQ6JyEaYzGSru_7lYW4ejw-ZPRDrUxFRxCMaT5OqI5tA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 08:21:41 -0400 (EDT)
Date: Mon, 20 Jun 2022 14:21:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 25/64] drm/vc4: dpi: Add action to disable the clock
Message-ID: <20220620122139.6jahd2jt3a5gzhvc@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-26-maxime@cerno.tech>
 <CAPY8ntDemhFi3ZFfOE_9kxtmc7v8Wse0C+dz0xxLrBGvSPh12w@mail.gmail.com>
 <20220616083835.2e7jfrlicbkgkra2@houat>
 <CAPY8ntCB-_o0Td41PxeZ6NC004aQ8jvNrsVfO_SFpTVENT4U8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m7ydw3oi64r3fwj3"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCB-_o0Td41PxeZ6NC004aQ8jvNrsVfO_SFpTVENT4U8w@mail.gmail.com>
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


--m7ydw3oi64r3fwj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2022 at 10:47:56AM +0100, Dave Stevenson wrote:
> On Thu, 16 Jun 2022 at 09:38, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Dave,
> >
> > On Tue, Jun 14, 2022 at 05:47:28PM +0100, Dave Stevenson wrote:
> > > Hi Maxime.
> > >
> > > On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > Adding a device-managed action will make the error path easier, so =
let's
> > > > create one to disable our clock.
> > >
> > > The DPI block has two clocks (core and pixel), and this is only
> > > affecting one of them (the core clock).
> >
> > Thanks for the suggestion, I've amended the commit message.
> >
> > > (I'm actually puzzling over what it's wanting to do with the core
> > > clock here as it's only enabling it rather than setting a rate. I
> > > think it may be redundant).
> >
> > Could it be that it a "bus" clock that we need it to access the
> > registers?
>=20
> No idea. Normally it's the power domain that is required to access
> registers.

For HDMI at least, the power domain being off will make a read return
some bogus value, but the core clock being off will just make the CPU
stall. I can only assume it would be the same for the DPI controller?

> AFAIK the core clock is never turned off, so the request for it is
> just a little odd.

Even if the clock driver never shuts it off, I think it still has value
to follow the Clock Framework conventions. We might have a different
clock policy in the future, and it would throw people reading the DPI
driver off.

Maxime

--m7ydw3oi64r3fwj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrBmUwAKCRDj7w1vZxhR
xUlKAQDPrKU3/ynL2RYrKp72MgZFa+yS2fkm9ZX5/Yo0/khI8QEAjgREUsKi+N2o
jtvV6TnJiJRUA8cMlHM4whDmWC8K7AY=
=xU8P
-----END PGP SIGNATURE-----

--m7ydw3oi64r3fwj3--
