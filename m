Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59543F3CB5
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 01:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4956E040;
	Sat, 21 Aug 2021 23:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169736E040
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 23:14:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDF5861269
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 23:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629587652;
 bh=tdGAnKxM6kcsoZk3AJYnO2VXuyN1lhYFWXouYEoZxx8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RVI+ysbAJjBVl8En6Vs6QLGPSDp6AF0fy0i7mrmaMSSjeQpz5Pf+r0dc0wQhRI7TV
 Kwvrkg+yiFOhgR4iCbVQOo7tKeD4yasJQl6UTs6ErZdFrr0+uR2VrGY7QUNxDzH6+w
 9iH8RVxmt+kqUpV0zJs4jF8hwCVbOyPJqrZkcRLTarM1NqycsWOMv6tMTgh7pwbd+n
 rj5hf9VhejMa/2NxaC5/3DtAZF80309hB0zAUPeOvYpyFZDCSuDkH/fbdE3nG5kOCc
 3lkT4RZ6V+vrqBJ94Bp92JJ/0fdZy6A1HR6zxEgWlomfN1/Yn8LQG9cGsqywL0Y39u
 bkpGgl9NeBvaA==
Received: by mail-ej1-f43.google.com with SMTP id a25so1410741ejv.6
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 16:14:12 -0700 (PDT)
X-Gm-Message-State: AOAM531e4V4tmHpNev2usc/DRRIayfuC9An3pdFJhl/1Xs+lSauhGSOi
 qcZxm1dAvoWK+lBw0V7ci8RqPEjw3UtkK56H/A==
X-Google-Smtp-Source: ABdhPJwTRztprBtYY7QES1iZ4ScD8mkXMBE/wRVHlguKZVJ/TxTvzU9+aJ8opXWxfoCtbK7Nd3DULgP8hMTBvn6pcmo=
X-Received: by 2002:a17:906:f43:: with SMTP id
 h3mr29009091ejj.267.1629587651408; 
 Sat, 21 Aug 2021 16:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Aug 2021 07:14:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9BUZ3x01FXY=UKmcrqGxmP7bfpqyz7zCJXK=+2xUhrYA@mail.gmail.com>
Message-ID: <CAAOTY_9BUZ3x01FXY=UKmcrqGxmP7bfpqyz7zCJXK=+2xUhrYA@mail.gmail.com>
Subject: Re: [PATCH v8 03/13] dt-bindings: mediatek: add mediatek, dsc.yaml for
 mt8195 SoC binding
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 singo.chang@mediatek.com, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
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

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=881=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> 1. Add mediatek,dsc.yaml to describe DSC module in details.
> 2. Add mt8195 SoC binding to mediatek,dsc.yaml.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dsc.yaml        | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,dsc.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.=
yaml
> new file mode 100644
> index 000000000000..f94a95c6a1c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam=
l
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek display DSC controller
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>

According to [1], the maintainer should be

Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix=
.de>

[1] https://www.kernel.org/doc/html/latest/process/maintainers.html

> +
> +description: |
> +  The DSC standard is a specification of the algorithms used for
> +  compressing and decompressing image display streams, including
> +  the specification of the syntax and semantics of the compressed
> +  video bit stream. DSC is designed for real-time systems with
> +  real-time compression, transmission, decompression and Display.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8195-disp-dsc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DSC Wrapper Clock
> +
> +  power-domains:
> +    description: A phandle and PM domain specifier as defined by binding=
s of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +
> +  mediatek,gce-client-reg:
> +      description:
> +        The register of display function block to be set by gce. There a=
re 4 arguments,
> +        such as gce node, subsys id, offset and register size. The subsy=
s id that is
> +        mapping to the register of display function blocks is defined in=
 the gce header
> +        include/include/dt-bindings/gce/<chip>-gce.h of each chips.
> +      $ref: /schemas/types.yaml#/definitions/phandle-array
> +      maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    dsc0: disp_dsc_wrap@1c009000 {
> +        compatible =3D "mediatek,mt8195-disp-dsc";
> +        reg =3D <0 0x1c009000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
> +        power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +        clocks =3D <&vdosys0 CLK_VDO0_DSC_WRAP0>;
> +        mediatek,gce-client-reg =3D <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000=
>;
> +    };
> +
> --
> 2.18.0
>
