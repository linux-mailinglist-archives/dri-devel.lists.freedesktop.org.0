Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23607411CB5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 19:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD596E593;
	Mon, 20 Sep 2021 17:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54226E58E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 17:10:48 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E426F5C01D8;
 Mon, 20 Sep 2021 13:10:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 20 Sep 2021 13:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=bHVTd+HpB5uBC82N+EYIUISSuwA
 5WGc0HaCUXBOjbp4=; b=jBHC+/CYHBrpTnJqtKJPWsZsiYeqCZTKz/mJkUBKTlO
 i+5uNaAxlqC4DzbtaWtnEdxIlhyaHfN5Th/cdLu9+iuDPgFUZM8eZTmr8D7Wk9hQ
 XBVKp73w9cehWwp74rswt5KxJ0F/5SUimbe24nMDTtNmOrs6ahEOtaXbFLBrWuAg
 M1hiCl0Wvj6qZIhHv9uAjLRVE/4wNEgk+IZbJd9TkhxAWXDeWk9iiwlc4X/yw4su
 5eqanJTwphQ8JKrmSGXi5akaFA0qZ3KKkda0U95zSnpofnEXCWVSq+fdL6XMv6L2
 SOZUx5YsG6rnq2EQnxJEh5gTbjQBueiW0FWGPUR9Q3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bHVTd+
 HpB5uBC82N+EYIUISSuwA5WGc0HaCUXBOjbp4=; b=ate8iXIVwzTCETzzG2pFZ2
 NQ+GmZG4N/Rb0NVF5UFQls9VAoWLrV2WrjgOFXql12GjXt8vd1XOpxc7sXURRNUD
 P/1dFMuV9MKkkv4uoTcdOjhKL4iOrjpDySMu7AoDqg/2jg6seCX/od8nMCHtfEJ6
 gkqB04yu61AC63+JjrSiiMo1kWdw0d9LXXQVFxr8qZ87rcIhuAmn7fRyTo874W9q
 OjtXR2MkSOyx4gEtDPozSWBUcgLmOf78MH5QE+f6VKjOMR7nF75Zkr/gej8B8uvi
 IkhjHXbinuL+xWUHSzIUfKxjPLWaZPiGP7op3U53P66PDoqJXU9hrp9XPfD6a8Sg
 ==
X-ME-Sender: <xms:lMBIYamYn4eQQoD2T8gt-Ze7O5d21xR9DiM2_TqodEJIf1m8PByp4g>
 <xme:lMBIYR3y3bOUdxRZ3GL40K9LBwYhJR4G9Ma6LyjsDC0hpe7WXl31LqiFzTRkGIiRY
 APFSquf70h9zN_h6Ok>
X-ME-Received: <xmr:lMBIYYp8Ik0DgNXOp4AUv-mQulVXxhMO3n6kB6xqkqKuboxNsO8bDII0s10enNmUKpvvZEIriOznoIav3WTl6e4wpjz_leiEu5Jf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgtefffffhjefhveeikeekvdekteehveekveeuffeigedvtdfgtddthfeh
 ieeffeenucffohhmrghinheptghouggvthhhihhnkhdrtghordhukhenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:lMBIYelurpMmUNoeGN4NjSyvwruVLqTcjbn6V6POYTIwegu1Jkhwtw>
 <xmx:lMBIYY1T-iFf56dpoT_AnmDroqZBmDvsJP1bPL6IPzA4KvhRGWdC7g>
 <xmx:lMBIYVvdiCsfDmTjlHO3mCxUBUnwsHLsSi2XEDT0Ejw3OmF8yHcA0A>
 <xmx:lcBIYSp6uOacPM39j5ZYkR_gKAy5wfZr3MByjLegBXYEYhXVGuGHCw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 13:10:44 -0400 (EDT)
Date: Mon, 20 Sep 2021 19:10:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20210920171042.oq3ndp3ox4xv5odh@gilmour>
References: <CADVatmPB9-oKd=ypvj25UYysVo6EZhQ6bCM7EvztQBMyiZfAyw@mail.gmail.com>
 <20210903160302.yh42vpkuob45dbpb@gilmour>
 <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
 <20210904091050.g5axxctgelciihjn@gilmour>
 <CADVatmN+9euG5Fegor1+kaSPewbW8vRwBgnxmr5SsK3mOE6FEg@mail.gmail.com>
 <20210920144730.d7oabqfbx7pmyyfb@gilmour>
 <20210920154333.vunyxeshdb7jt5ka@gilmour>
 <20210920155350.h6624mt65vwg72p2@gilmour>
 <CADVatmNi+jN+EwiWuoDoocZFyErDVNt1ND0BxtjuKiV63aNuJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wpj546mrj2thtynn"
Content-Disposition: inline
In-Reply-To: <CADVatmNi+jN+EwiWuoDoocZFyErDVNt1ND0BxtjuKiV63aNuJg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wpj546mrj2thtynn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:35:00PM +0100, Sudip Mukherjee wrote:
> On Mon, Sep 20, 2021 at 4:53 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Sep 20, 2021 at 05:43:33PM +0200, Maxime Ripard wrote:
> > > On Mon, Sep 20, 2021 at 04:47:31PM +0200, Maxime Ripard wrote:
> > > > On Sat, Sep 04, 2021 at 10:40:29AM +0100, Sudip Mukherjee wrote:
> > > > > Hi Maxime,
> > > > >
> > > > > On Sat, Sep 4, 2021 at 10:10 AM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > >
> > > > > > On Fri, Sep 03, 2021 at 09:09:50PM +0100, Sudip Mukherjee wrote:
> > > > > > > Hi Maxime,
> > > > > > >
> > > > > > > On Fri, Sep 3, 2021 at 5:03 PM Maxime Ripard <maxime@cerno.te=
ch> wrote:
> > > > > > > >
> > > > > > > > Hi Sudip,
> > > > > > > >
> > > > > > > > On Thu, Sep 02, 2021 at 10:08:19AM +0100, Sudip Mukherjee w=
rote:
> > > > > > > > > Hi All,
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > <snip>
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > You can see the complete dmesg at
> > > > > > > > > https://openqa.qa.codethink.co.uk/tests/76#step/dmesg/8
> > > > > > > >
> > > > > > > > What test were you running?
> > > > > > >
> > > > > > > Nothing particular, its just a boot test that we do every nig=
ht after
> > > > > > > pulling from torvalds/linux.git
> > > > > >
> > > > > > What are you booting to then?
> > > > >
> > > > > I am not sure I understood the question.
> > > > > Its an Ubuntu image. The desktop environment is gnome. And as
> > > > > mentioned earlier, we use the HEAD of linus tree every night to b=
oot
> > > > > the rpi4 and test that we can login via desktop environment and t=
hat
> > > > > there is no regression in dmesg.
> > > >
> > > > Looking at the CI, this isn't from a RPi but from qemu?
>=20
> No, this is from rpi4 board (4GB), not qemu. The CI is a little
> complicated here, lava boots the board with the new kernel and will
> then trigger the openQA job. openQA will then connect to the board
> using vnc to test the desktop. This is the last link that I sent to
> Linus when he asked for it.
> https://lava.qa.codethink.co.uk/scheduler/job/164#L1356
>=20
> And this is the lava job for today -
> https://lava.qa.codethink.co.uk/scheduler/job/173

Is it connected to a monitor then?

> > > >
> > > > What defconfig are you using? How did you generate the Ubuntu image?
> > > > Through debootstrap? Any additional package?
>=20
> Its the default ubuntu config. I can send you the config if you want.

Yes, please.

Thanks
Maxime

--wpj546mrj2thtynn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUjAkgAKCRDj7w1vZxhR
xeBCAQCX7YZ4s1SBf/EtTcIcixPm8R9vls2uw8w+P5Qg3E4fswEA3/YrRR3STrU8
5z+tqd9ZbXeVQOwuBMkMjpM5FgjGgAQ=
=XjUP
-----END PGP SIGNATURE-----

--wpj546mrj2thtynn--
