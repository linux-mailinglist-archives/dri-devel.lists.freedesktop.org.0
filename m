Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B86690BA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D5610E225;
	Fri, 13 Jan 2023 08:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28F910E225
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:26:37 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id x7so8446211qtv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IGwwX1FWc34aVprY9nV8lSjSaarIXrtB/QPl3dMA44o=;
 b=3yN23+/mFwpCpTSl3ICk8LEr0ZZC6wpQW+J6XBOzKtGUt/cfhWJJ1Qna1PLvPhyLaX
 cSNnDiTLzpDH8aoJDb2cMZoRy/sYqi8PvSqoB4n0aUvTelDuTTNssfHy0BI0NPAm9Pc9
 LOL8Bb1EZhtpXqaQ5k6ji+8m1p3njf19HdpYCGwLA+nDSAkcCilX87O2iINjaD3jJ/+T
 F/89g0JRuGQ8+uoyxuNl/SS/qtsWgPe/0Gbe3uRzqEUe2naKPBHma8msi7rcQdViHuyN
 wmp0QC3ugLV8znFoLIQMXtKd0jangzSyV9kSqw9Z/PaC7UDtEaa+OY041Ko5e3MA1+P8
 OWLg==
X-Gm-Message-State: AFqh2kpxqxhqGsuMaMOmAs960F3L1p0bg6xL+GisvCA1Dgv8BGwvsTdG
 i2zyyjZKFoFUmKYj/sTgiYqj016dPTmTjw==
X-Google-Smtp-Source: AMrXdXv4jaOa/bKWu5bIH+t6rFuhPHiLmJ1NT6RDzvbz4aKeAl9qjiF4IzXnsgssmh/xNlPdiSIAlA==
X-Received: by 2002:ac8:6b84:0:b0:3a9:80bf:83c0 with SMTP id
 z4-20020ac86b84000000b003a980bf83c0mr19594125qts.2.1673598396242; 
 Fri, 13 Jan 2023 00:26:36 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 u15-20020a37ab0f000000b006f9c2be0b4bsm12002673qke.135.2023.01.13.00.26.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:26:35 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id a9so4876551ybb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:26:35 -0800 (PST)
X-Received: by 2002:a25:7:0:b0:7c1:b2e9:7e71 with SMTP id
 7-20020a250007000000b007c1b2e97e71mr830819yba.604.1673598394939; 
 Fri, 13 Jan 2023 00:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
In-Reply-To: <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:26:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
Message-ID: <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
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

On Fri, Jan 13, 2023 at 9:10 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/13/23 07:23, Christoph Hellwig wrote:
> > arch/sh has been a long drag because it supports a lot of SOCs, and most
> > of them haven't even been converted to device tree infrastructure.  These
> > SOCs are generally obsolete as well, and all of the support has been barely
> > maintained for almost 10 years, and not at all for more than 1 year.
> >
> > Drop arch/sh and everything that depends on it.
>
> I'm still maintaining and using this port in Debian.
>
> It's a bit disappointing that people keep hammering on it. It works fine for me.

Indeed.  The main issue is not the lack of people sending patches and
fixes, but those patches never being applied by the maintainers.
Perhaps someone is willing to stand up to take over maintainership?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
