Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F667565BCB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5423510F55E;
	Mon,  4 Jul 2022 16:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC1010E028
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 09:31:41 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id c13so4334355pla.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xIA0tkEJFCPwLmR+R6eKHNKrvI9a6bVM4TsihGfrld0=;
 b=f8MhiLRjvn4JhQhz9F64yCgS5B6jrH8tJwT1awj7AGv9RShuJdBVz84vc1kQVsx0Lv
 eNwaezjyn3nuI01xLjtA8+y0NZAqsqTswX489ZxWe/DK4qA3KOAt8JChBJylkfu6iBcj
 ORlmB+OW6RB+2+Vau8HlQetnTopYsjVTFjp0f9KRNoR/+YI371o5iIsodX7EUGlhLxKP
 kIepqqS2tlY+l7PfLRiLbmuc06ZAkcN8W3clHbhEfFPx2LGi5BU/JurrZIflfzIJK1dI
 KLvXaDm+sy2U5Xe0lntfK9VA1zVFQuJyC2Hbzq2cctn7nouM2bwK0yqcoPWSdeZyN5vE
 +/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xIA0tkEJFCPwLmR+R6eKHNKrvI9a6bVM4TsihGfrld0=;
 b=x/Ok4oeuNNqTbNicsFZTxCTPWhCZBp/qZ517vJnBMPx/PEjocJaXAzpe2IvXorba3T
 03guJFG4aHXKPVzxcfT0mcgfzRaianbVEas3l07t/YPChm+BceA1HoTdYYpIxWKp9j+V
 MMlJpCBIspKFCniJAAPMivRNMKjdSquLsz+VOI/8pZSSdlvqJcP/T6YydMAWPJXEGLS+
 XwefBhTMTohhTkc5aQaYzpclmBpQt2XaSNEPAEr2x5BL4imDISRgsF5wGJ/HILZXJhqx
 Fe6Qq+G5kTTInmsN9qcbZRuTvbJjjZoomVC8bcqbmsBzOpMVBAzqyozOnJ1sVywbCb8l
 qjFQ==
X-Gm-Message-State: AJIora+p0N/bYTRnvyjoPZKYQ/WxO1NvG35LglAepU10ioQna1ttAZ59
 ZScO4rYSMfhG+8orcoygZ3J4OEMmECH0oLysZ3Q=
X-Google-Smtp-Source: AGRyM1snqrRpQbd96zgAVBmjrPX1x2o3afFwTRTiOLpzM13U4eENpimphE3z0PHrUTRqdjm3Nu9HaCkQlEPGsPeCLlE=
X-Received: by 2002:a17:903:110c:b0:168:fa61:1440 with SMTP id
 n12-20020a170903110c00b00168fa611440mr34740455plh.149.1656927100855; Mon, 04
 Jul 2022 02:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-9-peterwu.pub@gmail.com>
 <YsKXcnys2Wa8Zz0p@kroah.com>
In-Reply-To: <YsKXcnys2Wa8Zz0p@kroah.com>
From: szuni chen <szunichen@gmail.com>
Date: Mon, 4 Jul 2022 17:31:29 +0800
Message-ID: <CA+hk2fYA3phYAoh+BFr0ddy9MR8Ro1WCoqBpa1UK2StwMtLyfQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] usb: typec: tcpci_mt6370: Add Mediatek MT6370
 tcpci driver
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chiaen_wu@richtek.com, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greg KH <gregkh@linuxfoundation.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Jul 04, 2022 at 01:38:56PM +0800, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add chip level mt6370 tcpci driver.
>
> What does this mean?  Please provide more information about the hardware
> being supported here so we know how to review this.

Dear Greg,

MediaTek MT6370 is a highly-integrated smart power management IC,
which includes a single cell Li-Ion/Li-Polymer switching battery charger,
a USB Type-C & Power Delivery (PD) controller, dual flash LED current sourc=
es,
a RGB LED driver, a backlight WLED driver, a display bias driver and a
general LDO for portable devices.

This driver is used for the Type-C & Power Delivery controller in
MediaTek MT6370 IC.

If we change the commit message to

"Add MediaTek MT6370 tcpci driver.
MediaTek MT6370 is a multi-functional IC that includes USB Type-C.
It works with Type-C Port Controller Manager to provide USB PD and USB
Type-C functionalities."

does this meet your requirements?
Or =E2=80=9CAdd tcpci driver for Mediatek MT6370 IC=E2=80=9D is enough?

Sincerely,
Alice Chen
