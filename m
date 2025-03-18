Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2529A67807
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 16:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A9C10E062;
	Tue, 18 Mar 2025 15:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aot3C0I4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B7810E062
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 15:37:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 585975C58A0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 15:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E394CC4CEDD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742312251;
 bh=2FADrrGOuhJNxGZb/t5P0+jQhpdMvnVntdR+ZZPNqr8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aot3C0I4ulAoFThJpUgw9CGlUg7DamiOAMz2opBd0lYxFvlPz2nvBhJIjl8ahiED0
 iMkvptmtcSQCJ+ypeS54FrMggkoHfgq7p9tCN7FiYCqcd+wabzbOn7JhMIeUH14pUD
 vsNu596aRkWfCIeoEYMuk4D0+N7u1PBTUGAjeuqBa8CrVIly4RvaK0MAcvZq/THWdI
 bhkbqZqzyj+YbD0h162GzWpyiRx5KdETmvJZXv5g97ICPgA5QefTcMAk+kfDLCCR6c
 UhuEhoA4R6CckL2vV674KmCKz5hVn8M1CPajZz1ma4UD92Fy/FLiPftaYER4pa/zsG
 mTkq3ONU1jCMQ==
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5e5b572e45cso11005856a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:37:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX82b0BP+sZQj7cgAm+Jchzh28ruA0t8wkXx5wJVcIy/572g+4fp8M4Y2G2VnZI8j8k4rw2QvvoGlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy58N55fK9nd2QRiVmDtk17RMjSaziTp03ogI3orf5Ds/FYnktu
 LzbnDYgyPAn7QWGSmxl9YaGsa4OsNkezvkWRKqcgwdZiiKKfSwsjaBIOhYYDiGBhwxxUnMWZMNy
 PW0sj+gD38plKLz/jqPEhoSOLjQ==
X-Google-Smtp-Source: AGHT+IFxNikh/zPyi87/yPKISRD75uRN3LN7OEe83oBU+Jm0RfN/NRF8Jwu1275PkN7yYWLFFVO4RlTc7PstjVcm0CI=
X-Received: by 2002:a05:6402:84d:b0:5e4:9348:72d4 with SMTP id
 4fb4d7f45d1cf-5e8a09faa0bmr16499578a12.24.1742312250511; Tue, 18 Mar 2025
 08:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
 <20250226-initial_display-v2-3-23fafa130817@gocontroll.com>
 <20250314210652.GA2300828-robh@kernel.org>
 <PA4PR04MB7630094413C8E1F3D715EE23C5DD2@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <20250317-massive-calm-bat-43ff61@krzk-bin>
 <PA4PR04MB7630DA5DF63C18530B86AB59C5DF2@PA4PR04MB7630.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB7630DA5DF63C18530B86AB59C5DF2@PA4PR04MB7630.eurprd04.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Mar 2025 10:37:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKiWyMMqZwdvbZp8pebqDYrA7MwoD3AGAST6iixXzU0LQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqdfYH-dOSKs1kb8D0C16udXHv06QqBb0LECvEA4U-xF3d7uL0jX9WyoUw
Message-ID: <CAL_JsqKiWyMMqZwdvbZp8pebqDYrA7MwoD3AGAST6iixXzU0LQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
To: "Maud Spierings | GOcontroll" <maudspierings@gocontroll.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Mar 17, 2025 at 5:42=E2=80=AFAM Maud Spierings | GOcontroll
<maudspierings@gocontroll.com> wrote:
>
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, March 17, 2025 11:34 AM
>
> >On Sat, Mar 15, 2025 at 07:32:28AM +0000, Maud Spierings | GOcontroll wr=
ote:
> >> >> +required:
> >> >> +  - compatible
> >> >> +  - reg
> >> >> +  - reset-gpios
> >> >> +  - interrupts
> >> >> +  - sync-gpios
> >> >> +  - i2c-bus
> >> >> +  - slot-number
> >> >> +
> >> >> +additionalProperties: false
> >> >> +
> >> >> +examples:
> >> >> +  - |
> >> >> +    #include <dt-bindings/gpio/gpio.h>
> >> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> >> +
> >> >> +    spi {
> >> >> +        #address-cells =3D <1>;
> >> >> +        #size-cells =3D <0>;
> >> >> +
> >> >> +        connector@0 {
> >> >
> >> >I find this being a SPI device a bit strange. Is there a defined SPI
> >> >device that every slot is going to have? Or the connector has SPI
> >> >interface and *anything* could be attached on it?
> >>
> >> So a module slot is like a pcie slot, it can be occupied or not, and w=
hen
> >
> >But which buses...
>
> I don't think I am fully understanding what you are asking of me. The
> module will always be an spi device, that is the main communication bus.

Okay, that clears up whether it should be a SPI device or not, and I
think it should as SPI is always used. The 2nd question is what does
"gocontroll,moduline-module-slot" mean exactly. Normally, the
compatible implies how you interact with the device (or what is the
programming model). For SPI, that's what do the SPI transactions look
like to begin with. Does the slot spec define that such that every
module is the same? Then when it comes to different module types, are
those discoverable (e.g. PCI has vendor and device ID) or will you
need "compatible" to make that distinction?

Rob
