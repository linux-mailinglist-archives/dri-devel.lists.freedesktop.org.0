Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A543B51F5B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 19:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0571010E2FE;
	Wed, 10 Sep 2025 17:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MuZPrEFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAA910E2FE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 17:47:44 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-60f45afcc50so1256638d50.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757526463; x=1758131263; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=043TJq6hpWw8pYqx0PWm3cQzQQkOF8ixWKwRpDFzK+o=;
 b=MuZPrEFi0021m39FwgcJXz6WiVO5qJJHtStaRdCb0BWrcf8o71Kp/ylBOR4UlZYoVJ
 cya4JLizcRmqoSGxOlJ4gfxyvXJabJ0S26VgbI0/bR0loPS+vcYD12c1X3eKt563XKoy
 h7QQMkuzVPrXVqy+abM7hjrmLbpDmc3lK1UY2m6IBa8g86e3+CAdZLdlbOpPxHUN00W8
 iUM0QC4ciYz2vPGTvyBsbud3Fw7Zr7sX//JVcMqzt6LP8OBI8a09yihHe+WikrCFZ8SF
 6H4pGOnQSOTLdU6dwWydknf+qGl5lHtWQLqoLu72UJg9asSD9WWhsXDbn0aXea/OjRgd
 /4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757526463; x=1758131263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=043TJq6hpWw8pYqx0PWm3cQzQQkOF8ixWKwRpDFzK+o=;
 b=w1OjgAm3E4vYlYxY1J++8Tx84aVAz/sCWGjzyYZyd3TRzRBygP2whXwIxGuqM7w5BR
 ob/3MIf6ECJH2Hpuq+k0u3XdGwa9mfZH5VZC4oOziFcim93kTzu1tOUyKCgHSeH70+br
 LS9Leh9sZc7wM1r6KHYkmI349WGYYAPo4uaHAY3Zs2ejcv5Zrt1GgbtKBNJpO3A3i+cE
 ilPhGMFTPGruK1ewrw8xF8GPADgU7DHNdDnOpXZOBqKkTNYQR1st0t5lyrMq/AIZPe3G
 6PJbGz/a7ahu+++SRGs25IOuntuZKhiKZ01fFZMT0Y5/99y+Nj4rDYDmpRPE6Bxk0CYH
 AlAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRK4FYlDo68mhu3qLLMwfHadG3gc/mkKGESaq0qIkmzVo8U+lOmRH9/wt9/EjSgt9acmYrpFjMmjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/K75P1RgxPw90X7keh79DWVru4N1SQ3g+PAJJe7AxmuK8ksEg
 xR4DqwFq7F3VbBBwITcQiihLm9k8MvI4MM+4Fn1m6TAG5hdXo2Y3h2q8dRDagQjyNSwO5qB2mBD
 k7PgdViCBOKJ8COq1ecpDk8TP7/xGi4qAduZ0uss=
X-Gm-Gg: ASbGncuubuGBKblyHd0S8YMu/XFHg7JfpsbbTEy3sn1/8LYKjuMbpHRIuihI4J7b9ln
 73tHH0E30LOvgY6SE2FUV91zBucCIEz7lMVsdYjv/WBwGrjJAab8cVl43yw2nNJzPpNY5LfJf35
 Vrq8OdgvdtGMVxOzVxRvxFKVH5NpaAgatDJiWHTS6jzJuOLzKAAHul6IB9Q1RsUF2sPF8bJ2rqH
 4mHl8IR
X-Google-Smtp-Source: AGHT+IHxqld34a90SEM7ZlyhxBZvKGmf9aZideR0Sg0xlweL+lpFqlqovs0nnqC44Do1K8CC6oK2kjmZ56tu8gmw1Tg=
X-Received: by 2002:a05:690e:430e:b0:5fc:541b:cea3 with SMTP id
 956f58d0204a3-6102135dfeemr9750495d50.2.1757526462993; Wed, 10 Sep 2025
 10:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
 <CAOvMTZhxJ3atv62ui5+ahNKV1vb7JXnwwm4xxvg5p=o5p2HnDQ@mail.gmail.com>
In-Reply-To: <CAOvMTZhxJ3atv62ui5+ahNKV1vb7JXnwwm4xxvg5p=o5p2HnDQ@mail.gmail.com>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Wed, 10 Sep 2025 12:47:32 -0500
X-Gm-Features: Ac12FXwyR3KsW504KghsIm6qGTQ8W8fmNLhinJPGzylKTRxTbEJk3t0TSqYGRWY
Message-ID: <CAOvMTZhmacxPsM3GcLL9cNq-1BonkwycYKY=hwtVXTz5UF_LYQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aleksandrs,

On Wed, Sep 10, 2025 at 12:04=E2=80=AFPM Steev Klimaszewski <threeway@gmail=
.com> wrote:
>
> Hi Aleksandrs,
>
> On Wed, Sep 10, 2025 at 7:01=E2=80=AFAM Aleksandrs Vinarskis <alex@vinars=
kis.com> wrote:
> >
> > Leverage newly introduced 'leds' and 'led-names' properties to pass
> > indicator's phandle and function to v4l2 subnode. The latter supports
> > privacy led since couple of years ago under 'privacy-led' designation.
> > Unlike initially proposed trigger-source based approach, this solution
> > cannot be easily bypassed from userspace, thus reducing privacy
> > concerns.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 ++++---=
-
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts=
 b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..3b3f7137689a6fa292ffe4f=
ec8c1d1f20ee525bc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > @@ -83,14 +83,11 @@ leds {
> >                 pinctrl-names =3D "default";
> >                 pinctrl-0 =3D <&cam_indicator_en>;
> >
> > -               led-camera-indicator {
> > -                       label =3D "white:camera-indicator";
> > +               privacy_led: privacy-led {
>
> Should this now be privacy_led: privacy { ?
>
> >                         function =3D LED_FUNCTION_INDICATOR;
> >                         color =3D <LED_COLOR_ID_WHITE>;
> >                         gpios =3D <&tlmm 28 GPIO_ACTIVE_HIGH>;
> > -                       linux,default-trigger =3D "none";
> >                         default-state =3D "off";
> > -                       /* Reuse as a panic indicator until we get a "c=
amera on" trigger */
> >                         panic-indicator;
> >                 };
> >         };
> > @@ -685,6 +682,9 @@ camera@10 {
> >                 pinctrl-names =3D "default";
> >                 pinctrl-0 =3D <&cam_rgb_default>;
> >
> > +               leds =3D <&privacy_led>;
> > +               led-names =3D "privacy";
> > +
> >                 clocks =3D <&camcc CAMCC_MCLK3_CLK>;
> >
> >                 orientation =3D <0>;      /* Front facing */
> >
> > --
> > 2.48.1
> >
>
> v5 does not turn the led on here on my X13s whereas v3 did (and v4 was
> not tested)

From IRC conversations, the issue was not having
https://lore.kernel.org/all/20250910104702.7470-1-hansg@kernel.org
applied - with this prerequisite, v5 works here

Tested-by: Steev Klimaszewski <threeway@gmail.com>
