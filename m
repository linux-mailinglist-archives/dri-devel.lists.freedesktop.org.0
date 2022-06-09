Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CADB544749
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 11:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386A21123C6;
	Thu,  9 Jun 2022 09:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1081123C6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 09:23:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BBFF85C01B9;
 Thu,  9 Jun 2022 05:23:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 09 Jun 2022 05:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654766634; x=1654853034; bh=352wLLxlD7
 Wq9htjtLZa3SOeS/ceKkHHQ6QTJWL5UcU=; b=bYrLdaUmhv8Fei2w1EHZpcl3P+
 xl2U83AoQIL9dPHqKh1lD8wI6iGNGQ70EomT7YsbgOfu8EsDc/BcLZZah06F606P
 0ERZk0Veocs5MlkwsCZdmdrposh0XN/tDVLZVTXcf8Ix4gdecn3cXXQLyvHc4+z9
 P6ieNpVVeoYtkj+aq05UbiBB9uDDDYukiZrQkeABh0jYbINDRYu4iyPHj622NvbX
 ZSzo5rN9ZQ7QCQsWbA3K2owbZUFyz8m+9a89GpBDEpL5GRXJicIL2CHJFoVIMBVH
 kuG7dxlmEhK2AFZx2uoa9US1y2RIFsoEf+36dhpCcuQ6mqeNF/rI9ky+I4yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654766634; x=1654853034; bh=352wLLxlD7Wq9htjtLZa3SOeS/ce
 KkHHQ6QTJWL5UcU=; b=VCUDf4xa6Zqq3WMRp19cyLvphuvA7Ia3WLrY8y2iZZGw
 TWiwCWDmjjoSi8cHHW9yB6hWF26TsoPEDmH7i7Zr8cjZtwkZH6bex3+qTx03kU0/
 ypzz+GSkgrG7aiOfYe7LCwlTvn7jPw4ohrpNIVVM9/JthI/mhjvqD1ro2ydB1hyr
 Wy75gj0ZMzqIo7WpNuV6UJtGh3q6PDfNK7iKsT7YH7ginNj/OuZ1s22CD5e5a1RF
 RxT7yPIOZaASDY3I4rSGKBaq+XjqICaJ7XsBF27yqJjO7mAHMncC+eudzLu3zyLl
 CXJ0ZpeD52CcnP0nBDfKLJXJsjOXNdMVnrh9PTyiKQ==
X-ME-Sender: <xms:KryhYtXkTRePyQrWZ9b3xgH1wNqgJUvE3ygUPjY3NfvyVb2-VfdU4A>
 <xme:KryhYtnoE9q8hJE34ji1gn8Kcu1WASWAxAtsEniok8GSKTd-xttKtIruV0Xy_-EUX
 5TZBlctgBAcrxXoSuQ>
X-ME-Received: <xmr:KryhYpZyGYtcXfPWD16J3Pl9-u7aNKvjyb6BetfsjwE7G4SFr1fb5ln9ySzeTDou_eRgqNBO5ZoDxcCXSXuypWaqQbv7zSx0eyXb3cU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtledgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KryhYgX68xHHzEXtE1tTGCfwwMeuOj620saQvSuEai74GxutXXTYGA>
 <xmx:KryhYnm2YeYICVdsStYzoLE0v1sUz4CgcpRpsvT5AxfmQH5NK9cc3w>
 <xmx:KryhYtcD_ofVLsLYjNWdnEV2OzGT8BD61AEldGrAGlnYFn-IrMHVhw>
 <xmx:KryhYsy5NaYMDmUJ4RIVkk63TL4B28K-F4Ho4nMIVuZf7mzDCVQL4w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jun 2022 05:23:53 -0400 (EDT)
Date: Thu, 9 Jun 2022 11:23:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Message-ID: <20220609092351.t2muybqjnqaqzemz@houat>
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
 <CALeDE9OyJtvRGnN80JNW3AwwgAa_h_bs8GTLJzo06WK-o+_7Ng@mail.gmail.com>
 <20220608153608.ntgyokt67f3m7pn6@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2ijjz5f5a256ywwx"
Content-Disposition: inline
In-Reply-To: <20220608153608.ntgyokt67f3m7pn6@houat>
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


--2ijjz5f5a256ywwx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 05:36:08PM +0200, Maxime Ripard wrote:
> On Wed, Jun 08, 2022 at 04:14:22PM +0100, Peter Robinson wrote:
> > > > > As of Linux 5.18.0, module vc4 apparently isn't working on Raspbe=
rry Pi
> > > > > 3B any more.
> > > > >
> > > > > If a monitor is attached to the device, the boot messages show up=
 as
> > > > > usual, but right when KMS starts, the screen turns black. Similar=
ly, the
> > > > > screen also turns black when the module is blacklisted at boot ti=
me and
> > > > > loaded from the running system.
> > > > > The problem looks quite similar to the one posted some months ago=
 in [1].
> > >
> > > If I understand you properly, it results in a blank screen if the
> > > monitor is connected, but the system is still responsive?
> >=20
> > Yes, it boots fine, I see all serial console output and the module
> > loads etc, without a screen I didn't notice the issue
> >=20
> > > If so, it's a very different problem than the link you provided, since
> > > it was occurring when no monitor was connected and resulted in a total
> > > system hang.
> > >
> > > > > Unfortunately, looking through systemd's journal didn't seem to y=
ield
> > > > > any real hint. Nevertheless, the results from grepping vc4 are
> > > >
> > > > I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
> > > > can confirm the regression. Maxime would know what might be up here?
> > >
> > > I tested on 5.18 on my 3B and it works well. Could you paste your ker=
nel
> > > configuration and config.txt somewhere?
> >=20
> > It boots with output on 5.17.13, and not on 5.18.
>=20
> Interestingly, it works for 5.18 in my case but doesn't for the current
> drm-misc-next branch with similar symptoms.
>=20
> I'll look into that one and see if the two might be related.

Actually, it was because drm-misc-next was missing 88110a9f6209, and
thus the DRM driver wouldn't load.

Once that patch is applied, 5.18 and all -rc work fine on my side.

Could you start a bisection maybe?

Maxime

--2ijjz5f5a256ywwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqG8JwAKCRDj7w1vZxhR
xVziAQCLkDnJjGxPuHeYjETe6yH2lUial0V954bRrvolcbCggAEAwAQzrfI1FOc5
wILnRfznD49bR9kTV7JxVl4mvI4NrQU=
=zY68
-----END PGP SIGNATURE-----

--2ijjz5f5a256ywwx--
