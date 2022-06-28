Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA5555C0CE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 13:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67EF12AAE1;
	Tue, 28 Jun 2022 11:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA7312B359
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:53:11 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31780ad7535so114066727b3.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XNYX9WokN0679cD0D/hGygcBjjhtjrHu3X0w/VyXDQg=;
 b=p+9m14+6QsTCZ3pdtSfJn+WEHQmDbBfmFgyzcxQlQAFSE6IZY+I2k0I60ILS1T6sE6
 5tfPY5UZgBU3FRb4NSW//C4Rx1Ok8ZtMgaPCeNnseoVwEVJEBVFNSrjEMdO0/aE06dMF
 bO4JyL56j2waskXr5NRKktwhHstWwfoOWUIKXEVeyeHLnlyJ69uPTTPHfcyFtQdII3ir
 DcrqRmp4yuJtYhQikKQO4K74tylJuh4wPkW3XPaMf8NJTGy1r4c5kq60uETiZZASMznb
 ZWFQkb1edLWF2vaOXd4DP8s5wnw2b9QM2i0kdqnmPmBiANAXfuc6nrwo6+J80NhmvMlD
 X06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XNYX9WokN0679cD0D/hGygcBjjhtjrHu3X0w/VyXDQg=;
 b=QEDhLaGOTOo3CUY7g6W4k+zEMwWxKFx3YadMY4C04MgJ8rrgIfAf4bU8snkV5p7mMf
 XIh2W5pCpqDRaVl5btSLeHcIj07EuOHjPWR+wodZl44qX/5gPDLWEQOqLLaeQJkRmTeV
 w/YkueAv2EUHIxwIQRdgPbG13Qn6tB7Dx7nFxPWjMyx39JqhogQ280HsFEdr7TvfQuaF
 4Cz2D/sjQRm+3inHhYqOxUvH2haC6Lxij75/lBWFSnXPiJA0WYzHo6Yl6Sd+njBYB+ek
 8vHCdOylCOaK2TSiBo1FDozQyrPvODPfPtMyMKsZsTl+DJ3h2218LYB51/ARahB5rTGz
 yJ6w==
X-Gm-Message-State: AJIora/um8/bmSPbSYjwCnEmQyrTtNdMmP2I0G8rzrkqe5Lkl8i5NhAu
 awVOQoFMg536Sn8nnqB8YT3kUjgm7M3o2Z111mk=
X-Google-Smtp-Source: AGRyM1t1yvSVmh1UzQdiLz0fOsWVO4xcBW2SRjndRAGwREFZZ1pQOPCCdyP/RInbExx8gXe7S6V6QoaMvGta8vqrn/0=
X-Received: by 2002:a81:2386:0:b0:317:6586:8901 with SMTP id
 j128-20020a812386000000b0031765868901mr20865815ywj.195.1656417190958; Tue, 28
 Jun 2022 04:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-8-peterwu.pub@gmail.com>
 <CAHp75Vd95sEQz8y4ZcviUKaC9ic27yitR+VCwkfb38MTTe0mkg@mail.gmail.com>
 <CABtFH5K_vB5Rmo+2zAJ8PuMeMvC9x-yhDL93ByOLD+gc2maQYg@mail.gmail.com>
In-Reply-To: <CABtFH5K_vB5Rmo+2zAJ8PuMeMvC9x-yhDL93ByOLD+gc2maQYg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Jun 2022 13:52:34 +0200
Message-ID: <CAHp75Vc0t+3p2TGs9kZ-6JP8y-+cmSF++9uCfbWAgFhapteh-A@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
To: ChiaEn Wu <peterwu.pub@gmail.com>
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

On Fri, Jun 24, 2022 at 12:19 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=
=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E5=87=8C=E6=99=A82:01=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Thu, Jun 23, 2022 at 1:59 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:

...

> > >  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)  +=3D intel_soc_pmic_bxtwc.o
> > >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     +=3D intel_soc_pmic_chtwc.o
> > >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  +=3D intel_soc_pmic_chtdc_ti.=
o
> > >  obj-$(CONFIG_MFD_MT6360)       +=3D mt6360-core.o
> > > +obj-$(CONFIG_MFD_MT6370)       +=3D mt6370.o
> > >  mt6397-objs                    :=3D mt6397-core.o mt6397-irq.o mt635=
8-irq.o
> > >  obj-$(CONFIG_MFD_MT6397)       +=3D mt6397.o
> > >  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)     +=3D intel_soc_pmic_mrfld.o
> >
> > This whole bunch of drivers is in the wrong place in Makefile.
> >
> > https://lore.kernel.org/all/20220616182524.7956-2-andriy.shevchenko@lin=
ux.intel.com/
>
> hmm... So shall we need to cherry-pick your this patch first,
> then modify the Makefile before the next submission??

I don't know what Lee's preferences are, but at least I have these
options in mind:
1) wait until Lee applies my series;
2) take that single patch to your tree as a precursor.

In the second case you will need to send the series with that patch as well=
.

...

> > > +#define MT6370_REG_MAXADDR     0x1FF
> >
> > Wondering if (BIT(10) - 1) gives a better hint on how hardware limits
> > this (so it will be clear it's 10-bit address).
>
> well... This "0x1FF" is just a virtual mapping value to map the max
> address of the PMU bank(0x1XX).
> So, I feel its means is different from using (BIT(10) - 1) here.

Perhaps a comment then?

...

> > > +       if (ret < 0)
> > > +               return ret;
> > > +       else if (ret !=3D val_size)
> >
> > Redundant 'else'.
>
> I'm not quite sure what you mean, so I made the following changes first.
> ------------------------------------
>        if (ret < 0)
>               return ret;
>        if (ret !=3D val_size)
>               return -EIO;
> ------------------------------------
> I don't know if it meets your expectations??

Yes.

> > > +               return -EIO;

--=20
With Best Regards,
Andy Shevchenko
