Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4B3388D9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 10:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F69C6F526;
	Fri, 12 Mar 2021 09:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736946F522
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 09:43:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C8E9919AB;
 Fri, 12 Mar 2021 04:43:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 12 Mar 2021 04:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=9
 lQvlLw+vU7rUZY13PSSwCQRsmYtgtSB0Kv8oypIsHc=; b=WGdNzxlBXzZxoWZCt
 jehAeaY73GiS/Z3Pa5UhYwGC8s9HVQ/GGuHxkSqk/PUdatlqGk2t4MsYFQfucuOY
 wTSnUR3bRx1C+paREhCwXf2a/lO8vUhLPk8mKD7bFxIjmr5/pcjcWIjr6cJCMcd+
 /y3bE63OSQoDwLTLCtg4JAQ9FdZ3D2qSW25wioDxohwsawMx9i82ki7Upfdb9LiV
 bY8Ojp0d4KftVoV8tR+nMfJhbc2xMyd1YF6P/rtGNYD3zPMDwrgDqdZSzU6TU6Uu
 IFBBAx92jBDRLFSCX9HsJKPPjAGi2DZgqfKw6fKdBDESP32Tsfm96vsf7bBxicCr
 rYWgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=9lQvlLw+vU7rUZY13PSSwCQRsmYtgtSB0Kv8oypIs
 Hc=; b=IXwS6yN73kNspy58drT3bcbozEqnzqvtO3pyBPgs+m6qP/F+lrwmEqEiB
 R9v4F5eU7u43xSVGrWofLH//C8979nfB2tCBol+x6Rp8k6S8/eQW30nMyq8udf7B
 j1bGwNAU7xDZU3Mxd8nHTQeQL3iFnnLyftV3utPgrk/1BpvkJR58mp6GAegTgyWL
 fh1mWwKGymHgihFbHKq2MgpsY34v3IWCR/bRjod4zheRWk5/AAzKU2JBYlsz6dHE
 2NdxeRD546zPy2lSuBffe2xmZ+vl4mGf7o9nklnghLKtM/zrC1X1JumzyobCdUwi
 2PftDAUXLnh/aZ1br0gx0UnLU5JiQ==
X-ME-Sender: <xms:rDdLYNExMiu30-yvDoEFxntdgwc2tN6URAekYzFr5ts9stMvb7sP6w>
 <xme:rDdLYCUYw-8KgkLTcENn7MWIXV2Yl2ecQoLAcFrlrot5FQgB-0uetMkNnIbyhDHC5
 ikqQyJa5z5nqGgtr_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvvddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rDdLYPLdPq3fQq54iAM3MwyxCiRXemXX-XCuLOL1ZscV47RnSAhwDQ>
 <xmx:rDdLYDFYJ_vDgEL7MFL8bG0WdhLWby8-9Czl3tX6xuwPCVQd2fA-Hw>
 <xmx:rDdLYDVXbFCLasqR7cKVIwTkRpvNDtwAPcTt8ExMBnZbKgYOCsIkaw>
 <xmx:rTdLYAg2lepqfTPiWx_uO106RHWESMYEAMc7-AWwp_Mw3766sp_Byg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20D0E1080068;
 Fri, 12 Mar 2021 04:43:08 -0500 (EST)
Date: Fri, 12 Mar 2021 10:43:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: don't base trees on 5.12-rc1
Message-ID: <20210312094305.pcxa3bttrlhaki24@gilmour>
References: <CAPM=9tyZF=seWUswnp7M3RbDQC2hLUc0wjpYYyEfn3dgpOf4zw@mail.gmail.com>
 <20210310074851.x4lo4ymkq25e2iw2@gilmour>
 <CAPM=9tym-LbpFhFCyezYRZeOv6ryEcGj-Jh5yH_87x45g8NN_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tym-LbpFhFCyezYRZeOv6ryEcGj-Jh5yH_87x45g8NN_w@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 05:11:36AM +1000, Dave Airlie wrote:
> On Wed, 10 Mar 2021 at 17:48, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Dave,
> >
> > On Wed, Mar 10, 2021 at 09:50:29AM +1000, Dave Airlie wrote:
> > > I'm mostly sending this to the -misc maintainers because
> > > drm-misc-fixes is based on rc1 at present.
> > >
> > > This needs to be *rebased* not merged up to 5.12-rc2. Merging will
> > > still have the bad landmine commits in the bisect history. This is a
> > > very special case.
> >
> > I'm sorry, I'm not entirely sure I get this. -rc1 is still in the -rc2
> > history, so how would that change anything in the bisect history?
> >
> 
> We can't get rid of the bad commit range, we can reduce the amount of
> times someone accidentally bisects into it, by not using it as a base
> commit for future changes.
> 
> If in the future a bisect happens to want to test one of the patches
> in drm-misc-fixes that is based on rc1, it will land the user with an
> rc1 test kernel and could eat their swapfile/disk. We can avoid that
> problem by not using rc1 as a base for drm-misc-fixes.
> 
> We can't avoid them bisecting into the broken commits between when
> this landed and was fixed, but rebasing trees can minimise the chances
> of this when bisecting other changesets.

Ok, yeah, that makes sense. Thanks!

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
