Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4755B8C7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 10:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7F610EB0F;
	Mon, 27 Jun 2022 08:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCD389F55
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 08:53:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 463B15C01EE;
 Mon, 27 Jun 2022 04:53:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 27 Jun 2022 04:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656320029; x=
 1656406429; bh=YbjaBfcwxsEJTLjjrwiaw6MoYuL/h+89W5hA8G79W4Q=; b=K
 rnsdYJ7Gtd1gaPgHQgJ7CYrrdpgLodOOteQgjDXDuR/Gy4bWi31+C2S1zlWj/RsW
 TPXPsN1BeYYYDs3GhntWmb8QnICNDcawD1BpWyuv+IYjxoniipRC9bAyiZIkfugl
 4FKtvLzSArJvoZx3617q5dc0k7ea6qUaIWyLa1yhjq+4VqDr8GPNv4PXSZhv56fC
 9JryqKy4CcZhKMUwPbQqFh2c+UO/0p8sX2hxRLS1mMly4v6Q/bD9JXywKrmHgSw9
 GVClFImLMg2rs1g8TA68/HYBo8A8NldyABiUTVmgwLqvOefe+MGo/7gK8kfaFx95
 oIwAXin58tJl7Bkj7HKkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656320029; x=
 1656406429; bh=YbjaBfcwxsEJTLjjrwiaw6MoYuL/h+89W5hA8G79W4Q=; b=x
 job176r5evUQOCs+fa4Qn0RiRtHHSnr7r8qv2q54xaYcSJ34sEuCQXMGQl2oWNSn
 3o6BWPUEMB3EebOdcDWhfambt8Q8IxMiMkHuPkRvMO4GDgeHcRH7v7QCjt2L8zYa
 6gCGOOKF2zBILFeOe9tZvFIQa/dJznMaepmNM875oFuy9vhJHVVIDjvgYpoFL0pg
 B1qDVNoaNnosvfRdu1hibqXmrQ2AcxwVyCID6f+3NDuTo4+Y8XYczHV48IYYp+gq
 //IhV+GT6/Ip42Ir6REwezI4yibDxiD1AYjE1AkX90FAqCiF63uaOIV1gvL8kb88
 158iYLkKKw9P2cJbH3S+g==
X-ME-Sender: <xms:HHC5Yr6A370a_bV83zQbm-AC2gHCt23tCoeey9NSFmU78bRuD3wj7w>
 <xme:HHC5Yg6h8mB-zjZ5HjkTPKZZHH74PHh8JBMAsgl_jBAsFTdcmwJzSD1UirHPGyWSs
 t_U2f9IZaCUGpxB310>
X-ME-Received: <xmr:HHC5Yid_Sdj0a5X99v9sRtgh3coU4JXi_a6GErhqJIMm0lUYErxs1dluFgRIYIo-b8Bm5YKA3t9EHL4vA2SMNgnckDdNCUDZ4r5Y5VY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HHC5YsKZX24XRkV0TM-u-WX4Yj5_Clj2e1hYiUvyLyM25rSrPGFt6A>
 <xmx:HHC5YvKH9BnYDaaAUNfMyooMbY_PneaCqLGSTrkSf0tUeW7dlZLT7w>
 <xmx:HHC5YlzqP2-zgZj2zGU5hkuOLbD50XZwDnOBjC7KkFL6vv0Vel--1g>
 <xmx:HXC5Ylh_QdmJd7Cm39OxlS8TFFPoTZlsgHZ4JKc6VEELSPYchLFWZQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 04:53:48 -0400 (EDT)
Date: Mon, 27 Jun 2022 10:53:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH] drm: logicvc: Fix uninitialized variable in probe
Message-ID: <20220627085346.6fnzgygajdu7wncc@houat>
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
>=20
> Do I need to reply to the emails with a message indicating that I merged =
them
> or is using the tool sufficient?

Going back on this, but it's fairly easy with b4 to generate the
messages that you applied them.

For example, I'm using:

cat mail | b4 am -t --no-cover -o - -P _ | dim apply-branch drm-misc-fixes

b4 am will retrieve the last version of the patch from lore (and only
the current patch with --no-cover -P _), add the tags (-t) and output it
on stdout (-o -) and pass it to dim apply-branch

Then, you can do

b4 ty -a && git send-email *.thanks && rm *.thanks

And it will send a mail for every patch you applied in the current branch

Maxime
