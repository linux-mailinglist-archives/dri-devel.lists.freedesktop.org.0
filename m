Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8E1559CFB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 17:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F7410E342;
	Fri, 24 Jun 2022 15:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05B510E342
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 15:06:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 25E145C01DA;
 Fri, 24 Jun 2022 11:06:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 24 Jun 2022 11:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656083205; x=
 1656169605; bh=HjT+D1N1osG/gGZVW5EodSJ+cA7Y5+uYwHsMT33cSjw=; b=n
 bK4GxSQkrXj+mv+hxp0zW+0OPwRz1ButBUhIu7fSLnA4E96zxgrCE6dqG+f7LGaj
 1eYe8fzdRODokUz9cyQ0F+WzcrjKUyZdsr1wXHKeUobFIO+dBdWe73eCLrT4dvGP
 JMME3INHUCBeKoM1Tt9+8J1zEKwJQW6rq80+eBFvxDqVI4z9hphrngJoRz/4s/zM
 qNFj/duSmCrpbH0COptguSv8y+MZMGUH2vAx8qelVI/h+m8iPfIs2U6hGVgEwrMo
 NfLaqGa3Amuy0wH3FrVdemzqS+yjWcUzUYNxSpDEeYitSBK4Ag2KsobqKTl4B9b+
 AnIbNHdnkL3sUnBgscqgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656083205; x=
 1656169605; bh=HjT+D1N1osG/gGZVW5EodSJ+cA7Y5+uYwHsMT33cSjw=; b=v
 qvtGt0IX13aS/uwgD8GVvCpfB8hHyJ/0gJwOIX4pnv7xyVK6OZs8LvC7XeekRBfh
 QLQdiKmF0UumsE4Z3zSVEbCUeHA7w7ZCLXLUk0Vjhem6gRcjY36zB/1QqSpjAj44
 QeBFoWOubNPCoR/yS+F5vLCWAcx+0BEwox7WT6AYCmvz6hvJwwAal9jTNOovNwAs
 vqVBgRD6AcTDTEy18PP/h4oQ4gw4BLXd6XbgABvOW+EIko6ZmR4cBCUcGXGZe96j
 7i+HklAmDtS9n7EIwWCUL2yAuVYEnM0KAj2iR7W4U5ixPZ8hs5IAml6blbUroInQ
 KiFjPkeTAArp/vpeW27tg==
X-ME-Sender: <xms:BNO1YmL4ONZqTGqMU--zPKoJF1_-NDfTAG_HRW0MIjrDbsRw3jcSJw>
 <xme:BNO1YuLpt6Omkimf-8rOE3BBhPFflBX-gaLWgMq-8LYfvnYvX773zoMHPV1kOp3F7
 8oQrD2fhmP_rQDinUQ>
X-ME-Received: <xmr:BNO1Ymv5J4GaEEZshQXOkH7BgakTraQ103BVHA8tP0goGFtSQkNtO_un3BzoGtO4cajXILuX-PJ30iPmSKH2vgj4p1dpymwUP1T-QLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BNO1YrbAouVnEIZKD4ndfS9wcVEc8-W4GuCbuubGI61Rde2kJla6rQ>
 <xmx:BNO1YtZVe7cBZbZ_ehlomCTXXajIZU3xELf8EByPcorMKih3-tN5Yw>
 <xmx:BNO1YnBs0CR2_zmmIECtDzfuT9zLKArOzVKTSkXiKOgpbT_NZ24Kuw>
 <xmx:BdO1Ygw0IiIqSoDeZnISQ8JHLRIBwdgpTxx0Eo7iY04pQtiYTdeJ_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 11:06:44 -0400 (EDT)
Date: Fri, 24 Jun 2022 17:06:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH] drm: logicvc: Fix uninitialized variable in probe
Message-ID: <20220624150642.afkxpnut365i2wew@houat>
References: <Yqh6OfSiPFuVrGo4@kili> <YrXLrVUIavGWC4sx@aptenodytes>
 <20220624143717.tykkcznvzq5e5qz2@houat>
 <YrXOTAR6koA1b8XJ@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YrXOTAR6koA1b8XJ@aptenodytes>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 04:46:36PM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> On Fri 24 Jun 22, 16:37, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Jun 24, 2022 at 04:35:25PM +0200, Paul Kocialkowski wrote:
> > > On Tue 14 Jun 22, 15:08, Dan Carpenter wrote:
> > > > The "regmap" is supposed to be initialized to NULL but it's used
> > > > without being initialized.
> > > >=20
> > > > Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display cont=
roller")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >=20
> > > Nice catch, thanks a lot!
> > >=20
> > > Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >=20
> > Since you have the commit rights to drm-misc, you should apply it
>=20
> Absolutely, I'm on my way to doing that.

Giving your Acked-by is confusing then, because it's kind of implied if
you apply it.

> Do I need to reply to the emails with a message indicating that I
> merged them or is using the tool sufficient?

Sending an email is better, dim doesn't do that

Maxime
