Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55065F3F11
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 11:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D814C10E3AA;
	Tue,  4 Oct 2022 09:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92E310E3AA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 09:02:18 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bj12so27382001ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=MaE+VYQSDiY92kjGX4h2jSkOyA7XFQBMOSLljPLW3Fs=;
 b=kOrG/KsOgzPslDjCA/2wVvVO8wIY+Cw63qRlS34Bc2Gp0ysABkZAdfwKG3GoOZ3Qov
 t4oapKrVCSblA5nYqcznfIMp6w4ItdU0n5J/SYR+0Hceg0Jqz/Q6SNrd3vhaaCFEqQdD
 zeNuwz5e8oIdedEly8BXGR4rPJLr85M/PVlA/PCGFIq+Ggxp+UmRpOxC53yYJetG5DYL
 Q+HgO/POXHyWYUav/27yx9hiPsg7rGyNS5edBzAQjt7AAACiph3U60WYVAvU393riZGy
 0XVfHUXoDmykiCYSMMFso6leDg6qDMmNQAV3bd8hLOxObTYNZhQ4bCRzK59pirN9TatC
 3v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MaE+VYQSDiY92kjGX4h2jSkOyA7XFQBMOSLljPLW3Fs=;
 b=fg69EfqY2OTyjOnaM0VJBjZu19n9jqomSm11uDSaTCS/WCaKxGlnsIrq5OJmEvZKZL
 +6kMsR2+Qj/Rgs5YfXfrMrigrPzjH6UwJCL94xSh07aCMbvL6/S2bH7H0CulqsVXB1JV
 UNZ5UeSF0GyJA4s4ontqoUi6GDiNtwQDfEVEFil5Nlo7XEK+cFnmLmxlaoHw/TvxpJ9N
 jxOZUsm4ZuVUxV8o3MWs/p7tQ01sfICEor/3XXYnXBZzAa4ezdQr+5iDTm/KTDN2iU3B
 DMbAbzCHz9lOpDetpas1TEF+wlq9D0DUFkM4OLrql11x0wRdV3/fJS/HoIaXHxh4OJuY
 Hi2A==
X-Gm-Message-State: ACrzQf0bc4FovImfwwhwyjn5ka6V9FjCsimbwqJEbVQsPQglSxDl+aFC
 JdI/feDyoSoZBYk9QF63x8aWFv6m++xhw/B0pYqpsQ==
X-Google-Smtp-Source: AMsMyM4xndojXaNMN2ex8pnWSc6yo524zQadaqbeACW6jhGMMrzwPKdUyNStMO3sE6xymDGbSG30wCrcXWZUR4MZZtg=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr19070022ejt.526.1664874137461; Tue, 04
 Oct 2022 02:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <YzN6A9Y20Ea1LdEz@google.com>
In-Reply-To: <YzN6A9Y20Ea1LdEz@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 11:02:06 +0200
Message-ID: <CACRpkdZF9TVA3+3pgjqm_cnhfPO6p0oOT=2jrqFafMCHe2cwDg@mail.gmail.com>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 12:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Properties describing GPIOs should be named as "<property>-gpios" or
> "<property>-gpio", and that is what gpiod API expects, however the
> driver uses non-standard "gpios-reset" name. Let's adjust this, and also
> note that the reset line is active low as that is also important to
> gpiod API.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I think the gods of Open Firmware will try to punish you for such
incompatible changes. But I have long since renounced them.

> Another option is to add another quirk into gpiolib-of.c, but we
> may end up with a ton of them once we convert everything away from
> of_get_named_gpio() to gpiod API, so I'd prefer not doing that.

We need to know if i.MX is shipping device trees stored in flash,
or if they bundle it with the kernel.

In the former case, you have to add quirks, in the latter case this
patch is fine.

Sascha, what does the Freescale maintainer say?

Yours,
Linus Walleij
