Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021A58055A1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179D010E52A;
	Tue,  5 Dec 2023 13:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FC110E52A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:14:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C3CF2580900;
 Tue,  5 Dec 2023 08:14:58 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 05 Dec 2023 08:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701782098; x=1701789298; bh=ei
 yfcAaW8S/0cnNR5qvKPP9FPzFqObUKOJebJtjaT4g=; b=grEmVeOgHZVU7k2UVR
 fBuDBLbJtVcdW6JHwpmkRQOApCRyKxLEPPbBQzSFuGL7pTWsUpTnLuLG18JTYSdd
 r5Ie73b5CxmXV8agvJPks974YXcGcy9PCXZ6SudrBJOn9Si8ehblp8Swj1R/5MFm
 0OiWwOsjtefr1JtV2s8B5Z4qdSbziOgyuJH0hZ2Ptm9EE0gppXezrqY08o1pieKU
 +xigXIbh42rBl2cShzh/dUzqQFJbJLwXAXBOaasKUKMfFc9Y7iBA5CgXSmie6Izq
 5ARk+IM3wPGouVUagkm2l3Vu1LYB2frX+EvdD1CyH78dRJQVAgjHL5AH+CXprc+j
 eI6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701782098; x=1701789298; bh=eiyfcAaW8S/0c
 nNR5qvKPP9FPzFqObUKOJebJtjaT4g=; b=f1yaUVrL++5MAMGC4cbmDB8dljjUb
 fA3lfwnxZjPejU0/Xn2sD/whZSTKRDuZTUihGKPhegGz3zDPQO80bET8uckJnIvv
 7y7PEYD6gbBGENnRb59ZCJi3Zl8gJYapj2XHp3vS8TuLlZzT0uEvLwWcFPUO4WLJ
 yT/0WVD6yOcD4+qAk903M1U6dfn+rR6q2UXKCKe+rgZ4b48nCc5rMEjIpUoVCTZl
 D7oYFZ7J7OgmonTbT7881/tS56EXD3DMx5+yQ0iDU8vAXa/nIFIhEC8zNDxmomr8
 pcKmyWIefGXUiHqzCIL9+KOMlhWiIJRaPTn0qgpNbex16PwKdznwA/xUw==
X-ME-Sender: <xms:USJvZdtD4Xj-rKm4EbtDQTqywp3yDIspPCPxyyYYQmN2dDrc2X8-qQ>
 <xme:USJvZWfCuprCvfjeFomf43rC43Am9m_6BEk62f-OYW24PVvWuPFAbdQSj-3IyWiRC
 2KbNLDGTMIMMj_WZPc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:USJvZQyogSwNl7GvjMqkXHd3oo0SRyxodXv_3kZZa-2vXdozvl9Pug>
 <xmx:USJvZUPBIgiirKM2QudRIYoMgVWUqdSm6ANNOgqgp5fhSjJwiQLHbg>
 <xmx:USJvZd8_djA6qpYT8j7-mJ9cYWznkD_6YIEyh5fvOq1B9WYRU21tXA>
 <xmx:UiJvZc08CiOPzCYcPBoPUoMiA0lZQaX_WGdzAB2ZKbxsntozNCu6XQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7F054B60089; Tue,  5 Dec 2023 08:14:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <f2b58a5c-5457-485a-974f-cfda2e6dc2d2@app.fastmail.com>
In-Reply-To: <76bbd45b22ef6cc1fa69369aff908c9c4e366860.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <76bbd45b22ef6cc1fa69369aff908c9c4e366860.1701768028.git.ysato@users.sourceforge.jp>
Date: Tue, 05 Dec 2023 14:14:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yoshinori Sato" <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Subject: Re: [DO NOT MERGE v5 06/37] sh: kernel/setup Update DT support.
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
> Fix extrnal fdt initialize and bootargs.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  arch/sh/kernel/setup.c | 51 ++++++++++++++++++++++++++++--------------
>  1 file changed, 34 insertions(+), 17 deletions(-)
>
> diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
> index 3d80515298d2..b299abff68e0 100644
> --- a/arch/sh/kernel/setup.c
> +++ b/arch/sh/kernel/setup.c
> @@ -30,6 +30,7 @@
>  #include <linux/memblock.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> +#include <linux/libfdt.h>
>  #include <linux/uaccess.h>
>  #include <uapi/linux/mount.h>
>  #include <asm/io.h>
> @@ -74,7 +75,13 @@ extern int root_mountflags;
>  #define RAMDISK_PROMPT_FLAG		0x8000
>  #define RAMDISK_LOAD_FLAG		0x4000
> 
> +#if defined(CONFIG_OF) && !defined(CONFIG_USE_BUILTIN_DTB)
> +#define CHOSEN_BOOTARGS
> +#endif
> +
> +#ifndef CHOSEN_BOOTARGS
>  static char __initdata command_line[COMMAND_LINE_SIZE] = { 0, };
> +#endif

I think an appended DTB is generally better than a built-in
one, as that allows you to still have a single kernel
image across machines and just pick the dtb when installing it.

With everything else being equal, I would suggest not
actually making this an option for new platforms.

    Arnd
