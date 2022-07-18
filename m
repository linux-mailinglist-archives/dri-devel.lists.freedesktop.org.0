Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46B578481
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 15:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419801127BD;
	Mon, 18 Jul 2022 13:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6A911A4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 13:56:29 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so7387351wmb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5GaiY4B+fVcmnXKAwsi7m8Aj4lGUBvR7I/9W6/qWXhE=;
 b=d6a2HGJ1DOesvRkrVZgSQ6iPEldBTUlBgQ9k3NnGUVcyNgxyKIcTc2kdsPDQKUOOsh
 4J/nvEVxTTl0E4onnZS0zUwKWxO9pjnNCxaD0wWN9PVUybjFPl6RI42KIuQHh4vfkShP
 fJQlXkKDNfpR7KD5Tx3SaGwhuYeDulAK9P9Z9Y+u2LOt3QOnTyc5mgmLl+C/m4bqct+H
 giOxHhFobOt82+YV6AxC1RpEI/zA+Ycz3NIWz/ErQN2V/axhvGGex1JNxkWjgMyy5t2n
 hhs2muTFQoUTJSosvO9Qpp180LKtT7CoNF5pYFKvDX2EJhZBU36QFMOIJKTt5qcIpZQi
 /qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5GaiY4B+fVcmnXKAwsi7m8Aj4lGUBvR7I/9W6/qWXhE=;
 b=2/2UfD+ZEfbWwukoGZL3Wem/vKwjG4la2yt0jQpxdm6cMN/7guGxKZkOEnTiXbxCLD
 mQ6Fh7Xgf/M/RP9eeP1gEeCWMvu3p3V8z/EalqFOXqhOARsmCu6gm2+Ub2Mn9669RT/c
 Ab4HlPzazaL+Nu8sAidRg+UmGYfMEsrGZYGUWbudCPYRbrgqBx4G88SOssUumF01s+EJ
 xq/XsnlHZ05xuytAGKtJt0jATkPIWbdnZAH65Ca1Kto57cDt5Ezv0MIRYVd341heahCG
 0L58Tz2ID3v9rLkFjdlj5mjANPZZi1oUgIZbryzOUah3oAcrzIqjDF5f2TCTG411PXSL
 zR6w==
X-Gm-Message-State: AJIora9uV8EpS4RQyhvUsLyq646XDF2rl1l+z5/HrrHJv3G23czCji3u
 2f4YKCZu5hAEUOMQybmNEVMfjHhEGTtcdip+mdk=
X-Google-Smtp-Source: AGRyM1t+b+B57G30zmJ6SDH+MUo5HsflVXfg85sd+e8uS0SrrTs9lUsnJSmOWUJajxJe7O8JYC1jvg/HjWwDmFR7Nok=
X-Received: by 2002:a05:600c:19c8:b0:3a1:792e:f913 with SMTP id
 u8-20020a05600c19c800b003a1792ef913mr32475753wmq.182.1658152587885; Mon, 18
 Jul 2022 06:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-9-peterwu.pub@gmail.com>
 <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com>
 <20220718080831.GA31509@cyhuang-hp-elitebook-840-g3.rt>
 <CAHp75Ve2_UcS9e3pJC2j4FBc21=S8878tQusyxNV1mXtQG423w@mail.gmail.com>
In-Reply-To: <CAHp75Ve2_UcS9e3pJC2j4FBc21=S8878tQusyxNV1mXtQG423w@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 18 Jul 2022 21:56:15 +0800
Message-ID: <CADiBU3-DbJpD_pyGaOsh8EF=0NpCWgUP5T=RHgxXzwqZzwCyQA@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=
=8818=E6=97=A5 =E9=80=B1=E4=B8=80 =E6=99=9A=E4=B8=8A7:39=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Mon, Jul 18, 2022 at 10:08 AM ChiYuan Huang <u0084500@gmail.com> wrote=
:
> > On Fri, Jul 15, 2022 at 03:10:42PM +0200, Andy Shevchenko wrote:
> > > On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wro=
te:
>
> ...
>
> > > > This commit add support for the Type-C & Power Delivery controller =
in
> > >
> > > This commit add -> Add
> > >
> > Upper case? Or rewrite it as 'This commit is to add .....'?
>
> Please, read this documentation [1] for better understanding. It
> should clarify this and perhaps other possible questions.
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml#describe-your-changes
>
I'm thinking why to change it from 'add' to "Add'.
Ah, I misunderstand it.
> > > > MediaTek MT6370 IC.
>
> ...
>
> > > > +       ret =3D devm_request_threaded_irq(dev, priv->irq, NULL,
> > > > +                                       mt6370_irq_handler, IRQF_ON=
ESHOT,
> > > > +                                       dev_name(dev), priv);
> > > > +       if (ret) {
> > >
> > > > +               tcpci_unregister_port(priv->tcpci);
> > >
> > > This is wrong.
> > > You mixed devm_ with non-devm. Either drop devm_ *after* the first
> > > non-devm_ call, or convert everything to be managed.
> > >
> > How about to add 'devm_add_action_or_reset' for tcpci_unregister_port?
> > This will convert all as 'devm_' version.
>
> I think it would work, that wrapper was designed to cover cases like this=
.
>
> > > > +               return dev_err_probe(dev, ret, "Failed to allocate =
irq\n");
> > > > +       }
>
> ...
>
> > > > +static int mt6370_tcpc_remove(struct platform_device *pdev)
> > > > +{
> > > > +       struct mt6370_priv *priv =3D platform_get_drvdata(pdev);
> > >
> > > > +       disable_irq(priv->irq);
> > >
> > > Why?
> > > An ugly workaround due to ordering issues in ->probe()?
> > >
> > Yes, due to the ordering in probe.
> > 'bus remove' will be called before device resource releases.
> >
> > Like as you said, another way is to convert all as non-devm
> > version after 'tcpci_unregister_port'.
> >
> > If to keep the original order, 'disable_irq' before
> > 'tcpci_unregister_port' can make the flow more safe.
> >
> > Or you can think one case if irq triggers after
> > 'tcpci_unregister_port'. Null pointer occurs.
> >
> > Anyway, in next revision, I'll convert all to be 'devm_' version.
> > For this remove callback, only 'dev_pm_clear_wake_irq' and
> > 'device_init_wakeup' will be kept.
> >
> > Is this better?
>
> Sounds like a plan!
>
Already did. Just to double confirm the changes.
Thanks. All are clear.
> > > > +       tcpci_unregister_port(priv->tcpci);
> > > > +       dev_pm_clear_wake_irq(&pdev->dev);
> > > > +       device_init_wakeup(&pdev->dev, false);
> > > > +
> > > > +       return 0;
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
