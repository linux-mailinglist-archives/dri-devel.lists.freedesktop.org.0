Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022955C0D1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 13:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EDF113BB0;
	Tue, 28 Jun 2022 11:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DAA1130C1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:55:09 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id l11so21732158ybu.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WRlzJEXIDSC/xppUDMk3dCziyjCMe9bw9g7ZjtMlNWc=;
 b=CmaAQlqVxTtwAwTMBcNHdcD5nQ8/1n9uY6sAAnGoXMm/bskTVcJe0doxfjfSuV4DDM
 ycJrmTEU7M9ompmrsazJrcgK8CBOlHlKxkeOt5AKb7PaHVBJ5BdmBtpKhaL/omLeJwKd
 z8KIWABeC7iqGcV8umJupiQ+jv33fn1pYiubviGcSU1JMg/YFdU/oLBYxHNEyLAXNJ7q
 CXrLCTZFp+lpvSdjP1qxtjhI+7PnKczCA1dk/JaN/g81TGDN+1OIJ68dTwZdWHARiZdv
 fb/ZpWPoCUVwTZnMjHEKZ783H7+4wqhvDfhyEwNsJoST3WRImOzRQCQJwalBEqCZd6jE
 Fw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WRlzJEXIDSC/xppUDMk3dCziyjCMe9bw9g7ZjtMlNWc=;
 b=eM12RsUU03pkZfWhmUUu6EI6WBHMRVQevZHSn2O3Dz6p6x9kRvFkbrkjF875NHcfPG
 ifSU3/K18VMX1x4lzHBUBoybAc9e6pWjV1lBIvcqYBaN8TNAYM7P7KqGbD2XmiMSH8pc
 7kSKkZN9NPEwY7maYk/2m0bFItlHKs0fx0SFWdfSKfW46P1xLNX4NGa+9AcHIaGu8EBK
 Pt1BdfMHVvc9GQMmIYBHIRWqETPvWVDTGWC2P9PodvgBh2E40wRCcHI5e7W/SXrx0/As
 Wzxg/7GZvOWbz4DJBpH5Da8HdfN420CRpARHvqRFs0Ivabk2pIclKVkuwq4G51MbhfUA
 xCPQ==
X-Gm-Message-State: AJIora+L0org78TwHdYhxMmIYXL2CrsKN0DlNrHcr0VuZaG+5e5Uk6Nd
 Btl0EBPE6m6N57oStso/3PUwlGJlkUsrOpIQEW0=
X-Google-Smtp-Source: AGRyM1uykJWizq1yWSU8bYm0BHbWS+35APefPp+3MlNtqzzo6MB05yQElDVVW/E20r0RIxop4VWi/8sWSqknbKaV00s=
X-Received: by 2002:a25:ca0a:0:b0:66b:4e6c:e094 with SMTP id
 a10-20020a25ca0a000000b0066b4e6ce094mr20612051ybg.296.1656417309029; Tue, 28
 Jun 2022 04:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-10-peterwu.pub@gmail.com>
 <CAHp75VdgxR9aFQmi_MPrX=t7RMnKDiLAwWMvxbpW9OoQMJkKyw@mail.gmail.com>
 <CABtFH5+YLpYdWNsy1DwkKf19L6THo5NYvQ8e3rpo9wkTS9HxwQ@mail.gmail.com>
In-Reply-To: <CABtFH5+YLpYdWNsy1DwkKf19L6THo5NYvQ8e3rpo9wkTS9HxwQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Jun 2022 13:54:31 +0200
Message-ID: <CAHp75Vccc3xx29DQUMdwEfPz4k3Zwn=T5g24KAzEw4Y8KOp62A@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
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

On Fri, Jun 24, 2022 at 12:33 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=
=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E5=87=8C=E6=99=A82:19=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Thu, Jun 23, 2022 at 2:00 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:

...

> We got a notification from Mark telling us that this patch has been
> applied to git.
> ( https://lore.kernel.org/linux-arm-kernel/165599931844.321775.8085559092=
337130067.b4-ty@kernel.org/
> )
> So, should we need to make any other changes in the next submission?

You may do the followup(s) to address all or some of the comments
depending on the case (e.g. good to clean up code with dev_err_probe()
use).

--=20
With Best Regards,
Andy Shevchenko
