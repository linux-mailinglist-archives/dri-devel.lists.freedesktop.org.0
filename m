Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86C55597A8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 12:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE3C10E35F;
	Fri, 24 Jun 2022 10:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742EC10E35F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 10:19:47 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id h85so2226142iof.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RgSnFxwGzpmjm+p7ZnjxYjteXl5sPOJEGrU4Scgygt8=;
 b=Ksbgww2SpxbTKSeTwjSi+p9D7IjbSHXpPB6L2alhOT0rPaZ3Jdcwu4C8kKWHxpZsNs
 pDZuW0yEoNBO0Hch6e/i/MyP8cEMrpcp0cPmroROelXTAnV/iMJJ35xzaUxnSQ80bmAt
 FltIIv4lxmVG83sudMnDJngHdXAPymOVnnH0oSIsuglA6T+ThlE9cu/QXsyrD1halwkq
 4K3YpgtFmjOQS4dXGRT42MgvZSQwT5yZfxY8tb0iUMGjYycTBPfNix0kpEQLPHOYAs/N
 BZkwaH866WD1HBeagt9fSRhQwdsNkEWRuT2z/k8aQQco4QLvUdvBC6kIAJI/qCmJqBhj
 IgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RgSnFxwGzpmjm+p7ZnjxYjteXl5sPOJEGrU4Scgygt8=;
 b=MubTgeMkEmr7pO59eVabgBJZRC2/jd3JOUtLMg4kvtrxGZMatnzevkgZgm3j+eJSdl
 mQV3oQmsofVY61S33vjiAq4DL6V5UGFSv/Mmxp/uB3EZLReqYXxCJz4dYsa8x2dFYt5n
 riUnZv8G+t1P0xaRqIHT74wYMK5xK7hVkwbrD+83bfPiTq+kVPtOY/uwkug3ewzvtzOm
 VwYDnt4Vfegu5HwjSys9/TBbTnen+DtcPa8iWOBxfoo1QG4olrHl//l6r/U8Ej5Tl3UN
 AfxxdJs++EAdPXyMy7qF4HwnGSCPmu31e6Vs4tfgTu3YsQ9xrQ2CvmtOLY/dNl5c0Ob/
 91iw==
X-Gm-Message-State: AJIora948amOCqnPtX9GVWwm41RNtfj4W8OfMRZ78fyr0RdAUIro5JDW
 V/GgC6xaoRS+fMjbYH0VCIwGecHzoHvgSnIPJmM=
X-Google-Smtp-Source: AGRyM1vutyoXzSan9RSfWSnID47w2e/WTQN3pASpI53PVkOjX+Rz7wJCkOQl3pTTKmSWx4A4FnD/sHVFYCZM+YdWIVo=
X-Received: by 2002:a5e:990f:0:b0:673:4f01:3a2a with SMTP id
 t15-20020a5e990f000000b006734f013a2amr4553113ioj.76.1656065986866; Fri, 24
 Jun 2022 03:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-8-peterwu.pub@gmail.com>
 <CAHp75Vd95sEQz8y4ZcviUKaC9ic27yitR+VCwkfb38MTTe0mkg@mail.gmail.com>
In-Reply-To: <CAHp75Vd95sEQz8y4ZcviUKaC9ic27yitR+VCwkfb38MTTe0mkg@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 24 Jun 2022 18:19:35 +0800
Message-ID: <CABtFH5K_vB5Rmo+2zAJ8PuMeMvC9x-yhDL93ByOLD+gc2maQYg@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
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
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for your helpful comments! We have some questions below.

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E5=87=8C=E6=99=A82:01=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Thu, Jun 23, 2022 at 1:59 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 MFD support.
>
> ...
>
> > +config MFD_MT6370
> > +       tristate "Mediatek MT6370 SubPMIC"
> > +       select MFD_CORE
> > +       select REGMAP_I2C
> > +       select REGMAP_IRQ
> > +       depends on I2C
> > +       help
> > +         Say Y here to enable MT6370 SubPMIC functional support.
> > +         It consists of a single cell battery charger with ADC monitor=
ing, RGB
> > +         LEDs, dual channel flashlight, WLED backlight driver, display=
 bias
> > +         voltage supply, one general purpose LDO, and the USB Type-C &=
 PD
> > +         controller complies with the latest USB Type-C and PD standar=
ds.
>
> What will be the module name in case it's chosen to be built as a module?

OK, we will add related text in the next patch! Thanks!

>
> ...
>
> >  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)  +=3D intel_soc_pmic_bxtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     +=3D intel_soc_pmic_chtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  +=3D intel_soc_pmic_chtdc_ti.o
> >  obj-$(CONFIG_MFD_MT6360)       +=3D mt6360-core.o
> > +obj-$(CONFIG_MFD_MT6370)       +=3D mt6370.o
> >  mt6397-objs                    :=3D mt6397-core.o mt6397-irq.o mt6358-=
irq.o
> >  obj-$(CONFIG_MFD_MT6397)       +=3D mt6397.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)     +=3D intel_soc_pmic_mrfld.o
>
> This whole bunch of drivers is in the wrong place in Makefile.
>
> https://lore.kernel.org/all/20220616182524.7956-2-andriy.shevchenko@linux=
.intel.com/
>

hmm... So shall we need to cherry-pick your this patch first,
then modify the Makefile before the next submission??

> ...
>
> > +#define MT6370_REG_MAXADDR     0x1FF
>
> Wondering if (BIT(10) - 1) gives a better hint on how hardware limits
> this (so it will be clear it's 10-bit address).

well... This "0x1FF" is just a virtual mapping value to map the max
address of the PMU bank(0x1XX).
So, I feel its means is different from using (BIT(10) - 1) here.

>
> ...
>
> > +static int mt6370_check_vendor_info(struct mt6370_info *info)
> > +{
> > +       unsigned int devinfo;
> > +       int ret;
> > +
> > +       ret =3D regmap_read(info->regmap, MT6370_REG_DEV_INFO, &devinfo=
);
> > +       if (ret)
> > +               return ret;
> > +
> > +       switch (FIELD_GET(MT6370_VENID_MASK, devinfo)) {
> > +       case MT6370_VENID_RT5081:
> > +       case MT6370_VENID_RT5081A:
> > +       case MT6370_VENID_MT6370:
> > +       case MT6370_VENID_MT6371:
> > +       case MT6370_VENID_MT6372P:
> > +       case MT6370_VENID_MT6372CP:
>
> return 0;
>
> > +               break;
> > +       default:
> > +               dev_err(info->dev, "Unknown Vendor ID 0x%02x\n", devinf=
o);
> > +               return -ENODEV;
> > +       }
> > +
> > +       return 0;
>
> ...and drop these two lines?

OK! We will refine it in the next patch!

>
> > +}
>
> ...
>
> > +       bank_idx =3D *(u8 *)reg_buf;
> > +       bank_addr =3D *(u8 *)(reg_buf + 1);
>
> Why not
>
>   const u8 *u8_buf =3D reg_buf;
>
>   bank_idx =3D u8_buf[0];
>   bank_addr =3D u8_buf[1];
>
> ?

We will refine it in the next patch! Thanks!

>
> ...
>
> > +       if (ret < 0)
> > +               return ret;
> > +       else if (ret !=3D val_size)
>
> Redundant 'else'.

I'm not quite sure what you mean, so I made the following changes first.
------------------------------------
       if (ret < 0)
              return ret;
       if (ret !=3D val_size)
              return -EIO;
------------------------------------
I don't know if it meets your expectations??

>
> > +               return -EIO;
>
> ...
>
> > +       bank_idx =3D *(u8 *)data;
> > +       bank_addr =3D *(u8 *)(data + 1);
>
> As per above.
>
> --
> With Best Regards,
> Andy Shevchenko

Best regards,
ChiaEn Wu
