Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A04467CFE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 19:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AE67B2AE;
	Fri,  3 Dec 2021 18:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Fri, 03 Dec 2021 18:11:09 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A174D7B2AE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 18:11:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4046C62C5D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 18:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A792DC53FCE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638554736;
 bh=1zADHONGe9ye/9HrjsdbUoVUKEcoPvEfRAADvTU6/Q4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jGAp0FNsfkxTCDLwylEseZA8O5OtHf55siaWXwWykRt7Qat6ru8tpSuu7b4dDhCn2
 TziNhgV4wuTC3zQwoKU8YhDI0hiZmP1yBCUlCaqLSlaphZrMOgmTgHDHqlAYwP4I0M
 Le3ZE1I2UT2NUEuyoWk4C8EcF0QSbxPtBw5UL3PFEfUYA3jSFRnc1opHY4xEPROmwG
 eonKYgU8/V3JFrGIl2aRpPn79YzBHtwz99xkdpU7sDzpQEPSG+cqufR3mmMXnN5z7E
 NFbQmWrwmmKvl8sIDMdRYiiauiyLEjXVl5eksDfp/fW5zdP63KyhfYDCKUqJeUGg5h
 10yyFN4raLWug==
Received: by mail-qk1-f181.google.com with SMTP id d2so4250316qki.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 10:05:36 -0800 (PST)
X-Gm-Message-State: AOAM530av4LEgXs9wQgxQP1DnX+qUE/0NottEpaq241pgDRnLq82JXgG
 wg8z+hhRaZLy/dP4TtJYRmCefffZBscyvUrmUw==
X-Google-Smtp-Source: ABdhPJw3WzGi3L+5Ta6ODQRfCaYlSmrqLhwP4dxEGuGb/NX/g488jPllZ9zY9A7U4hgeAIa6P7qLsiBzvCJBU6SJxLg=
X-Received: by 2002:a05:620a:4547:: with SMTP id
 u7mr19259027qkp.643.1638554735749; 
 Fri, 03 Dec 2021 10:05:35 -0800 (PST)
MIME-Version: 1.0
References: <20211203154350.179112-1-thierry.reding@gmail.com>
In-Reply-To: <20211203154350.179112-1-thierry.reding@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 3 Dec 2021 12:05:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLy8UN2hDoGx3t0ev4jB_+hQ5mjzp31SyY-GOPpsCmMKw@mail.gmail.com>
Message-ID: <CAL_JsqLy8UN2hDoGx3t0ev4jB_+hQ5mjzp31SyY-GOPpsCmMKw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: panel: Include SPI peripheral properties
To: Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 3, 2021 at 9:43 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> SPI panels need to reference the SPI peripheral properties so that they
> can be properly validated.

Thanks for doing this.

>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/display/panel/lgphilips,lb035q02.yaml    | 1 +
>  .../devicetree/bindings/display/panel/sony,acx565akm.yaml        | 1 +
>  2 files changed, 2 insertions(+)

I'm seeing a few more than this. If there's some logic to the ones you
fixed, I'm not seeing it.

Documentation/devicetree/bindings/display/st,stm32-dsi.example.dt.yaml:
dsi@5a000000: Unevaluated properties are not allowed ('panel-dsi@0'
was unexpected)
Documentation/devicetree/bindings/display/panel/samsung,ld9040.example.dt.yaml:
lcd@0: Unevaluated properties are not allowed ('#address-cells',
'#size-cells', 'spi-max-frequency', 'spi-cpol', 'spi-cpha' were
unexpected)
Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.example.dt.yaml:
panel@0: Unevaluated properties are not allowed ('spi-max-frequency',
'spi-3wire' were unexpected)
Documentation/devicetree/bindings/display/panel/ilitek,ili9322.example.dt.yaml:
display@0: Unevaluated properties are not allowed ('reg' was
unexpected)
Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.example.dt.yaml:
display@0: Unevaluated properties are not allowed ('spi-max-frequency'
was unexpected)
Documentation/devicetree/bindings/display/panel/abt,y030xx067a.example.dt.yaml:
panel@0: Unevaluated properties are not allowed ('spi-max-frequency'
was unexpected)
Documentation/devicetree/bindings/display/panel/sony,acx565akm.example.dt.yaml:
panel@2: Unevaluated properties are not allowed ('spi-max-frequency',
'reg' were unexpected)
Documentation/devicetree/bindings/display/panel/novatek,nt36672a.example.dt.yaml:
panel@0: Unevaluated properties are not allowed ('vddi0-supply',
'#address-cells', '#size-cells' were unexpected)
Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.example.dt.yaml:
panel@0: Unevaluated properties are not allowed ('reg',
'spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
Documentation/devicetree/bindings/display/panel/tpo,td.example.dt.yaml:
panel@0: Unevaluated properties are not allowed ('spi-max-frequency',
'spi-cpol', 'spi-cpha' were unexpected)
Documentation/devicetree/bindings/display/panel/innolux,ej030na.example.dt.yaml:
panel@0: Unevaluated properties are not allowed ('spi-max-frequency'
was unexpected)
Documentation/devicetree/bindings/display/panel/sitronix,st7789v.example.dt.yaml:
panel@0: Unevaluated properties are not allowed ('spi-max-frequency',
'spi-cpol', 'spi-cpha' were unexpected)

>
> diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> index 830e335ddb53..240a884b7fa7 100644
> --- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> @@ -14,6 +14,7 @@ maintainers:
>    - Tomi Valkeinen <tomi.valkeinen@ti.com>
>
>  allOf:
> +  - $ref: ../../spi/spi-peripheral-props.yaml

Please use /schemas/spi/... instead.

This needs Mark's tree if you want to avoid errors. I'm fine though as
long as linux-next is okay. Or I can pull in Mark's tree and take this
and others.

Rob
