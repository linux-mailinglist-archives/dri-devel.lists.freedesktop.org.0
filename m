Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A85819372
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A410E079;
	Tue, 19 Dec 2023 22:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3D010E079
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:23:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9EED7CE1AE6;
 Tue, 19 Dec 2023 22:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FE9C433CA;
 Tue, 19 Dec 2023 22:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703024605;
 bh=lZ30IhwGFLMBhfwISOG2BgYm93YxFRidrCef3XByU90=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=LUMx7sjqswcD7C2ib4kLf9lfxKcmBmz8yAt2CwMXc6x79gKLBOqudHBxGbwqtA0jK
 DqwZtB/UK7XJ8WTDWlgUs8Cl84wi0WY0SbQKSq3FiN5UU1hKcSNG3mOyVZL/EBSaT6
 8yphUBsEcJdd7RRHWCuHIhHWcGRYICmESdoh1KE5WOmgCQ7b97kBz8KkbIkKjVHiez
 ewuddlB+VtKy3Ob+MOX1jlog49AcfBLMw4U+/+cZBrywQHWPc/ZRTBkBY/LhbdmjqK
 tbROi2aW3yhzlEnCzoqipRTIrJE50qzSAme+i/hReSUZBk1Bh14F558K1MCsIwZqbQ
 CBLj+VdNIRPTA==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 69B3C27C005A;
 Tue, 19 Dec 2023 17:23:24 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 19 Dec 2023 17:23:24 -0500
X-ME-Sender: <xms:2xeCZcX6ponX-c0PqLmlTlJijU2kwXgM5zvNzn83-nAxyW-g5yIckQ>
 <xme:2xeCZQng9-zZHEup6793xn5LXCNVTaKpGa26yaLL4wTqzC-eBrwDUzgUskWE8SgtP
 huLbPb_WsloylwtGVs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddutddgudehkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeeh
 udegtdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
 tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
 druggv
X-ME-Proxy: <xmx:2xeCZQbSfuYkSOgv-VH-DNRi2peLhH--iP1usJ2V8WiZR-V3Uq6T3Q>
 <xmx:2xeCZbU8HCuSDgjla4TLiYne2QmcTX1BmQkAgUzptRSzK48fRYvclQ>
 <xmx:2xeCZWk7sOIhjbmHMbIAVToZKb7C0ayQ3rlzumWhb9DZ7-Fql5hSMw>
 <xmx:3BeCZR9nDJ8LXL-vTRFkSmr2QVYFPgoYdfR71TGFcShiAPNhHmZaEg>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EFFF7B6008D; Tue, 19 Dec 2023 17:23:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <2fc75a39-a6f4-42f4-ab09-d7622cb23b10@app.fastmail.com>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-1-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <20231219-sam-sparc32-sunset-v3-v1-1-64bb44b598c5@ravnborg.org>
Date: Tue, 19 Dec 2023 22:23:05 +0000
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Sam Ravnborg" <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>
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
> From: Sam Ravnborg <sam@ravnborg.org>
>
> This is a copy of the leon_smp defconfig found in
> gaisler-buildroot-2023.02-1.0.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Andreas Larsson <andreas@gaisler.com>

I did not get a cover letter for the series, but I looked at
all 27 patches and they all look good to me, nice cleanup!

Acked-by: Arnd Bergmann <arnd@arndb.de>
