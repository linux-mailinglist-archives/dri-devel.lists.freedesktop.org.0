Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB9785E46
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 19:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA7C10E47A;
	Wed, 23 Aug 2023 17:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7166B10E483
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 17:10:06 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-570f6c17c55so1137367eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 10:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692810605; x=1693415405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hyVSZ/uyEq53y0HZqdCOt35wbrFe7hx7mDP2krNpag=;
 b=ce7F6U5er550sOTJ5v0t0KspHLp18rI4QgdmsLVSjojk5+ABQOCjElioL2v8AK/aky
 hutJ9MuBmbZQdlw591t1ll9MRvw9yQtzJbyejYSefhVk/ABWHfZuSa9ULeSdNr7iVvzi
 FJRrmW1lFWa55bnF0NZSx3YQimzcB3a6FpktGP1kF9Km0AAy8VCU0SDR8FLxgAxzIkU3
 1xUcD7zDN8bD0VzbOmKCIew31ryPEbuqnOa3gfUVSWtiWSvD6gIGg9AVRIHD6oot2Odr
 0c/KdU143N2S/gnVjlc57J/xzOFvthseFZS0yjbc3eb9af5ewEV3GFmDqH7D4JJUKeDG
 ZN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692810605; x=1693415405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hyVSZ/uyEq53y0HZqdCOt35wbrFe7hx7mDP2krNpag=;
 b=OncWQLXMIsGXUfEqs30MU16PMypOHS7/7dN6Bd08BCOVpcC6G3SaxPrWLRFj7WNP3f
 L8Hoh6MKHCarRHm/mZ1J0Lcz1zhvH9JbtS+fIMFVg81v9h7mcw0w0XPuzBrpMcbhBsTl
 k9ZZa3Gg9AKDeRqXPZVx9TLteFkx8nj9HwcD+W4yiSD8YhKuzP9yxn26K9a26IZsoR35
 fWOqS2eV/TDUncVqTUcujsbLaIoME+zvANapClNTamjfCumqc72FGXe9/e5/Tluq0MEQ
 FYwB/2ivHC/he6Z8DtdxQcruZpDx3fi0b60A3WYWAbADcFwNkMfXhtHxX6X6muIF6UKr
 HzeA==
X-Gm-Message-State: AOJu0YwWsluZOGisVIRHPYLdvgq6okV/nQs8P97z7kqpHI1YfITLTU8N
 eEzUKAA3TB+yqG78ae+nNhrSTiSTrFQW6uDD248=
X-Google-Smtp-Source: AGHT+IE3etSktXpnieusxbMl+Ub2+aFioaxeHteDwuBa2je8Ed3KNdPCo5MMZ6APGWz+p++lAQyKiRRMwlgE5fAtwJU=
X-Received: by 2002:a4a:270e:0:b0:56e:9e98:2cfd with SMTP id
 l14-20020a4a270e000000b0056e9e982cfdmr9772071oof.2.1692810605284; Wed, 23 Aug
 2023 10:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
In-Reply-To: <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Aug 2023 20:09:28 +0300
Message-ID: <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 7:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Aug 23, 2023 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > On Sun, Aug 13, 2023 at 1:51=E2=80=AFAM Biju Das <biju.das.jz@bp.rene=
sas.com>
> > > wrote:

...

> > > It seems like this is a sign that nobody is actually using the i2c ma=
tch
> > > table.
>
> You can't know. The I2C ID table allows to instantiate a device from
> user space by supplying it's address and a name, that has to be
> matched with the one in ID table.
>
> > > It was probably added because the original author just copy/pasted
> > > from something else, but obviously it hasn't been kept up to date and=
 isn't
> > > working.
>
> How can you be so sure?
>
> > > While your patch would make it work for "anx7814", it wouldn't
> > > make it work for any of the other similar parts. ...and yes, you coul=
d add
> > > support for those parts in your patch too, but IMO it makes more sens=
e to
> > > just delete the i2c table and when someone has an actual need then th=
ey can
> > > re-add it.
> > >
> > > Sound OK?
>
> No. Please, do not remove the I2C ID table. It had already been
> discussed a few years ago.
>
> > Yes, it make sense, as it saves some memory

Okay, reading code a bit, it seems that it won't work with purely i2c
ID matching.
So the question here is "Do we want to allow enumeration via sysfs or not?"


--=20
With Best Regards,
Andy Shevchenko
