Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15183819BB1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 10:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA5C10E110;
	Wed, 20 Dec 2023 09:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA9A10E110
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 09:51:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0E372B81C38;
 Wed, 20 Dec 2023 09:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63D0C433C7;
 Wed, 20 Dec 2023 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703065912;
 bh=Cp6gzt3q4v5XnTntRjirvjcv/I42KDzoFGvVKYV/ZYA=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=KUPj6oFWlnLEtsziChPP6fNg6KLO22ByvgKX47tRye5w0L3zPZHC3qn4pmIBBCHik
 j92jbvRoK9SXAcBTYyMO2QPjs1o0KtcilwdCMqpDDX90y8fJG3lsmsbr+XNFnSmyuc
 /1kEIGuHhFtqtTejF54pmipy01C2DDUpvbBM1URSsnTL9T9LZMGpGJSsZZl0ijJPt5
 snrx+3Z1qvT3sJqmRWD8+v1lZC6io5wn9elGVGvlZbQXOtWs7yx7JBYb2NJxffYURU
 tYOQpw+65Y024Z/VVT1z2wXVb/5o37JrDEx70Um1/N6UigmQzSN+unknc6alOKzyXc
 23V55hKIXsebw==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 926C227C005A;
 Wed, 20 Dec 2023 04:51:50 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 20 Dec 2023 04:51:50 -0500
X-ME-Sender: <xms:NLmCZbZl8gKQKvH6_jEgGanAWRBW0IZ9wSq2V-Xq4b7yZ4S2j9wxdw>
 <xme:NLmCZabuVOhCENTUuNyROA8RzCLAKX2XuSSoruo5P6aq9agWJDiowVbzia3M5VZtX
 1zls5TgLGThqnqqS7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduvddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
 grthhtvghrnhepvdeviefgtedugeevieelvdfgveeuvdfgteegfeeiieejjeffgeeghedu
 gedtveehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
 vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
 guvg
X-ME-Proxy: <xmx:NbmCZd8Y-yYEchDqoN_ntfXRavuxioD9eu7W4WXdOf2ztyRZGuMCxA>
 <xmx:NbmCZRpducWjQsjhpng9BGJFM1gihhAQnIydaUX0iRt8Ff-A7W7Iiw>
 <xmx:NbmCZWrEzVWoia2K0Iwijp9UcgvYJ_gMbOTKiAdIZZaY8RREb-4zmg>
 <xmx:NrmCZb62Iw048aegq2kvAtL_NfPBQ1wXuVZi7RU4NCk0hLEiQ7teNw>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E3684B6008D; Wed, 20 Dec 2023 04:51:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <55c0b9a5-6ba3-4582-97f0-225d0119da5d@app.fastmail.com>
In-Reply-To: <9c4479a3d194450593d541ae02ad288a@AcuMS.aculab.com>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <01ea8c41-88cd-4123-95c7-391640845fc3@app.fastmail.com>
 <9c4479a3d194450593d541ae02ad288a@AcuMS.aculab.com>
Date: Wed, 20 Dec 2023 09:51:27 +0000
From: "Arnd Bergmann" <arnd@kernel.org>
To: "David Laight" <David.Laight@ACULAB.COM>,
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023, at 09:34, David Laight wrote:
> From: Arnd Bergmann
>> Sent: 20 December 2023 08:37
>> 
>> On Tue, Dec 19, 2023, at 22:03, Sam Ravnborg via B4 Relay wrote:
>> > TODO before this can be applied:
>> > - Ack from davem - as he is the principal sparc maintainer
>> > - Tested-by: preferably on a target or QEMU (see above)
>> >   I expect bugs as there are some involved changes!
>> >
>> > Ideas for the future
>> > - Apply the most relevant downstream Gaisler patches
>> >   - The ones introducing CAS should have preference as we then
>> >     can drop the cmpxchg emulation
>> 
>> One note about the CAS -- as far as I can tell, the absence
>> of the futex() syscall on sparc32 kernels means that no glibc
>> from the past decade can work correctly as it now requires futex
>> for its internal locking, though it does work on sparc64 kernels
>> in compat32 mode as well as the LEON3 kernel that adds futex
>> support.
>
> Does the glibc mutex 'fast path' also require a CAS instruction?

I think that depends on whether glibc is built for a CPU with
CAS or not. If it's built for 32-bit sparcv9 or leon, it should use
CAS and crash on sparcv8 without CAS. If it's built for pure
sparcv8, it should try to use an emulation that is incompatible
with the kernel futex syscall.

> Presumably having CAS also removes the 'really horrid (tm)' code
> required to make all the bitmap operations atomic?

Yes, but I'm not sure this is implemented in the leon3 tree.
With CAS enabled, at least asm/atomic.h, asm/bitops.h,
asm/cmpxchg.h and asm/spinlock.h can be implemented as efficiently
as they are in the 64-bit version.

> Seems a shame to lose old sparc32 support when (I think) the sun3
> in my cupboard would still work - if only it had a working psu.
> (The 110/220V switch wasn't connected and the FET wasn't rated
> for 450V. UK mains can be 240+10% if you are near a substation.)

sun3 support has never worked upstream. There is an old series from
20 years ago that made it work but nobody ever tried to get it
merged.

       Arnd
