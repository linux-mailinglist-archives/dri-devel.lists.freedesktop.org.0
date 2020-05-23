Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8251DF651
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFEA6E1B1;
	Sat, 23 May 2020 09:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5956E156
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 01:35:43 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id j3so12607818ilk.11
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 18:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S1QSAzJLA557HDI9geZdFtza2j2ttaAmC0/pNbF94RQ=;
 b=A992b6KQ0XxvQBvr4hpSCBAiJVOy3bCMOJRZbTEgNVsjziHkOX1YLkNL2W7JgGf5kB
 6dkdnQIBW/+Lh4TZr5VZ9W9jlKsQLHFUNaXvbtKPXiXkE2z25chDOo+YqkADBuJdDhZ/
 tHUB4rgSKsyEN1xbge2cNw65A0heIWhKbJcDMDvUkNC/9rydOmAqGX3PUZ8I2z0U7Y/V
 5Cr+kLr+aMh+DQj7mplWOIOBhISwulzYr6G01tL+aSEMoNt7Tw1DQ0rbXyQBcNzZ99L6
 aTZi5JpRzKVrsOLiFDG26hTNg0/+eB2eYUciggM6rhuzsRwMg4KgAEsT2EqkXuw9fJM0
 UHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S1QSAzJLA557HDI9geZdFtza2j2ttaAmC0/pNbF94RQ=;
 b=Co7vs2WHAduDw+RFj+1AEaXRwzv+VwuOVjqv8MuGFCuo0BodVJn7CXTpgD43ai4c45
 sDhiZ77UAo9xRrKp6kQ7djTn/FsSfabnY0mw1W0QEKlE1/Q553rqAn+u+t41/lp1Jg5j
 /+CPhF6SFXW7CX4RVDJFD6MxnzDld3D2PSZC8SJYcZDwGuzP1rCWPuqxqkmxD6qbCihW
 moJatEn/pSoUljaIacmighYcQBXEUFbv81uxfw2kSkpdHklHs0sh3DoVPfVngTMgon8B
 J1+pvTqmQ6ViDViSwa6xVBG22+m5qaDa+c9G43ZZ4fbvBrQ37ueH0+TXeBIs3M3jgVun
 vddg==
X-Gm-Message-State: AOAM530ZH/RGn0WXykxWPYgzlwcAGJLiFFcklMB8hGpgRBdGkBxxQUzM
 4mm5na8Top9KUrexRcUZH0Lw+IduDv0ABAxgc/g=
X-Google-Smtp-Source: ABdhPJyFMcan15/IQgBUd7V654mVVCiDvmI/KPlV1LTFmOXrmNhn289+5jn0LkISjmGIfWZTCLlEXoFxdgoJGQtXdZU=
X-Received: by 2002:a92:dc85:: with SMTP id c5mr15557198iln.270.1590197742955; 
 Fri, 22 May 2020 18:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
 <20200522113634.GE5801@sirena.org.uk>
 <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
 <CAL9mu0JZ4Qy+m2oF9TSTRqA_mM0J89huCt3t_Gs7qHa=3LxhBw@mail.gmail.com>
 <20200522162901.GP5801@sirena.org.uk>
In-Reply-To: <20200522162901.GP5801@sirena.org.uk>
From: dillon min <dillon.minfei@gmail.com>
Date: Sat, 23 May 2020 09:35:06 +0800
Message-ID: <CAL9mu0+E5R0mDUW3f+aKpfE_457VimS-ow2z_xVOmCfCAMnKuA@mail.gmail.com>
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

On Sat, May 23, 2020 at 12:29 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, May 22, 2020 at 11:59:25PM +0800, dillon min wrote:
>
> > but, after spi-core create a dummy tx_buf or rx_buf, then i can't get
> > the correct spi_3wire direction.
> > actually, this dummy tx_buf is useless for SPI_3WIRE. it's has meaning
> > for SPI_SIMPLE_RX mode,
> > simulate SPI_FULL_DUMPLEX
>
> Oh, that's annoying.  I think the fix here is in the core, it should
> ignore MUST_TX and MUST_RX in 3WIRE mode since they clearly make no
> sense there.

How about add below changes to spi-core

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 8994545..bfd465c 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1022,7 +1022,8 @@ static int spi_map_msg(struct spi_controller
*ctlr, struct spi_message *msg)
        void *tmp;
        unsigned int max_tx, max_rx;

-       if (ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) {
+       if ((ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) &&
+               !(msg->spi->mode & SPI_3WIRE)) {
                max_tx = 0;
                max_rx = 0;

for my board, lcd panel ilitek ill9341 use 3wire mode, gyro l3gd20 use
simplex rx mode.
it's has benefits to l3gd20, no impact to ili9341.

if it's fine to spi-core, i will include it to my next submits.

thanks

best regards.

Dillon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
