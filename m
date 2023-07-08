Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB074BC83
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 09:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385CA10E004;
	Sat,  8 Jul 2023 07:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDB910E004
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 07:11:07 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-51d7f350758so3619633a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688800263; x=1691392263;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvXK5oEuIY7lWNWkNWObt3ZTrcKC50SIxSS9jwfZwto=;
 b=pQh9ovKmeP5uMdOcC4/2gCZkr5SDhnTm5223+rjPs4zzF1s1c5xpmBjDjgKZB1sWP8
 rLBxmxzTCm8zWxsVoAq9OMyizB3Ykm/r3Tqy7uGY38dUDqcNCig6UscRly3ZlU6tHBgK
 RZaTzvNVXReRQw6y69wwtGA1gRHvAUjl/j8fB4eaoD5FIG4vMSVmS6UKzEtLA+nWLlK5
 jnBYt3TteqGQo7KeDvDK2vZZIO5aO3RFsZf4bNXJnV/4sRyryDb8xEI4hEtib5GHIHXV
 2AR5oaM1KCWI+10AXKzzTkeShApsbTQO4nzZXfv87n46Lkcj6LnhrpFVdzyfsxh7CWLu
 OJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688800263; x=1691392263;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GvXK5oEuIY7lWNWkNWObt3ZTrcKC50SIxSS9jwfZwto=;
 b=cMr7YOc/1pW5mjqSPqQ8ytN2aavur68yN+rl2RTPL+xgR5zNZwVyyPk3Rwdu/fLBQh
 +wEAEaFkXuqCabw67nmMwg6A8PtCxNeY1l0Qj7ctMYlUs17onLgAWkNa/40ZLiueOAbt
 XVdc50Ad6hNSenzPdZu2mqaDDvwXbikb/ppZ1zzQfZtE4O59QPEvg3QPMG6ikhgigfxt
 ESCUladgzmH6tA74ns0SPVPB4kYg2lOja2CmI54CC6dCiWd342Www1B1W7zigmPZ699t
 KyOPo/PkckAdQc15baIc+LAobMEtTrJ3tOqxD5iCI67rAKmPgKjkI7fyNBBfGI07Q5Ds
 JEkw==
X-Gm-Message-State: ABy/qLaKh/UGiRdAGviGySRtaVAkWk5KYbiu4DEd8qGvUrKxzH9NnupX
 bdQYVmk3N8trkgENiS1kBQo=
X-Google-Smtp-Source: APBJJlGwbtOxDY4lSfhBZMb8VNQ2fXcYzhOJWKt/FjyfC+puXO0xuYEfkiaVOg6NxpvDBYU0sIrNHA==
X-Received: by 2002:a17:907:b020:b0:974:55ea:1ad8 with SMTP id
 fu32-20020a170907b02000b0097455ea1ad8mr5125794ejc.63.1688800262973; 
 Sat, 08 Jul 2023 00:11:02 -0700 (PDT)
Received: from [127.0.0.1] ([95.168.107.25]) by smtp.gmail.com with ESMTPSA id
 j17-20020a170906279100b00982a352f078sm3062166ejc.124.2023.07.08.00.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 00:11:02 -0700 (PDT)
Date: Sat, 8 Jul 2023 09:11:02 +0200 (GMT+02:00)
From: =?UTF-8?Q?Paulo_Pava=C4=8Di=C4=87?= <pavacic.p@gmail.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <85d0e75d-146d-496e-a22d-3aea5298c61a@gmail.com>
In-Reply-To: <0d43e653-32cd-b25e-40fa-6f0571048467@denx.de>
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
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <85d0e75d-146d-496e-a22d-3aea5298c61a@gmail.com>
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

Hello Marek,


Jul 6, 2023 5:26:15 PM Marek Vasut <marex@denx.de>:

> On 7/6/23 17:18, Paulo Pavacic wrote:
>> Hello Linus,
>> =C4=8Det, 22. lip 2023. u 10:22 Linus Walleij <linus.walleij@linaro.org>=
 napisao je:
>>>
>>> On Wed, Jun 21, 2023 at 5:09=E2=80=AFPM Paulo Pavacic <pavacic.p@gmail.=
com> wrote:
>>>
>>>> A lot of modifications to st7701 are required. I believe it would
>>>> result in a driver that doesn't look or work the same. e.g compare
>>>> delays between initialization sequences of panel-fannal-c3004 and
>>>> panel-st7701. I think it would be optimal to create st7701s driver and
>>>> have special handling for st7701s panels. If there was a flag for
>>>> whether panel is st7701 or st7701s it would end up looking like a
>>>> mess.
>>>
>>> What matters is if the original authors of the old st7701 driver are
>>> around and reviewing and testing patches at all. What we need is
>>> active maintainers. (Added Jagan, Marek & Maya).
>>>
>>> I buy the reasoning that the st7701s is perhaps substantially different
>>> from st7701.
>>>
>>> If st7701s is very different then I suppose it needs a separate driver,
>>> then all we need to to name the driver properly, i.e.
>>> panel-sitronix-st7701s.c.
>> I had in person talk with Paul Kocialkowski and I have concluded that
>> this is the best solution.
>> I believe I should rename it to st7701s due to the hardware changes. I
>> would like to create V5 patch with driver renamed to st7701s.
>> Please let me know if you agree / disagree.
>
> If I recall it right, the ST7701 and ST7701S are basically the same chip,=
 aren't they ?

I'm currently exploring all the differences. There aren't a lot of them, bu=
t there are some.

So far I can see that default register values are different, previously unu=
sed registers are now used and there has been some reordering of how info i=
s placed in registers [1] (return value for some commands is different). E.=
g AJ1N[1:0] has been moved from B102h to B101h [1]

Moreover, instructions to some commands have been changed as well as meanin=
g of what data bits mean [2][3]. Also, new features have been added [2]; th=
ere is now PCLKS 3 for example.
You can see few differences in following images:
[1]=C2=A0https://ibb.co/NmgbZmy=C2=A0- GAMACTRL_st7701.png
[2]=C2=A0https://ibb.co/G79y235=C2=A0- PCLKS2.png

P.S. this is second time I'm trying to send this e-mail so some of you migh=
t have received e-mail with the same text twice


Thank you for your time,
Paulo
