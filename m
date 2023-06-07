Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F2D72600A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 14:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F47910E0D8;
	Wed,  7 Jun 2023 12:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF3C10E0D8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 12:49:49 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-565cfe4ece7so82013447b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686142188; x=1688734188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AxgroMuIH5NoBbtLc+ad3Qph59KMeN5Cm1Y0j7Ly7E=;
 b=ZbKfKcjvgFXKqwj0h5Tewi1lK9Xd76DukZKwpNIXejMBEEIVgX1ml9V5uECiRVpV9C
 qpIGXKmcNrTBr1q1m39Ibv5tpSIkf8YqnsD3sVX2jKG2S8whdARNgj06BRqknITaqsfU
 xRKVeXzvJSMs4tI9tPs9ap5Lf66e2PkfUr6L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686142188; x=1688734188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8AxgroMuIH5NoBbtLc+ad3Qph59KMeN5Cm1Y0j7Ly7E=;
 b=X/+4M0hQ8kqhpwbYfX8D9OV9y/Ujj4Lk6ZW4T6JP+nb1VftMR4Qnx7RwgSD/XISMDp
 ChKFXBDJXiWaI1VIkeb0wyGuuodIqf9tnmgLbUPA4Zpr7p37gBtOe+PrO0jNOaI1W9f5
 +EscYp2ReM9UB/CMtPS9RtsBRpcEHFTfJY7TlO4hhscC9Y+QEFRx5pgBjxknAJnJ+vHw
 Kx+6AEzdiUBKCaku654qitysHix+zr7dG2Acq+ZRJp7Zo/4Sn8IjQhmdJToHdzaEvWZH
 erwfwqwMiG1YyxsX5IJBggavEagQw1iI9wm/6mKQxIZQXpaqEEc/Fm8byt6LeZVAjS7L
 rNTg==
X-Gm-Message-State: AC+VfDyr5el/4bwKKz+i6vQpKosOmRYPC+4TqdKCOgxFV+ZtaGCbAjcB
 XLEUcA81pBOlyYrOuseToQaDGAB1Xl9DFsRjrXdbUw==
X-Google-Smtp-Source: ACHHUZ7hBI1yQy3hOqMs3IywMmiWVgkBaT4CmmHgTUdbu1gUndSUOaqBclPy1zulKt9pLMxC7qjpriQ1ztOABz2tp58=
X-Received: by 2002:a81:834b:0:b0:568:b6a5:9100 with SMTP id
 t72-20020a81834b000000b00568b6a59100mr6838026ywf.42.1686142188079; Wed, 07
 Jun 2023 05:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-4-dario.binacchi@amarulasolutions.com>
 <CAMty3ZDCkQ_T+j96iXtMAhkOLFBm=hZHk=sZzSGA=MOQQUOv7g@mail.gmail.com>
In-Reply-To: <CAMty3ZDCkQ_T+j96iXtMAhkOLFBm=hZHk=sZzSGA=MOQQUOv7g@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 7 Jun 2023 14:49:36 +0200
Message-ID: <CABGWkvq_DevgJeR+KfBy-4ME+u-iORW93BAT4FTMVRuG0KU1Zg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 3/6] ARM: dts: stm32: support display on
 stm32f746-disco board
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Wed, Jun 7, 2023 at 8:43=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.c=
om> wrote:
>
> On Wed, Jun 7, 2023 at 12:01=E2=80=AFPM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
> >
> > Add support to Rocktech RK043FN48H display on stm32f746-disco board.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> > (no changes since v1)
> >
> >  arch/arm/boot/dts/stm32f746-disco.dts | 51 +++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stm32f746-disco.dts b/arch/arm/boot/dts/=
stm32f746-disco.dts
> > index c11616ed5fc6..cda423b6a874 100644
> > --- a/arch/arm/boot/dts/stm32f746-disco.dts
> > +++ b/arch/arm/boot/dts/stm32f746-disco.dts
> > @@ -60,10 +60,41 @@ memory@c0000000 {
> >                 reg =3D <0xC0000000 0x800000>;
> >         };
> >
> > +       reserved-memory {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +               ranges;
> > +
> > +               linux,cma {
> > +                       compatible =3D "shared-dma-pool";
> > +                       no-map;
> > +                       size =3D <0x80000>;
> > +                       linux,dma-default;
> > +               };
> > +       };
>
> This looks unrelated to display enablement, isn't it?

Without the "reserved-memory" node, it is not possible to allocate
memory for the framebuffer.
I got this error:
stm32-display 40016800.display-controller: [drm] *ERROR* failed to
allocate buffer with size 139264

Thanks and regards,
Dario

>
> Jagan.



--

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
