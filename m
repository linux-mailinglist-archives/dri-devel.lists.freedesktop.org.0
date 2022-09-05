Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F055AD0DB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB7E10E2D3;
	Mon,  5 Sep 2022 10:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2097D10E2D3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:57:38 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id a22so5859488qtw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=SceFooGsQvk4/DBXpk/M7nv2E1Tqfm+MkuaSRZ3qev8=;
 b=QgN1fKt4DP2kb7sAiv+5KFok8U8dxv0x5611ZTop3HKEETihbtz9RufJ5RUJvT6oy3
 NsDYXvFgWk/79gT0t031cWuTJ9+0anNKT0/QMVUymrmw27VD2+Q9Fvf/a4F1TUNnaeSG
 rqxNiZxP2226FfdS2mZJiVeLEcQ2F7NOQTCivGpJw3EJafbSCKZtnmajkVfO//JmwESc
 OQ+A5m2uZ9uWB9V0ddapJ9/fH/JlBtRhD0Pv/BF1sgrOUoMmJeKFvXNsijHb3izSghCC
 dWQbrWPcWtAWtUFpsLJaj3WsvtsNYlDXfe5EMqd/eXC/8JZqf2A/mHdQZ+FdhXMyXOQX
 cbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SceFooGsQvk4/DBXpk/M7nv2E1Tqfm+MkuaSRZ3qev8=;
 b=qpeU3yvHARtZN1hZqcwoGZ2SHMtYBynoO4aJLTKmSPXkq0gE2ALL0SqnD5DykBduDi
 GHUEWYMbcdJOHtKXJvwjvP7n004ulzBC7M+kHdQpFPfmGnUBSXdpZWZMGdPLJeMPid2s
 ar4WGlCWtDtSdpaVCLNNretMjL1/QCPGZGcSTKBSfnnbKt0ajzQUInu3ofJXS8bCOkc5
 bik23CjbsdIumrRwKP95CE7Dn0JS39/nOppskZTydRuMoLIcbA9LQRfRLXr5iPezdh98
 VQeeahnbEYgOvpJpk8uLJvf2OmF6ApN/uOgYH7Nz2YxDCBLAZniirGb6rn/+yKZk/lFR
 tTEw==
X-Gm-Message-State: ACgBeo03kNLP/E9xXWvUZhmekmPl6Fmzdqc4h0iFezLfM8IDDXSnodf+
 fqukPFWS+/wVaqmBMeyDunYCjK56boVlKgBY/CI=
X-Google-Smtp-Source: AA6agR60W0s2Xg2TAEJ7W+zD52eGjGAMZEZ33WklScUG5wc6dHREuBxFFHnQsCibmN0jWps5VKuSjG68kRfEhV6Vu4I=
X-Received: by 2002:a05:622a:40a:b0:343:77ba:727f with SMTP id
 n10-20020a05622a040a00b0034377ba727fmr39279991qtx.481.1662375457185; Mon, 05
 Sep 2022 03:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:57:01 +0300
Message-ID: <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
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
> I would like to limit (or maybe even remove) use of
> [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> a bit, so let's switch to the generic device property API.

> It may even
> help with handling secondary fwnodes when gpiolib is taught to handle
> gpios described by swnodes.

I would remove this sentence from all commit messages since it's a
debatable thing and might even not happen, so the above is a pure
speculation.


-- 
With Best Regards,
Andy Shevchenko
