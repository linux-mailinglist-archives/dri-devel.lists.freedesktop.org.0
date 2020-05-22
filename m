Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D5E1DF660
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834DC6E3FB;
	Sat, 23 May 2020 09:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576F06EA04
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 14:57:47 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id f4so11578596iov.11
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4E93R1F4OMg9K2XLuc0UwI5BfmV/kB8DZ8DcAqlj91Q=;
 b=RJh8B/6rHjjbkuji4u+fJ26zGQ2weYdBP8O87V6gBC0R3uO3Cxuxwia4xEC5fiQpVd
 BVao3bcj3EENB6cqKTKGBQu174xQRasXIfU4q+TkCRor9QpUGn/bNvOhtPgxnpksjF4z
 3fsMvYjJfJTHISaJ3cUFiRzeDfD7i3e9PZi6fj0SkJEmzk7TEWtsxWUY/iwJxQpOJ2R4
 T9SYcuC5mIwu3BPDv9d/KbkENTdJY9raVR0/065zsK9r46jPvzUkAxudp8zmyxpkPzW8
 Mh3IcqqBDWoU5MuQNyfGmuqSaUQzuiK4qAbocc1kDDt5QghsG+0LEtcX/A9knBg3T5Ef
 pvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4E93R1F4OMg9K2XLuc0UwI5BfmV/kB8DZ8DcAqlj91Q=;
 b=dfNw8nMImeDeV5eLChpKoFOblo1KQUK1AYKoiVwgaDEzj4mJ8/7iUVkztl0pNe4AeT
 6/gJbUeNkR+eRieN2InramyKo4rQzwj93ISFDmJK8ynwcpHQjnDii8E/x8FNQP+m4lCK
 JgtN55rzfej4B7KO810a5f39lVj+8DQfKa32maQ+uhs1GDpBlvtueWeGdcWzMfUhCCCS
 cagU6B07wznMsAhwxrdYWuGUHWpvOE7cD/wyE2q3oDb6Dntgpi0FmdwyRY/bHeCFwadp
 2KbxWre/oDXZJL0lNSwQgmD7mkCrbhh8exh+ZMUk4suNgXZ8swL+BcZ6hdYFJthtGtBf
 mtnw==
X-Gm-Message-State: AOAM532I7jDaO8E1QzszVt+RMpnvJhNXG2wFmxAdO0RtKLRPKG/SOwf9
 kc8aawvN8OEovxylvZ+JQhIC4MrFaHT1V98wGW0=
X-Google-Smtp-Source: ABdhPJzIBFSsXPwSSCGw73KtvrqDIXMGD/+GjvxVG0mSEkFCp7BWwg4nqAvzm+UoIsx0S8/uDt84GiJO2N2vFmJg7HM=
X-Received: by 2002:a05:6602:2ac9:: with SMTP id
 m9mr3461002iov.68.1590159466755; 
 Fri, 22 May 2020 07:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
 <20200522113634.GE5801@sirena.org.uk>
In-Reply-To: <20200522113634.GE5801@sirena.org.uk>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 22 May 2020 22:57:10 +0800
Message-ID: <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
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

hi Mark,

Thanks for reviewing.

On Fri, May 22, 2020 at 7:36 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, May 18, 2020 at 07:09:20PM +0800, dillon.minfei@gmail.com wrote:
>
> > 2, use stm32 spi's "In full-duplex (BIDIMODE=0 and RXONLY=0)", as tx_buf is
> > null, we must add dummy data sent out before read data.
> > so, add stm32f4_spi_tx_dummy() to handle this situation.
>
> There are flags SPI_CONTROLLER_MUST_TX and SPI_CONTROLLER_MUST_RX flags
> that the driver can set if it needs to, no need to open code this in the
> driver.

Yes, after check SPI_CONTROLLER_MUST_TX in drivers/spi/spi.c , it's
indeed to meet
this situation,  i will try it and sumbmit a new patch.

thanks.

best regards

Dillon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
