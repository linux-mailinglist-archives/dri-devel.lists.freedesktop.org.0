Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D28819A9D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 09:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8387110E33D;
	Wed, 20 Dec 2023 08:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DAE10E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 08:37:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B643861588;
 Wed, 20 Dec 2023 08:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8086C433C8;
 Wed, 20 Dec 2023 08:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703061452;
 bh=GfqJslkpVvJ3XXYQWsdH3Ruo4ihIvvMcg5EcfmjxGJc=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=GI7hnqtpI6VaXQzN495QY3tIVkSflZjreGel/GxS8oQ3nZ9ZmU6bLn895EsY5Yt7x
 mSguc3HxYHXT/vQih18qXo7EhThwMX2DdPIVwPOxEOr2DntH+mghugTC3yTtB3c9bY
 CRcR86xaPdPr+eoKnfR1zvyIf5+Pn6H3EYwFCvH09478fvM8ZKyF8VkKYv4NPtGjhJ
 8fvGwor+CYu9qYmNugki2U2ftA3j654XUhIY1A+ufY4LtFQfMd/j93dHXC8k0Qxntl
 Y+S2siRDTbmwHOJ80CAJDjgSoI2pDOqyfwNbcGLvBgnKSMxnfVWiCGc9ZVIckeyjAf
 EOX60QmRkAVAg==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id D362727C0061;
 Wed, 20 Dec 2023 03:37:30 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 20 Dec 2023 03:37:30 -0500
X-ME-Sender: <xms:yqeCZcFNU7SBn-nKxq85NIurnFIs4X6mhGvnKpm04Er1P7CYlOSFEQ>
 <xme:yqeCZVWdNfOFTXyNpTXpbos1Vy0O7339y6NyIMxGxX5XK2biBwK-msRpHSaiNFFkF
 wtr6Dr_Ie9rXzeLNsU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduuddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeeh
 udegtdevheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
 tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
 druggv
X-ME-Proxy: <xmx:yqeCZWKz6nCCmSHfcq4QeVeL2WGm4qZcaChnjeLBMGEusGpBWctMPg>
 <xmx:yqeCZeHYU5DDezpABXI62ZU3K6Wv1MBrwzG2hqJydfUQMzgPJp65iQ>
 <xmx:yqeCZSVCPRJttaH8HwzSz-pVNnacHI-O_4mKqgUF_PgS8pnCUvZJOg>
 <xmx:yqeCZTuBVL4M2cnR5Dyb2ypY_KR-ivxJtqYiSrA8TmGHNLyZ9SMZrQ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 99D9AB6008D; Wed, 20 Dec 2023 03:37:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <f3fac40a-c3cb-4535-836f-328cb2f90c86@app.fastmail.com>
In-Reply-To: <20231220064341.GA847783@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <20231219-sam-sparc32-sunset-v3-v1-1-64bb44b598c5@ravnborg.org>
 <2fc75a39-a6f4-42f4-ab09-d7622cb23b10@app.fastmail.com>
 <20231220064341.GA847783@ravnborg.org>
Date: Wed, 20 Dec 2023 08:37:13 +0000
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Sam Ravnborg" <sam@ravnborg.org>
Subject: Re: [PATCH 01/27] sparc32: Update defconfig to LEON SMP
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023, at 06:43, Sam Ravnborg wrote:
> On Tue, Dec 19, 2023 at 10:23:05PM +0000, Arnd Bergmann wrote:
>> On Tue, Dec 19, 2023, at 22:03, Sam Ravnborg via B4 Relay wrote:
>> > From: Sam Ravnborg <sam@ravnborg.org>
>> >
>> > This is a copy of the leon_smp defconfig found in
>> > gaisler-buildroot-2023.02-1.0.
>> >
>> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> > Cc: "David S. Miller" <davem@davemloft.net>
>> > Cc: Arnd Bergmann <arnd@kernel.org>
>> > Cc: Andreas Larsson <andreas@gaisler.com>
>> 
>> I did not get a cover letter for the series, but I looked at
> You are listed as a receiver?!?

Found it now, I was just blind.

    Arnd
