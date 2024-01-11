Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BE582B12E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 15:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB18310E1D2;
	Thu, 11 Jan 2024 14:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E388710E1D2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 14:59:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1011D61AC4;
 Thu, 11 Jan 2024 14:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F65AC43390;
 Thu, 11 Jan 2024 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704985170;
 bh=obzljcLiJ4GpVaa5SSKo4cJxW9OvkYGDmnjlyQfIlZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nHYalyDOvAOPCXFghAM1koa8SyyhhJbx2NS7oaSccjGMgH7hd8K6PgCbgUYNNxNlV
 RmGKdU8H/qelbOpHbdK6lY3z94gtQDkXFLwmXpIo6se2QKdb2/eJHuEYRWwCvqRZqz
 d6c/2VhyfKTHc2AOeMEj2o2oEeAhfzNCGN+6T/O6RApd1aGtGh6rdqf/jl/505e4yX
 2vkmubzDVpwuYZ5TSUe6C8cnpmoESUorVaftbQJbcjgGD8ONaUd6KceQOl+dy+Jwil
 R5sfhQjmbOfzkWmuihvw8I2rFw5SlSma30PRhfosHts/KPzeyEknOc/usqeCbKIhN0
 6Aj8MjPf72M2w==
Date: Thu, 11 Jan 2024 08:59:28 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [DO NOT MERGE v6 26/37] dt-bindings: vendor-prefixes: Add smi
Message-ID: <20240111145928.GA538344-robh@kernel.org>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <c8aaf67e3fcdb7e60632c53a784691aabfc7733e.1704788539.git.ysato@users.sourceforge.jp>
 <20240109-fructose-bundle-05d01033277b@spud>
 <CAMuHMdU1z64QHJOVd3jUsOfyuDApB1+khkUV8PvjoKbwsi327g@mail.gmail.com>
 <20240110-sincere-tripod-9d34175fcbce@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110-sincere-tripod-9d34175fcbce@spud>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <dlemoal@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 04:11:44PM +0000, Conor Dooley wrote:
> On Wed, Jan 10, 2024 at 12:23:37PM +0100, Geert Uytterhoeven wrote:
> > Hi Conor,
> > 
> > On Tue, Jan 9, 2024 at 7:06 PM Conor Dooley <conor@kernel.org> wrote:
> > > On Tue, Jan 09, 2024 at 05:23:23PM +0900, Yoshinori Sato wrote:
> > > > Add Silicon Mortion Technology Corporation
> > 
> > Motion
> > 
> > > > https://www.siliconmotion.com/
> > > >
> > > > Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> > > > ---
> > > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > > index 94ed63d9f7de..a338bdd743ab 100644
> > > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > > @@ -1283,6 +1283,8 @@ patternProperties:
> > > >      description: Skyworks Solutions, Inc.
> > > >    "^smartlabs,.*":
> > > >      description: SmartLabs LLC
> > > > +  "^smi,.*":
> > > > +    description: Silicon Motion Technology Corporation
> > >
> > > How come "smi" is used for a company with this name?
> > > Why is it not something like SMTC? There's probably some history here
> > > that I am unaware of.
> > 
> > See Documentation/devicetree/bindings/display/sm501fb.txt
> > The stock ticker is "SIMO", though.
> > https://www.nasdaq.com/market-activity/stocks/simo
> 
> If there's an existing user, there's little reason to stand in the way I
> think.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Or reason not to apply, so I'm applying this.

BTW, 'RFC' is the standard way to say 'DO NOT MERGE'.

Rob
