Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D0B819A97
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 09:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2BF10E319;
	Wed, 20 Dec 2023 08:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC55C10E319
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 08:36:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EC734B81C17;
 Wed, 20 Dec 2023 08:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C92C433C9;
 Wed, 20 Dec 2023 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703061417;
 bh=AdqAwz81NSKcWiMU11RDDZBgCQhJ9xWGLTtbQCSJNbU=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=mEDYC2jQqWm8vnT9Nkrs+3k0nHT+0K4lQ81FXcmNW9hquUi1VceiooL6YC+EoD/v3
 E45aScEhmnrdWxm4r26Vnxr3Rh7k+dJidaRRZ4RSjKfvl7q1yxCo6V4LpWHEdDgPhB
 ds7woxKIH/rFoQZYoLzGAzcU0D0XzSzCn4aVWulmweX5orveJg58kyG+GspFDnbkSb
 qSVBse1t2OgkYQQZ1c2Jrq7v7yzV4JoTZ2LsotOOEz1ScV10Ljpsk80fA5wHV3vze7
 xDgyn3V75H+2vBfcbDeCKMPzJyhox0V3p7xlDmTsj4T3jcyMiypTc9VYAHi2Tweq9O
 M2Pe3ZFztQnhg==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 8650227C0061;
 Wed, 20 Dec 2023 03:36:55 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 20 Dec 2023 03:36:55 -0500
X-ME-Sender: <xms:pqeCZVVgQ9feUAubE_UGRljNpRwTNFakBlr6_WNwG2tE7FM85ux4qg>
 <xme:pqeCZVl-jvy4st4hso5ixDc_suLOsRu9EGHi-PSiZ-09bn9KA78kCkw5CJCPvYAQh
 inqyHR-7xiP15wgrKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduuddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeeh
 udegtdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
 tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
 druggv
X-ME-Proxy: <xmx:pqeCZRYanC1WLiEFsG4-MAjWuA71k30OI4ivWyXUx3Ddq9cT3QLZzQ>
 <xmx:pqeCZYVLEhDPnmxHjnu2xZge4p1LMU2JvFdnJbnWOeQMjLDlPoxCCg>
 <xmx:pqeCZflpg3gqgULnEtvhu0bbQ5eyV2JyOrf1ABOQrweuKE4PBe8Rww>
 <xmx:p6eCZS-EHB8GVnpcX6MaGvLUsgqvB2pxWXT_ilSCWGl1_CSKvPBxZA>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4B72AB6008D; Wed, 20 Dec 2023 03:36:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <01ea8c41-88cd-4123-95c7-391640845fc3@app.fastmail.com>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
Date: Wed, 20 Dec 2023 08:36:36 +0000
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Sam Ravnborg" <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>,
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

On Tue, Dec 19, 2023, at 22:03, Sam Ravnborg via B4 Relay wrote:
> TODO before this can be applied:
> - Ack from davem - as he is the principal sparc maintainer
> - Tested-by: preferably on a target or QEMU (see above)
>   I expect bugs as there are some involved changes!
>
> Ideas for the future
> - Apply the most relevant downstream Gaisler patches
>   - The ones introducing CAS should have preference as we then
>     can drop the cmpxchg emulation

One note about the CAS -- as far as I can tell, the absence
of the futex() syscall on sparc32 kernels means that no glibc
from the past decade can work correctly as it now requires futex
for its internal locking, though it does work on sparc64 kernels
in compat32 mode as well as the LEON3 kernel that adds futex
support.

There have been a number of other bugs in sun4m/sun4d support that
ended up making the system unusable during the same timeframe,
I remember sysvipc being broken in native 32-bit mode (but again
not in compat mode) and I think Al Viro has a list of things that
he fixed over the years.

All of these were found through inspection rather than testing,
so there is a good chance that other fatal kernel bugs prevent
testing in qemu, at least until the fixes from Andreas' tree
are included.

       Arnd
