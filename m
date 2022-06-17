Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3AB54F3E4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 11:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A550E11AC20;
	Fri, 17 Jun 2022 09:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6E611AC20
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 09:06:59 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id f7so2587208ilr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qSNsJXRAq4gUj6ivdXbrjgAuRPp+HHbhKrKeTXicOCg=;
 b=Dl6LB9Q7n5EpkbYyX81Yn4cmxCMk5bOsvIkbCtCocr/dTjXuNz2CrJSviTnH0BS1ZA
 csEqG/oDAowT6GKI5Jv33GJEiHpYxvdMlDZhfZBBuw/eZ9Eo831Cknv0KsMHy7G0DWSs
 3swp9MPgLARrnm6iLy+/DP1EEaXbJ7LnAHzCQlBxp5v/D0UiuJmor5kJKMxWAzEUyXZI
 1+858U9fStR05SV0oD9CPijH25+Hp8jW+T2+F6TYxR/pS4vViGBRihmxY3Mm2QYpLSfc
 pMc8NksdwBd9eDGRApyinNjzZgukXbDtZkXMIRDLUvQKRqSpj3sI5S1JKd3VMT+YO5Eb
 /7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qSNsJXRAq4gUj6ivdXbrjgAuRPp+HHbhKrKeTXicOCg=;
 b=7JXGG9ZscFAwBBZhGOSWAQuQmbZ4GEoUJASmearmULjZpoh9b1SX3HBJCGrFylQj/1
 Yq37bw7u5UomF+CCjDxFEbc8lFXI8l9GiBLhgelqSlWeaKeByMWHdwLMRRzlEZ3OO/L8
 PTIfDZ1+kphYi+cOmIl3eJRqysJ0KnJjS/OzVmeBbIKF6qISYgix5o5xUZt2bX6nNVXH
 HoYwqMI6+EjDp8Z2Gw4mxnKCdrt6RWo4QZE4DT+GK2wq0enb43gIu72Xt9xh+GPPdD0W
 dkgt1OJ20+QdU9aVxML4JRI2jQmBzcA3gOVbHHLGtT2HIU+6w4goLshRLmANKDojhK8U
 OnMA==
X-Gm-Message-State: AJIora9rHW9r5ts7i/T0qCXWIYBPGTnoFPfwE1IoCyAHOZv/OwJb6HUT
 1PeYajIgXFRzEbbItkDoQFQGf/pbzx7DfOhmWuI=
X-Google-Smtp-Source: AGRyM1tGCu6AS9wDCH8Gur5zYW6uSfoWWJs4DOW5mFrlMgAa3+NrBz1Bdl1bq12S+LuODQiyUM9pGAPCWwXJA6zrKuk=
X-Received: by 2002:a05:6e02:1aa4:b0:2d3:aeb9:930 with SMTP id
 l4-20020a056e021aa400b002d3aeb90930mr5026082ilv.45.1655456819325; Fri, 17 Jun
 2022 02:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-11-peterwu.pub@gmail.com>
 <31b588e9-2233-3b40-e452-83f0f6bfb744@infradead.org>
In-Reply-To: <31b588e9-2233-3b40-e452-83f0f6bfb744@infradead.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 17:06:48 +0800
Message-ID: <CABtFH5K9SiOO-JDMoJJ9=5Y2XpMBirgX0ce+8F4e_Kgsk9Udaw@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 szunichen@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pavel@ucw.cz, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

Thanks for your helpful comments!
We will refine them in the next patch, thanks!

Randy Dunlap <rdunlap@infradead.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A84:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
>
> On 6/13/22 04:11, ChiaEn Wu wrote:
> > diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> > index cbe0f96ca342..dcb6866dab53 100644
> > --- a/drivers/regulator/Kconfig
> > +++ b/drivers/regulator/Kconfig
> > @@ -804,6 +804,14 @@ config REGULATOR_MT6360
> >         2-channel buck with Thermal Shutdown and Overload Protection
> >         6-channel High PSRR and Low Dropout LDO.
> >
> > +config REGULATOR_MT6370
> > +     tristate "MT6370 SubPMIC Regulator"
> > +     depends on MFD_MT6370
> > +     help
> > +       Say Y here to enable MT6370 regulator support.
> > +       This driver support the control for DisplayBias voltages and on=
e
>
>                       supports
>
> > +       general purpose LDO which commonly used to drive the vibrator.
>
>                               which is commonly used to drive the vibrato=
r.
>
>
> --
> ~Randy

Best regards,
ChiaEn Wu
