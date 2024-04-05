Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC4A89A1BD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBF110EB2D;
	Fri,  5 Apr 2024 15:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gXve/qOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F3110EB2D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 15:47:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3AB4460FBD;
 Fri,  5 Apr 2024 15:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908A5C43390;
 Fri,  5 Apr 2024 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712332066;
 bh=Qz4VZK/ytP0/9s88wplqYqEn1ox2CjHWrrOC2AmtCjQ=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=gXve/qOJy2MI9o2c1q8zE5qlqxTpZYzEYcG/lAXMV1wnWf77yf+abI4hYQIkNCQ1P
 2rvdYUB+C0PkMh/12FhQy5yNqJpePutP7GfebB9NIf6n4RiIJtZVLS5SrZ9XU0cYe7
 gmCuZyiDyj/PyqaWGMKMza6iuy8yHDp8XwdWxU8Sz4MSibWanxfQmFwttwR26kSkRN
 NWpqsZkWOm7exLt4mS1f/qCTQ+SWNxcJG9on95EV/hxkscgZ963H2VccMxN+uHDG2u
 CvdKb6HwBaMZWLwALCO6CvzTfVweSyS34AXaqNPFJqo1Ea7a6MHS69Sq1SCTnonWdz
 mUgEb2s6nzFHg==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfauth.nyi.internal (Postfix) with ESMTP id 930A6120008F;
 Fri,  5 Apr 2024 11:47:45 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Fri, 05 Apr 2024 11:47:45 -0400
X-ME-Sender: <xms:IR0QZsplW-_ktFdGPCKuRLqTT2VHn6agD75T3GCa1r47_H5Qp4ODvw>
 <xme:IR0QZirvi1FFsSTamDsCKMwp6-7MWDlywyUIBDcA-Au6hQHbQVlOEko6f-vO8s4AQ
 yQ5HsMC4_txRe7NeHY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudegtddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
 grthhtvghrnhepvdeviefgtedugeevieelvdfgveeuvdfgteegfeeiieejjeffgeeghedu
 gedtveehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
 vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
 guvg
X-ME-Proxy: <xmx:IR0QZhPpjE8I7K1OMB6CwkGjmhikvFd6jidJ1RjWl_QWmGlpac1slg>
 <xmx:IR0QZj67zRQv4RABBN40awWEN1AXIM2_iUYq0rNGb0gSwhsQUAEcMw>
 <xmx:IR0QZr4xPk9YIh4SbMtGBl9860p4KsymijgELnXyVHEUjGRgpkgwTA>
 <xmx:IR0QZjh-Or6AWnDSXBDsIqK4xP5vFffeTflerfFNOcnAFIzi85h4fg>
 <xmx:IR0QZu17grOZ_OQZ5kWkV_OkGa2CfvsdBd4y6bH8NwouFprJzflcdmuM>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 473E1B6008D; Fri,  5 Apr 2024 11:47:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <8287be1d-06d7-4ce8-806a-de4e764fdda3@app.fastmail.com>
In-Reply-To: <20240405154331.292421-2-schnelle@linux.ibm.com>
References: <20240405154331.292421-1-schnelle@linux.ibm.com>
 <20240405154331.292421-2-schnelle@linux.ibm.com>
Date: Fri, 05 Apr 2024 17:47:24 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Helge Deller" <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Heiko Carstens" <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] vgacon: add HAS_IOPORT dependencies
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 5, 2024, at 17:43, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will disable inb()/outb() and friends at
> compile time. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
> Note: This patch does not depend any not-yet-mainline HAS_IOPORT changes
> and may be merged via subsystem specific trees at your earliest
> convenience.

I think this patch can just get dropped now, no need to merge
it because it's already handled by e9e3300b6e77 ("vgacon:
rework Kconfig dependencies").

     Arnd
