Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2CA256652
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E279C6EC00;
	Sat, 29 Aug 2020 09:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003196E2B8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 09:11:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8AB89789;
 Fri, 28 Aug 2020 05:11:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 28 Aug 2020 05:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=Z
 6mEu5ovUCsGUuf/wYMTCQN4y6rAXdKDOAyJ2Ja6nCA=; b=qN37PLkgvkVR5Aazx
 VO6BnCy6DwdAV9DCbIZf14J7EMDsPTYcytEmv27Q19g3xOaErEcN8uFbDs/RK+2r
 qvYHiC8ux0XdNPZEvNL2DSUXkQaRhpUgRLsVdt6V/rYwMASN0dJ2Pp8DeUqZgKnM
 Jbxtp2cKAYQsZWyV0ok59dj5yMepW4jXKcqOYAtdomFYcOWZC4DCVyw3RBdj1ot5
 MVpJ7WYZwLU8liQEakA9C4keoaImk068u7RSJwVZadNsOES7aPlfbRYCI4oWSynA
 KnTZGKmJ1QmexpzClITgozZEM7c/Co9GQ5xWxUGtlT14hJRUPRe8De9lUCQIKO81
 Fx0HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Z6mEu5ovUCsGUuf/wYMTCQN4y6rAXdKDOAyJ2Ja6n
 CA=; b=J/GreiDhRaZndA7DEBOqOBikLTiFnuLazmjM6HRBkH3DkY6QbCiHTxKXA
 AT7CFyaTUft0UvLJz8h9MQO21oTI+fax4rUA4NHW/zUTyp3TaKvhZr4I4lDeiWsS
 1iYNk7N4HGxcIdw1ifu4rfV6mbtt+vw0hjSF4bhKZuLjsgnqbVUeZjcu8/zJenqf
 EGZ5dW/GElYwtg6CcuJEMLARnYM2EFBU6Vr3/b83Ib2JVAyD4klarhMsRt8SuWiI
 DQeHiRaO4CO65d5YvEfT6aNonVw9LHcy7CmDRWkeR2BBvV/zm/zDP4MlT3zVpQzM
 zZI74TPd9+2TnOcv6cKXbwpM1IwvQ==
X-ME-Sender: <xms:OspIX0ocSBm2DjNrFPFC4W7EeyJNIMQwWeiDjArXG5Umr_lD8Jl3rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvjedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhieehiefftddtgfekuefgleelgedtudefvddtkedvheejhfethfekjedv
 fffhheenucffohhmrghinhephigrmhhlrdihohhupdihrghmlhdrmhihpdgsohhothhlih
 hnrdgtohhmnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OspIX6qjTBWCbMKI489sP7e1md-tHIHIS9C2HkG5wnfEg70zir99BA>
 <xmx:OspIX5PDxDCqlUilueVJdVYs9CHCjUU0UeKMXgftzRW4mJhR9HiIFg>
 <xmx:OspIX77D5JWzJkxHsy_fyvUcDVrGQ_xjsI4FTSiFr-oAxNizaJqqEg>
 <xmx:PMpIXyTmitD0WCYlzYmkQqr7Z6mJ3U_0CDE3jCHafbFtXctad7afN8uEIYo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 10FC33280064;
 Fri, 28 Aug 2020 05:11:21 -0400 (EDT)
Date: Fri, 28 Aug 2020 11:11:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 3/3] drm/vc4: hdmi: Add pixel bvb clock control
Message-ID: <20200828091119.2kykcxixw247kfno@gilmour.lan>
References: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
 <CGME20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d@epcas1p3.samsung.com>
 <20200821071045.24501-4-hoegeun.kwon@samsung.com>
 <61c199bf-852f-82d3-089a-a0a435343acf@i2se.com>
 <80749dcd-d4b2-68a1-f3ca-c19a120f6f7b@samsung.com>
 <84c423e8-25a6-8f23-cc80-7a17ce03fd1d@i2se.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84c423e8-25a6-8f23-cc80-7a17ce03fd1d@i2se.com>
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 tim.gover@raspberrypi.com, dave.stevenson@raspberrypi.com, sboyd@kernel.org,
 mturquette@baylibre.com, kdasu.kdev@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 phil@raspberrypi.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 nsaenzjulienne@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On Thu, Aug 27, 2020 at 11:49:34AM +0200, Stefan Wahren wrote:
> Am 27.08.20 um 06:35 schrieb Hoegeun Kwon:
> > Hi Stefan,
> >
> > Thank you for your review.
> >
> >
> > On 8/26/20 7:04 PM, Stefan Wahren wrote:
> >> Hi Hoeguen,
> >>
> >> Am 21.08.20 um 09:10 schrieb Hoegeun Kwon:
> >>> There is a problem that the output does not work at a resolution
> >>> exceeding FHD. To solve this, we need to adjust the bvb clock at a
> >>> resolution exceeding FHD.
> >> this patch introduces a mandatory clock, please update
> >> brcm,bcm2835-hdmi.yaml first.
> >>
> >> Is this clock physically available on BCM283x or only on BCM2711?
> > As far as I know, BCM2711 raspberry pi 4 supports 4k,
> >
> > don't supported on pi 3 and pi 3+.
> >
> > Since 4k is not supported in versions prior to Raspberry Pi 4,
> >
> > I don't think we need to modify the bvb clock.
> >
> >
> > So I think it is better to update 'brcm,bcm2711-hdmi.yaml'
> >
> > instead of 'brcm,bcm2835-hdmi.yaml'.
> 
> You are correct please update only brcm,bcm2711-hdmi.yaml.
> 
> My concern was that the function vc4_hdmi_encoder_pre_crtc_configure()
> is called on a non-bcm2711 platform or on a Raspberry Pi 4 with an older
> DTB. So making the BVB clock optional might be better?

It won't cause any issue on a non-RPi4 platform since the clock pointer
will be NULL and clk_set_rate can deal with NULL pointers just fine:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L2221

For the older DTBs, it shouldn't be an issue either. We haven't merged
the binding yet, so we don't have an upstream DTB using it

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
