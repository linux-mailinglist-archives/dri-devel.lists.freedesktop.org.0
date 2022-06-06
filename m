Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5E53DF62
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 03:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1BC10FC82;
	Mon,  6 Jun 2022 01:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3FA10FC8D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 01:39:27 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id y15so8846818ljc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 18:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2aAzgWufLM3eFBRQ9m2A+4XEm2/EjgHO8XjvIlt8qsc=;
 b=Icn4irk9qnC0CRZA12hvjLPiNe929gRNEg4ZfZV0T3RYBehB9uqQtL9hviXbnYeMv2
 bPOGPBWkInazcMgEV6wlUWAWy4LSCAmIviwlw4PqqQoU1GClhQ+gTrya2W+LXGW27HEI
 YTBJghZmXIacPXwHbAz2rLV6GEdEzbddpeFWiv5x8CHz0zoKy99fxoUgELLe3DGexses
 5LgMUJl0NxVpiM5Ez4NxsHgGhlLB+23vcIQlNp/NfcZ79MKpf4bLNTppNG2jATt0VSfc
 LY9vQsx92hbFfZqPtzMGD9LKgeqzTKmWr7UkOiBTX5xPNFaUc0caWkM8N94mo7q/5kjt
 wuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2aAzgWufLM3eFBRQ9m2A+4XEm2/EjgHO8XjvIlt8qsc=;
 b=IoWHK0ugEUo9CuehRMzSEm4NqkL6g2h+wC0MUQus4QtiKCLiNAjkCFuwpQzUAg+64b
 Fr1K5VE5AxxHa3qSNpCYQNwtsHnvIui2nplCdEAz4kQXsVljvpLSQJPW8mUQP2QnyC1J
 OmNaNOdw4rikmGoNFqJ3SfzH7HehLbLScSGmPx+5qP35nb0EgFhwEZNC4ydiT6Gs/SQW
 dT1HaQjPKVHjMKslsaJNrNJzaA9iEqzGWjpOZ6hjnTfJukMvneH777gd4FSF/rjq7Adh
 fo6DsiBooyajSC0xU6DCGCnvkLkCu/59aR/v+m3J/vrWPPy+z7jRct1Q88rF2s3ZUJLW
 sgAA==
X-Gm-Message-State: AOAM5307SnYx11O9pLNnd19X4fgt//mdm9hbPm6nnYGxCcEIJA6cDm12
 Qdt45CHPKjNgXuhU6YYB1zMsE4819OzDYyC0WUo=
X-Google-Smtp-Source: ABdhPJz9OSonsWzarHgyRgYmCYlUPNe4zRBAj9Xp3fTYOkGEBTtj9VEAk2DAw1kz0ZE+rmV7BJU35tGBEixhOrTn2Ic=
X-Received: by 2002:a2e:904a:0:b0:255:7b02:8f32 with SMTP id
 n10-20020a2e904a000000b002557b028f32mr9325452ljg.133.1654479565373; Sun, 05
 Jun 2022 18:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-2-git-send-email-u0084500@gmail.com>
 <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
 <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
 <076d53d3-6062-686f-8e45-14c5f936bbf6@linaro.org>
 <20220602135604.GA2194286-robh@kernel.org>
 <e3aa9c7e-bf2d-dd55-8b3f-ca51f569771d@linaro.org>
 <CADiBU3-dN0vtQBEqvVLFCUp4-MkhLbQRkOiCet+fO8WfkEW4MQ@mail.gmail.com>
 <12096a2c-98c3-9e77-785f-808cc3e1a0e4@linaro.org>
In-Reply-To: <12096a2c-98c3-9e77-785f-808cc3e1a0e4@linaro.org>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 6 Jun 2022 09:39:15 +0800
Message-ID: <CADiBU3_REqNRb4UtT5OrVBKuhYL0NPAALisHTM76SrFCHUYMuA@mail.gmail.com>
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
=B46=E6=9C=886=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8812:11=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 02/06/2022 17:31, ChiYuan Huang wrote:
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=
=B9=B46=E6=9C=882=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:58=E5=AF=
=AB=E9=81=93=EF=BC=9A
> >>
> >> On 02/06/2022 15:56, Rob Herring wrote:
> >>> On Thu, May 26, 2022 at 12:32:12PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 26/05/2022 10:13, ChiYuan Huang wrote:
> >>>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=
=E5=B9=B45=E6=9C=8826=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:06=E5=
=AF=AB=E9=81=93=EF=BC=9A
> >>>>>>
> >>>>>> On 26/05/2022 05:16, cy_huang wrote:
> >>>>>>> From: ChiYuan Huang <cy_huang@richtek.com>
> >>>>>>>
> >>>>>>> Add the new property for ocp level selection.
> >>>>>>>
> >>>>>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> >>>>>>> ---
> >>>>>>>  .../bindings/leds/backlight/richtek,rt4831-backlight.yaml       =
  | 8 ++++++++
> >>>>>>>  include/dt-bindings/leds/rt4831-backlight.h                     =
  | 5 +++++
> >>>>>>>  2 files changed, 13 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/ric=
htek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlig=
ht/richtek,rt4831-backlight.yaml
> >>>>>>> index e0ac686..c1c59de 100644
> >>>>>>> --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt=
4831-backlight.yaml
> >>>>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt=
4831-backlight.yaml
> >>>>>>> @@ -47,6 +47,14 @@ properties:
> >>>>>>>      minimum: 0
> >>>>>>>      maximum: 3
> >>>>>>>
> >>>>>>> +  richtek,bled-ocp-sel:
> >>>>>>
> >>>>>> Skip "sel" as it is a shortcut of selection. Name instead:
> >>>>>> "richtek,backlight-ocp"
> >>>>>>
> >>>>> OK, if so, do I need to rename all properties from 'bled' to 'backl=
ight' ?
> >>>>> If  only this property is naming as 'backlight'. it may conflict wi=
th
> >>>>> the others like as "richtek,bled-ovp-sel".
> >>>>
> >>>> Ah, no, no need.
> >>>>
> >>>>>>
> >>>>>>> +    description: |
> >>>>>>> +      Backlight OCP level selection, currently support 0.9A/1.2A=
/1.5A/1.8A
> >>>>>>
> >>>>>> Could you explain here what is OCP (unfold the acronym)?
> >>>>> Yes. And the full name is 'over current protection'.
> >>>>
> >>>> Thanks and this leads to second thing - you encode register value
> >>>> instead of logical value. This must be a logical value in mA, so
> >>>> "richtek,bled-ocp-microamp".
> >>>
> >>> We already have common properties for setting current of LEDs. We sho=
uld
> >>> use that here I think.
> >>
> >> It might not be exactly the same. We have "led-max-microamp" which is
> >> the maximum allowed current. I guess over-current protection level  is
> >> slightly higher (e.g. led-max-microamp + 1). IOW, led-max-microamp is
> >> something which still can be set and used by system/hardware. OCP shou=
ld
> >> not.
> >>
> > Yap, you're right.
>
> So I am right or Rob?
>
As I know, both are incorrect.
> > From the modern backlight IC design, it uses the boost converter archit=
ecture.
> > This OCP level is to limit the inductor current when the internal MOS
> > switch turn on.
> > Details can refer to the below wiki link
> > https://en.wikipedia.org/wiki/Boost_converter
> >
> > And based on it, OVP is used to limit the inductor output voltage.
> > Each channel maximum current is based on the IC affordable limit.
> > It is more like as what you said 'led-max-microamp'.
> >
> > So boost voltage level may depend on the LED VF.
> > The different series of LED may cause different boost voltage.
> >
> > RT4831's OVP/OCP is not just the protection, more like as the limit.
>
> This suggests Rob is right, so let's use led-max-microamp property?
>
No, the meaning is different. 'led-max-microamp' always means the
channel output current.
It already can be adjusted by backlight brightness node.

For example
low voltage side (3.3~4.4V) to generate the boost voltage to 16~17V,
even 20V for BLED Vout.
This OCP is to limit the input current of low voltage side.

After the explanation, do you still think it's the same thing?
> Best regards,
> Krzysztof
