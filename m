Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DAF6693D7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 11:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1394F10E9DB;
	Fri, 13 Jan 2023 10:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 548 seconds by postgrey-1.36 at gabe;
 Fri, 13 Jan 2023 10:16:07 UTC
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027CF10E9DB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 10:16:06 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 59F1E2B066ED;
 Fri, 13 Jan 2023 05:06:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 13 Jan 2023 05:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1673604412; x=1673611612; bh=wiGd1poFqy
 c19NDgfhWxoziS+5a2ezYepeVzBSacqw8=; b=jQa0HDmPBmL/FfJL+hgRmPsB40
 Y3mC3xChdI36TABN4RG5b4ucaLsZc6+hC+19/zCIm4A4ie1QOoF7GdEwpLDXWLgg
 YS7KkbMyef4z8Yilol0xjO/jcY2PDSzSOyaObnKUz9YejiKar9NRQ/48gMheN8SP
 L9ydOdhClMFMN+laVtMxeJLlISQdpKBcfrhR3HNQLngArqhNZXfmj7B7QaV3Yjlc
 q1pbz3p93X/orY60g/G7bg2Tiz9gOW8CeW5RhiSUeYXFN/oIPHXLd05ewSyQoczy
 YcvZ76uBqZ6njLqUwdbbXb3on9pD3cxdKgfVZ0av7GSfMv1N46xG/nNSra4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673604412; x=1673611612; bh=wiGd1poFqyc19NDgfhWxoziS+5a2
 ezYepeVzBSacqw8=; b=T9tKOcHloTqEvCQgyITgoeWHiCG023yZCoHB8GCNjjun
 JWtWHvJqinTMKxNzOHfWFkde1UNzFYeNjWL4OYuUevGP5ZiDtpX0SAgeRoVmsRqT
 4s4imE9aYV/f9Pvbl/xyCzDnDswOyuD8ceeVeSEppPmXeTdO2UYN2NW+SPkjkx6z
 7AGNecW4IwYIR8h6khoClacES7xN1wBX6oY0XpQ9E/MHHJqDRpFMe5RHSjqUpFHQ
 972R/sDnO/VHBlJ/MZtdHhD4RBw3rwTM6MhJr5iT0G2mUNkzC1EVZ0kt797d6W2S
 fBdJ8aBi3uu6VLi/i8mbcHwOUByNIvAxQvGBru7fCg==
X-ME-Sender: <xms:Oy3BY2x8u8jGs5oav_hETNuy2fGaBGNB7nGV00CwtVI39ajIhtTDrA>
 <xme:Oy3BYyQeI43uOCS5CK49RFBPrQXLvgoH7jyxA1EWEhaXS1U_GFSXnUcOsyByJ4HxX
 7ebslCPuxwL7F72QUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Oy3BY4WFmJ1Wzov0EgMi6qcJljjNqlgJoW7YxZYtni3we9ZcuZJC0Q>
 <xmx:Oy3BY8jDZdOmomBzdPQYugeTKvRs2JAmwJR9qFQ78gYn6oU0QQd3og>
 <xmx:Oy3BY4DQ3Zg11gEbb70JkOCpYbMnoYHqWtdB8svYNbX-CHCrZb2sRA>
 <xmx:PC3BYzV0__Pe1Lv9Yq1qvCTC7InwXhC6SGzQNcMq4ULKQsDh2lBDrgxrUdU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B041DB60086; Fri, 13 Jan 2023 05:06:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <d9c2f760-283b-483c-8512-fdd2c372f26c@app.fastmail.com>
In-Reply-To: <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-12-hch@lst.de>
 <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
Date: Fri, 13 Jan 2023 11:06:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Christoph Hellwig" <hch@lst.de>
Subject: Re: [PATCH 11/22] mtd/nand: remove sh_flctl
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Netdev <netdev@vger.kernel.org>, dmaengine@vger.kernel.org,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023, at 09:30, Geert Uytterhoeven wrote:
> On Fri, Jan 13, 2023 at 7:24 AM Christoph Hellwig <hch@lst.de> wrote:
>> Now that arch/sh is removed this driver is dead code.
>
> FTR, this hardware block is also present on the ARM-based
> SH-Mobile AG5 and R-Mobile A1 SoCs.
> Again, no DT support.

I would generally consider drivers dead when they have no DT support
and no platform in the upstream kernel registering the corresponding
device.

If anyone still uses this driver on SH-Mobile or R-Mobile, they
have clearly given up on upstreaming their patches by now, and
they can carry the burden of maintaining the driver out of tree,
or re-submit a working version.

    Arnd
