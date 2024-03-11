Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7606878143
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EB5112AB2;
	Mon, 11 Mar 2024 14:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RrdbAr2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2297A112AB2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 14:05:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B53C2CE0FF6;
 Mon, 11 Mar 2024 14:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A5EC43390;
 Mon, 11 Mar 2024 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710165950;
 bh=UHMR4pqbVOsU7aLmYcmKHPDC47wVCRagl/RwfRJq63k=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=RrdbAr2gSdjhpVdUBVPwYvAG4+DM+/qYkT05L4bnOO+la235nWy4j4FPFjdoOsM6w
 guAHI05KdupyQoxAymBRuof8g6z2NDTM2A87A5QE0pTYOyWxCJnp+JqL3RPp5TD6wI
 C4a9eFYmb4yCv0F9mqpXpCvUOBdou5kwkIyNPbuThJegi9X4od2mKpkMilbZkhXyd7
 kusPYGGkciIOZ6QfOEsAXx8nI0Ci2WeajJ10zhBw9LqRiaDZVpN/JriVfMa/lDjLXQ
 zeCSrVdLQZfEzneHRSSSIYaJWk/XfrjLb1yE0JE+TyOFwkSMYICfOkpS4U40Vl1ezu
 ASvyAsULDBg7Q==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfauth.nyi.internal (Postfix) with ESMTP id 68A761200088;
 Mon, 11 Mar 2024 10:05:48 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 11 Mar 2024 10:05:48 -0400
X-ME-Sender: <xms:ug_vZTcns5F4VmSCmWfMFHId3q_1TySUB9svi28M7jXUMKjzZWEcfg>
 <xme:ug_vZZM4LR-RfsVVNtvCkpGCLxiYOIumDRJbGSaSg7X8TpXw8TVAVj-MIoktW5qc4
 EBKqnTmKtQEBtwS4cI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjedugdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
 htthgvrhhnpeejvddvjeffveevffdvjeejgedukeegfffhkeektdduffffueekffffudef
 vddvgfenucffohhmrghinhepvghvvghrhihthhhinhhgvddrtghomhenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugdomhgvshhmthhp
 rghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedqvdekjedttddvieegqd
 grrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ug_vZciA-X89FEkRLmH215-3DCIfaE78E_Bfi-DInAFk0Bgv0Va0fg>
 <xmx:ug_vZU_xMhQH6SZHBrp1cIU0BKMmfi5uN5ICgrxlkRt0bOe_npcSrQ>
 <xmx:ug_vZft8lZE6MOdPg3eeqURAlEm5sOtM_senXg9kxOnU_aomYU47XA>
 <xmx:vA_vZalNjXxjw9dINZlH-FGuq_Ai571BMTrFHUfKs9bLNSBRXUSje_g8Tyc>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 94D7FB6008D; Mon, 11 Mar 2024 10:05:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <e387ad3c-7646-49b6-a5f5-afd287556d8c@app.fastmail.com>
In-Reply-To: <20240309-sunset-v2-28-f09912574d2c@ravnborg.org>
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
 <20240309-sunset-v2-28-f09912574d2c@ravnborg.org>
Date: Mon, 11 Mar 2024 15:05:25 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Sam Ravnborg" <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>
Cc: "Helge Deller" <deller@gmx.de>, "Randy Dunlap" <rdunlap@infradead.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Mark Cave-Ayland" <mark.cave-ayland@ilande.co.uk>,
 "Kjetil Oftedal" <oftedal@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Alan Stern" <stern@rowland.harvard.edu>, "Jaroslav Kysela" <perex@perex.cz>, 
 "Takashi Iwai" <tiwai@suse.com>, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 28/28] fbdev/p9100: Drop now unused driver p9100
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

On Sat, Mar 9, 2024, at 19:15, Sam Ravnborg via B4 Relay wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> The p9100 driver is only relevant for the Sparcbook 3 machine,
> and with sun4m support removed this driver is no longer relevant.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Arnd Bergmann <arnd@kernel.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Helge Deller <deller@gmx.de>
> ---
>  drivers/video/fbdev/Kconfig  |   8 -
>  drivers/video/fbdev/Makefile |   1 -
>  drivers/video/fbdev/p9100.c  | 372 -------------------------------------------
>  3 files changed, 381 deletions(-)

I tried to figure out if there are other drivers in the same
category and found the list at
https://everything2.com/title/Sun+graphics+cards

As far as I can tell, the only SBUS graphics that were
shipped on sparc64 are FB_FFB and FB_CG6, so we could
go further and remove BW2, CG3, TCX, CG14 and LEO as
well.

No need to change anything here for the moment, dropping
p9100 is already a step in the right direction.

     Arnd
