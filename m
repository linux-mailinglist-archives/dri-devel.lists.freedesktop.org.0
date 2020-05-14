Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001771D29F7
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 10:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5976E2F9;
	Thu, 14 May 2020 08:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8296E2EA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 08:24:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f18so2478415lja.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 01:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jkb8BxKnl71QcTSlAQifB2QDBHTd1utKf7Tuku0XIK4=;
 b=iIm3W3vxPyvQT8hBr8kR8u+6yVBH0h6bfGPXKdobARfet5qpx6e2NJwbGUoVD4BTiz
 kvpn1tyKA+LwVUJc8z8fF1ZwXlCreaNrldq4vaEDBNH9cKFjh4tAUHQkvEkgZrv38eDN
 o2gz3Js+ZsuW3daffpbxtnkSsvbVGjH/1ch+B53s3SDAzYlJpVIgVSGq9BIdUF43U3J3
 PYEdm9THYdzNqhqnu0YtajA3OhEFK2moz2+zytOAdmmOqgbfZNV8YpRwBfYf+FcYfKP1
 slXNCbKogiAPZuvMbATklfcba8DSvlZ/NhggKTK4KlzEC8fEhJbI/SNZCFcSB3u8yrD/
 oIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jkb8BxKnl71QcTSlAQifB2QDBHTd1utKf7Tuku0XIK4=;
 b=EhDaVwuxEB5248EUPDVaLdD33n0x1dB8VqZ0KePlr3IePqcUWG9x0RO51wfxud2z92
 177wzJAVDyu1q6xaZc3dtyE5hHg8nPflGPeJ+Cs9omUNteXfdvoddMklmRY0/67AkxY5
 gy9MSt4uAeucWATJTedhwl6N7M2MqEe2bw5qvQolmBt56pc9u9fa0vTGZfmrvFRaLDP9
 WFA3CqdV1aSieEw/b07DLlRoTDlzmi0eCObTQubJq6QTy6a4B7+LgTdU/OJfv3BCF3cd
 iuOSQzA7Sjzn7gt5R1DDEYrXdSxvjhhNTZCEr347laJ4bNMyICx0A5+Y649XfHC9aqdD
 K26Q==
X-Gm-Message-State: AOAM530TLIaVX0UxaSUGA11/ksTiX4hW5gObj4sNSL2zXZ/vVZahMuRj
 SFNBuyxZaoVfKnzWfUe/qyghpppB5HG6mbD2AvbTWg==
X-Google-Smtp-Source: ABdhPJzbR0lONsL+LHNQ562bI+zZx3vzCrNYamk5GJI5zjbv9WVScZ7rOiUe3C6sarzGNmAWB4jF6RMUNqx0dbXgSxU=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr2073815ljh.223.1589444679816; 
 Thu, 14 May 2020 01:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 May 2020 10:24:28 +0200
Message-ID: <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] ARM: dts: stm32: enable ltdc binding with ili9341
 on stm32429-disco board
To: dillon.minfei@gmail.com
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

On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:

> From: dillon min <dillon.minfei@gmail.com>
>
> Enable the ltdc & ili9341 on stm32429-disco board.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

This mostly looks good but...

> +&spi5 {
> +       status = "okay";
> +       pinctrl-0 = <&spi5_pins>;
> +       pinctrl-names = "default";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
> +       dmas = <&dma2 3 2 0x400 0x0>,
> +              <&dma2 4 2 0x400 0x0>;
> +       dma-names = "rx", "tx";

These DMA assignments seem to be SoC things and should
rather be in the DTS(I) file where &spi5 is defined, right?
stm32f429.dtsi I suppose?

It is likely the same no matter which device is using spi5.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
