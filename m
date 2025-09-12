Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE17B5454E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24F510EBC0;
	Fri, 12 Sep 2025 08:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KSZmxq/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBB210EBC0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:27:58 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-336e44ca0e4so13792471fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757665677; x=1758270477;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zi88VRbZEuFnGbKkriA0LDu6mR+gOJpwP4/2p/PnZ1A=;
 b=KSZmxq/ltAYbbm25MDzYuS84K1d5QUohYFeao8J6Ne+I8uAs5gREpmJQ4/vb9RWTon
 cwA5EmIcRlAUmLotrpK3vSh7Xx29imOqdmIOc7XQofDNu/1rT8KouTVsA+KHich6JXAs
 uZH7Mzkr2TqHRzaw0LotHAjmrPVOESFXfpF+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757665677; x=1758270477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zi88VRbZEuFnGbKkriA0LDu6mR+gOJpwP4/2p/PnZ1A=;
 b=FKa21fJyNt5F6XXypMLof+QgUFZhz9c7WiEHBRtPXf6J4biMbynQGygohn6cXuTsgK
 vXcX1QTjDYLREodMBRJ+EODxsE3LJyVuBTaxa9ZF/6fHo1miBfq5Jzj3AhkH+bfFEucL
 aPzococfTn64+Ynuny0C+hNsEJyOi+E4NRW3TQNjUhvIiNa5+iflZOj03qj+mKUlLO6c
 8DoNraUG3ruO9VlGXpCEQNc0wpI4/BRt3qyo3WsaJFttlFLk7QhN85MJpp0LXK0EfPaE
 XL8817WvI4jK0ZN4+b2YufyvCaoDniQ8IbF8v86mK/spjs47bMYuPa6jjmYVWo1K+sPE
 uYRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Np6qePM7hnmG1Cg0duESX8NtcimpQN9O9g/+vR/CN5Vc78+XStW9+b0jzimu5jJ4aB2XG0kS60c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZljQOsn2u2LyEFfaGseilLnhWZ7u3r4FzvXvZMvdnkfdwZHyw
 0CrQNcy08DWJxqPIeypt0cDb+9L68WlKlitlO67qwh9WB5WZA7cK5X7jTGq88N6JSCg4ZWVy9wY
 gr7ypaZONnapmbAUJTg/uT8gIpK0+OA25do9VVV/r
X-Gm-Gg: ASbGncuMSjG3L+3pFi+hmLFtN0toedTXsAWixmbVBYj3Y4nZlu0Ko0I6bvkQs4/M8By
 A/FU72w0oEbyb7xZ063gkz9QMyXApk7sS+BiZhTP3FMHsSGRGx/NbLz8IyFEIGpGAyPlSTQI2U3
 rD6EFARukBCJbYwNTs6kAC5xTfcQ0896V3NWVZxs+B4tGeJRsJ9UFgp+jNmVIu4bIiBrhyl0byn
 eS3nL1+D/rHnjwvghgdHsm5t1Vk0e7FIFcZnQ==
X-Google-Smtp-Source: AGHT+IGuFu/6x8GGdyKs3uZP46gycKBj+oJ6yMQK+fd/K5sFBfDmEqPc/X66Qf0G8U/XPK4phpEvZh/Ddpcm0n+c0BE=
X-Received: by 2002:a05:651c:4350:20b0:336:6481:1549 with SMTP id
 38308e7fff4ca-3513aeb2e2amr5142751fa.12.1757665676867; Fri, 12 Sep 2025
 01:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-2-ariel.dalessandro@collabora.com>
 <20250912-alluring-turaco-of-conversion-dca193@kuoka>
In-Reply-To: <20250912-alluring-turaco-of-conversion-dca193@kuoka>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Sep 2025 16:27:45 +0800
X-Gm-Features: Ac12FXxVG1RuSVKZojzF8lrEoj8T-u7pZlbyr1abmA13aynWyYRO-SXBCvUw2XE
Message-ID: <CAGXv+5GovP7NuG042AwfmtC-sPJMGuFAm6iZ0iqNZgU0VE+qmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>, airlied@gmail.com, 
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com, 
 angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
 chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
 heiko@sntech.de, houlong.wei@mediatek.com, jeesw@melfas.com, 
 kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
 lgirdwood@gmail.com, linus.walleij@linaro.org, 
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, 
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org, 
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
 support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 netdev@vger.kernel.org
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

On Fri, Sep 12, 2025 at 2:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Sep 11, 2025 at 12:09:50PM -0300, Ariel D'Alessandro wrote:
> > Convert the existing text-based DT bindings for MediaTek MT8173 Media D=
ata
> > Path to a DT schema.
> >
> > Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > ---
> >  .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
> >  .../bindings/media/mediatek-mdp.txt           |  95 ----------
> >  2 files changed, 169 insertions(+), 95 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt=
8173-mdp.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-md=
p.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-md=
p.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> > new file mode 100644
> > index 0000000000000..8ca33a733c478
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> > @@ -0,0 +1,169 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT8173 Media Data Path
> > +
> > +maintainers:
> > +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > +
> > +description:
> > +  Media Data Path is used for scaling and color space conversion.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - mediatek,mt8173-mdp-rdma
> > +          - mediatek,mt8173-mdp-rsz
> > +          - mediatek,mt8173-mdp-wdma
> > +          - mediatek,mt8173-mdp-wrot
>
> Why there is no mediatek,mt8173-mdp here? What does this compatible
> represent?
>
> > +      - items:
> > +          - const: mediatek,mt8173-mdp-rdma
>
> Still suspicious. Device cannot be simulatanously: compatible and not
> compatible. This is not a well known cat that has superposition of two
> states, whenenver you look the other way.
>
> Maybe the old binding was incorrect, maybe the in-tree DTS is incorrect.
> Whichever the reason, this must be investigated and documented, because
> by standard rules this is wrong. Each wrong code needs very clear
> explanations (and "someone did it" is not a good enough explanation).

My guess is that "mediatek,mt8173-mdp" is meant to serve as a single
entry point for the implementation to bind the driver to. The MDP is
a Data Pipeline and there could be multiple instances of the same
IP block, as seen in the original example.

The datasheet I have doesn't cover the "RDMA" block specifically, so
I can't say whether there is an actual difference between the two RDMA
blocks.


ChenYu

> > +          - const: mediatek,mt8173-mdp
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  mediatek,vpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to Mediatek Video Processor Unit for HW Codec encode/dec=
ode and
> > +      image processing.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8173-mdp-rdma
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Main clock
> > +            - description: Mutex clock
> > +    else:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Main clock
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8173-mdp-rdma
> > +              - mediatek,mt8173-mdp-wdma
> > +              - mediatek,mt8173-mdp-wrot
> > +    then:
> > +      required:
> > +        - iommus
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8173-mdp
> > +    then:
> > +      required:
> > +        - mediatek,vpu
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/memory/mt8173-larb-port.h>
> > +    #include <dt-bindings/power/mt8173-power.h>
> > +
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        mdp_rdma0: rdma@14001000 {
> > +            compatible =3D "mediatek,mt8173-mdp-rdma",
> > +                         "mediatek,mt8173-mdp";
> > +            reg =3D <0 0x14001000 0 0x1000>;
> > +            clocks =3D <&mmsys CLK_MM_MDP_RDMA0>,
> > +                     <&mmsys CLK_MM_MUTEX_32K>;
> > +            power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
> > +            iommus =3D <&iommu M4U_PORT_MDP_RDMA0>;
> > +            mediatek,vpu =3D <&vpu>;
> > +        };
> > +
> > +        mdp_rdma1: rdma@14002000 {
> > +            compatible =3D "mediatek,mt8173-mdp-rdma";
> > +            reg =3D <0 0x14002000 0 0x1000>;
> > +            clocks =3D <&mmsys CLK_MM_MDP_RDMA1>,
> > +                     <&mmsys CLK_MM_MUTEX_32K>;
> > +            power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
> > +            iommus =3D <&iommu M4U_PORT_MDP_RDMA1>;
> > +        };
>
> My previous comment applies.
>
> Keep one or two examples.
>
> Best regards,
> Krzysztof
>
