Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250AA72548E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 08:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAD710E436;
	Wed,  7 Jun 2023 06:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8BA10E436
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 06:43:03 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-56974f42224so64308217b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686120182; x=1688712182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dsg7fMeOwWf6duFi3SL6qXsSugXJIk0Q5FLHDNP0ztQ=;
 b=kVd/MnqaoIb5oxrldwJ5KKFEpysXJo1vKiAhaP19lZrkPC6P9oUh93qci0bfIU3RYr
 FOzKnA6wBqU6vXDEPXVRMXQ54vUNAsclDBESzc7L+maa4WBFhljs6Xr+L827WRe4vcD/
 aB9DVry9wy72Eh4u11rbQThzzLKuFbWeSnLWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686120182; x=1688712182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dsg7fMeOwWf6duFi3SL6qXsSugXJIk0Q5FLHDNP0ztQ=;
 b=ZPoZI0WQ/80+JgSIVHtp6bulNDPsTLlaOHVEtUeIY15xJZyZKA1v8Ad8Pw0wLSMsdq
 xvLUNNcuRjbgJLKh6Kzmad0Lfnd0l5XFbfD7bK03O/40qEXeXnVAXhBvoZmvlnNOd7gU
 IEEegOyd+EIkLppa+kB3WZBr7zri2DtRoGejlYtvUBsaefBk/cznsyHSbZUGF8vHpMuH
 sH5dm62azIREn4AAhf0GavrR0eoItGtdMLanQgpol8HHZxtiwsGvSTqMdNw1nsYPEGVY
 Yh0pEt3Ftt/NVbEj8ZeNzqU6wUJ3kGGIYwDO4KYmCmCHjp7BqtS37rO9FrLiEqwNQrEY
 EaLA==
X-Gm-Message-State: AC+VfDzNlDF9WSYVmwFFdtdMQcPumxlikbEYtLHFRPP6CFhNWU7AIWuN
 B1yful1xyd6BSZBmFzJnLMhg7FAmkCbKGMQdSBmrEg==
X-Google-Smtp-Source: ACHHUZ6sjnQG6odBG4w0qQkBK4LJZGwQU7CqikJozkVHCbSGSE0jcdrkgzVwr1fXZBKKMsum+q741mo0WSCe/CRDp74=
X-Received: by 2002:a81:8450:0:b0:565:b22c:4165 with SMTP id
 u77-20020a818450000000b00565b22c4165mr5933812ywf.11.1686120181918; Tue, 06
 Jun 2023 23:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-4-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230607063139.621351-4-dario.binacchi@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 7 Jun 2023 12:12:50 +0530
Message-ID: <CAMty3ZDCkQ_T+j96iXtMAhkOLFBm=hZHk=sZzSGA=MOQQUOv7g@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 3/6] ARM: dts: stm32: support display on
 stm32f746-disco board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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

On Wed, Jun 7, 2023 at 12:01=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> Add support to Rocktech RK043FN48H display on stm32f746-disco board.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
> (no changes since v1)
>
>  arch/arm/boot/dts/stm32f746-disco.dts | 51 +++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f746-disco.dts b/arch/arm/boot/dts/st=
m32f746-disco.dts
> index c11616ed5fc6..cda423b6a874 100644
> --- a/arch/arm/boot/dts/stm32f746-disco.dts
> +++ b/arch/arm/boot/dts/stm32f746-disco.dts
> @@ -60,10 +60,41 @@ memory@c0000000 {
>                 reg =3D <0xC0000000 0x800000>;
>         };
>
> +       reserved-memory {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               linux,cma {
> +                       compatible =3D "shared-dma-pool";
> +                       no-map;
> +                       size =3D <0x80000>;
> +                       linux,dma-default;
> +               };
> +       };

This looks unrelated to display enablement, isn't it?

Jagan.
