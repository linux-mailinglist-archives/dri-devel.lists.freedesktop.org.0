Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAE410117
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 00:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E12B6E07F;
	Fri, 17 Sep 2021 22:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02206E079;
 Fri, 17 Sep 2021 22:07:10 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B227B2B00B9B;
 Fri, 17 Sep 2021 18:07:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 17 Sep 2021 18:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=RZqwfni5G08cwy4bwCn0VZ2NfU9
 CVpPHZawELnxT/nw=; b=CFEPoLG3r9CnA2l7rKfHIt4/NhNBzFl/tYNZjS8vfyy
 /7sCYBUgPrRC6V28BYKuk9Bt2j1P+Iff3ZTYJf4cfr5F2EApL6nSPPeHbJno94Ql
 0Mhe6eK4Hla69B75bTxb+z0TYEZ76Er4RbLdvE0OhGIO6nGSyfzFO1xh2UBwNaVM
 g/kiCzmS0gRdD7Ws1BuT4FPalpabDVdL0cDH2HoLQ0l1WClEm8MdwoKvir9yF+KI
 Mh9jLazd8l1xH2dhP9VnVnH0jZ6mP5ryxws3aKuICOK9b4psPogX/UxTPwuCe9WC
 1mBj4y513FOjemXjVXaGVuBzIHYG3mfy3SV8tmRQPpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RZqwfn
 i5G08cwy4bwCn0VZ2NfU9CVpPHZawELnxT/nw=; b=dUn7PmC0UMgypEUPLvpOHv
 X2kr0eFnUfnvMEeRbdehbaGOancVzRwPT/g238ZzaSTphUNKKetqLzg9ET9o591s
 846aL7F1yJ97PEV9sukaCt/59u/0UQEZyxt693FJCnGf9IgL4ZVBS8pI9y7XFX6R
 b1vUC9gV4CgqBqvZrS478AfxsUpMSTnbaJLNqlTyfT//ffTxil5lyiN34OaOd3N2
 fcsD+sZqIN6yGeKn6dtaQAGa/3Ix/Ltzmd0sIX1WufyMPD2yByw1I+6cRrLfY8a7
 BB0lpl6jbeBHOdFRwXZX+b4l8n9B3i8taSi/p/v3fFbMQyHmap9vama1Mcgu+UsQ
 ==
X-ME-Sender: <xms:jBFFYfBzwibEOXj6hINpqax_AAqdbLES6-tiCke7xIA4dS-3fTR4JQ>
 <xme:jBFFYVgZK34L1fEJ66pZVtre9X9hMnXDUFLuQVjAocnE6ZNbG6i2eJv1vJJpkM1Oa
 _P56YQwY2SWdeCDkg>
X-ME-Received: <xmr:jBFFYakynxWEBsySxAbMMwLqVYu2OBdDTO-q6DRNF_9Ue1MzP1ujx1ttDzjZBNsY8Jo2-akm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehjedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefhvghrnhgr
 nhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrghtth
 gvrhhnpedvjeeifeelhfetiefhhfdthfefkefhhfeutdetvdfgvefgveefheffgfekjeef
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
 gvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:jRFFYRzU-8KV-gZCQwXeqUpIlPRzLmk-EbmqztYBPFonEx2DOWGrow>
 <xmx:jRFFYUQ83lMNgvGetRzh9HM3EMX9pXtzdV9P251l9BezZyOHtkKp9A>
 <xmx:jRFFYUZdW2dQKZSQ9UaXNHTBCwz2mm_nlAa6Zfcd4Uh3Z4nw7i9uEQ>
 <xmx:jRFFYd8zXjMhg1IYRUCPMcoz4UPUH--EMN53o4xKu55w2dfTb_HlGjBhGno>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 18:07:05 -0400 (EDT)
Date: Sat, 18 Sep 2021 00:07:03 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/15] dmr: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <YUURh/CDzCGdBLzj@zacax395.localdomain>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-2-greenfoo@u92.eu>
 <20210917152842.GA2515@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210917152842.GA2515@art_vandelay>
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

> 
> Could you please fix the subject, changing dmr to drm?
> 

Ups! Sure, I'll fix that. Thanks for noticing.


>
> I think you can just reuse 'ret' instead of creating a new variable. That
> ensures if the lock fails we return the error from the macros.
> 

I didn't reuse "ret" because otherwise I would have had to change the prototype
of the function (which currently returns a "bool" instead of an "int").

However I could, for example, check for any error and convert that into "false".
Would that be ok?
