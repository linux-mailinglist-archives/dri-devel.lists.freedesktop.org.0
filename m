Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F00280DCB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 09:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D291F6E231;
	Fri,  2 Oct 2020 07:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D6F6E21A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 15:04:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5C7E5EC9;
 Thu,  1 Oct 2020 11:04:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 01 Oct 2020 11:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=hsfcTzgykACUWAsl9gm17cAmSb/
 jbx8vKMS03bYlBoc=; b=IzI9XQUpqwHQXDBqWSZsIOL8bjuBgldJm4aGWxlbmmN
 uq4yhSHKnzgIFDqomMxR+jJPp+kjkDdAhIrCxuNs0gayMH91X9YwftbqRCVwMYAx
 /3GM1+33/xrYZMyzwmHhEnxB3NP+5F2ZQGAgJQRe+e1NLiyUX+LsG8WlWPUToxUZ
 v045HIgNGitcwAed+9GG+Gzj/3bdq5+rAUU9eUcdfTeJ7t+AY272eaIHgmK1EbL8
 iRfscdc+4pU9370AVpmDXUO2RblyipLkYO8SuzN5cPvggG6B3M7rE49BaaEBTVpZ
 3lUcT7qDQ4RQDq8nY+cTzHaIe/u34CEIg/jd892+Swg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hsfcTz
 gykACUWAsl9gm17cAmSb/jbx8vKMS03bYlBoc=; b=iXtlJjk3DfuxhwaFJE8mgq
 4Rq6YsbpaFt/r9R6nmgIW3PRvJVnoISyVNbvgbkvs7F5KwAtxsNlZUrZ/PZSPlqg
 Q0VHnOuDT9J/FdXmlnp/9PSz9/CMr001YPMnjTscgJNpQWVOAZXDHr1qaTqjRAbj
 XWEacWDtXgWlhs0qijc/TmsopQG9p4owpSHjKYcJ8p/aEnYryOSUk1J/9aUDhYE3
 Su5SMas/9oNpdQLiXrymtNnKXS4S8UmLR3DVodRjEi+yudiH4tAa7GVgad4OKmik
 QxlP/TWm5pmlVQAsXpYtIe/VVRRbzh0VJKGjbtJdMewmTGbpDEr1eFiya/79QSfA
 ==
X-ME-Sender: <xms:BPB1X-U0GvC7t716HL72VGGH0WozmDqeaMo-3JI-I3ZQ7bovEDzLFw>
 <xme:BPB1X6lfwGd6e_bEojenHNMjFlPkgF8tUizF3PS_B3aZUUMin9TSYZE-PfBnQUPBl
 1L9-yAvxOoxHnrVt_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeggdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BPB1XybpBri8xocCpAnIDe0QBMxw8tm9F8t6lUNYIYO3Zdcm7hluPg>
 <xmx:BPB1X1XVVLg5tDDIzaJK1GUrgC2WV15M3MNs8k_Yy3VhkX3ylzJrvA>
 <xmx:BPB1X4n3aFDGjDIPS4oviIemQa69Lv5zGV5VZonoeWIbJePxdrGOFQ>
 <xmx:BfB1XyUmlYORyQp1Kyi6FCXoH1isdphp8TQakx70B5aL0NHa4QsLIg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E5B3F328005A;
 Thu,  1 Oct 2020 11:04:35 -0400 (EDT)
Date: Thu, 1 Oct 2020 17:04:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH 1/2] drm/vc4: kms: Assign a FIFO to enabled CRTCs instead
 of active
Message-ID: <20201001150434.g2wleylc7l6tj2nd@gilmour.lan>
References: <CGME20200919084635epcas1p3b36b85b4445709cf3595fc62e659c1ae@epcas1p3.samsung.com>
 <20200918145918.101068-1-maxime@cerno.tech>
 <226dbb4a-e97a-f6b3-645e-785a20bbdacd@samsung.com>
MIME-Version: 1.0
In-Reply-To: <226dbb4a-e97a-f6b3-645e-785a20bbdacd@samsung.com>
X-Mailman-Approved-At: Fri, 02 Oct 2020 07:02:50 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 =?utf-8?B?64KY7ISx6rWt?= <sungguk.na@samsung.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1177106735=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1177106735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5tw7v2xntnj4obcw"
Content-Disposition: inline


--5tw7v2xntnj4obcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 05:08:56PM +0900, Hoegeun Kwon wrote:
> Hi Maxime,
>=20
> On 9/18/20 11:59 PM, Maxime Ripard wrote:
> > The HVS has three FIFOs that can be assigned to a number of PixelValves
> > through a mux.
> >
> > However, changing that FIFO requires that we disable and then enable the
> > pixelvalve, so we want to assign FIFOs to all the enabled CRTCs, and not
> > just the active ones.
>=20
> Thanks for the patch.
>=20
> There is a problem when doing page flip.
> After connecting 2 HDMIs without hotplug and booting.(Same thing when
> using hotplug.)
>=20
> When executing page flip for each of HDMI 0 and 1 in modetest
> operation does not work normally. (crtc irq does not occur, so timeout=20
> occurs.)
> Sometimes both hdmi 0 or 1 work or not.
>=20
> LOGs:
> root:~> modetest -Mvc4 -s 32:1280x720 -v
> setting mode 1280x720-60Hz@XR24 on connectors 32, crtc 64
> failed to set gamma: Invalid argument
> freq: 60.24Hz
> freq: 60.00Hz
>=20
> root:~> modetest -Mvc4 -s 38:1280x720 -v
> setting mode 1280x720-60Hz@XR24 on connectors 38, crtc 69
> failed to set gamma: Invalid argument
> select timed out or error (ret 0)
> select timed out or error (ret 0)
>=20
> Could you please check it?

So I can reproduce that bug, but I've not been able to fix it yet.

The issue seems to happen 100% of the time when you start first with the
second connector, and then the first. It creates yet another muxing
corner case, which is that when the first modeset runs, there's only one
enabled CRTC (with the 69 here) that gets assigned the channel 0 (since
it's the only one and it can run from that channel). However, when
modeset exits, it doesn't disable that CRTC for some reason.

Then you enable a second CRTC (64) with the second modeset command, but
it has a lower index so it gets evaluated first and gets assigned the
channel 0 as well since we haven't removed the CRTC 69 from the pool
yet.

I've fixed that up by first removing the channels in current use, and
then allocating them in two separate passes, but it doesn't address the
problem entirely, so I'll keep looking.

Maxime

--5tw7v2xntnj4obcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3XwAgAKCRDj7w1vZxhR
xW0kAQDrvqxIBKWe9EPtrZibFmb88iU0CFvkWQPZJ2y0NRxOLAD/cEat243uR/LF
S3N1zXZVD+Qdqw0Gpwebn2NKbqnmRAI=
=hi47
-----END PGP SIGNATURE-----

--5tw7v2xntnj4obcw--

--===============1177106735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1177106735==--
