Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E02578101
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395B7995A6;
	Mon, 18 Jul 2022 11:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8AD99589
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 11:39:13 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id m13so4675940edc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 04:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WM+zWzeYAitwMFZLUVsc8lp6MA3Zpo/kJcizrD/8ssk=;
 b=OvcuKUIjR4uhqpfL8lpsxLQ88mCYxcDOZ5lSaz8YMU5SyNSpWm2LhWIoS9CC+qDuiX
 DI/fnwo811XGeH4U+R290EOyJleoAHOZMLhaBd4hEdDGJHO0ZVerBEE3gVl6te9BpcT4
 KyyXCEIlVZI9vzIm3Fjqb3WD+Kz4vqa72ux+kIiV8AtKAdtI87dFPLp0/j+Mpfxof+su
 lev/A8157qmlXkCgs9+5cRS0ruqiTC3/PHuZcO3JHcb+eMLKX823Z/MyUYWDhywL+lc6
 ZEQD7h68BhRbIcXy5EQnFOo4JXLrkrtrSYjrBnXa5BTwwYZFNpiLwNcI86j6oai3JcHf
 Kb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WM+zWzeYAitwMFZLUVsc8lp6MA3Zpo/kJcizrD/8ssk=;
 b=w/1ToVNZSRo51e8o4A33bvxGT2EdHeEU/GF1klywxQJajytEP4micQAFOM0P84FLiP
 TakVdSEw2FDJuAplZCBZyrsWoGs8f6cnw9ah3W80JJO/h7+Ifvc+uzTMyPM9HVsnBPSa
 ErpXyBBf50HSKvd9scceOhl7FVAmcR11Gr632GsHdXFYXlu+NAGjxdlK6hvUXOZsnpwO
 z9p9uWnB5ZdmoQGTsHEQhXfkD6ozy8iAz2VeKO6l2vyZk0bPBZQ1Rq8OSqoThxVctz54
 Kumrq+KVytNi0+JN1ENlOQLzzHe3lkFlg1idOh7/FowvPKmH/fMWzyZZ32DKNUOtgcDh
 eJZQ==
X-Gm-Message-State: AJIora9GxfNEOCwkknd8Fq96+wTRUBDyf0fmJY+HjY6bQXgApuBpbJVk
 BYXHEMnnnr8OpWj3PJWNLfpDseDl14nAGNjSZCk=
X-Google-Smtp-Source: AGRyM1uLSUr+2lvxiCg3cwvu9VMJCLD+uDi8ZOzhv3dgH0XROSPP5YW44n0Pb3saV+i0UvUB6nImoWisC6NYG7PACSY=
X-Received: by 2002:a05:6402:34c5:b0:43a:8f90:e643 with SMTP id
 w5-20020a05640234c500b0043a8f90e643mr35599070edc.88.1658144351737; Mon, 18
 Jul 2022 04:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-9-peterwu.pub@gmail.com>
 <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com>
 <20220718080831.GA31509@cyhuang-hp-elitebook-840-g3.rt>
In-Reply-To: <20220718080831.GA31509@cyhuang-hp-elitebook-840-g3.rt>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Jul 2022 13:38:35 +0200
Message-ID: <CAHp75Ve2_UcS9e3pJC2j4FBc21=S8878tQusyxNV1mXtQG423w@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
To: ChiYuan Huang <u0084500@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
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

On Mon, Jul 18, 2022 at 10:08 AM ChiYuan Huang <u0084500@gmail.com> wrote:
> On Fri, Jul 15, 2022 at 03:10:42PM +0200, Andy Shevchenko wrote:
> > On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

...

> > > This commit add support for the Type-C & Power Delivery controller in
> >
> > This commit add -> Add
> >
> Upper case? Or rewrite it as 'This commit is to add .....'?

Please, read this documentation [1] for better understanding. It
should clarify this and perhaps other possible questions.

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> > > MediaTek MT6370 IC.

...

> > > +       ret = devm_request_threaded_irq(dev, priv->irq, NULL,
> > > +                                       mt6370_irq_handler, IRQF_ONESHOT,
> > > +                                       dev_name(dev), priv);
> > > +       if (ret) {
> >
> > > +               tcpci_unregister_port(priv->tcpci);
> >
> > This is wrong.
> > You mixed devm_ with non-devm. Either drop devm_ *after* the first
> > non-devm_ call, or convert everything to be managed.
> >
> How about to add 'devm_add_action_or_reset' for tcpci_unregister_port?
> This will convert all as 'devm_' version.

I think it would work, that wrapper was designed to cover cases like this.

> > > +               return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> > > +       }

...

> > > +static int mt6370_tcpc_remove(struct platform_device *pdev)
> > > +{
> > > +       struct mt6370_priv *priv = platform_get_drvdata(pdev);
> >
> > > +       disable_irq(priv->irq);
> >
> > Why?
> > An ugly workaround due to ordering issues in ->probe()?
> >
> Yes, due to the ordering in probe.
> 'bus remove' will be called before device resource releases.
>
> Like as you said, another way is to convert all as non-devm
> version after 'tcpci_unregister_port'.
>
> If to keep the original order, 'disable_irq' before
> 'tcpci_unregister_port' can make the flow more safe.
>
> Or you can think one case if irq triggers after
> 'tcpci_unregister_port'. Null pointer occurs.
>
> Anyway, in next revision, I'll convert all to be 'devm_' version.
> For this remove callback, only 'dev_pm_clear_wake_irq' and
> 'device_init_wakeup' will be kept.
>
> Is this better?

Sounds like a plan!

> > > +       tcpci_unregister_port(priv->tcpci);
> > > +       dev_pm_clear_wake_irq(&pdev->dev);
> > > +       device_init_wakeup(&pdev->dev, false);
> > > +
> > > +       return 0;
> > > +}

-- 
With Best Regards,
Andy Shevchenko
