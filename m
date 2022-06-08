Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A70254378A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652F211285F;
	Wed,  8 Jun 2022 15:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B1811285F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:36:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 11C305C00A8;
 Wed,  8 Jun 2022 11:36:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jun 2022 11:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654702571; x=1654788971; bh=gi/aTBTT3V
 TXvLA80ynP88nuCtb6kbViTkLUWqxVHN4=; b=dK1VAUGGzUs9RNrPqlN7xZ1P+H
 FamFfB1MjxaEe18NuuNHJcu409tlzi/HqN4T9uScWOeTmYuqB6eZsKCAKY4KdLnj
 3jpQO3ASOE41g9AyUg63zkrbNeNVuZ6xqZIFu28e/Sp68W1/w1cXRCcweejdIkZH
 JP5Sd+3a592U0hcORL0DFIHHkplT34W7r+SH3z5FNKosRh3zvm28jeI4oGysEpCx
 z//JwUcdXiv1++I/KuqphYNme21hqfUZa0iWc6RbQN+Zwa1PkCKL+qJdoXjKBr7o
 K8oWYKO1wnxPrSvTuzc5wKshxYQf5u2jUCpq1wgcoQ+toU7KbsDBN01V2x2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654702571; x=1654788971; bh=gi/aTBTT3VTXvLA80ynP88nuCtb6
 kbViTkLUWqxVHN4=; b=NfS4DMCy0iOd2n7C5apSu4Oc3sUa6puvTSCMybPn+mUu
 hi5izilDYhVoh/VeygOpm5FnFkholwoKMvVtudDfeY/aRRul9jLB31EMAScDjzdZ
 wuEbQJxK1xgPA20tuW5k6FjM5dt++51evDv/iTL23zhxO25xRcBFFiKuO/K77sc+
 ublY4UbxdfCp/4YtgDPeJatWjq0FvPHFKwbYc0gn4jDCA/dkCdJXCkJ3j/Ev7F8M
 s8/sVwIAyHmBFyabJhyGMh8FM5I92VM0W/wEtlhuj49j6i88uATsr2T0odo8xIEP
 7EoQfo/fxSkcvDIQlGEJiSj7g8CM2jDDPuf0TYTMUQ==
X-ME-Sender: <xms:6sGgYuegmoirtKjZBN3-eUHeYcHeelNkfpm3s3mbQMYpxCAKy_WfJg>
 <xme:6sGgYoMoUAWK7p6QYcmd4FFAiKVujIqyKk8D18sIef5Q6B9aA7EkZhAqkAhdc1mNg
 IMWiX188hkyD_od5OM>
X-ME-Received: <xmr:6sGgYvhJqzGyS69Vk1Tw9A377QGrLab7-L9d_5JfwEpU9IKXOAWnlwWMeB1RB8afYn8SijjD5qz69CEGrIHA6HJO2JoLfmLJ4JtB_bE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6sGgYr-65o-Q5bPZDZfJNup3SRKqp-uyyhxXxBqqF6JmC5Qnkp_Kdg>
 <xmx:6sGgYqvhXJfjjGOaQGuKYcBDlqFKGX7G-_ENLH-BjbTjfGAEM3oVPA>
 <xmx:6sGgYiFU1rkvCQOYPzQ8KsN-Nhk894NQESSB1bT5nt6MTs7MCZ2K4g>
 <xmx:68GgYj5ZpMIGpisRnc9dD0Ipp1vGo2JzIVM5j2VNhBysIp_1dxpmKQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 11:36:10 -0400 (EDT)
Date: Wed, 8 Jun 2022 17:36:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Message-ID: <20220608153608.ntgyokt67f3m7pn6@houat>
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
 <CALeDE9OyJtvRGnN80JNW3AwwgAa_h_bs8GTLJzo06WK-o+_7Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="55hm725jtglcvqzl"
Content-Disposition: inline
In-Reply-To: <CALeDE9OyJtvRGnN80JNW3AwwgAa_h_bs8GTLJzo06WK-o+_7Ng@mail.gmail.com>
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
Cc: stefan.wahren@i2se.com, Peter Mattern <pmattern@arcor.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--55hm725jtglcvqzl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 04:14:22PM +0100, Peter Robinson wrote:
> > > > As of Linux 5.18.0, module vc4 apparently isn't working on Raspberr=
y Pi
> > > > 3B any more.
> > > >
> > > > If a monitor is attached to the device, the boot messages show up as
> > > > usual, but right when KMS starts, the screen turns black. Similarly=
, the
> > > > screen also turns black when the module is blacklisted at boot time=
 and
> > > > loaded from the running system.
> > > > The problem looks quite similar to the one posted some months ago i=
n [1].
> >
> > If I understand you properly, it results in a blank screen if the
> > monitor is connected, but the system is still responsive?
>=20
> Yes, it boots fine, I see all serial console output and the module
> loads etc, without a screen I didn't notice the issue
>=20
> > If so, it's a very different problem than the link you provided, since
> > it was occurring when no monitor was connected and resulted in a total
> > system hang.
> >
> > > > Unfortunately, looking through systemd's journal didn't seem to yie=
ld
> > > > any real hint. Nevertheless, the results from grepping vc4 are
> > >
> > > I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
> > > can confirm the regression. Maxime would know what might be up here?
> >
> > I tested on 5.18 on my 3B and it works well. Could you paste your kernel
> > configuration and config.txt somewhere?
>=20
> It boots with output on 5.17.13, and not on 5.18.

Interestingly, it works for 5.18 in my case but doesn't for the current
drm-misc-next branch with similar symptoms.

I'll look into that one and see if the two might be related.

Thanks!
Maxime

--55hm725jtglcvqzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqDB6AAKCRDj7w1vZxhR
xVpNAP4i1WTzxRomgIC2lUMV7jrnCgw7DowjmoB27uB1MTFzzwD8CV0tVYyFP4Dj
ke2kckSghTo6IZ58zKartpdJs4diLgE=
=mZwG
-----END PGP SIGNATURE-----

--55hm725jtglcvqzl--
