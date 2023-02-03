Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C46896C6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036EF10E750;
	Fri,  3 Feb 2023 10:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9664A10E750
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 10:33:27 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id m12so4932736qth.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 02:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7A9k4QSf8av6qzMk9PJKNV90s0Q4PXBSAXyaJlyJVU8=;
 b=VOq/pvL1Uh5vhKa9PTWoKZ5qSpVL9wTjtUVUCppDrRX1qClcQb44S/BlBYjM7SNqut
 LFQYja+yYwa94u72H9Ci5VrptdkmeHYqCbdey4BM6zedTGr40voK4Xi4ka/ed1X5zXKe
 4H+m9v6O1oZ0nF3g7dNIcznZc/oVnYb50a8CBIeZe4YKrgKmwtG8si3+MVYFnj3liIbZ
 AcgnBD7GG41+3/irAQ9ABTSdF4BWUJE1eqJyhe4pdCMHCWkjaKx3+T1WhXSh7DXpTrTz
 HiX3E++IfgFZinamLusNDrZRkMJSE8ACqgaFYNxYka2GDfO+LNaCEC7MvxzdtsTn6lSm
 Putw==
X-Gm-Message-State: AO0yUKXg9DWXLgdqcxTpVm5CdyXk5NoCEHAfzwqaeWmlBe7k8tBXCYMR
 1qBJ5TXUVhL+DwCoZ3s05BphCJ7Mb/9yIg==
X-Google-Smtp-Source: AK7set91a5BHNg3v93o4TqgGWGyKpkauHyk5oC5PRTN9DrcACDU9Jn78KgxusnZ0A5f4E16Uhpwc6Q==
X-Received: by 2002:ac8:7dc7:0:b0:3ab:2a7f:83e4 with SMTP id
 c7-20020ac87dc7000000b003ab2a7f83e4mr17947970qte.35.1675420406497; 
 Fri, 03 Feb 2023 02:33:26 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 r144-20020a37a896000000b0070638ad5986sm1524768qke.85.2023.02.03.02.33.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:33:26 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id x4so5723006ybp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 02:33:25 -0800 (PST)
X-Received: by 2002:a25:9c83:0:b0:7bf:d201:60cb with SMTP id
 y3-20020a259c83000000b007bfd20160cbmr900933ybo.365.1675420405273; Fri, 03 Feb
 2023 02:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de>
 <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
In-Reply-To: <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 11:33:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
Message-ID: <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian,

On Fri, Feb 3, 2023 at 11:29 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Fri, 2023-02-03 at 09:30 +0100, Christoph Hellwig wrote:
> > On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wrote:
> > > Since this is my very first time stepping up as a kernel maintainer, I was hoping
> > > to get some pointers on what to do to make this happen.
> > >
> > > So far, we have set up a new kernel tree and I have set up a local development and
> > > test environment for SH kernels using my SH7785LCR board as the target platform.
> > >
> > > Do I just need to send a patch asking to change the corresponding entry in the
> > > MAINTAINERS file?
> >
> > I'm not sure a there is a document, but:
> >
> >  - add the MAINTAINERS change to your tree
> >  - ask Stephen to get your tree included in linux-next
> >
> > then eventually send a pull request to Linus with all of that.  Make
> > sure it's been in linux-next for a while.
>
> OK, thanks for the pointers! Will try to get this done by next week.
>
> We're still discussing among SuperH developer community whether there will be a second
> maintainer, so please bear with us a few more days. I will collect patches in the
> meantime.

Thanks a lot!

If you need any help with process, setup, ... don't hesitate to ask
(on e.g. #renesas-soc on Libera).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
