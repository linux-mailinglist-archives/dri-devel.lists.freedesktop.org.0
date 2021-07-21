Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C33D11AD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992D76E987;
	Wed, 21 Jul 2021 14:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A606E987
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:53:55 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id y6so2495628ilj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=39/icZ4895+m49O8ui8jK8s2YjESquae62yWMw3Ir4c=;
 b=Guo73mZ6yKHiZEmwWSRxAODeMC+83TtcsfX8BJAhI48v2UJRUUcF4upLXHb4Lrdb0L
 po+YJuoSUpi2NwBBE3sZFLrMxQriAhcPhsuh1k9Gq5omgHSlp66KafL9ziJNC79uDngy
 ZyKAutlVy3QInJurrVKEbXqCfox2pN99kwZFSqRzCSAwszGcpPsEZKaUNFZUE3srjo8j
 Cwh2xWPhdGSluOIWtQgDV4HpSDaDWW2Au3wN/ro0nsCwaGZAl+YgkP8afmA+HuRWIrC7
 7Kcnq1gSYbXqBKU4TQ0RG+YwrVrrhlGdWAtXigdm3hiyQiB7dCoyWF6bXUJDxrx0lHwZ
 efhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=39/icZ4895+m49O8ui8jK8s2YjESquae62yWMw3Ir4c=;
 b=r4LLpvDhIFfp3gVOEo0+OxzBck8MslX2pwDVA/wsIbeJ31USLm+1Y3kL+K+ydYDmni
 ODN9L/ftWdq1WFMpFVh2yhYQOoZ/W6t8uqs3TfbBJ5IyW5VyVdwVYu46hut3xvowJjDV
 u+/zNMa9fIhQLHt1qepHiOzwv2fyR1Oih2fuf/S0J32BRUjGpBw8017NNoWohVWAkwOt
 5cAEVIvwA3c1RR8sRlAZeY+TxX/L5Icnr2fmA52+D6Dnpq/ZVdjRt/jCkTGvmYdnAqN+
 j92CS1trkb/RiwRfyPie83XH44ZGZHL0KnLj6p4Xl6j3Xv1SowTWy2xsGQcl5NHcuUOd
 TXdA==
X-Gm-Message-State: AOAM532nNXWBVj3jsc737tLPmEKIlJSMZBIkzVMrFTl7PRI3PIXDfbRQ
 TtzW382yxoP7A4Ilm6b9V6SsncVZfVWkdMChguQ=
X-Google-Smtp-Source: ABdhPJw1i62IODwqJG85RIGShGbX/nNmMKibJ4lq9B3eoCKP4Zhoh2+aEP3HFa6R+ujOCRWL8PdWXsy8PnQESunRSag=
X-Received: by 2002:a05:6e02:e82:: with SMTP id
 t2mr24437728ilj.218.1626879235022; 
 Wed, 21 Jul 2021 07:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1626853288-31223-3-git-send-email-dillon.minfei@gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Wed, 21 Jul 2021 22:53:19 +0800
Message-ID: <CAL9mu0J=Z5je9GJP8karYL=aaeMyQF5pCP7pU-c4QAr7eApUmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: stm32: fix dtbs_check warning on ili9341
 dts binding
To: thierry.reding@gmail.com, Sam Ravnborg <sam@ravnborg.org>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Doug Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

I suppose you will going to review this patch,
I forgot to add the Fixes tag in v2, just add it.
I will submit v3 to add this tag in case necessary.

Thanks, Best Regards.
Dillon

On Wed, 21 Jul 2021 at 15:41, <dillon.minfei@gmail.com> wrote:
>
> From: Dillon Min <dillon.minfei@gmail.com>
>
> Since the compatible string defined from ilitek,ili9341.yaml is
> "st,sf-tc240t-9370-t", "ilitek,ili9341"
>
> so, append "ilitek,ili9341" to avoid below dtbs_check warning.
>
> arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
> ['st,sf-tc240t-9370-t'] is too short
>

It's should be a Fixes tag here.

Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with
ili9341, gyro l3gd20 on stm32429-disco board")

> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> index 075ac57d0bf4..6435e099c632 100644
> --- a/arch/arm/boot/dts/stm32f429-disco.dts
> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> @@ -192,7 +192,7 @@
>
>         display: display@1{
>                 /* Connect panel-ilitek-9341 to ltdc */
> -               compatible = "st,sf-tc240t-9370-t";
> +               compatible = "st,sf-tc240t-9370-t", "ilitek,ili9341";
>                 reg = <1>;
>                 spi-3wire;
>                 spi-max-frequency = <10000000>;
> --
> 2.7.4
>
