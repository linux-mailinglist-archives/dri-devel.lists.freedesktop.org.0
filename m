Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E1584B92
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 08:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E5F10E037;
	Fri, 29 Jul 2022 06:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D951110E037
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 06:17:24 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id o3so3744058ple.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 23:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EW499GBzYHaTH/WArZ0WtZvIkRlpsncxTw1RlPqz+v8=;
 b=bBJrwZNNbNwZOSdpiHnZjxTBlhq5e5F5z/aB01/7Rhm7XVlQWB/jv1YB3Yg3stPpPN
 SmPojYXgxob/8myvBqE/AYKB3hUIDzGgtgzp4td+2Rutu5SZSMSBz+TEPl7HNs7Bb9MW
 W7TCxTINNO2IXJYHAUFDEo60ceS/hW+jhm95xlptfVEjnS/+i/uxEzpBJqVXlteEWYKP
 MLSVJZ2NRzFuZR5K2IulKBp8EOOR/C3KOurSc/13nA+jBRKeS6G6Ni3gVaAmjbINYeTP
 Y/exdADOpBiQOL0wbDkY7ixd3HtrsRWGX3QW7Rcr/xwq05d0Ejbdfk37De6Lis+ytz3+
 Mzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EW499GBzYHaTH/WArZ0WtZvIkRlpsncxTw1RlPqz+v8=;
 b=nScOGdFEdWCc+0KLnWx5cov5UX/qvsCbgdkHkeWbxI+h3TUr4B410hXJDrV8uWXouK
 S/7/6gRcz5TguT47KqZ4MXCqK3hILbb0B2WcHPXW+5Yx+oi7eNrRTs2pfh3mSPLNc7aF
 KJe51y874VQU0PQXIzA48adNWSwE0XTpH+sGP2pq0I0h0ajiKAwMYMYPBgpN7thkQlMV
 qNnTWE03Yj+y6Pip0Bae3cAvO+1rG3hdsFfokLaC2jce6lLHp8qyQHeDWjo3jH7zGAEn
 fqQAzWoT01doxoQV+AFiyRzgflILbxsIVTP8XNwJ5fPEayLFDuo44PiFWztSzQccpHu9
 SWqg==
X-Gm-Message-State: ACgBeo21WyXcQJpLIqtXVbETAtgwVmmrXubiT9i+gCbi3LmCyAynsLkR
 Gi4RPeiYTW3eUNVNpa4NIKw/CnOPSXVCSAyh6V8=
X-Google-Smtp-Source: AA6agR5CfpBYT1/n0Fz3b0mpL30Y1BQpcR5ZJ1q53vOkI+o8r7h1QJKT9bGnP/JXhqgwA8TQcF5sWeEJfeZ5+jaoGc0=
X-Received: by 2002:a17:902:f646:b0:168:e2da:8931 with SMTP id
 m6-20020a170902f64600b00168e2da8931mr2450692plg.84.1659075444381; Thu, 28 Jul
 2022 23:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-13-peterwu.pub@gmail.com>
 <CAHp75Vf85_uzA9fRxTizbPJxODcXFpM4wuU6DxP2j9UA47B_2g@mail.gmail.com>
In-Reply-To: <CAHp75Vf85_uzA9fRxTizbPJxODcXFpM4wuU6DxP2j9UA47B_2g@mail.gmail.com>
From: szuni chen <szunichen@gmail.com>
Date: Fri, 29 Jul 2022 14:17:13 +0800
Message-ID: <CA+hk2fYcw0szJ7bBvfEjtyUE_Z61_A1vFWmPSdhe-gmd5jbC6g@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
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

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=
=8825=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:51=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: Alice Chen <alice_chen@richtek.com>
> >
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> > LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> >
> > The Flash LED in MT6370 has 2 channels and support torch/strobe mode.
> > Add the support of MT6370 FLASH LED.
> >
> > Signed-off-by: Alice Chen <alice_chen@richtek.com>
>
> This SoB chain is wrong. Prioritize and read Submitting Patches!
>
Hi Andy,

After reading the Submitted Patches,
ChiaEn Wu wasn't involved in the development but he submitted the patch,
So, ChiaEn Wu <chiaen_wu@richtek.com> should be the last SoB, right?
I will revise SoB to

Signed-off-by: SzuNi Chen <alice_chen@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

If there is anything else I need to fix, please let me know. Thank you.


Best Regards,
Szuni Chen
