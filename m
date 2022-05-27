Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08349535785
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 04:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F6D10F054;
	Fri, 27 May 2022 02:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5573E10F054
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 02:24:54 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id j7so3081034vsj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 19:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QvhKBJjGUiG7G8PpadcKf8ELEDTEzExAiqgsG99aSxM=;
 b=mBbmAl6FjJyf8/uGuc+JM8m3jjGD4++wND89c0YwmoUfKv9uxtcnlFOm6SAVysFfR8
 LuV7S6P1tMqdJ+AWryZ4E+GduRTIiJvOAAlESpU6RQqzaCRI23M9y8FYiyJFgsXUKOcm
 2L9peqMteW+4GSorZyudGmiIXphWNVVJ/CxXo238lHvM/d5RGvlmwyPsc6kmAlf9+j/9
 fqPCUG/YS3oABatxSC2rvKJg2XSxHu9X3YrAx2DQoVzHPd2vCGTWf6/2NcPJEng0CRLx
 jnY/niKmADvaV1vgnSePz9UGymiEJ0qaYdApQ+SnsGkJWg8NcbvJjp8aDYtGYb+OZ8b/
 knyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QvhKBJjGUiG7G8PpadcKf8ELEDTEzExAiqgsG99aSxM=;
 b=QeK4ITzOlckrJnevppwHHjgxycFvQq5HHiVYDxvy9zmYI3pIwHDBrYLyoFSR2A3PbS
 aU2AOHwhT8ffGbjakrSC2NuRhi7mLftiLfFlT59l0tSx3ZEnb1pdG/wcrOU7NnifRkY1
 XGzr7IBA8dbpzNp74e6uzPn6PFqSvXcxhCaedFvXXLLjohPCIxq5Oo/xsi8HLno4gtQU
 7pYrOwBhpYxffY5aaFVnF1xcHMdecMvY94qV7zHVHhtVNn6J67qb2sZ8VkItNvQVJl6Q
 1iYPpdmX3EZkPS/PJZZiDmusjzDNBTcOm+QVQ6cKT7PeQ00C+T8d1W+Yr+erlWbPmvxL
 lNFQ==
X-Gm-Message-State: AOAM531oiN/CwE70nVyuEz3SxhHRq9jzb6ndFn/r1QPX9Kh/RtlB+tNU
 MnwVLxkPQK1q7Ne0bZBLCSAPXdklO2T0GaonEHE=
X-Google-Smtp-Source: ABdhPJwkZPvj4AjNTutTU0UnZb0VBCu1HQ5FumUGt7iv+OBdH1kfcKU5DRWqD7wVat93IE/BS4BJmsVF9rwuvgX1dsM=
X-Received: by 2002:a67:ef5b:0:b0:335:e3a3:9b33 with SMTP id
 k27-20020a67ef5b000000b00335e3a39b33mr16969880vsr.57.1653618293351; Thu, 26
 May 2022 19:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-3-git-send-email-u0084500@gmail.com>
 <20220526100510.3utwh5bov4ax2jmg@maple.lan>
In-Reply-To: <20220526100510.3utwh5bov4ax2jmg@maple.lan>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Fri, 27 May 2022 10:24:42 +0800
Message-ID: <CADiBU3_3rJ6uCYx_W+TZJpuPzGtt61QEDwZWtxy_abzynTr8VQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] backlight: rt4831: Add the property parsing for ocp
 level selection
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 lucas_tsai@richtek.com, jingoohan1@gmail.com, deller@gmx.de,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 cy_huang <cy_huang@richtek.com>, Rob Herring <robh+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Thompson <daniel.thompson@linaro.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=
=8826=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:05=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Thu, May 26, 2022 at 11:16:35AM +0800, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add the property parsing for ocp level selection.
>
> Isn't this just restating the Subject: line?
>
Ah, that's my fault. I didn't state too much in the patch comment.
I only left it in the cover letter.

> It would be better to provide information useful to the reviewer here.
> Something like:
>
> "Currently this driver simply inherits whatever over-current protection
> level is programmed into the hardware when it is handed over. Typically
> this will be the reset value, <whatever>A, although the bootloader could
> have established a different value.
>
> Allow the correct OCP value to be provided by the DT."
>
> BTW please don't uncritically copy the above into the patch header. It is
> just made something up as an example and I did no fact checking...
>
OK, got it.
>
> >
> > Reported-by: Lucas Tsai <lucas_tsai@richtek.com>
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  drivers/video/backlight/rt4831-backlight.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video=
/backlight/rt4831-backlight.c
> > index 42155c7..c81f7d9 100644
> > --- a/drivers/video/backlight/rt4831-backlight.c
> > +++ b/drivers/video/backlight/rt4831-backlight.c
> > @@ -12,6 +12,7 @@
> >  #define RT4831_REG_BLCFG     0x02
> >  #define RT4831_REG_BLDIML    0x04
> >  #define RT4831_REG_ENABLE    0x08
> > +#define RT4831_REG_BLOPT2    0x11
> >
> >  #define RT4831_BLMAX_BRIGHTNESS      2048
> >
> > @@ -23,6 +24,8 @@
> >  #define RT4831_BLDIML_MASK   GENMASK(2, 0)
> >  #define RT4831_BLDIMH_MASK   GENMASK(10, 3)
> >  #define RT4831_BLDIMH_SHIFT  3
> > +#define RT4831_BLOCP_MASK    GENMASK(1, 0)
> > +#define RT4831_BLOCP_SHIFT   0
> >
> >  struct rt4831_priv {
> >       struct device *dev;
> > @@ -120,6 +123,16 @@ static int rt4831_parse_backlight_properties(struc=
t rt4831_priv *priv,
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D device_property_read_u8(dev, "richtek,bled-ocp-sel", &pro=
pval);
> > +     if (ret)
> > +             propval =3D RT4831_BLOCPLVL_1P2A;
>
> Is 1.2A the reset value for the register?
Yes, it's the HW default value.
>
> Additionally, it looks like adding a hard-coded default would cause
> problems for existing platforms where the bootloader doesn't use
> richtek,bled-ocp-sel and pre-configures a different value itself.
>
> Would it be safer (in terms of working nicely with older bootloaders)
> to only write to the RT4831_BLOCP_MASK if the new property is set?
>
Ah, my excuse. I really didn't consider the case that you mentioned.
It seems it's better to do the judgement here for two cases.
1) property not exist, keep the current HW value
2) property exist, clamp align and update the suitable selector to HW.

Thanks.
>
> Daniel.
>
>
>
> > +
> > +     propval =3D min_t(u8, propval, RT4831_BLOCPLVL_1P8A);
> > +     ret =3D regmap_update_bits(priv->regmap, RT4831_REG_BLOPT2, RT483=
1_BLOCP_MASK,
> > +                              propval << RT4831_BLOCP_SHIFT);
> > +     if (ret)
> > +             return ret;
> > +
> >       ret =3D device_property_read_u8(dev, "richtek,channel-use", &prop=
val);
> >       if (ret) {
> >               dev_err(dev, "richtek,channel-use DT property missing\n")=
;
> > --
> > 2.7.4
> >
