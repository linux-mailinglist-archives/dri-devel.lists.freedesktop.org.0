Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC1653BB94
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 17:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF6110FF8E;
	Thu,  2 Jun 2022 15:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD6910FF8E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 15:31:42 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id be31so8372472lfb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 08:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=esMKub0cfzvqnfMV7lmbB0oZRypBhw/uecaEXqoF+WU=;
 b=oTu0P2daaKsA1l22EDygSdCtDLs65QG9Z696gkcTXpMo2tPkRWcIDU2SMt0nxxwHQV
 csoZh3kuDwqEf57wSVlZictjMfan6VYdNqioDeQrZBxICj/Wj03NDcp8oSK1+klzeBcx
 XcYkpq4lntn5O9wd5dX8J9zJOtEUn1gmdu9TJrmh3E2MtzmmvM5IfgMdo9Ve7xiXelvj
 N7b0cjXXMinL39F1ZZ+NPFL2o7Z4V4Xpl+l3ZuVhZ7ULijC4XHWkWjKa8NPclYWMZsg5
 pvaMNdZN8qOCh5oTGXJGE6gyXJktrIDLP+dhxJ65pVF/x3LinZGRwkfCxH6t089Io3Pq
 EGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=esMKub0cfzvqnfMV7lmbB0oZRypBhw/uecaEXqoF+WU=;
 b=hy4L+P072xOpmoyddZeiPWn4tDVd3315ifm5+GSCr4jkcgEzdwfD96YceSUkSh7wI8
 Y6SzXjJdSJanNhLGTX8FmLtMGiRBS1Zdx7WeeusA9WfiedrwOh22HFktHTTWg6njfIwo
 dUSBrifyI2W+jjaiZToH6k3ILsIcNYeubTxUdPwv6ou3nDpb3zRszA9tnuw7zqt4fxb2
 SjHRbe6gbNdlOz46EGwWc1f5dcHySCqiCbypiYp8pxNYK1kFjxcIDQQvt9gtDl0yytl7
 hmZfeKFjsZVIqLA8psjRsZ5Lx4S2YoTYxlPzI7ExpL0YIte7H3276wFMk43sGVFr51HW
 IZSA==
X-Gm-Message-State: AOAM532oZ/SrSwmZ3XObu/ufsKVfoitm6U40xVf03JD44GbWqpE0Cr+V
 L8GIiuCkzF1fFo9f01h7m18+BO6ZC1B9gzeVbTw=
X-Google-Smtp-Source: ABdhPJwUWTC1dJi2VZe48WvDxa+lO5SkWNx609HcHDHFfZMmdimibD/T9ChrnJh/j6CAvW90E37p6PiD4Z97tjQIh84=
X-Received: by 2002:a05:6512:3a95:b0:478:da91:ebc8 with SMTP id
 q21-20020a0565123a9500b00478da91ebc8mr4080306lfu.120.1654183900754; Thu, 02
 Jun 2022 08:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-2-git-send-email-u0084500@gmail.com>
 <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
 <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
 <076d53d3-6062-686f-8e45-14c5f936bbf6@linaro.org>
 <20220602135604.GA2194286-robh@kernel.org>
 <e3aa9c7e-bf2d-dd55-8b3f-ca51f569771d@linaro.org>
In-Reply-To: <e3aa9c7e-bf2d-dd55-8b3f-ca51f569771d@linaro.org>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 2 Jun 2022 23:31:29 +0800
Message-ID: <CADiBU3-dN0vtQBEqvVLFCUp4-MkhLbQRkOiCet+fO8WfkEW4MQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: rt4831: Add the new property
 for ocp level selection
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 lucas_tsai@richtek.com, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, cy_huang <cy_huang@richtek.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B46=E6=9C=882=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:58=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 02/06/2022 15:56, Rob Herring wrote:
> > On Thu, May 26, 2022 at 12:32:12PM +0200, Krzysztof Kozlowski wrote:
> >> On 26/05/2022 10:13, ChiYuan Huang wrote:
> >>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=
=E5=B9=B45=E6=9C=8826=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:06=E5=
=AF=AB=E9=81=93=EF=BC=9A
> >>>>
> >>>> On 26/05/2022 05:16, cy_huang wrote:
> >>>>> From: ChiYuan Huang <cy_huang@richtek.com>
> >>>>>
> >>>>> Add the new property for ocp level selection.
> >>>>>
> >>>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> >>>>> ---
> >>>>>  .../bindings/leds/backlight/richtek,rt4831-backlight.yaml         =
| 8 ++++++++
> >>>>>  include/dt-bindings/leds/rt4831-backlight.h                       =
| 5 +++++
> >>>>>  2 files changed, 13 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/richt=
ek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight=
/richtek,rt4831-backlight.yaml
> >>>>> index e0ac686..c1c59de 100644
> >>>>> --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt48=
31-backlight.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt48=
31-backlight.yaml
> >>>>> @@ -47,6 +47,14 @@ properties:
> >>>>>      minimum: 0
> >>>>>      maximum: 3
> >>>>>
> >>>>> +  richtek,bled-ocp-sel:
> >>>>
> >>>> Skip "sel" as it is a shortcut of selection. Name instead:
> >>>> "richtek,backlight-ocp"
> >>>>
> >>> OK, if so, do I need to rename all properties from 'bled' to 'backlig=
ht' ?
> >>> If  only this property is naming as 'backlight'. it may conflict with
> >>> the others like as "richtek,bled-ovp-sel".
> >>
> >> Ah, no, no need.
> >>
> >>>>
> >>>>> +    description: |
> >>>>> +      Backlight OCP level selection, currently support 0.9A/1.2A/1=
.5A/1.8A
> >>>>
> >>>> Could you explain here what is OCP (unfold the acronym)?
> >>> Yes. And the full name is 'over current protection'.
> >>
> >> Thanks and this leads to second thing - you encode register value
> >> instead of logical value. This must be a logical value in mA, so
> >> "richtek,bled-ocp-microamp".
> >
> > We already have common properties for setting current of LEDs. We shoul=
d
> > use that here I think.
>
> It might not be exactly the same. We have "led-max-microamp" which is
> the maximum allowed current. I guess over-current protection level  is
> slightly higher (e.g. led-max-microamp + 1). IOW, led-max-microamp is
> something which still can be set and used by system/hardware. OCP should
> not.
>
Yap, you're right.
From the modern backlight IC design, it uses the boost converter architectu=
re.
This OCP level is to limit the inductor current when the internal MOS
switch turn on.
Details can refer to the below wiki link
https://en.wikipedia.org/wiki/Boost_converter

And based on it, OVP is used to limit the inductor output voltage.
Each channel maximum current is based on the IC affordable limit.
It is more like as what you said 'led-max-microamp'.

So boost voltage level may depend on the LED VF.
The different series of LED may cause different boost voltage.

RT4831's OVP/OCP is not just the protection, more like as the limit.
>
> Best regards,
> Krzysztof
