Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C84E6FB9BC
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7688310E307;
	Mon,  8 May 2023 21:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0719810E307
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 21:31:18 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-b9a6f17f2b6so27331767276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 14:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683581477; x=1686173477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOJR/20LVKyz48EAyeHc1+jVArD8eFRaiPVz2llKJYw=;
 b=xnPwIs1cwDo2FfYER/sCJ/da+7w70ojR2vcIjoTIwWXCv32mMF1zm1BD4+lfb2YBZM
 a2JVJMgplb8WbXqgCdHgK8Kp72gs89jO2wf+8i72UAlWKsMEO+QAvE2kzbL6W+zsK4XX
 5Z8iTG2eG+u2fgFxWPNmnpwDmCvRMpfx0fMcptbYfNamY9350JY8Gd4qdqq2mPQh9kC0
 +x56ZfIKBMwAlE8P63WHOLZVXUP3U77r1pEjelQEPWycVNYaZZsW7RV6EqwWY1pIciet
 mUJNXjEV6P9b/N9Sms+auwR08F+s4xsHpxn7JhrpRdBY15Z66VnYReC0HO7LXkTpsCWj
 0ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683581477; x=1686173477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOJR/20LVKyz48EAyeHc1+jVArD8eFRaiPVz2llKJYw=;
 b=HuY/+l+yLqVdLE69MLsJul45oS0/m+aASbyFpubSuHzSrTaA/0OxeMiNKjuL/kfnNf
 qKrywUMn374oX7BQhiAF+8GWVnLKA2/q9VvmSsewAYP8x8maBX5+RBtPL8pag5ddKjjK
 NWKQJ/gk4s55X3DK7ddM3sl/QcrlDnyJjiVv1H2cNEJEYN2yQ7G4/Q5Qo+Wr6u0UDCdh
 65CZlTTXsDeluH7rK/jglZGenakTqgR/Q5kui++w5TOr+UHAZ/zIqjgAbZVyc1/Rvmnl
 c/EVkkqK1zb5aM3Rg0yxr97mDKtZX4aDWVPKWgudvlQY0329wSW+E8e91BVdB48GARVF
 SZBg==
X-Gm-Message-State: AC+VfDyF6dSUCFM7spwYHrq7+7ROI5Zki3NBkcM0ZPgXzb944xKGpV3o
 i052LJXGslzrWYdi7PLwiUIQp9fkGA4i7qN2+MOoiQ==
X-Google-Smtp-Source: ACHHUZ58fReQQ4pRCBtoCz9Lw0P3GVuCrDW/FKsG0+nk/YgPWCXp8EO7CBeqYU//QyxCun6JDuY2iPWmdeq6/W2Qfd0=
X-Received: by 2002:a81:4c4c:0:b0:54f:54c5:70d with SMTP id
 z73-20020a814c4c000000b0054f54c5070dmr13840092ywa.20.1683581477497; Mon, 08
 May 2023 14:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org>
 <20230430-nokia770-regression-v3-1-a6d0a89ffa8b@linaro.org>
 <ZFVGMiuRT+e2eVXw@google.com>
 <CACRpkdZUXOTOK9CObdXuHQx4PMD3ykMKco8X5ijchkZ8cEmQvA@mail.gmail.com>
 <ZFlpYff6I5V6JiH1@google.com>
In-Reply-To: <ZFlpYff6I5V6JiH1@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 May 2023 23:31:06 +0200
Message-ID: <CACRpkdae4+0vsJS71G6dR5PEpMw13JGJAJr9Jyf2T+Z8gOgoxQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] Input: ads7846 - Convert to use software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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

On Mon, May 8, 2023 at 11:28=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, May 08, 2023 at 11:23:44PM +0200, Linus Walleij wrote:

> > > This needs to be
> > >
> > >         return !gpiod_get_value_raw(ts->gpio_pendown);
> >
> > There is no such function. The gpio descriptor runpath simply assumes t=
hat
> > device trees can be trusted.
>
> Sorry, this was supposed to be gpiod_get_raw_value():
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib.c#L28=
54

I missed it, I should have very well understood you meant that one...
I just read the file too sloppily.

> Yeah, we we can land the DT fixes ahead of the driver change that would
> be great. Otherwise we need a temporary application of
> gpiod_get_raw_value().

If the patch is fine I will send it to the SoC tree and ask for it to be
applied as a fix.

Yours,
Linus Walleij
