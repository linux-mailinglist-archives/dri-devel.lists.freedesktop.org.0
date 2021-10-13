Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E22142CC71
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 23:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B056EB15;
	Wed, 13 Oct 2021 21:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424776EB0D;
 Wed, 13 Oct 2021 21:00:40 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id ABAB15C008C;
 Wed, 13 Oct 2021 17:00:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 13 Oct 2021 17:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=p
 uRd1BM9YLoYVc3J5iBNemEECVRtEUjgf+PpJrxzOyY=; b=btpyqzrKv6GPplLdL
 HppkwJGZguo438d4Y4I9hQrt+tl7VvNAxwnaUmCJZzYO3YnoB/ggOQOOLWjH20d8
 jptUzSIJZ9y1MeU/pZsPDoLpBrlm3asvU92NJftq+WhBAogw5NyPDrhniDxm+u2w
 4CSVAvIHJTh0kuqEXntBVexUZyYXlCa2UTX8Rz0Kfz2jOCzrH4BM3dq6BxDbgGVP
 PSdGMhHqGs4kYfyue7rhSrJDvjpZ4wc7j4w7ZfSAya1T64OS5E4tbdOcS1TOAd1/
 JIdHDAQ9SEkmjk5zETuSKVQko6+VdqOtOq0T4zgXvuMlJ7GyyTtPnE8KcPRKdIAC
 m743w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=puRd1BM9YLoYVc3J5iBNemEECVRtEUjgf+PpJrxzO
 yY=; b=cViQsdllolKpiy/DvMtka4/LPTuplE9MtNol66QRwXywNfehD199Z+43b
 oXQ2jjfEWmC/Yl6C183d7NImG5z0e52l0FQDm9xvVswOTe9ato+ZN3w6oclA1o5H
 w6Um+/WFkZd/nLXFlTMbNV6CoNINgoEzR+bGLORQvukSBftJIZyHYX7OadNwcDnF
 3aUAGNtTULippYeXcvLo8a9uESpc/Q2bYQGaeAoIARlLvZPJFBCR4QFfeyHSC8yS
 cP7qHHmMs6vRvrVuVhOFhUUnAYdJGDFUAdggyF046WjK9icIt6i39NbBIDN+EOsM
 SI3c1NF9zIzHAvz9IOZIuA2RlGP0g==
X-ME-Sender: <xms:90hnYdBf2zRdc062nsU--xx659yJ24EsBE5SfEZgz_ypnGUt_9AWJQ>
 <xme:90hnYbjHMpVY_k5RWNjNLX_eNEaGXjCgI1RlT5hGUaMAfGhVeThZbu2zKaBH1Kump
 Q5b8hBoB6_-1FT1CQ>
X-ME-Received: <xmr:90hnYYmxDstCPNAuziIpBtBDLHUF8K_Xqj60x1jyydAQwRW3pGjbfRoykFEM0y4ExLyVSHfJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefhvghr
 nhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrg
 htthgvrhhnpefhudetkeekgeefgeefveetueegffefueejleekfeehgeeggeeuhedvfeeu
 teehveenucffohhmrghinhepgihktggurdgtohhmpdhkvghrnhgvlhdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhho
 ohesuhelvddrvghu
X-ME-Proxy: <xmx:90hnYXwZ8mWvKnzCXp33xHDFDUk0RS9VnTNGzyud7UGQsgfnNy_JNA>
 <xmx:90hnYSQGji1c0JLdoXSQgRFEzMtKxktMecWbnJ_PcPbuu4HCdF0lmA>
 <xmx:90hnYaaRE2EN72Ipf17BcI973EuCdK5sikbSiN0tSVPPvoItLkmN2A>
 <xmx:90hnYQdGorfo-XEUhDsxvFb9orF-mu29xVU3Nxhd82b-NapFHCgNyA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 17:00:37 -0400 (EDT)
Date: Wed, 13 Oct 2021 23:00:35 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 1/4] drm: Introduce drm_modeset_lock_ctx_retry()
Message-ID: <YWdI82JKcncv3J71@zacax395.localdomain>
References: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
 <20210715184954.7794-2-ville.syrjala@linux.intel.com>
 <YPbTUf9KfiZ5GnFz@phenom.ffwll.local> <YVriZxCeipBUgc8O@intel.com>
 <YWbKM9Fo5OHGafAY@phenom.ffwll.local> <YWbL3Z0UNZLMLC59@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWbL3Z0UNZLMLC59@intel.com>
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

On 21/10/13 03:06PM, Ville Syrjälä wrote:
> > And yes C is dangerous, but also C is verbose. I think one lesson from igt
> > is that too many magic block constructs are bad, it's just not how C
> > works. Definitely not in the kernel, where "oops I got it wrong because it
> > was too clever" is bad.
> > 
> > > > Yes the macro we have is also not nice, but at least it's a screaming
> > > > macro since it's all uppercase, so options are all a bit sucky. Which
> > > > leads me to think we have a bit a https://xkcd.com/927/ situation going
> > > > on.
> > > > 
> > > > I think minimally we should have one way to do this.
> > > 
> > > Well, there is no one way atm. All you can do is hand roll all the
> > > boilerplate (and likely get it slightly wrong) if you don't want
> > > lock_all.
> > > 
> > > The current macros only help with lock_all, and IMO the hidden gotos
> > > are even uglier than a hidden for loop. Fernando already hit a case
> > > where he couldn't use the macros twice due to conflicting goto
> > > labels. With this for loop thing I think it would have just worked(tm).
> > 
> > I'm totally ok with repainting the shed, I just don't want some 80s
> > multicolor flash show.
> 
> You have a better idea in mind?

Sorry, I completely forgot this discussion was going on and I just published V4
of my patch set here:

    https://lore.kernel.org/dri-devel/20211013204846.90026-1-greenfoo@u92.eu/

Please, feel free to let me know (ideally, as a reply to the corresponding i915
patch from that set) if you rather me not to modify i915 files for now.

Thanks.
