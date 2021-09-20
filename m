Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E244118A8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 17:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4D16E52D;
	Mon, 20 Sep 2021 15:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A066E52D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 15:53:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E00A35C0126;
 Mon, 20 Sep 2021 11:53:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 20 Sep 2021 11:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Xo4kNrX/HMmpJUVnG7m+mTNGvPb
 3udHRjLjYmf/wSiM=; b=H1gYi5GStJVzn2dEPTZUMbYt2InvJSON0ewahNSWgSY
 YqsQ8owzGiqWU6l1aKBVP77TDVYvBHMkseLO44wEu/Xmy1EVo+mFRiyaiGxpZbzf
 Jy1XlQN4kU90phQZ0BGHnChyAiRg/zsRDP/iqFuRNVfiXpoqL9+e9hJEaJBZQQg6
 wjyGf9mjVRtsfOAsvPn+us1fPqiDu7ujMEy4EZ96SRptmYoGTFP1KntLHM9cqugE
 B+kQRC1UMd4xFIlm0ypsJHC6gDr8rGrb6rdcBRGs6llEKLdaG1uUaTgKIcLvBTk5
 EFrLZEd00sVcHL8UlCAz+xTXO9Ae1fqnmV3VVk9VzRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Xo4kNr
 X/HMmpJUVnG7m+mTNGvPb3udHRjLjYmf/wSiM=; b=ZlD6KRUqFgNvKmFvCIh5qy
 UOZcT5ORqcuLtpcIEWF+d9+MZEER8NIQQCB4QiD5idsdO3e5QNPalYzq7k7LClxA
 /GS1Q3biDi877t2kLh7LMaD4sDtwEzYHWMT2GZwxtyEcviERPcKiyHreJ2gAhnPy
 r9rizEc8n8mah89XSq4r+99X3ZRgPHhOWWZNXFNCBZiUey+Fg0fCbzKlBwBT/Jjh
 qDDR9VBG3HOpD6KGWHCzW5mh0/DmxsHEmwqLTmjeVt382qFuOP0halIsezd4p+bl
 PYLCj79NL9cAj/TnheD9eD5gkajcnGdT+jiVeGjBiQ0UmpH8Pd3wgQ9Gq7Lv9HGQ
 ==
X-ME-Sender: <xms:kK5IYS0gV8TovlghO5QqNQ1g2gowDBTtW8PjtO6O_0wtHPVPtShBXQ>
 <xme:kK5IYVE9c9e1y0fuqRM-zSd2PLzR4itQWkyNu6JMKGrf2ZVwLCFM0e5dPAVUHzCna
 0hxw3QozImLdtboJt8>
X-ME-Received: <xmr:kK5IYa45NAHkhC_9IKVhlIvCXE4jC4Ud1jKhUyUZXwmzVtxZOQrPBrcsNHF52ECHxc0cF_rrsVWgfKY_7q37-wYsyoIOdrFGcncN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvedvfeetffdvleeugeeukeegueekheegieevieejkefhieetgfevudekhfel
 fffgnecuffhomhgrihhnpegtohguvghthhhinhhkrdgtohdruhhkpdhgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kK5IYT1PWsQ_LDUpK9d04g-rNNdpf7gF6phTpnq3ZSJia7fklxMZLQ>
 <xmx:kK5IYVFPJOwZ57uiMYWTgfFAL3ZAhswzA8c0rARx2LQKqOTMQ1S1qw>
 <xmx:kK5IYc8nSwjzI-gWkiNwYwfbcKbrZ8qUOblhYWGWzOXIsDiwTyflrA>
 <xmx:ka5IYa7qMKjEOBBQU3QS4zFbDL3KhuQNX0J8-i7AaLfhOafhgWSm-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 11:53:52 -0400 (EDT)
Date: Mon, 20 Sep 2021 17:53:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20210920155350.h6624mt65vwg72p2@gilmour>
References: <CADVatmPB9-oKd=ypvj25UYysVo6EZhQ6bCM7EvztQBMyiZfAyw@mail.gmail.com>
 <20210903160302.yh42vpkuob45dbpb@gilmour>
 <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
 <20210904091050.g5axxctgelciihjn@gilmour>
 <CADVatmN+9euG5Fegor1+kaSPewbW8vRwBgnxmr5SsK3mOE6FEg@mail.gmail.com>
 <20210920144730.d7oabqfbx7pmyyfb@gilmour>
 <20210920154333.vunyxeshdb7jt5ka@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2k2j2rpvo2rs2z62"
Content-Disposition: inline
In-Reply-To: <20210920154333.vunyxeshdb7jt5ka@gilmour>
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


--2k2j2rpvo2rs2z62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:43:33PM +0200, Maxime Ripard wrote:
> On Mon, Sep 20, 2021 at 04:47:31PM +0200, Maxime Ripard wrote:
> > On Sat, Sep 04, 2021 at 10:40:29AM +0100, Sudip Mukherjee wrote:
> > > Hi Maxime,
> > >=20
> > > On Sat, Sep 4, 2021 at 10:10 AM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > On Fri, Sep 03, 2021 at 09:09:50PM +0100, Sudip Mukherjee wrote:
> > > > > Hi Maxime,
> > > > >
> > > > > On Fri, Sep 3, 2021 at 5:03 PM Maxime Ripard <maxime@cerno.tech> =
wrote:
> > > > > >
> > > > > > Hi Sudip,
> > > > > >
> > > > > > On Thu, Sep 02, 2021 at 10:08:19AM +0100, Sudip Mukherjee wrote:
> > > > > > > Hi All,
> > > > > > >
> > > > > >
> > > > >
> > > > > <snip>
> > > > >
> > > > > >
> > > > > > >
> > > > > > > You can see the complete dmesg at
> > > > > > > https://openqa.qa.codethink.co.uk/tests/76#step/dmesg/8
> > > > > >
> > > > > > What test were you running?
> > > > >
> > > > > Nothing particular, its just a boot test that we do every night a=
fter
> > > > > pulling from torvalds/linux.git
> > > >
> > > > What are you booting to then?
> > >=20
> > > I am not sure I understood the question.
> > > Its an Ubuntu image. The desktop environment is gnome. And as
> > > mentioned earlier, we use the HEAD of linus tree every night to boot
> > > the rpi4 and test that we can login via desktop environment and that
> > > there is no regression in dmesg.
> >=20
> > Looking at the CI, this isn't from a RPi but from qemu?
> >=20
> > What defconfig are you using? How did you generate the Ubuntu image?
> > Through debootstrap? Any additional package?
>=20
> So qemu (at least on Fedora 34) doesn't seem to have an RPI4 target, nor
> upstream:
> https://github.com/qemu/qemu/blob/079b1252e9de384385c9da910262312ec2e574c=
8/hw/arm/raspi.c#L367
>=20
> I've tested an Ubuntu 21.04 arm64 build (since it seems like it's what
> you've been using), built using debootstrap + ubuntu-desktop, both with
> and without a monitor attached, and up to the desktop once logged in.
>=20
> I don't see any crash.

That was with arm64's defconfig.

Maxime


--2k2j2rpvo2rs2z62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUiujgAKCRDj7w1vZxhR
xeQ/AP9/sFD90opAxmYDXA9UYBTRMxrWpbrzz0O0H0pwB8PaXQD+PS2gIVvM2v1k
5bpKMLxnU3LuKu+im06SotCU+ScvOQQ=
=A1Cm
-----END PGP SIGNATURE-----

--2k2j2rpvo2rs2z62--
