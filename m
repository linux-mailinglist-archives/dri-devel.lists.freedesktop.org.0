Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27275078C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F31410E4EE;
	Wed, 12 Jul 2023 12:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6AE10E4EE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:07:22 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-783549ef058so307666939f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689163641; x=1691755641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=js9A+LroJpKyjly1c+m3wIj1/hOhy81EZTbGk7lLc9w=;
 b=QJDFf6a2qcjPXjiPm97eZlxkt0nwP+Cy792/OnHUSjEnI5bVgRJOZlFiDEhc9oPi6V
 8Ukf3UAhhORVbhHiJLowqUCvznS3tlqmqp+oI2JYlf1FRg/EVkPBXdub7EjPGyE8LFcQ
 vJY4YUMoSH/dFomzmMcsTFyx0k/FBuivXQWCR9tm6o33eGWo8GmiSO8lRHiZDWPKVnc1
 34Kl8LzDooi5FS626w9o36EXvlrHFUt4EOMEg3wWkSxeC7szYcDl6zD0/II0YC5WkiLP
 eLrjT4FAVw7NGfD33CKrdeg86PxkCNS24anRmf7ctv8V9cgolZXJlFBrEDyeLw+TMIBz
 Al9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689163641; x=1691755641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=js9A+LroJpKyjly1c+m3wIj1/hOhy81EZTbGk7lLc9w=;
 b=KJkv2KgxLH+YNdhG8694R7016k43JCvIM8oPXpx1c2FFJufYcE1/oFF5pMgh+rZrfQ
 VDUU6vfzqL5A46TShLJmSwuNAmDCMAWb9x/Lz8HuJPkA5wMVSkj14rfKrSxdHB6YFTWi
 CiIwwSrETd5mx1bUiCebEL17Ykl39iizebPkoCDgCZjRvonP1F01GsbgdcHiFSwEBNer
 27io4ESXnx4KeINOQY1Lg/ABHDzx7doRSJyUiWL2Nb+Qpszm6BpX2XiasgDY1MRvqpiY
 lS/c1bX9X1qlIZVsc1mKBy0uKn3BSCjL/j/+VeLu2hnts3rtgoki0j8fagDuR0akSDf+
 wlCA==
X-Gm-Message-State: ABy/qLYGRSCPwJcNhlgVeAuVUXEVsv9Uy+V3jMOm8xMSGWDWWeTpGpyg
 1mvB/m/xoKieMnDdsghllpwJfXNwgh8pVU2QIdg=
X-Google-Smtp-Source: APBJJlETKzUMF2OAd9kTWv7lkEdSNYU4Mqa9EYSDW3Wz3B8ikNrnIT5lFXObmJx47ZNPP7nh7b1m66J9NjVwYTQm1Zg=
X-Received: by 2002:a5d:8848:0:b0:783:606b:740f with SMTP id
 t8-20020a5d8848000000b00783606b740fmr18734048ios.15.1689163641507; Wed, 12
 Jul 2023 05:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
 <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
 <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
 <CAO9szn0OuKW+-JZMs3TPUHiwLCe6cUPcsUq+og64K2utMyZpqQ@mail.gmail.com>
 <CACRpkdb5stXKb7FNk_FC-PKduCngRX3sZTbzcxN+kRskz78fuQ@mail.gmail.com>
 <CAO9szn3oTzrrwiyr91H14ep7OPUkA-SDST3CSQAQHvFFnkJWfA@mail.gmail.com>
 <0d43e653-32cd-b25e-40fa-6f0571048467@denx.de>
 <CAO9szn20RY3uBDceyUJ1S+gb=FN8Hd5qqMfOSbitHFyFCZ+iLg@mail.gmail.com>
 <8b0ae1d1-c769-1f55-0452-4bbc62da133b@denx.de>
In-Reply-To: <8b0ae1d1-c769-1f55-0452-4bbc62da133b@denx.de>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Wed, 12 Jul 2023 14:07:10 +0200
Message-ID: <CAO9szn1QdB5WGshuyCOGqb0qbBWHqoikeiMkk+bNGhAF5TX5ew@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Marek Vasut <marex@denx.de>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Jagan Teki <jagan@amarulasolutions.com>, sam@ravnborg.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all,

sub, 8. srp 2023. u 14:53 Marek Vasut <marex@denx.de> napisao je:
>
> On 7/7/23 17:26, Paulo Pavacic wrote:
> > Hello Marek,
>
> Hi,
>
> > =C4=8Det, 6. srp 2023. u 17:26 Marek Vasut <marex@denx.de> napisao je:
> >>
> >> On 7/6/23 17:18, Paulo Pavacic wrote:
> >>> Hello Linus,
> >>>
> >>> =C4=8Det, 22. lip 2023. u 10:22 Linus Walleij <linus.walleij@linaro.o=
rg> napisao je:
> >>>>
> >>>> On Wed, Jun 21, 2023 at 5:09=E2=80=AFPM Paulo Pavacic <pavacic.p@gma=
il.com> wrote:
> >>>>
> >>>>> A lot of modifications to st7701 are required. I believe it would
> >>>>> result in a driver that doesn't look or work the same. e.g compare
> >>>>> delays between initialization sequences of panel-fannal-c3004 and
> >>>>> panel-st7701. I think it would be optimal to create st7701s driver =
and
> >>>>> have special handling for st7701s panels. If there was a flag for
> >>>>> whether panel is st7701 or st7701s it would end up looking like a
> >>>>> mess.
> >>>>
> >>>> What matters is if the original authors of the old st7701 driver are
> >>>> around and reviewing and testing patches at all. What we need is
> >>>> active maintainers. (Added Jagan, Marek & Maya).
> >>>>
> >>>> I buy the reasoning that the st7701s is perhaps substantially differ=
ent
> >>>> from st7701.
> >>>>
> >>>> If st7701s is very different then I suppose it needs a separate driv=
er,
> >>>> then all we need to to name the driver properly, i.e.
> >>>> panel-sitronix-st7701s.c.
> >>>
> >>> I had in person talk with Paul Kocialkowski and I have concluded that
> >>> this is the best solution.
> >>> I believe I should rename it to st7701s due to the hardware changes. =
I
> >>> would like to create V5 patch with driver renamed to st7701s.
> >>> Please let me know if you agree / disagree.
> >>
> >> If I recall it right, the ST7701 and ST7701S are basically the same
> >> chip, aren't they ?
> >
> > I'm currently exploring all the differences. There aren't a lot of
> > differences, but there are some.
> > So far I can see that default register values are different, new
> > previously unused registers are now used and there has been some
> > reordering of how info is placed in registers [1] (data bits are in
> > different order). Moreover, instructions to some commands have been
> > changed and meaning of what data bits mean [2][3]. Also, new features
> > have been added [2]; there is now PCLKS 3 for example.
> >
> > You can see few differences in following images. Same images were
> > attached in this mail:
> > [1] https://ibb.co/NmgbZmy - GAMACTRL_st7701.png
> > [2] https://ibb.co/G79y235 - PCLKS2.png
>
> Ouch. I wonder if this is still something that can be abstracted out
> with some helper accessor functions like:
>
> if (model =3D=3D ST7701)
>    write something
> else
>    write the other layout
>
> Or whether it makes sense to outright have a separate driver. The later
> would introduce duplication, but maybe that much duplication is OK.

I would like to create new driver because panel-st7701 seems to be
outdated and is using non-standard macro (ST7701_WRITE()) and for me
it is crashing kernel 5.15.
Does anyone have similar issues with it?

Br,
Paulo
