Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4FD75859F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 21:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FB510E074;
	Tue, 18 Jul 2023 19:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7570810E074
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 19:36:55 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 651A45C004D;
 Tue, 18 Jul 2023 15:36:54 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 18 Jul 2023 15:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1689709014; x=1689795414; bh=9Y
 F80M8AumnJ2cGW1p1PoEqywaxWXZl7S/aY3kdi8QM=; b=h+oY/Y54OyZ945XdUb
 1Z91zhj3lumlF6L8R+VwhlL1j0Bz9j2pq90XdqULhHF/1C2jQ4uCdbY1fh6JgQh9
 0PGy4aUaF3ovo/VHO9pHQkUZNMElIsy0ZSHVi9tkbOfbMb94PahIhFbw5N3jTXBh
 m031K0XKyNuBpUbaEBHFArJb2p85Jnw+vvMaRBIJk/IdLDxS0uxQx6dy+4frpd1r
 Gb0whYzmeQa5etv6OJwz8yP9NXbf603WAvGd3NVJ55QEw4xFbDQ587+Gi4b2gco0
 1tlg+qrGnX6Gxge75/pX4+stU4oE+7TWDY2pVl68jJB5b+R3v+z7pupmoygQ8rIK
 wJzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1689709014; x=1689795414; bh=9YF80M8AumnJ2
 cGW1p1PoEqywaxWXZl7S/aY3kdi8QM=; b=YxBbmiuRs0uw7FqpqHCzEz9YE3PZf
 h7J0GzqAvn9Tls1RgXgr9HmYSGW8G9V1R+f4hXlkuqiCIIKWtNjSbqeFnIJzCMAI
 vyoNNcTeAHJAWasrTPfdM9F1Oo0ocTlK70no13F7Q92bCzlgO7nvRnyQqb76PCiH
 7JZjMcQDDIyp/Vj4OMuSjhcVioxhBVEEiADAoqnlpDGIoBs0vx6+fqpHlYBBf1mi
 kQyNNwY5ZoEvZydZoeNh4yCKB88tIBT6/ZhzySspCPItjcGIXCQhyntnIFNISspi
 eY1GNrzGyvPpsS8ZpWcnJUOfxyfeTo2uIRaxxhRfNu9bnoapTB57nBHVw==
X-ME-Sender: <xms:1em2ZDVD5aTbjBESKA-j3p2A3tHRoQ2de3w3wycByaC7ifZRtYzF8w>
 <xme:1em2ZLlX0WJsfXhNhL5VPe7GU-dgK1knFvckGZIX5u9NYt-njPETWu_ystcoJLSjS
 _e4hPPn3pMBILBmB0U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggddufeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:1em2ZPbn3mvk73znuzLL2wnwc-zGBTLR5k16kD3qqibq8oqDWzBMiA>
 <xmx:1em2ZOUz-6EAzWUVZaactFrJln0jxCXuDmzGeSj-QWQ0k5nS8UCSgA>
 <xmx:1em2ZNma9FHf5mWkdhz5pLFGx83A8ATVzCDFtUd-W1bHIhb6nYZXYQ>
 <xmx:1um2ZP65j7T_qcONMk4_-hS1eLQshNefVimFaTBIO8cW3O2nktIpOg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B6543B60086; Tue, 18 Jul 2023 15:36:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <f925fa1c-a6db-4032-8adc-d6aba8cd2ef8@app.fastmail.com>
In-Reply-To: <20230714171642.91185-3-javierm@redhat.com>
References: <20230714171642.91185-1-javierm@redhat.com>
 <20230714171642.91185-3-javierm@redhat.com>
Date: Tue, 18 Jul 2023 21:36:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Javier Martinez Canillas" <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] fbdev: Move core fbdev symbols to a separate
 Kconfig file
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023, at 19:16, Javier Martinez Canillas wrote:
> The drivers/video/fbdev/Kconfig defines both symbols for fbdev drivers and
> core fbdev symbols, that can be enabled independently of the fbdev drivers.
>
> Split the Kconfig in two, one that only has the symbols for fbdev drivers
> and another one that contains the fbdev core symbols.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

While testing this patch series, I noticed a conflict against
Thomas Zimmermann's series for FB_SYS_HELPERS_DEFERRED, so you'll
have to adapt the patches in order to apply them on top.

> +
> +config FB_HECUBA
> +	tristate
> +	depends on FB
> +	depends on FB_DEFERRED_IO
> +
> +config FB_SVGALIB
> +	tristate
> +	depends on FB
> +	help
> +	  Common utility functions useful to fbdev drivers of VGA-based
> +	  cards.
> +
> +config FB_MACMODES
> +	tristate
> +	depends on FB
> +

The FB_HECUBA now needs 'FB_SYS_HELPERS_DEFERRED' instead
of 'FB_DEFERRED_IO', which is the change done in the other
patch. I think the best way of doing that would be to just
not move the three symbols above to core/Kconfig but leave them
in place, as they are all just helper modules for some other
drivers, rather than core code.

      Arnd
