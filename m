Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25EDAD34E5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1791810E510;
	Tue, 10 Jun 2025 11:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="zrTiJGlO";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Chk2bphT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374D510E510
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 11:27:06 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 7D5042540103;
 Tue, 10 Jun 2025 07:27:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Tue, 10 Jun 2025 07:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1749554825;
 x=1749641225; bh=yuDbo2GW1JzHKoT1DngI1u1qLCDPh52Z9n938BLR8Hs=; b=
 zrTiJGlO2ci1+axaxZsPc6PQHD6SYH//C+2Tv6G0ywd44/0TdMrweZwcZpWJitur
 Qjes3FI9doHEhtyYBwIwPUviaQqab5d/DSTbfRoiuUfe6/ptf+Wa/G7OFpMYCQO8
 90qmHDUFbEe+ojrSJFZ7VLLuZdASCiD0ZGuKdqcJEU4o28iKgiNQzQkJjQMvcVvF
 qbf4vimYA7zuEimcCNqp7GDHC6NqW5RPBMp/4ZKXPDOnPHvIoxHeAZ/5Kr1O/FA9
 PEtYAhD6VU5kUbHxhYNNUTVT4+RgpYdPgKgQtluQZXl3OpEEMeV/48N572b/4NOp
 Pm4f7vHDqxVdBpz0b/a6VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749554825; x=
 1749641225; bh=yuDbo2GW1JzHKoT1DngI1u1qLCDPh52Z9n938BLR8Hs=; b=C
 hk2bphTu8ab2tZ58nmZfBQFDPJIhl2sFEYbmP29EiqVXRuB8lN5n4zxlFYKNhlmn
 Yd1RBo7ojwAnVkNTKL2LExaxFQeIHn8SgG0Xqest6WYvtX7L8gV/zkjDNhIXvBQC
 JtEhPOWb4WUyl0/rx5+ihImFl2f/p7ramCQYWQvD7I94S8UDciHYhbXxIPRanKOk
 WxJvZm2SQHKLWEAa8Aze1aCXktWqIihpGsqi8vbM4TstNaEru43dzB/Vpxx8i1DG
 3SKqQnezCSWl8it+3BsntNr1rRPeCLaC2Q42gC8+zMYIGYx0v64cKQMmTyK3Wo7r
 e2bjJp3Y0VSLThydZJz2A==
X-ME-Sender: <xms:iBZIaJMMINykXGFrF7dbfsE92sE7A9algJW8pV1S6xq0q7Wxpg5QhA>
 <xme:iBZIaL-Ia97AHVOGJvKIYkr2yFDuLqajMQLupbCmVtyz6Hm3H4TRq2WLvZhm5uNaB
 qkCjkdCbd3wgntyONQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdeijecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
 druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
 gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeel
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrihihrghnughhihhmrghnudegse
 hgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgt
 phhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhse
 hlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughrihdquggvvhgv
 lheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuh
 igqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepthii
 ihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhfsgguvg
 hvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
 vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iRZIaIQrGfpPzIu76UcAcu7BdyFSd2LhEjxJJ5TZFLkuBs2jW283wQ>
 <xmx:iRZIaFuLY_Q52LZFl8G703CuiH8dMr0WXsK5N4Gl1rh9y2cXMSPj4A>
 <xmx:iRZIaBfcvRtZvgg3dAZHK2MpCQF0wg0As6zYEpSyqyqAOKTwfHAgqA>
 <xmx:iRZIaB38rbuiwMRMP411ha8C5PurhFFJbXnW9bjb1fGD6BNlcNo10g>
 <xmx:iRZIaCLwED6Q6-yoN7h0d8YP6-cJC6M3qCrDJ1RkEaQ7c7AZb6ree3dI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id D99F7700061; Tue, 10 Jun 2025 07:27:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T6da4eef3dd4d532c
Date: Tue, 10 Jun 2025 13:26:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, "Andy Shevchenko" <andy@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Riyan Dhiman" <riyandhiman14@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <39920a53-0458-484c-bb6d-9d4bfaa38472@app.fastmail.com>
In-Reply-To: <20250610112357.3306246-1-arnd@kernel.org>
References: <20250610112357.3306246-1-arnd@kernel.org>
Subject: Re: [PATCH] [v2] staging: fbtft: reduce stack usage
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Tue, Jun 10, 2025, at 13:23, Arnd Bergmann wrote:

>  {
>  	struct device *dev = par->info->device;
> -	int buf[64], count, index, i, j, ret;
> +	u32 buf[64], count, index, i, j, ret;
>  	u32 *values;
>  	u32 val;
> 

I was too quick to update this one, please ignore v2 and
wait for v3 after I've tested it some more with the (hopefully)
correct version:

@@ -842,7 +864,8 @@ EXPORT_SYMBOL(fbtft_unregister_framebuffer);
 static int fbtft_init_display_from_property(struct fbtft_par *par)
 {
        struct device *dev = par->info->device;
-       int buf[64], count, index, i, j, ret;
+       int count, index, i, j, ret;
+       u32 buf[64];
        u32 *values;
        u32 val;


     Arnd
