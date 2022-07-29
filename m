Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F20584EE3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 12:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE10E10F359;
	Fri, 29 Jul 2022 10:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC3010E21A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 10:34:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i13so5280378edj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=Zk6yHET57f/wYXBe4yiexZ1AAMItVqOz1Jv1kut5E8E=;
 b=IsM5N0dJ2jSYwlQl9rbwt+OLNPEKaCRVIniuh9/fK2UA5cEWqol8qEt2eY1KAFImh0
 xgKtFlDvRwmal8EgGb4Op+XBno/E/HH8Bxy8BPnkUU2nIxz44g1exMkT0mBgnzczAkOM
 jEEdvopg/k2e5S3/4OLDkdml7fNMgGZXJmK2pxORFJYNKUIs9dcrZpTPKP/PyTRRiDnU
 4AbNyblEPeQVwrctPIK+zUGSC8WmuyEHQXK0TllYSTMZqHtKbYQ+rO3pNAksc0uoqvC9
 H7uLLtXO9go/uW0Ye5nZLjgde4OuJHwsb257PiiTAEQZboCcDlee7NJuUdg+WQoQdZGF
 8sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Zk6yHET57f/wYXBe4yiexZ1AAMItVqOz1Jv1kut5E8E=;
 b=qVeehy+jjsBUQFmATKjnB6OERH6dbJF3jRXx7gV0fCpGBLNgbWLIMNHhMVV2H5sMtj
 YITB5sZSW8gFk2oAtG6ID0Kuc6of0Dnd5kYU3Q7b67iFSvw7/+rMDUkjRzQGDxi0a2Cr
 zDIfnFswMwZ0Wr72mTU0KCAA0fAuXgxDWfOkeqQCMfr23qgn9DaldGC9IGAxJpf6vQlV
 fXTyMxb9yWqbuIpIHY5I3PPS+yCpD5GsUdf0ffkVmc2NWUy8nsXBP/IgqLtN8dRzvrOw
 m2KrjfWJcmxx7ra5/bHRjTF+QavnB9mC2ZNG9Y2l+A/HtpCi0lCkrQedeYGDPdEKJOuZ
 qx4g==
X-Gm-Message-State: AJIora/A9HZsR/k+M0Y+TKfi5gKERDeNFO6SHRxj/e7BHap+bW/fs7f6
 bNyQFptGBQbbbLuSsh0XZ3hWEUSib4fXwbtVAxM=
X-Google-Smtp-Source: AGRyM1thJcc6VzDaeaE+EySViKuCRpu348iS7jC1QI3PpaFzkcmRpNMn9JsAnkR2MfsFuw188nD7QnVuUJohoFdGXiU=
X-Received: by 2002:a05:6402:501d:b0:437:e000:a898 with SMTP id
 p29-20020a056402501d00b00437e000a898mr2923947eda.265.1659090892398; Fri, 29
 Jul 2022 03:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-13-peterwu.pub@gmail.com>
 <CAHp75Vf85_uzA9fRxTizbPJxODcXFpM4wuU6DxP2j9UA47B_2g@mail.gmail.com>
 <CA+hk2fYcw0szJ7bBvfEjtyUE_Z61_A1vFWmPSdhe-gmd5jbC6g@mail.gmail.com>
In-Reply-To: <CA+hk2fYcw0szJ7bBvfEjtyUE_Z61_A1vFWmPSdhe-gmd5jbC6g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Jul 2022 12:34:14 +0200
Message-ID: <CAHp75VctFBkPYumu-4+iGNATt=zE7HJ3n0kRSdDduJZ=h6FDEQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: szuni chen <szunichen@gmail.com>
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
 Linux PM <linux-pm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Fri, Jul 29, 2022 at 8:17 AM szuni chen <szunichen@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=
=9C=8825=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:51=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrot=
e:
> > >
> > > From: Alice Chen <alice_chen@richtek.com>

...

> > > Signed-off-by: Alice Chen <alice_chen@richtek.com>
> >
> > This SoB chain is wrong. Prioritize and read Submitting Patches!
>
> After reading the Submitted Patches,
> ChiaEn Wu wasn't involved in the development but he submitted the patch,
> So, ChiaEn Wu <chiaen_wu@richtek.com> should be the last SoB, right?

Right. Submitter's SoB is the last SoB in the chain.

> I will revise SoB to
>
> Signed-off-by: SzuNi Chen <alice_chen@richtek.com>

Not sure I understand the SzuNi <--> Alice transformation...

> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
>
> If there is anything else I need to fix, please let me know. Thank you.

--=20
With Best Regards,
Andy Shevchenko
