Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED0B6FB99F
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B43710E0E8;
	Mon,  8 May 2023 21:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901ED10E0E8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 21:28:08 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-24df758db1cso3493989a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 14:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683581287; x=1686173287;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CBp9p/uYaxi06hfRt45Jfs/gvw/XMrWCbWQr51fRckI=;
 b=G+jtUkmJEGKtOIVlB1RLnusjVD7s5WH8jEykBI3T+p3wREB6Hz7cddVts23Rk9aenL
 XoXxoQOKK5CspEKZ9YgTwXtSX8Ggara9foZC11GZhmPDCJzrWCRYWXSwyubdOXzVSHWM
 ftnwFgcGAeyMrP1VA51kR5vUlAxFvsbXBQ+ogyCGSfzGTAyTHlc3a85ujRd0nP/Akg+g
 hUDc8bgPWakGrLPBIdziZpqnPp2aPO6qHtY5LskY1H9Ufzo/7if59XlgnH2qU8lGU7E2
 1OSxXrsAUX80sO1KkU8iUVZVxcGQJLG/dBQs3GODDg1tYGRPXThJN5QAfwPxUStfyJZ+
 euxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683581287; x=1686173287;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CBp9p/uYaxi06hfRt45Jfs/gvw/XMrWCbWQr51fRckI=;
 b=BlnCikhSR8cKOvqbyeDcs0WDBpjM2Ow9LBLryOKW9lR6XtRFKuL5C/u1fAEBZu+zLl
 unshqM/40qCeHExg4FDCH2KJNfkU33yIVyxdg6VCFHSVlgyobb+QJ7HAu0JIswcTlntT
 4zrTX8Vpnlkqoy5afMaSalU03rGa7KkGDj9oAmOVVf/Kieys7xHPP3/zG2N6GuBoGeu2
 /5z6z2Q4OPyeO4vfuZ4Rw50/yijphll50UdICGZybtVQaKV/loAG3qgrHhF7GwvF+dNm
 M5/Svlp25AolTSAHGO+dfj6KiAM7UZVsmLYMidD4ve6yjsNPEa/fy0shxOh+yOQBb/Wx
 spEw==
X-Gm-Message-State: AC+VfDyf49FVYYImDk1HXqW47TbWdFIFhWgUZZZY47R2LCxo3F9dOeqt
 B2AUOL8PXb9RFfI6ro4d7+w=
X-Google-Smtp-Source: ACHHUZ4SKZcFOEk4rh3wU8Xlt4Wg/5LelB0TU7HIWEOKGANquhYmCFYPj5iGkqtKuBTaj8e5e9UbBQ==
X-Received: by 2002:a17:90a:b401:b0:23b:2c51:6e7 with SMTP id
 f1-20020a17090ab40100b0023b2c5106e7mr12079044pjr.21.1683581287314; 
 Mon, 08 May 2023 14:28:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4d1:db5a:dbba:cd34])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a17090a579800b0024dee5cbe29sm14992974pji.27.2023.05.08.14.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 14:28:05 -0700 (PDT)
Date: Mon, 8 May 2023 14:28:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] Input: ads7846 - Convert to use software nodes
Message-ID: <ZFlpYff6I5V6JiH1@google.com>
References: <20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org>
 <20230430-nokia770-regression-v3-1-a6d0a89ffa8b@linaro.org>
 <ZFVGMiuRT+e2eVXw@google.com>
 <CACRpkdZUXOTOK9CObdXuHQx4PMD3ykMKco8X5ijchkZ8cEmQvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZUXOTOK9CObdXuHQx4PMD3ykMKco8X5ijchkZ8cEmQvA@mail.gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-spi@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 11:23:44PM +0200, Linus Walleij wrote:
> On Fri, May 5, 2023 at 8:08 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > > -     return !gpio_get_value(ts->gpio_pendown);
> > > +     return !gpiod_get_value(ts->gpio_pendown);
> >
> > This needs to be
> >
> >         return !gpiod_get_value_raw(ts->gpio_pendown);
> 
> There is no such function. The gpio descriptor runpath simply assumes that
> device trees can be trusted.

Sorry, this was supposed to be gpiod_get_raw_value():

https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib.c#L2854

> 
> > I looked at various DTSes we have and they use a mix of active high and
> > active low annotations, so we have to go with the "raw" variant for now,
> > and then update to normal one once we update bad DTSes.
> 
> I just sighed and fixed all the device trees :D

Yeah, we we can land the DT fixes ahead of the driver change that would
be great. Otherwise we need a temporary application of
gpiod_get_raw_value().

> 
> Yours,
> Linus Walleij

-- 
Dmitry
