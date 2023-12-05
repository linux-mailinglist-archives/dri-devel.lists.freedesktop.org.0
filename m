Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874968055DA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7404610E527;
	Tue,  5 Dec 2023 13:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4664C10E522
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:26:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 92ADB580BBE;
 Tue,  5 Dec 2023 08:26:35 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 05 Dec 2023 08:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701782795; x=1701789995; bh=W3
 qjdlXCrGJYdFNLku/WKxa0Yd1q1gu7loL3v5KHYRM=; b=zK/Fp8Q3S0qWDC4+U3
 kGt9Orlb8390T8Sy5wd+3hlBiAst1xeRlVyMyoOWpO2/Q34RC6ALM0nBbMY0H/MC
 FEtoQpTDxv2EJ+t9+cnilInQbFDDr37JteXNVSzkC2RRZha5BxX7IfYPTuXPLspP
 IYgnEWI75Q8dphn8Csk8ftz2HOjlAxs8P3+k4jocBTLtxw4sAe0T04w8uj+Aptf9
 pO1XoxI18qnsPS82ZJr5c5rp5rkU01GfA4p+E6aYZG0mx1YXcti/s5GkYB0Qa0gk
 RladkT7vE641Xi0g49knromvDRkAlBgSxJzq7TxLqq3qOqheGV+mHtPcLZseq/dI
 Bfgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701782795; x=1701789995; bh=W3qjdlXCrGJYd
 FNLku/WKxa0Yd1q1gu7loL3v5KHYRM=; b=fpvUYP+wLkfgJ6TQflEw4OYF6LGe5
 a3Feaob+JOtf3BjOTf5iamzt5cbGiVXbtWXiKG/2ZKW6mnM2ubhYH3OZv4+hQct3
 0FwHg1HgToCblPVSe/K/Lrm06wNjmSS3oz+Z8OBxKjTZlDWTFaTzHPuhJYG06L+X
 VK71m4Ula7avDUgfjvEnXtOyJDhPQljO2/TXqfUyynZukPMVPqiy0D9T5ZJKNyUo
 pqJhtJu2irMcj/Tg9+gpXOBqFixV5fA6N5sT/EU9zWNeESYhtOrUY1eRAQd+HcQa
 4gbGVA/EHZ5jPKyUhOSyD3FpbAT4FxyPBuiMYaID3OKt2zYjSoH2h9G/w==
X-ME-Sender: <xms:CSVvZcJVbsbrhr9sYKVcQUAAAS1DaBjSTvnpkZgk2j6LLf3slEjtXA>
 <xme:CSVvZcLr1DCGQRgrUVj-UyibDWjBlihjF5mIveBAeePWght-G5QzZlkjbdE-mkBW7
 TZg6eac0e_QXsu_Ux8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:CSVvZcsFsaCqlqUXDamXtGWKSxuWxDGZnZGh7uiXKsXvrH7hkLAbIg>
 <xmx:CSVvZZZFmxyOnwLm9cYbYVRTqBzlMGMH3al9Ge29PS6sdDVySSGjww>
 <xmx:CSVvZTYpLSW4BZilnjVOVgo2REBAlE3kPOHnsquKrdoOUGP_qC4L6A>
 <xmx:CyVvZcjUxRtu4e4Hrx-sSqQkzLAgDMCLWFO7kek49ROwxqThQoR9iw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7D795B6008D; Tue,  5 Dec 2023 08:26:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <2ef81211-9525-4f96-a6b2-3fcfbed0c6e5@app.fastmail.com>
In-Reply-To: <602e1ba4f02489fcbc47e8f9904f3c1db1c9f14a.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <602e1ba4f02489fcbc47e8f9904f3c1db1c9f14a.1701768028.git.ysato@users.sourceforge.jp>
Date: Tue, 05 Dec 2023 14:26:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yoshinori Sato" <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Subject: Re: [DO NOT MERGE v5 11/37] pci: pci-sh7751: Add SH7751 PCI driver
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

> +#include <asm/addrspace.h>
> +#include "pci-sh7751.h"
> +
> +#define pcic_writel(val, base, reg) __raw_writel(val, base + (reg))
> +#define pcic_readl(base, reg) __raw_readl(base + (reg))

__raw_writel()/__raw_readl() has a number of problems with
atomicity (the compiler may split or merge pointer
dereferences), barriers and endianess. You should normally
always use readl()/writel() instead.

> +	memset(pci_config, 0, sizeof(pci_config));
> +	if (of_property_read_u32_array(np, "renesas,config",
> +				       pci_config, SH7751_NUM_CONFIG) == 0) {
> +		for (i = 0; i < SH7751_NUM_CONFIG; i++) {
> +			r = pci_config[i * 2];
> +			/* CONFIG0 is read-only, so make it a sentinel. */
> +			if (r == 0)
> +				break;
> +			pcic_writel(pci_config[i * 2 + 1], pcic, r * 4);
> +		}
> +	}

the config property seems a little too specific to this
implementation of the driver. Instead of encoding register
values in DT, I think these should either be described
in named properties where needed, or hardcoded in the driver
if there is only one sensible value.

> +/*
> + * We need to avoid collisions with `mirrored' VGA ports
> + * and other strange ISA hardware, so we always want the
> + * addresses to be allocated in the 0x000-0x0ff region
> + * modulo 0x400.
> + */
> +#define IO_REGION_BASE 0x1000
> +resource_size_t pcibios_align_resource(void *data, const struct 
> resource *res,
> +				resource_size_t size, resource_size_t align)
> +{

You can't have these generic functions in a driver, as that
prevents you from building more than one such driver.

The logic you have here is neither architecture nor
driver specific.

> +static int sh7751_pci_probe(struct platform_device *pdev)
> +{
> +	struct resource *res, *bscres;
> +	void __iomem *pcic;
> +	void __iomem *bsc;
> +	u32 memory[2];
> +	u16 vid, did;
> +	u32 word;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (IS_ERR(res))
> +		return PTR_ERR(res);
> +	pcic = (void __iomem *)res->start;

This cast is invalid, as res->start is a physical address
that you would need to ioremap() to turn into an __iomem
pointer.

> +	bscres = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	bsc = devm_ioremap_resource(&pdev->dev, bscres);
> +	if (IS_ERR(bsc))
> +		return PTR_ERR(bsc);
> +
> +	if (of_property_read_u32_array(pdev->dev.of_node,
> +				       "renesas,memory", memory, 2) < 0) {
> +		/*
> +		 * If no memory range is specified,
> +		 *  the entire main memory will be targeted for DMA.
> +		 */
> +		memory[0] = memory_start;
> +		memory[1] = memory_end - memory_start;
> +	}

There is a generic "dma-ranges" proerty for describing
which memory is visible by a bus.

> diff --git a/drivers/pci/controller/pci-sh7751.h 
> b/drivers/pci/controller/pci-sh7751.h
> new file mode 100644
> index 000000000000..540cee7095c6
> --- /dev/null
> +++ b/drivers/pci/controller/pci-sh7751.h
> @@ -0,0 +1,76 @@

If the header is only included from one file, just removed
it and add the register definitions to the driver directly.

     Arnd
