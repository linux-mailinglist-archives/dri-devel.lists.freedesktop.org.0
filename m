Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25C93E1268
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6F6E50C;
	Thu,  5 Aug 2021 10:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961D76E4E8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:16:54 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so4650039pjn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxYTdS6bgnfx+2Ini0fwp3kDF4xi+vc1vXsFnljggKE=;
 b=JtEg/md2Yb41+lcJXe0vA8ZSpStUi8dmGPgMckSn8GNINukwB+ruPr97a/iHlXfhPz
 tAalqCJiLpoS195wRcmC8yJvRMyKPo/YkNrM9NUBQ2qlfOc32ztPM7YldPLNnk3r+PeA
 jdJ1aVLKQrfpCupHt43bipmklPq+GVI+oImgws/r3M096q3leCRSbAFXiiW5+twDCZ5a
 C5vHVCdnP1TIvdOukQbc6Mi22tGiMGQ2oTQe3tyyEN92JHvwC4mFFCg/DNPGApK+EZmt
 0x+2mcC8l2PXBFQ9R22X/soj19riBMzXr/o7Vz5pLl1imicG2uHNDO4TwmW2gvW7T3+Y
 ybbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxYTdS6bgnfx+2Ini0fwp3kDF4xi+vc1vXsFnljggKE=;
 b=gaEhwbhKrSvotosUUkffMC4HRsYMaTtqNLimJm7nXfq4FUfxyuHTVdUsJb4uE1omd2
 6oVH1VF3Amvop1KV3oDC9kRUuE0b8d6TjaMY5V0JbdVuH19GIPljvOc0mh7RlIi7g3y0
 yH+nEsFBhMhCiKCdPQmy55r4hPIBJ6QS5U7A5F1XFkV/OKQnLNZd4VxgNk4l1E8kDreF
 DumP47PRB+I1WGMipz3Vkzy2slW0k/AjQ4MUKitpK+Ofbi7RBjjPLFToYZzfRrkupMRV
 nLMT6FdXE655oTSaOimSWaGkvqgPAK9Ey7kOTIoZTFSuYqJ/Jj7aOCbuCe5r5r/oIT0N
 L61Q==
X-Gm-Message-State: AOAM530JmivMzrOWLxX8vHeEkW1SstbJk0+nC9wdkLVoZvFRpnK8f9dh
 jB1enC8sl46oUHFv7ZOV9QAI9tHcz/CQ6pOvE3k=
X-Google-Smtp-Source: ABdhPJzQdp79YDSUT7pRlIuSy1Usr2PJofPj14rvaki1F07Zhcat3klZF8hM1ON/1nirWpPekkeKplXaq4gQ26K/OTY=
X-Received: by 2002:a17:90b:33c5:: with SMTP id
 lk5mr14831776pjb.129.1628158614242; 
 Thu, 05 Aug 2021 03:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Aug 2021 13:16:14 +0300
Message-ID: <CAHp75Vc5fJM-UiBiosAiTraq=6P0AFefmw1rmtFcvyWVb6rfLA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add ilitek ili9341 panel driver
To: dillon.minfei@gmail.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 kbuild-all@lists.01.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 6:46 AM <dillon.minfei@gmail.com> wrote:
>
> From: Dillon Min <dillon.minfei@gmail.com>
>
> Since the st,sf-tc240t-9370-t dts binding already exist in stm32f429-disco.dts
> but, the panel driver didn't get accepted from mainline. it's time to submit
> patch fot it.
>
> This driver can support two different interface by different dts bindings:
> - spi+dpi, use spi to configure register, dpi for graphic data.
>   st,sf-tc240t-9370-t
> - only spi, just like tiny/ili9341.c (actually, this part is copy from tiny)
>   adafruit,yx240qv29

...

> I was submited the first patch last year, you can find it at [1].

submitted

> this patch has one major difference from that one, which is replace the low
> level communication way, from spi_sync() to mipi_dbi_{command,
> command_stackbuf}() interface, referred from Linus's patch [2].

Can you shed a light on the road map here.
I have the SPI panel (tiny) based on the ILI9341 and I'm using
actually mi0283qt driver. With yours we will have 3 (three!) drivers
for the same chip. I really do not want this. Without road map on the
prospective of these all drivers, NAK.

-- 
With Best Regards,
Andy Shevchenko
