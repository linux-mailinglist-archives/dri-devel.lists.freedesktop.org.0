Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E3314C0D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 10:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A286E02D;
	Tue,  9 Feb 2021 09:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD446E02D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 09:49:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id i5so2468352wmq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 01:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iODsYL577vtiTZcS5AXU5f62AD5nWHRXTaswzxJRGpE=;
 b=JBX1u8nYfJ2D17HCZU3bF64mR3tXNePMMbkujQwPzUB4EHhq0FLPs5OOM92rDCpHBF
 4O9xTvVsnstE1b4IgRWf/cN/5JU2cy+inHw8TS2/FNMZeJNBStL7jnJ8ZcPrtCFvxPG4
 V/4KyzneELW/HpkZBFhB9trOu3KvpkoWlsMbt5tVgBOMJdCNMuB/45CFP7unHH4zy3N2
 NFahaB6yHkIYKLQFa/wTYu0dpNn78LVyWqe8lOs5wsRRZj5Dw2+AdWS4zVBv+s35utmv
 HQfK/sg06HSj9kgzRvVI2EWfBGQTkY4bQKv9rmjLvOp2dFbUsZ/6hGhjOZ1SksYp8P8F
 /Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iODsYL577vtiTZcS5AXU5f62AD5nWHRXTaswzxJRGpE=;
 b=f38BuldARVxZgavLrClTkhhnYgqkTydEC479VigI+3O+vgNDEDhNyTs/w9ehFcVo1h
 T4YEMX9EDh3kp8w60m+osjzjcx8XSgOh6TiwiyQK2ZgWTbQvDnofb8WBHghdloBZtWyN
 INVcQfEhIYthQVDBBD1w8V7xgyH+VeWF5I/Pu0hpBXdtkOFEFR8cGk/9nWLfkpbA4pyo
 vNLos5HF2zPF5YtxhQrFVEE5NeOgroxp8Bss9rCr7paJnpaMuingaOUx1cF2/T1mnAgV
 gQb7dhv3nGaZ1C4xGWOEjdfG9rtGWkVREY14IOYdak6qZ+DzIhct4hWckBIsJxbakht/
 EnSw==
X-Gm-Message-State: AOAM532psqNfESDS5CmuFIyzzUKTJMtZAUNKENTNeqaLCV5quBKuzkyV
 2ePVIjo9XCb/LqO9PWMmZAm73gpAYf7Q+NgZDQxq7tEYAyRR1w==
X-Google-Smtp-Source: ABdhPJwkXMO4uhvCsmyjxeJIJN/dMVthik8rV2agcLFH9W28tEatgkKRxyaLXGqmb/ZxKjwVzyOeJ3lIrOe3jbSNI4Y=
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr2607883wml.116.1612864162564; 
 Tue, 09 Feb 2021 01:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-15-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-15-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 9 Feb 2021 09:49:05 +0000
Message-ID: <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt
 controller
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BSC controllers used for the HDMI DDC have an interrupt controller
> shared between both instances. Let's add it to avoid polling.

This seems to have unintended side effects.
GIC interrupt 117 is shared between the standard I2C controllers
(i2c-bcm2835) and the l2-intc block handling the HDMI I2C interrupts.

Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
doesn't appear to be an option for l2-intc registering as an interrupt
controller. i2c-bcm2835 therefore loses out and fails to register for
the interrupt.

Is there an equivalent flag that an interrupt controller can add to
say that the parent interrupt is shared? Is that even supported?

Thanks
  Dave

> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  arch/arm/boot/dts/bcm2711.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
> index 4847dd305317..8bb46ae76a92 100644
> --- a/arch/arm/boot/dts/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/bcm2711.dtsi
> @@ -308,6 +308,14 @@ dvp: clock@7ef00000 {
>                         #reset-cells = <1>;
>                 };
>
> +               bsc_intr: interrupt-controller@7ef00040 {
> +                       compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
> +                       reg = <0x7ef00040 0x30>;
> +                       interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +               };
> +
>                 hdmi0: hdmi@7ef00700 {
>                         compatible = "brcm,bcm2711-hdmi0";
>                         reg = <0x7ef00700 0x300>,
> @@ -341,6 +349,8 @@ ddc0: i2c@7ef04500 {
>                         reg = <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
>                         reg-names = "bsc", "auto-i2c";
>                         clock-frequency = <97500>;
> +                       interrupt-parent = <&bsc_intr>;
> +                       interrupts = <0>;
>                         status = "disabled";
>                 };
>
> @@ -377,6 +387,8 @@ ddc1: i2c@7ef09500 {
>                         reg = <0x7ef09500 0x100>, <0x7ef05b00 0x300>;
>                         reg-names = "bsc", "auto-i2c";
>                         clock-frequency = <97500>;
> +                       interrupt-parent = <&bsc_intr>;
> +                       interrupts = <1>;
>                         status = "disabled";
>                 };
>         };
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
