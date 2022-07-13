Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4757E5736D9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 15:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0700B884D4;
	Wed, 13 Jul 2022 13:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541CD9A925
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 13:07:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r10so9278387wrv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 06:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZDp5NtLIxNT/y/y4TV28JKQZE5KPsmeDwau7U2nvfbI=;
 b=ykcE/L76OyKjfmB6gW/9PEIXPb7KX9wbY5QZt6rzoJ7cx+NshQnf3zYFk9CJJmZ/WM
 Yjn5tpbDrFkjNkWS+WFrkqjSfGYuauzrhkLnPgPWJ+ijDPIFajS1TTDtmC2uQEI2eXJq
 v/PjSpgG/525Lm1jJ94ez4EFFEytapEdMWKLq79xQRBWSawK2YgrGJjhf+6mviSVU3q3
 kOx9C54FFQzStrBSdTBuFlQdgkenCIZH2XWgb8DLkaqKQZ3XbPUtvaJN7A3d1aNdPv+L
 MOY47XiJ+MoxEz7XvBmRhEiBH0MhBUFHBMZQFzRyd4+1IQ/e0LRFMgzPqoPQQ++2EeCE
 bFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZDp5NtLIxNT/y/y4TV28JKQZE5KPsmeDwau7U2nvfbI=;
 b=FrsCsMAh1G5F3QXaRT93TCMVPtvkJ1hqmtISt2Rq+X41ykbWtV+N0G/wY9DBnGYcbv
 XZXlgS5NT+FNFoFd0IWar0MIGXT3xYxNE5Aciy/ArHK0/pKY5XM4lSytZV4papvDo3Lq
 mE+7cfhC9hDKJyLiaGFPmXJoubLGHfEhK8tv0jKleuEcsE8xqRpSffXQIhUu2dlTxkor
 MGRqEmiUIn1XkCmle+XarInjzcHkMW6bVjVbvBz1KQMzZHwtmlLfzklX068/sy2pc2Je
 A0E25vtce8xvbMhBiWLy+amg3pzZTRycYlVPFEN7NuJQu3wdJSiudm0+DWTb0zP78QLy
 ZyfA==
X-Gm-Message-State: AJIora8ymSjoM6v3ZuHixdpShvkG3b7GAel+hrpkibCX4g4nAsNV2arh
 447MCQ06IDc3WmXtoUVhGQiNYA==
X-Google-Smtp-Source: AGRyM1v3Wejcmcef1+JLx2OGnt8FIDdBIQxbNYoMtF21Qn+Urzq7T2tg4YCX+P2hq8vPNX2sKjEQ7Q==
X-Received: by 2002:a5d:5747:0:b0:21d:65e9:be07 with SMTP id
 q7-20020a5d5747000000b0021d65e9be07mr3162978wrw.215.1657717658781; 
 Wed, 13 Jul 2022 06:07:38 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b0039749b01ea7sm2628398wms.32.2022.07.13.06.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 06:07:38 -0700 (PDT)
Date: Wed, 13 Jul 2022 14:07:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <Ys7Dl1oApfww27MJ@google.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
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
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jul 2022, Andy Shevchenko wrote:

> On Wed, Jul 13, 2022 at 12:53 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> 於 2022年7月5日 週二 清晨5:14寫道：
> > > On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> 
> Please, remove unneeded context when replying!
> 
> ...
> 
> > > > +               brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> > > > +               brightness_val[1] = (brightness - 1)
> > > > +                                   >> fls(MT6370_BL_DIM2_MASK);
> > >
> > > Bad indentation. One line?
> >
> > Well... if indent to one line, it will be over 80 characters(or called columns?)
> > From my understanding, it is not allowed, right??
> 
> It's allowed to some extent.Use your common sense.
> Here it's obviously broken indentation.

Refrain from going crazy though - hard limit is 100 chars.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
