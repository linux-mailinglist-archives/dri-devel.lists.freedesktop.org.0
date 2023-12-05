Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7BE805570
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D178910E514;
	Tue,  5 Dec 2023 13:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BD910E514
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:05:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BCF13580995;
 Tue,  5 Dec 2023 08:05:36 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 05 Dec 2023 08:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701781536; x=1701788736; bh=zv
 8E1tGkz8JRoBtprl3IIFJf3pqYhFYTFABmpiAXWAw=; b=3WQNels8GZT9EHjAGe
 8yfIGTf6t1rQoHVS0QDsjV/1Tkqf1GPB1IVd2yS7sVoLExG8iqjS8uPv5XwVpv39
 jlFbgdIvDOafO5fmVa2Er6yIcNwxHCoNlokod1SrXZw8RNvJs8wQF6zCzTn3jpID
 Ss3nDuYnLEKXbcZZAtlsqlF67+azlHhK/2GRq9SwOa3CJAv7v7p1DgfhuCiMXMBB
 OE0Q9jvcIZIxPk7RJwZhwiLLuEjViqjU1eqhwWNN4zE3CPO3Tx+YCmS8bM4DazwM
 h/2kkZOJ17rU0BNUizcCbuD6VH3OIdZwjTpCxtxTSlxrk2ctYbStFsPLeMhJE/C0
 2fCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701781536; x=1701788736; bh=zv8E1tGkz8JRo
 Btprl3IIFJf3pqYhFYTFABmpiAXWAw=; b=wlpv/9HnZko73ZnxFuSLnB5FO3HGW
 DhMsSqbTGUW7mNrYTONRLLTwBAv4W0Ql0T9FtUAstavChyMo7lPd7Uqkp6Tb5z2b
 KoQ9a4ghH4y320yL2wOeSC6uCN/U1vKhABUiDBy4/v6T6Z0fQmRMYiUBQxX/E9kE
 Kyx6mJYgEmXXKMFcCmkGPKpCNKSor4qkqGOitktJniahB0IQGMC282ZhwpICp/eM
 2Km1E8Wc6XsBUInY2WqMTRAPEzdKE7r0k6sauJIDLHD4550BRFSbxUB04/q+xN4A
 Xt5q4cGHn1chsJ3D/xmriqqhSTnBaw/8RR7bWSidwZ4KBmAUPKntYDygg==
X-ME-Sender: <xms:HCBvZYh1HvhPX8I-4dLlMaxir1Ui5CEvHw-sO2OvnJkm-EPkMwtXIw>
 <xme:HCBvZRBX5pPVsfYFiSg63xm106u_qmlvi6NDEV8QnRKg83Jj1XhuBiSnVJYct8MvJ
 wRqsN2NlPb5tB9Pgo4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:HCBvZQHKawWk0-I4ZMKq_iLVDtgSHzwdWnBMgyrmNEkOquzyk7dGrg>
 <xmx:HCBvZZRUMYJErIJuL8iQ_D23zjcpjD9zkSm8kigOwHnEh3OmK27JFQ>
 <xmx:HCBvZVy_sU0Azgn1BjoF_ZHQ5vXaTGEsiQ2bPoeVu82x2uoj7C0KlA>
 <xmx:ICBvZVZa9PFID05lChPOqnqiMEtsLOTSWjyPXG9N-kIqAZfLyn5MVQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B88B2B60089; Tue,  5 Dec 2023 08:05:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <3acae2ba-e91a-46d2-8748-b2cb1b369063@app.fastmail.com>
In-Reply-To: <ec01fdf9a91d9d1da9da08be83d5821353ac5a9d.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <ec01fdf9a91d9d1da9da08be83d5821353ac5a9d.1701768028.git.ysato@users.sourceforge.jp>
Date: Tue, 05 Dec 2023 14:05:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yoshinori Sato" <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Subject: Re: [DO NOT MERGE v5 10/37] sh: Common PCI Framework driver support.
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
> +
> +#if defined(CONFIG_PCI) && !defined(CONFIG_GENERIC_IOMAP)
> +void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
> +{
> +	iounmap(addr);
> +}
> +EXPORT_SYMBOL(pci_iounmap);

This definition does not work for addresses that are
returned by ioport_map(), include pci_iomap() on
IORESOURCE_IO.  However, the definition in lib/pci_iomap.c
should work fine, you just need to #define ARCH_WANTS_GENERIC_PCI_IOUNMAP
to get that.

      Arnd
