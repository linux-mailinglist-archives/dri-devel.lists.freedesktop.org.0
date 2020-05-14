Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783BF1D462C
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED6089D1D;
	Fri, 15 May 2020 06:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFDA6E2E8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 09:18:20 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id t12so476386ile.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ydoBtyjQkZ71HME1rY9/L3edxtQ8UTZXOUoGaJuGgqs=;
 b=ZYqSa8L/3MIGZtdjLm0uDEAUX9qw4WfHyEd/Xw3RGOzYb1CkiCmu64wr9INtmjvKAv
 emNDZI8PC9mqxdaFO/x+7iDPFrRBkDTofku3oFwDsonyzK71UUmM/f2Ph34IYVB1ePui
 TRYJEkf6+HZ5dpJwh+khw4qEqdRQ1Yz4UtEMkaULjMFHZPky5finqqVyz2JPi5d/Mocq
 Ga+oJmmuDjPRydwsVFRhLCydvb7MAqHM/hyGTEJ+1CxinGcEilDhOARv4nY1Mia/4k5g
 0CjcHoE1TsdomFZGSZaCa096y7nxhGm4PrO3r+27z96mUV9fH7IfZq7KcSOXdK64+inC
 4q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ydoBtyjQkZ71HME1rY9/L3edxtQ8UTZXOUoGaJuGgqs=;
 b=gwHSfrrLCWL63g7gKU63/lJQtwpB6pBTAn6iaF2U3g3ZC66HW+ZJARRXG+3p/SdFGR
 ggalcaLjd6hS5q/MM/yB9n0KsOrIyXM2yyz6i5Oztrvu76EHJ9QYJasMsk5vJuAhn2Vt
 ZVyyaxkuOKiwgfg0XmVRcdP7YTvDo14A/oLFi/tDKmoBu1nyy4tfmduqsushRMr+p2jE
 M1Y+IsKWuXvkkTq1wTFweusjWDt7GyR6RZeIHQsSikAJS6uKAVYgsotHLixfA6Bj0n9D
 uHEnuGj8nyUmbICFy3opWxklikdk3or3slxoi27fGqAXklAqNLpUtPIBfyn0/SbZzudc
 SVIQ==
X-Gm-Message-State: AOAM5315r2zQ53YYLCiFotriUE2IY80P4pj+hJQO1PJxnCUlcRHctmcN
 2UV19axYbT2P9VeKSSIyIK8Fz1LCx176Abrykz4=
X-Google-Smtp-Source: ABdhPJx7BSQgQE4F6HtJZDnTuhUIhxQY0EfiByegZhfXtsPPqB/OWed28lLtaW/x8ef7ztWZ46mbWs3Tdl5vZCAZRP0=
X-Received: by 2002:a92:3556:: with SMTP id c83mr3346133ila.218.1589447900002; 
 Thu, 14 May 2020 02:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
 <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
In-Reply-To: <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 14 May 2020 17:17:42 +0800
Message-ID: <CAL9mu0JZdgJ0yjULUHkXzU0CyKeMi0dcA1L7PxPiZucpuuyQ9Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] ARM: dts: stm32: enable ltdc binding with ili9341
 on stm32429-disco board
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
 <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>,
 Dave Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Linus,

thanks for reviewing.

On Thu, May 14, 2020 at 4:24 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:
>
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Enable the ltdc & ili9341 on stm32429-disco board.
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
>
> This mostly looks good but...
>
> > +&spi5 {
> > +       status = "okay";
> > +       pinctrl-0 = <&spi5_pins>;
> > +       pinctrl-names = "default";
> > +       #address-cells = <1>;
> > +       #size-cells = <0>;
> > +       cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
> > +       dmas = <&dma2 3 2 0x400 0x0>,
> > +              <&dma2 4 2 0x400 0x0>;
> > +       dma-names = "rx", "tx";
>
> These DMA assignments seem to be SoC things and should
> rather be in the DTS(I) file where &spi5 is defined, right?
> stm32f429.dtsi I suppose?
>
> It is likely the same no matter which device is using spi5.
>
> Yours,
> Linus Walleij

Yes, the dma assignments can be moved to stm32f429.dtsi file.
i will change it.

thanks.

best regards.

dillon,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
