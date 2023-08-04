Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D068770A24
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 22:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6355C10E124;
	Fri,  4 Aug 2023 20:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87B310E124
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 20:55:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 075A0620DC;
 Fri,  4 Aug 2023 20:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15192C433C8;
 Fri,  4 Aug 2023 20:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691182544;
 bh=wReEdRZmNyzKl8e39OUS/Hxln9/SS8v2NW80Cb+MhRg=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=Dg2rKdsCZa9KopomzzcFwZJZVcIoYS0nwbd9LEhg5UBGsMLJciX8q4AFAGHVCtGrC
 P1nrcHCj2kqOfjWxuGs+6DImdGWftTInrnVWai2gagMhAs71O5JkmtftaoCtiDyu1z
 AERYu375lf1Pt0yYUcTHlMU9vRcscSn4K36Q5hKgxKT3iqopzNpmm1VOVPcSc2zVPv
 Zar+WBAKffJmB11lE1UcbucdfFdn9lwxZXodhjiOj84FicrvS5Cc1VUTfFQ9hMCtjl
 Q2yhSSSty8uLQxpxve0cM3XXCM2fXVihIfPTgeyh1hbBCk5xrbxB6yajkeC07Fnq3i
 PGtVzRLJge10A==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailauth.nyi.internal (Postfix) with ESMTP id DA8B427C0054;
 Fri,  4 Aug 2023 16:55:42 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 04 Aug 2023 16:55:42 -0400
X-ME-Sender: <xms:zmXNZKrcMNnSiSjBe42hFkrLMNaka8fh4JPOnwaDGvMKoDTK4Bekgw>
 <xme:zmXNZIrMvIAorwCXGgkWQygRfMITle1Ljec5oWGgL6hpaLDMmNHyOOR4qc61vFxNB
 vLlgvjhk4whRfP3ORo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkeeggdduhedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
 grthhtvghrnhepvdeviefgtedugeevieelvdfgveeuvdfgteegfeeiieejjeffgeeghedu
 gedtveehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
 vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
 guvg
X-ME-Proxy: <xmx:zmXNZPNqv6JqAbvGdhKTrjHJjz7f6BDwoP6u0n-c0osDzkfvDnn0Ag>
 <xmx:zmXNZJ5HftwiSGcKWU0ycmkYvV0ayoxBI0_v34C7K4u-buO3oXr_bA>
 <xmx:zmXNZJ42CJzXtY3RSQmkX5EtQyDdPeo_8WI7wjARdljTjXHqxUIwjA>
 <xmx:zmXNZIJ-f0ZTQCQxpbdxuHaKLQUvW2kXkhdWs_Jge0gm9mdiYo0ReQ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3121EB60089; Fri,  4 Aug 2023 16:55:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <3baeb706-dc62-487c-a909-afc3cb3bed26@app.fastmail.com>
In-Reply-To: <ZMk7cMgZXgZVobq2@shell.armlinux.org.uk>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <ZMk7cMgZXgZVobq2@shell.armlinux.org.uk>
Date: Fri, 04 Aug 2023 22:55:20 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Russell King" <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/4] vgacon: rework Kconfig dependencies
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
Cc: linux-fbdev@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, guoren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 1, 2023, at 19:05, Russell King (Oracle) wrote:
> On Fri, Jul 07, 2023 at 11:52:23AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The list of dependencies here is phrased as an opt-out, but this is missing
>> a lot of architectures that don't actually support VGA consoles, and some
>> of the entries are stale:
>> 
>>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>>    the merged arch/powerpc never did
>> 
>>  - arm lists footbridge, integrator and netwinder, but netwinder is actually
>>    part of footbridge, and integrator does not appear to have an actual
>>    VGA hardware, or list it in its ATAG or DT.
>
> Integrator/AP has PCI, and I have had PCI VGA cards plugged in to that
> hardware when I've had it.

I'm pretty sure it can no longer work and broke a while ago,
so I would prefer to leave it out unless someone actually has
a reason to use it and puts the work in to restore the support.
From what I can tell, it's broken in at least three ways with
the new PCI host driver:

- the PCI memory space is identity mapped to its CPU physical
  address as of d3721efce22d1 ("ARM: dts: integratorap: Fix
  PCI windows"), which is generally better for compatibility
  with broken drivers that read the BAR directly, but it
  prevents memory mapped ISA-style devices including VGA text
  buffer.

- vga_base is no longer set by the new PCI host driver, so
  any accesses to the text buffer just end up in user space
  memory at (__iomem*)0xb8000

- there is no DT binding for setting the global screen_info
  to whatever the boot firmware has initialized
  the VGA BIOS to, and the default 80x30 on Arm does not match
  the typical 80x25 text that would be set by the BIOS.

> Provided any platform sets up PCI in a compatible way, and can run the
> VGA's BIOS to initialise the card, then vgacon is supportable.

It looks like only footbridge does at this point, all the other
platforms would need to fix at least some of the three things I
mentioned above, in particular plat-orion is the only thing
setting vga_base but also has the identity map issue.

My impression is that nobody has cared about vgacon on most
Arm systems since it's harder to get working than fbcon with
a native PCI driver (or the built-in pl110 on integrator) but
also less useful.

    Arnd
