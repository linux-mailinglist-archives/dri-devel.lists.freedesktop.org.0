Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965EF1F62FF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E783C6E8A3;
	Thu, 11 Jun 2020 07:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E176E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 18:40:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DBB4858015B;
 Wed, 10 Jun 2020 14:40:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Jun 2020 14:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=udqN551CwjSTVUDc0D3kSahB8HY
 8CeSIkA8lNOgclJo=; b=SSOBpvk4b4Pw9e8QupB5MChycdXrWcxNGUbo5+QqOB2
 EG/b6zh9og0gepAraw33BO9gskuaIRH/d0B35Z8IRps3FyOX9d09lsd8adi6iZud
 e4LF60hPZkpPmAu/O1VqMmODBhtuiuTNUgkN6kPFd0EfVB6pqxZ0SQ+sbm/y/nRO
 MNTEjq/SsNEpo9sa0FRTaXDvCrZLPJFIAn6DudP3qcIE9GxA/fgU8wjLHtzPcYpE
 Nu3K+4rdJ1I2YSTF4zBggLJD53HHuXGiDBIgUIg7GAQMLxDLwTE9cIgBj8SQsIGB
 DQ4z62PiBkuUX6hQy+lS0Tf3xRZ7FSAlI0tNzJyEtTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=udqN55
 1CwjSTVUDc0D3kSahB8HY8CeSIkA8lNOgclJo=; b=oUMwvVekXmmDKq3tMHHOiq
 Oe9XPwUXSkst2D1ORd9yRYO9u/dghU0y7YQOhRV5KtF2yslH5qzusgPFowpBlrpU
 +TGcxs6rkP28NyrODwFw+02LPte9frNWwwH6y/bNeay6zQ2ABLMb3yU7hkmLiWbK
 TcDdko3D0PsAE3dbjz079ZwugHREMVR+ecCwNXR9JnDW+BjmFHCKW+/rOCZYsI/N
 ZZvYdbkGu6Td/qD0nK/UgT1g/fsNMLm+PBk8ocOchxmIDUcZ/kuSo8mrQkVZO4Ck
 snK/aDJys04wqBT2O6DV+tzzKj3CMNH827Hc5u6Pl2u7J461+KLnuKbUKy/HPfYw
 ==
X-ME-Sender: <xms:DCnhXtRpnDDHB7tIAsgobtDpskmMLtcq5mgmBd4ZveX-ADkzXrvmjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehiedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DCnhXmyjE-mu_wBJfFrUMjijn_JHiqCkLoIfce_gMkkOdJy5pzYR-Q>
 <xmx:DCnhXi31HyndptgqdHeNm8rYG2sDdpk_rg8DI31Fibd1LTqMSLPWag>
 <xmx:DCnhXlA-QYkYRubCILB4TOA-06l9HsdBHv39yzdJvOD_yWDnTM09AA>
 <xmx:ECnhXqjgnNS8FrTCg8Qxbtz9huV6yGQNddfcwbSdHWAb8o8mOm9kaA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 962643280064;
 Wed, 10 Jun 2020 14:40:12 -0400 (EDT)
Date: Wed, 10 Jun 2020 20:40:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v3 066/105] drm/vc4: txp: Turn the TXP into a CRTC of its
 own
Message-ID: <20200610184010.slnn46azvxvtxp7t@gilmour.lan>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <e9bc87e240b62c80617ea7825144121a470a2d44.1590594512.git-series.maxime@cerno.tech>
 <CACvgo50j1t5VtMgE7-pquuYRaC_ku5pZ2aBVoD-MCCktfPm-VQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACvgo50j1t5VtMgE7-pquuYRaC_ku5pZ2aBVoD-MCCktfPm-VQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:54:02 +0000
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
Cc: LAKML <linux-arm-kernel@lists.infradead.org>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0629344739=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0629344739==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="heqnr6uenmn6etam"
Content-Disposition: inline


--heqnr6uenmn6etam
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Emil,

On Thu, May 28, 2020 at 04:51:31PM +0100, Emil Velikov wrote:
> Have you considered splitting the series into several parts and
> focusing on merging one at a time?
> IIRC this the longest series _ever_ submitted to dri-devel, plus it
> seems to be growing with each revision.
>=20
> Due to the sheer volume, it's likely to miss various points - large or
> small (like below).

Yeah, I know, I wasn't really happy about it either :/ I already removed
some parts of it to reduce it, but I'll try to be more aggressive.

> On Thu, 28 May 2020 at 08:47, Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > +static int vc4_txp_enable_vblank(struct drm_crtc *crtc)
> > +{
> > +       return 0;
> > +}
> > +
> > +static void vc4_txp_disable_vblank(struct drm_crtc *crtc) {}
> > +
> Core should handle if these are NULL, so the stubs should not be needed.

I'm really not sure actually. In the general case, you'll want to have
vblank functions, since it doesn't really make sense to have a driver
without it.

We could argue that with writeback, it might be optional like being done
here, but you don't really know if you're going to use a writeback
connector in the CRTC at initialisation time, and all the other
writeback encoders actually seem to use a real CRTC that can output to a
real encoder, and therefore has some proper vblank handling too.

So yeah, it really looks like the check is valid, and that driver is
just the odd case.

Maxime

--heqnr6uenmn6etam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXuEpCgAKCRDj7w1vZxhR
xfKbAP4guXZpKOBW0DBgderX3rva9jNmN1dH66Kel2jC5+ha2AD/f4mM9LuoVOUU
FtD2pyxEBAUtj6eIpZBwTD4vxJiVgg0=
=v1fz
-----END PGP SIGNATURE-----

--heqnr6uenmn6etam--

--===============0629344739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0629344739==--
