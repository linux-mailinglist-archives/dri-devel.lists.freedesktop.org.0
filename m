Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154F8C9FA8
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 17:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C34F10E3CD;
	Mon, 20 May 2024 15:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="mcU2EaBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CFD10E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jEy13TwY51IDLHTA3smgYhsxn/699IJE/oBHUE2hE0Y=; t=1716218784; x=1716823584; 
 b=mcU2EaBdPxEOpFgIHL5rZJ8SPi3vq9I2b05PnXsXDYQfi5oQYHetE53x+K1LooxtOidFwLOZZ3v
 YW6JQKwcgRsS/GNqYL44+BDZlzYetXJYtQLAczVTRq8WSK+UDpmGf+eWrVhtZRYbEAV1czy7ntqio
 MGObddyuk8h8zgsB3eoFIO397Zdc/pilC/e9thW0iGm10mq6ROah9fnr5s+SDmezLg6FoJiPD7SIm
 ExDetO8KV2AdpTh2JZqo5O/Z/ItXPlDQaftOb8olvud5sqCtrC1D1svVGnAvMhovayxWiQcMN/T+a
 ippB8hv8nepzN8VhSsumjOqaINAgiy/7zJjg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.97) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1s94tS-000000012H7-2ORN; Mon, 20 May 2024 17:25:42 +0200
Received: from p57bd9a40.dip0.t-ipconnect.de ([87.189.154.64]
 helo=[192.168.178.20]) by inpost2.zedat.fu-berlin.de (Exim 4.97)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1s94tS-00000001zzN-0gCb; Mon, 20 May 2024 17:25:42 +0200
Message-ID: <46c11cf9f837416470c50fa678df0ddb94a0a22e.camel@physik.fu-berlin.de>
Subject: Re: [RESEND v7 00/37] Device Tree support for SH7751 based board
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Niklas
 Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,  Thomas Zimmermann
 <tzimmermann@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas
 <bhelgaas@google.com>,  Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rich Felker <dalias@libc.org>, Lee Jones <lee@kernel.org>, Helge Deller
 <deller@gmx.de>, Heiko Stuebner <heiko.stuebner@cherry.de>, Shawn Guo
 <shawnguo@kernel.org>, Sebastian Reichel <sre@kernel.org>, Chris Morgan
 <macromorgan@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd
 Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>, Hyeonggon
 Yoo <42.hyeyoo@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Baoquan He
 <bhe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Kefeng Wang <wangkefeng.wang@huawei.com>, Stephen
 Rothwell <sfr@canb.auug.org.au>,  Javier Martinez Canillas
 <javierm@redhat.com>, Guo Ren <guoren@kernel.org>, Azeem Shaikh
 <azeemshaikh38@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>, Herve Codina
 <herve.codina@bootlin.com>, Manikanta Guntupalli
 <manikanta.guntupalli@amd.com>,  Anup Patel <apatel@ventanamicro.com>, Biju
 Das <biju.das.jz@bp.renesas.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>,  linux-ide@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-pci@vger.kernel.org,
 linux-serial@vger.kernel.org,  linux-fbdev@vger.kernel.org
Date: Mon, 20 May 2024 17:25:39 +0200
In-Reply-To: <87fruc8wg4.wl-ysato@users.sourceforge.jp>
References: <cover.1712205900.git.ysato@users.sourceforge.jp>
 <455e40c03314294f9c2e64480aa69f8261a3f2d5.camel@physik.fu-berlin.de>
 <87fruc8wg4.wl-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.154.64
X-ZEDAT-Hint: PO
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

Hi Yoshinori,

On Mon, 2024-05-20 at 22:06 +0900, Yoshinori Sato wrote:
> On Sat, 18 May 2024 18:08:30 +0900,
> John Paul Adrian Glaubitz wrote:
> >=20
> > Hi Yoshinori,
> >=20
> > On Thu, 2024-04-04 at 14:14 +0900, Yoshinori Sato wrote:
> > > Sorry. previus mail is thread broken.
> > >=20
> > > This is an updated version of something I wrote about 7 years ago.
> > > Minimum support for R2D-plus and LANDISK.
> > > I think R2D-1 will work if you add AX88796 to dts.
> > > And board-specific functions and SCI's SPI functions are not supporte=
d.
> > >=20
> > > You can get it working with qemu found here.
> > > https://gitlab.com/yoshinori.sato/qemu/-/tree/landisk
> > >=20
> > > v7 changes.
> > > - sh/kernel/setup.c: fix kernel parameter handling.
> > > - clk-sh7750.c: cleanup.
> > > - sh_tmu.c: cleanup.
> > > - irq-renesas-sh7751.c: IPR definition move to code.
> > > - irq-renesas-sh7751irl.c: update register definition.
> > > - pci-sh7751.c: Register initialization fix.=20
> > > - sm501 and sm501fb: Re-design Device Tree properties.
> >=20
> > Could you push your v7 version to your Gitlab [1] repository so I can f=
etch
> > it from there?
>=20
> updated it.

Thanks!

> I'll be posting v8 soon.

Sounds good! Maybe we can start merging the patches that contain fixes only
and that have already been reviewed. This way, we can reduce the overall si=
ze
of the series a bit.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
