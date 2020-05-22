Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810AA1DF662
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0AD6EA4A;
	Sat, 23 May 2020 09:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDEF6E08A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 16:00:01 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q129so2721190iod.6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FHIFAWUYDhJ80n0eXg0z7nTHf0/vDwtgn87D1kTvKZw=;
 b=VwHlaoAfnE0jrQI4ME3ZjZ87Fl8fMiI7FOB/65iDK32jeXJ0r6Bf6SnfYRIVEO6k6m
 DzlctHIuvMnhbnvAziB3ubyH4olRzONZWriz82tW84id41d+G0aaZsGJzAQD9SqY6STl
 U+KIXtBjUhXfneehG1qd35VDkYmEVKk7k7U5Q0d9nJw20AfuQV3MvWXVSY1liADEoJS7
 FgJEadNiBp+b7li6e5pXHsRL5ssVBlR672GS1Q9jDnRZiYAnpONVjiZRHjbbr9FFH8d8
 W/7kM258Bwcm/cHTYm/kHaSY9DU3wWohGjofhiEvbcNCowmRsk2+eu46fBFd/xkb9Pl+
 kx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FHIFAWUYDhJ80n0eXg0z7nTHf0/vDwtgn87D1kTvKZw=;
 b=AsQCxBr0eeVdcCImwgxgm974mVUmKo8VSgnn9/DoUvNu5I370M7KtrPASeCiC+YYT4
 q9bKHlFW+uLV5Qx5HGMaWU2X2R4Jr1RzOS0UsXJBG36R465Zq/aQNHnXSk1VI/Tl0pQS
 xwECTOLA3sjQ9lLuPlqC+3M+52S9lqYuBkOikcqV8wiC0qL7o4Vc0Upvtqe0fyw8FhY4
 +M5GarSu7er9bbWX6oxqPFcGE/rcWlrboELC6NmBwFtnkF5kQuy658++E5qY9uusQYAA
 GSG94NRaJfLDxUtUcDYTnquUkaVBqZWxrLy2pJHCLaz1uOdgg4wzKokhL3eGPG4/g1OJ
 nuPw==
X-Gm-Message-State: AOAM533wphuNCsofh+7BS5d9F2Jk8YhgWBd6JCuKg567W/6zzdT6ejs7
 ja3VSlesXbkli5edTqopMvHbsq6chYtAZdYvGEl/X9j27j8=
X-Google-Smtp-Source: ABdhPJzAQJiDrgeJy7rhfX0pAkio1uuxAwG3849yDdBeiLJsJGxodT7NQRbXZ/oKCcFCwEsCtRUE249ryL/Lt2qOMyI=
X-Received: by 2002:a05:6638:631:: with SMTP id
 h17mr2552012jar.137.1590163200792; 
 Fri, 22 May 2020 09:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
 <20200522113634.GE5801@sirena.org.uk>
 <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
In-Reply-To: <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 22 May 2020 23:59:25 +0800
Message-ID: <CAL9mu0JZ4Qy+m2oF9TSTRqA_mM0J89huCt3t_Gs7qHa=3LxhBw@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX'
 support for stm32f4
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>, linux-kernel@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 22, 2020 at 10:57 PM dillon min <dillon.minfei@gmail.com> wrote:
>
> hi Mark,
>
> Thanks for reviewing.
>
> On Fri, May 22, 2020 at 7:36 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Mon, May 18, 2020 at 07:09:20PM +0800, dillon.minfei@gmail.com wrote:
> >
> > > 2, use stm32 spi's "In full-duplex (BIDIMODE=0 and RXONLY=0)", as tx_buf is
> > > null, we must add dummy data sent out before read data.
> > > so, add stm32f4_spi_tx_dummy() to handle this situation.
> >
> > There are flags SPI_CONTROLLER_MUST_TX and SPI_CONTROLLER_MUST_RX flags
> > that the driver can set if it needs to, no need to open code this in the
> > driver.
>
> Yes, after check SPI_CONTROLLER_MUST_TX in drivers/spi/spi.c , it's
> indeed to meet
> this situation,  i will try it and sumbmit a new patch.
>
> thanks.
>
> best regards
>
> Dillon

Hi Mark,

There might be a conflict with 'SPI_CONTROLLER_MUST_TX' and 'SPI_3WIRE' mode,
i need to know the SPI_3WIRE direction,  currently i get this
information from 'struct spi_device'
and 'struct spi_transfer'
if ((spi_device->mode & SPI_3WIRE) && (spi_transfer->tx_buf == NULL)
&& (spi_transfer->rx_buf != NULL))
    this is a SPI_3WIRE_RX transfer
if ((spi_device->mode & SPI_3WIRE) && (spi_transfer->tx_buf != NULL)
&& (spi_transfer->rx_buf == NULL))
    this is a SPI_3WIRE_TX transfer

but, after spi-core create a dummy tx_buf or rx_buf, then i can't get
the correct spi_3wire direction.
actually, this dummy tx_buf is useless for SPI_3WIRE. it's has meaning
for SPI_SIMPLE_RX mode,
simulate SPI_FULL_DUMPLEX

how do you think?

thanks

best regards

Dillon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
