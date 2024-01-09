Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA77828B47
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 18:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8285C10E49E;
	Tue,  9 Jan 2024 17:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFCC10E49E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 17:31:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E4C2614E2;
 Tue,  9 Jan 2024 17:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7782C433F1;
 Tue,  9 Jan 2024 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704821492;
 bh=UOEYJi4gJtE8sc2Wj07/bfw21ESQfkQyPOaOQJ8ntis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FcCzoDiHW9klwT7ITiw4GovAPaKPnr72xGYdoRaIK7XAnlsIaojUnauhMcef6+alT
 Rm9ONxbPUJh8Bew+DaFyg/rm7F98zKKN76tYI+t0eWNSh3mChToLImHOlZ27csWcmK
 A9RsIvRVydPCrdx71CO73qGLeVu91A6M03V0c8dErhG1NmqRg5zQc7+65/2g2o+UV1
 OKZfIOQgFL61a5GRIUUU4WRt/RNssERHP21qQenhLA2dHCvOaYxe7LnJ1Yb2foX72k
 GZqlnbJj6lyLc2u7YZRUxksAM4Fmjb+Jv6bJNKjh47dK+LISNbCJ5fSJ5btMV276Xm
 6aPemIi6bTC8g==
Received: (nullmailer pid 2808343 invoked by uid 1000);
 Tue, 09 Jan 2024 17:31:24 -0000
Date: Tue, 9 Jan 2024 11:31:24 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [DO NOT MERGE v6 12/37] dt-bindings: pci: pci-sh7751: Add SH7751
 PCI
Message-ID: <20240109173124.GB2783042-robh@kernel.org>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <160ee086771703c951c5522d997662aeac122a28.1704788539.git.ysato@users.sourceforge.jp>
 <CACRpkdZMkyJdkFt_x-6iubLZ-KzewvmT0zi4HAas0Xy9DpPn3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZMkyJdkFt_x-6iubLZ-KzewvmT0zi4HAas0Xy9DpPn3g@mail.gmail.com>
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
Cc: , Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sh@vger.kernel.org, Bin Meng <bmeng@tinylab.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
	Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org,
	Michael Karcher <kernel@mkarc>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-serial@vger.kernel.org, David Rientjes <rientjes@google.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	her.dialup.fu-berlin.de@freedesktop.org,
	Chris Morgan <macromorgan@hotmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sebastian Reichel <sre@kernel.org>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 01:42:53PM +0100, Linus Walleij wrote:
> Hi Yoshinori,
> 
> thanks for your patch!
> 
> On Tue, Jan 9, 2024 at 9:24 AM Yoshinori Sato
> <ysato@users.sourceforge.jp> wrote:
> 
> > Renesas SH7751 PCI Controller json-schema.
> >
> > Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> (...)
> > +  renesas,bus-arbit-round-robin:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set DMA bus arbitration to round robin.
> > +
> > +  pci-command-reg-fast-back-to-back:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI command register Fast Back-to-Back enable bit.
> > +
> > +  pci-command-reg-serr:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI command register SERR# enable.
> > +
> > +  pci-command-reg-wait-cycle-control:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI command register Wait cycle control bit.
> > +
> > +  pci-command-reg-parity-error-response:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI Command register Parity error response bit.
> > +
> > +  pci-command-reg-vga-snoop:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI Command register VGA palette snoop bit.
> > +
> > +  pci-command-reg-write-invalidate:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI Command register Memory write and invaldate enable bit.
> > +
> > +  pci-command-reg-special-cycle:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI Command register Special cycle bit.
> > +
> > +  pci-command-reg-bus-master:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI Command register Bus master bit.
> > +
> > +  pci-command-reg-memory-space:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI Command register Memory space bit.
> > +
> > +  pci-command-reg-io-space:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Set for PCI Command register I/O space bit.
> 
> Do you really need to configure all these things? It seems they are
> just set to default values anyway?
> 
> Can't you just look at the compatible "renesas,sh7751-pci" and
> set it to the values you know are needed for that compatible?

Yes. Please drop all these.

> 
> > +  pci-bar:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description: Overwrite to  PCI CONFIG Base Address Registers value.
> > +    items:
> > +      items:
> > +        - description: BAR register number
> > +        - description: BAR register value
> > +    minItems: 1
> > +    maxItems: 6
> 
> Same with this, isn't this always the same (hardcoded) values
> for "renesas,sh7751-pci" if used?

The OpenFirmware PCI bus supplement already defines how to specify BAR 
values in DT in "reg" or "assigned-addresses". If you need to specify 
these, use that. Note don't expect the kernel to do anything with them.

Rob

> 
> > +            interrupt-map = <0x0000 0 0 1 &julianintc 5>,
> > +                            <0x0000 0 0 2 &julianintc 6>,
> > +                            <0x0000 0 0 3 &julianintc 7>,
> > +                            <0x0000 0 0 4 &julianintc 8>,
> > +                            <0x0800 0 0 1 &julianintc 6>,
> > +                            <0x0800 0 0 2 &julianintc 7>,
> > +                            <0x0800 0 0 3 &julianintc 8>,
> > +                            <0x0800 0 0 4 &julianintc 5>,
> > +                            <0x1000 0 0 1 &julianintc 7>,
> > +                            <0x1000 0 0 2 &julianintc 8>,
> > +                            <0x1000 0 0 3 &julianintc 5>,
> > +                            <0x1000 0 0 4 &julianintc 6>;
> 
> This interrupt-map looks very strange, usually the last cell is the polarity
> flag and here it is omitted? I would expect something like:
> 
> <0x0000 0 0 1 &julianintc 5 IRQ_TYPE_LEVEL_LOW>, (...)
> 
> The interrupt-map schema in dtschema isn't really looking at this
> so it is easy to get it wrong.

dtc should IIRC. Maybe not in the example being incomplete.

Rob

