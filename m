Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2600E819D49
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 11:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225C310E337;
	Wed, 20 Dec 2023 10:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D29910E337
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 10:48:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F558615E4;
 Wed, 20 Dec 2023 10:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C343C433C9;
 Wed, 20 Dec 2023 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703069296;
 bh=affP7wF8+XMw8uG5v8noirtoXKryiDk9LMZdxtuSBpQ=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=WccBeKYu1X+hqSW24q0mFGP3KDKZ7RzPDM0pm2HpuKJZ8Yja8m8M9lSpLbJRMV295
 AnMLjR956icFaR1wFTju5W8NNHaLacr+6WycC6l1Gdyq9Q6SoMy706bGsoNJfbZtAK
 XeaaljEXsgUv2FNdjfswg610tCQEJchtQrCRJN/NIIIznqFoefS3/C9hBjARTeQ0cw
 OYDaf8dgs4p0N9hfOxnGthL1MiDH03H6gXTuEH7s3mblTA++YosBvK3fG7KLnDWzhS
 IErCEk7yD+5CTC6APCXSDp49+Jwe/6UI9qyGx4A++KLuYUz8oW9447nx6MZxJhWk1K
 N7xmv+vmOzw4g==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 59CCC27C0061;
 Wed, 20 Dec 2023 05:48:14 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 20 Dec 2023 05:48:14 -0500
X-ME-Sender: <xms:bcaCZa-dYaDSNN36puMBjYL2UZjPu7XIDmrS9ZbAtZmLOLHzRsRkmQ>
 <xme:bcaCZat5hWRhwFchay4HQaiInMmMJezm4FaDG4D7qWJ-QMer37ZYU0DBDBILQhArg
 4Ew8i-upCvuurJzD3s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduvddgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
 grthhtvghrnhepgedtudegtdejhfdtjeeglefhhfduhedtjeejgeegieelgeduudeiueev
 ffetjefgnecuffhomhgrihhnpehqvghmuhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugdomhgvshhmthhprghuthhhphgv
 rhhsohhnrghlihhthidquddvkeehudejtddvgedqvdekjedttddvieegqdgrrhhnugeppe
 hkvghrnhgvlhdrohhrghesrghrnhgusgdruggv
X-ME-Proxy: <xmx:bcaCZQDIKCNj7awbmv8GAKA4WgNCD1CdNaOAL918zpCfYGwv1bP6tQ>
 <xmx:bcaCZSeU8EDkSAwPx0LydaLR2A-g-Npf-ECxnOrW3cDEcyCKfKWFCQ>
 <xmx:bcaCZfPiwW0oa83V1FG959Vcn7M1gbIp-lc-37NNQpZjt5Ir6z56Yg>
 <xmx:bsaCZduisMTzT6YuRGasRasp3nG8XGAP5iAFXKnUBRYcf05Nq05azg>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5080DB6008D; Wed, 20 Dec 2023 05:48:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <dbb60b13-565f-43b8-8cb8-6f8cd98b06df@app.fastmail.com>
In-Reply-To: <e897e6d5a88ec2f9024c62f7bee5c13bfb2cab55.camel@physik.fu-berlin.de>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <01ea8c41-88cd-4123-95c7-391640845fc3@app.fastmail.com>
 <e897e6d5a88ec2f9024c62f7bee5c13bfb2cab55.camel@physik.fu-berlin.de>
Date: Wed, 20 Dec 2023 10:47:56 +0000
From: "Arnd Bergmann" <arnd@kernel.org>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>
Subject: Re: [PATCH 00/27] sparc32: sunset sun4m and sun4d
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023, at 09:54, John Paul Adrian Glaubitz wrote:
> On Wed, 2023-12-20 at 08:36 +0000, Arnd Bergmann wrote:
>> All of these were found through inspection rather than testing,
>> so there is a good chance that other fatal kernel bugs prevent
>> testing in qemu, at least until the fixes from Andreas' tree
>> are included.
>
> Andreas has fixes for these issues?

Not sure, all I know is that

- Andreas has some fixes for Leon in his tree
- Sam is unable to boot mainline in qemu
- There is an unknown set of bugs in sparc32 since it has not
  been tested for many years without Andreas' patches

it appears that the qemu developers are still testing the sun4m
model against old Linux and Solaris installations [1], but
failure to run the leon3 model could still be any combination
of kernel, qemu or configuration problems.

        Arnd

[1] https://wiki.qemu.org/Documentation/Platforms/SPARC#Compatibility
