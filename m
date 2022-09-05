Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC15AD0E8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F7010E2F5;
	Mon,  5 Sep 2022 11:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB7910E2F5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:00:21 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id b9so6096036qka.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZeMo2PWVWCCE4kicxMFOEAyAOyDB4gnn7oyqH8IifhU=;
 b=CTOoiLvwwBkvtH32c6w60zEVvHcTnoXO3ACu0Ys4kWjZ2v5rcWsBDH+vdDx4TQZ9hd
 zoXITcV3yQclTjF5bSmp+qDBSGLQc9kK7p/Q6MVruLaf+yQ2ieawJUD0vtr6jFmlqqb5
 VM0HxdCbbCyt9e3B0tD+nb2kHG9B39a4RXdVZ+gBaJ13JI/Bhg4cILs9FZoegyTQ+F+6
 8fPJkAuVnPubU2LSPwAtno5IP1SguIVrVU1uTopFif2u8b6jICrnPWEduG2jMRNf+dw3
 TOSVD6xw70ivt4BkffpLzGj1KiFTvRTD6M32zkdDHIex4lTV6wIEhedGMFPH+v+dK0yQ
 6+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZeMo2PWVWCCE4kicxMFOEAyAOyDB4gnn7oyqH8IifhU=;
 b=eyWGMtv+h/lhHWFSfe/3chZEo/J+Q79OBQBJKsfoENhTyyQOq/2vd1j3Q98TVASMjy
 05MY8wrJTVo3C4oGc+j4aaIssKRENvhRfzw8bVs7w3sKeOdf5xQmGLUAUVthJNTNbGAZ
 0aeMMAnGzwaazwKjAi3ML7c57zdGRSLZmU7Vb8e+UOVSYxa0W/BI+uIzrAzSimtMs5he
 2DSbZ0xkQDaJ+yGC0Nbv8Y0ATZ4I80uWTV0vWENaP/i4+Nm8psuTA1HQSt8Ab/JfOrzj
 Zl0I5Dxxgu+VYGMqkclQ8EmfId4kOh4xS6kp6a3eronlgd357PV6BVNwPiWUUPvm423f
 LNMw==
X-Gm-Message-State: ACgBeo24cpWXQ0er0UIqQkWG0w9S8fY7ircqT7624uTSCzn29n65kPQJ
 76H+LI0N82T0B2XROiW6cnvaBAhj2vc/BcuCkVY=
X-Google-Smtp-Source: AA6agR5QfYlB3faOXg1Xo9fT2kr66lBEoMt1tUwQEmf4Hjj69mFUh3WyFYB6EU5cllnnLi+qXnfCb/Dp4e9d3zghof0=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr32736370qkp.504.1662375620030; Mon, 05
 Sep 2022 04:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:59:44 +0300
Message-ID: <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using devm_gpiod_get()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> device property API.
>
> I believe that the only reason the driver, instead of the standard
> devm_gpiod_get(), used devm_gpiod_get_from_of_node() is because it
> wanted to set up a pretty consumer name for the GPIO, and we now have
> a special API for that.

...

> -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> -                                                   "nvidia,phy-reset-gpio",
> -                                                   0, GPIOD_OUT_HIGH,
> -                                                   "ulpi_phy_reset_b");
> +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> +                                      GPIOD_OUT_HIGH);
>                 err = PTR_ERR_OR_ZERO(gpiod);

What does _OR_ZERO mean now?

>                 if (err) {
>                         dev_err(&pdev->dev,
>                                 "Request failed for reset GPIO: %d\n", err);
>                         return err;
>                 }



-- 
With Best Regards,
Andy Shevchenko
