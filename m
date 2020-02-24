Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F216A1F0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645A16E23F;
	Mon, 24 Feb 2020 09:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 547 seconds by postgrey-1.36 at gabe;
 Mon, 24 Feb 2020 00:16:04 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98216E144
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 00:16:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C30F20A4B;
 Sun, 23 Feb 2020 19:06:55 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 23 Feb 2020 19:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=zjhLqXsGdwHmDXQ4loElGl5IBhTi4NI
 teyaEj1OhzX0=; b=pMIvQxSM7Sx8a5nkQzbt7ZFK/MAHlcTi1D3f+ks+P/0EKLo
 6SAqSKgyK7eLnr9gb0WRoCjmsYSevkz8doLPRU1crKf5iem3xkd91XjVTtfyed2s
 UbmZlOaMOEb59rUmSADPxSLYxolVKZoVbLe37IJ5wPtR9xDI5YCK31SYR4xq2Rci
 ki5Nio2Ku7yuTJp5vz0QYgmRkmbr8xQgEivf7MMb5CdGnzUF8gIPfzyCe62xojx6
 8o5bo/Mht62rUZRbcPQuvEw2skBtB5C8IcZFPteC19ML2U7GcJQ0ppMkRxQjbVs+
 x7m9qqyhICAxmAiCZS/lgflQwPX0tSrkAAS0x1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zjhLqX
 sGdwHmDXQ4loElGl5IBhTi4NIteyaEj1OhzX0=; b=Kl9m75Lgt1kvotcVMiTCEa
 JFVqY3d6ZyBArGZn0X/iKGaAt5+J2Cb747X2tw0H5gVULjjSILHn+yVRBwMZpKOY
 omSWqe+HmTx3Ie6sjlPNWbb/gSWajKydpCgmKodvgaIgQFtPT++1JbTOc2VretjJ
 uevH6h1m+YOWSDuXPZbOHvnL6rqrlGLqKL6+7VDmmPgSr5wPzwPTrdUZ3arjA2/E
 plgeoIKlvPk1hB8roLOrX8o+HSTsgctZC9bIo3maQpEh6P1I6XqFwPaVXnsC7VrS
 gYdbyKc0NuEvflaGG8hn21IuEVmU2Tlf7km9ao34juMTsOu415lpyzU83XkJzjPw
 ==
X-ME-Sender: <xms:nBNTXlGexT6W00zZwqe5NhyI45Mm3-x-EfUkj2m1tCDBTPa45nLLkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeelgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:nBNTXoDnePLBa_Y_9k7NJkxs4WhfSQp8lTAkWuV86lg67zuSOFyFNQ>
 <xmx:nBNTXhko0weVkNUI0dB4G_laWk2E0gIVeuw7fS2hjoyfGZk3yLZYsg>
 <xmx:nBNTXjSqxLmg3j9fEEBlhoG8sA6IUJPl3sLCZdb3uQrjMKSS4GwFZQ>
 <xmx:nxNTXokN7xZ8q4h5XmrjbQQZMMPf4p_hbjDdjrAiAWe_PRVXSUi1Og>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C3486E00D1; Sun, 23 Feb 2020 19:06:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <020e9eb5-4fdc-44d0-b00e-42b6e6435110@www.fastmail.com>
In-Reply-To: <20200222235152.242816-1-megous@megous.com>
References: <20200222235152.242816-1-megous@megous.com>
Date: Mon, 24 Feb 2020 10:36:47 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ondrej Jirman" <megous@megous.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: aspeed: Fix GENMASK misuse
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: "open list:DRM DRIVER FOR ASPEED BMC GFX" <linux-aspeed@lists.ozlabs.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Sun, 23 Feb 2020, at 10:21, Ondrej Jirman wrote:
> Arguments to GENMASK should be msb >= lsb.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
> I just grepped the whole kernel tree for GENMASK argument order issues,
> and this is one of the three that popped up. No testing was done.

I think someone's sent a patch previously, and last time it turned into a
discussion about how the macros aren't actually used and could be
removed.

Regardless:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
