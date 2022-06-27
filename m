Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA7555BB21
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 18:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE1310E7D7;
	Mon, 27 Jun 2022 16:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84CA10E7D7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:28:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k22so13831686wrd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 09:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RFbscGfZ1HvqkolFfPgOHxRAqCYKsO6AGhI1CWcF3U0=;
 b=QL9P5fYJiAGJ0cVberqQxZgecUlCyO035Rs/RHERScTvlSGjFZWJwcJ83NKx7icnCf
 MmmkqeK7/MKYHkhThvS+4I5n6eilA1iv0cTdd1jM4UXHDDaaVEXvSnXIRzJWnCUCUcUi
 hfbpR0k3AwYuP7wFzDx1Qb4iWIpTN9nBpMOsMz5YzOvQfMZ+aNGdk1BwqtUaNtHKCBDC
 fA9t5x0TJ4kWUQmeUPz8VsbAvV+0a4AUoZiJIyO7qENghiYMyKTM8whwQHTooEBVZnfa
 hv7NO7jkwT4JYF/WPaOvNMBn/r4c0lJo2uE2cyoUPVH1HBvXxtPYqUUryaiaIppTOHk7
 Xteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RFbscGfZ1HvqkolFfPgOHxRAqCYKsO6AGhI1CWcF3U0=;
 b=jeJWEip0BxG8zVBA2q3oWbU2lxneobGFmemLNsMpXxe6CxIU3eeMOJVRcUrecwtt8M
 LZRTvgpegMWJ2pZVEkWW592ynSoTcToMzzrKeSyymkHs9spuLo+OFDRQMIUJild/Pml8
 bVPwTSTjtDZNDeFd0tuDawmwUFvt/kqALQ2DgVqbPpmHn4Hzh3E+kDjXNLa1Qla9/KMH
 CwPTNyXJvnM0v2TI/EJ68J1Fgda6OSl0rhUDiduy2PYaaANMpApudr941nDdzynM8riC
 TdgZpxgXOsHWkDlxuqtdHNgYfdJOmAPNemeUPP2k6B19co4z+kDGg9wxah1rQ+sb3DGd
 PPIQ==
X-Gm-Message-State: AJIora/ou09o+m8tCxUfpMQGhwNwGF1HwPBNkunoNo2bbemMXLqFR4YN
 bKZWnhGkG23vpnepPK+A+q8Vrw==
X-Google-Smtp-Source: AGRyM1tWghCzrhvaQKuNnG4CtD67zaV7MVCuo84J73jDL9LXJFGuDL/uN51RLsUeyYqHqBL/FNulUA==
X-Received: by 2002:a5d:5966:0:b0:21b:80b5:ecc3 with SMTP id
 e38-20020a5d5966000000b0021b80b5ecc3mr12930472wri.130.1656347292409; 
 Mon, 27 Jun 2022 09:28:12 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 m17-20020adfe0d1000000b0021b866397a7sm11132854wri.1.2022.06.27.09.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 09:28:12 -0700 (PDT)
Date: Mon, 27 Jun 2022 17:28:09 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v2 08/15] mfd: mt6370: Add Mediatek MT6370 support
Message-ID: <YrnamaUx236MsNQa@google.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-9-peterwu.pub@gmail.com>
 <Yqph8jwHU8rPooJA@google.com>
 <CABtFH5KLVQFYOBGZ--9+s4GrHXbsDao-yL-KCFwL3FD_kbNhjg@mail.gmail.com>
 <Yrm7NTID16g8gM5t@google.com>
 <CABtFH5L7B_kEvG5E2Um5EANEScJPTfQthyLNfCbvoHq_YDpXxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABtFH5L7B_kEvG5E2Um5EANEScJPTfQthyLNfCbvoHq_YDpXxQ@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux PM <linux-pm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, szuni chen <szunichen@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[...]

> > > > > +#define MT6370_IRQ_DSV_VPOS_OCP              124
> > > > > +#define MT6370_IRQ_DSV_BST_OCP               125
> > > > > +#define MT6370_IRQ_DSV_VNEG_SCP              126
> > > > > +#define MT6370_IRQ_DSV_VPOS_SCP              127
> > > > > +
> > > > > +struct mt6370_info {
> > > > > +     struct i2c_client *i2c[MT6370_MAX_I2C];
> > > > > +     struct device *dev;
> > > > > +     struct regmap *regmap;
> > > > > +     struct regmap_irq_chip_data *irq_data;
> > > > > +};
> > > >
> > > > Can we shove all of the above into a header file?
> > >
> > > Well... In Patch v1, we put these "#define IRQ" into
> > > "include/dt-bindings/mfd/mediatek,mt6370.h".
> > > But the reviewer of DT files hoped us to remove this header file, we
> > > put these "#define IRQ" in this .c file.
> > > Shall we leave them here or put them into the header file in
> > > "driver/power/supply/mt6370-charger.h"?
> >
> > Where are they used?
> 
> Sorry, I wrote the wrong path last time...
> What I should say last time was to put them into the header file into
> "driver/mfd/mt6370.h"
> These "#define IRQ" are just used in "driver/mfd/mt6370.c"
> I’m really sorry for making this mistake...

Yes, that would be fine.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
