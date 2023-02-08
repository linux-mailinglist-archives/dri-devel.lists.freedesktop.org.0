Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C468EEDB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 13:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B16910E763;
	Wed,  8 Feb 2023 12:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7A110E763
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 12:25:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7626BB81DB0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 12:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EADCC433A0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675859100;
 bh=RUfI31Jp44rV1IeXbD4t0AsPLNTznicHOFs5hGw+KFs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bMMO1+Azhs4Km63qgW7MyIf+xqhtlvG35nq7SJSy2pRcyN1Otm0Ye2NpZm65hUFqw
 g2UXYyZAG7y/GFHBum+Tqvnc08IW/1rKLeK2jUsXxW7365sg7nfY60Nm/b5ecUvZQ+
 jq+lxc+dnzzsBOH4xyeBMTDmL0feOmwqVdR28/LMrsSb4zQ7MmlEy1CKADHvAJGQ10
 xpco4MhgWctFyqW7SPENgukrqaHiImxPZNFmW4rTruJqX80YiWBcJ9RCfx9cgGGxxL
 w+OZLjdQi4usnRrjDZg5ctNF6esi6dZRhb/3dLkvxKIhjpj2Rv5UGltstIpXEGZNZq
 KJq9yQDIINrkw==
Received: by mail-ed1-f53.google.com with SMTP id v13so20135187eda.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 04:24:59 -0800 (PST)
X-Gm-Message-State: AO0yUKWyrwaMBoTD8H72j5/r3PeUtykaTufKfrL0XPttUs4AWT0Exns6
 6jTBYIUiUkFZ2b9dmBDa6eWkgeiAdmw00nTPhsI=
X-Google-Smtp-Source: AK7set/Q+/uOAbYZFM/jkIz+fISRabx3Hr+/BidGERpWGk7aoFNjh3zSLNUNVVzX/I6kZ5ZONaxFoF5vNNtc7g05RbQ=
X-Received: by 2002:a50:ce0c:0:b0:4aa:a4f7:2304 with SMTP id
 y12-20020a50ce0c000000b004aaa4f72304mr1816736edi.38.1675859098335; Wed, 08
 Feb 2023 04:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
In-Reply-To: <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 8 Feb 2023 20:24:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
Message-ID: <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
Subject: Re: remove arch/sh
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Emm, maybe this patch has its chance to be merged now. :)

https://lore.kernel.org/linux-sh/CAAhV-H6siOtVkZpkS4aABejgZCqTwp3TihA0+0HGZ1+mU3XAVA@mail.gmail.com/T/#u

Huacai

On Wed, Feb 8, 2023 at 8:14 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Randy!
>
> On Tue, 2023-02-07 at 17:31 -0800, Randy Dunlap wrote:
> >
> > On 2/7/23 01:06, John Paul Adrian Glaubitz wrote:
> > > Hello Christoph!
> > >
> > > On Fri, 2023-02-03 at 08:14 +0100, Christoph Hellwig wrote:
> > > > On Mon, Jan 16, 2023 at 09:52:10AM +0100, John Paul Adrian Glaubitz wrote:
> > > > > We have had a discussion between multiple people invested in the SuperH port and
> > > > > I have decided to volunteer as a co-maintainer of the port to support Rich Felker
> > > > > when he isn't available.
> > > >
> > > > So, this still isn't reflected in MAINTAINERS in linux-next.  When
> > > > do you plan to take over?  What platforms will remain supported and
> > > > what can we start dropping due to being unused and unmaintained?
> > >
> > > I'm getting everything ready now with Geert's help and I have a probably dumb
> > > question regarding the MAINTAINERS file change: Shall I just add myself as an
> > > additional maintainer first or shall I also drop Yoshinori Sato?
> > >
> > > Also, is it desirable to add a "T:" entry for the kernel tree?
> >
> > Yes, definitely.
>
> Geert has suggested to wait with adding a tree source to the entry until I get my
> own kernel.org account. I have enough GPG signatures from multiple kernel developers
> on my GPG key, so I think it shouldn't be too difficult to qualify for an account.
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
