Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1F805555
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6049C10E1EF;
	Tue,  5 Dec 2023 13:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C83310E1EF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:02:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id EA602580983;
 Tue,  5 Dec 2023 08:01:56 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 05 Dec 2023 08:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701781316; x=1701788516; bh=Vz
 5fHcnpm58kiwXE8hZp/Ye9ElTOS3WdqAMkMGNeaRk=; b=Ycz+ORtxNsKPyDVDzV
 mUTEujccDOL1pC69S1mXYwMSthCZLLRPNAfUm9e859a4vWgkf+RghY2b080BV448
 PzVNuZ7c3fMjrnghCcJXdll/OTGpDio50ywRTUjuGCVkXD5sO5u2tRvBjBqza1HF
 UmV2NW5CREx6JXiLZV6NaOV8fiYO9Wyd0onI/776F21CR5rXNaaMe3RkDPckXTUo
 g4o2eVTN1+tLjZrdEUjP4K17aTy2lhBewAs2ZpWE6oBSSeSxkoIq+k/MOPl7NopL
 v04gw8rsLOJN+J0cZJQ4lzCCkbvv4qlTnBKTcMHFSmwGUeHcXH2yvJM/Uz3/RzlD
 oukA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701781316; x=1701788516; bh=Vz5fHcnpm58ki
 wXE8hZp/Ye9ElTOS3WdqAMkMGNeaRk=; b=EidB38fA74aS58OtxSvkCMoYVi/GX
 wX1sg7NXMHJwBaYVg2bxnKKOs4wd1+WTp9xkvBV+hzHC4WWay7b3SM/mriObQPjm
 elk1aS93nG4boNuAu0FW+n9Ml0Mrw84CtFCQXH+JQT+90zcd6v9GDraTjZFXPPUi
 1hYCiL1CLdeMwninZZi8WStwfG+toLse0nImkWa3WYezoYpe6gSY+C5RNq09jgkZ
 WaU8jtCqr6NmOXu4gF1jVZ35detblCEJikOWNSJ8AsR/mXoa4GTXgp+lcdSqyoPk
 rm6Errxc/Xjlhmu5QAiUncl+5ShFfJihARx0uLfXDzsSzOsCtP1ywJy2A==
X-ME-Sender: <xms:Px9vZUCrivgZykPt5yDfV3cI2dCBlvQTkhk7ibBH_E_i_R5WgAri4w>
 <xme:Px9vZWiG3A9V7NGuaHBBlo5DTh9T-f5aIi9quoBPejvLSlGXWZeVGwDfa6UVJIE0N
 362-d-y4eT6OHI3rfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Px9vZXkC5_AxgTtDYd7EwsRjUTSFOWhfllKI6yDzZjl8BRrVA9hWpg>
 <xmx:Px9vZawvBJlQkm83bdG6vYjFyhLuldKWWCihELdpU-ajFZ2O4SX0EA>
 <xmx:Px9vZZSYcECfgAp6F4Ppnumyf5yIUpinnXryfQvDH8KlcAOVCc0aTg>
 <xmx:RB9vZa5uyKgpsY5GCsGUnhsRCOqrZRP76MWQcl-6C6OBzL9i4dBvcA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7D516B60089; Tue,  5 Dec 2023 08:01:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <d76fc75e-15c8-4177-a150-6f906233b82e@app.fastmail.com>
In-Reply-To: <d6c242c0ab6e25e775284ec1d4b29a1ddd888af0.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <d6c242c0ab6e25e775284ec1d4b29a1ddd888af0.1701768028.git.ysato@users.sourceforge.jp>
Date: Tue, 05 Dec 2023 14:01:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yoshinori Sato" <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Subject: Re: [DO NOT MERGE v5 35/37] sh: RTS7751R2D Plus OF defconfig
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 5, 2023, at 10:45, Yoshinori Sato wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  arch/sh/configs/rts7751r2dplus-of_defconfig | 93 +++++++++++++++++++++

This is very similar to the landisk config, so it may be
easier to just have one of them that works for both, as well
as future ones.

> +CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_NAMESPACES=y
> +CONFIG_EXPERT=y

You should not normally need to enable CONFIG_EXPERT in a
defconfig. Is there any particular reason for this?

    Arnd
