Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF2B0210D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 18:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E52A10E3A5;
	Fri, 11 Jul 2025 16:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="MRY+qCPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC1310E3A5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 16:02:44 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-711a3dda147so25382137b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1752249764;
 x=1752854564; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KH5AFNkQfuVWbiRBmKTQngI4D6xLZ6iRLprTVywV+pY=;
 b=MRY+qCPLF0TJkO976V05ano3pIv6UNFqcI3CUm8KV0g4iAf7m4u67DAu3T5x9lADid
 eHXAlevy0wRnPPziPyXZf27zmyLpzYG1i+xfqhlQDmYEUNwMtFa59cyFvEniIRpb1pCT
 tTCPwe4ut8blGX8Q//I0G2unDanOcpEXkMXgOh5las9sDVLzxBPxZyOijNhvrVffSqmC
 l86Uam8lOrsWDwwXvQF3XIwEId9EcLTRfOMsutcXe+OTx52qtOGEKFtIMQlftNHR3aAa
 pbv3SNrwzjnJrOe/qYnH4QpQD06/C6C/vp6Xi+O33CFUiLCeNDvOiuRaDMvIB8RrL2fN
 pXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752249764; x=1752854564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KH5AFNkQfuVWbiRBmKTQngI4D6xLZ6iRLprTVywV+pY=;
 b=H8nY+CjlXH/d7UJb81EFN8YyYUuzJf6xcB9LOFwPmgcy6p3vWMWM0KoCuM9gORG8jQ
 BPCEQXJEutwmugcvb0wiNcRs04ugXsADTa32PCdKI8Nd1URK1oUVAflu3wPZMSvoeJFU
 8UAZhXhP5E7PzCGqpd1tvwWYEiXeLz3k2nQC/7GYF3qM2Lados1CN54fqfLp1wWZp2UL
 RIlkD/PjdpMd5KMelZrcodB7lkXhKbob1iln9ZkDojlaiWFYUpUVrqJFCHvnyraS/pwT
 YydWi2WgFF2/98iI1HIvIvbR+SzYYJXW06sJkoMX+SHetEF1lCYiAv5YMdYXMrr4cAW9
 G8Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgFTSZ0+OpYFVs4wfEdFyzNeDQ+yRkTjgQrIAJAGvkOKKlKhxG/JFWSqax93ziAoWNX0xnTrTWOIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8fsp81887c/l0x9YhzCEvzd/nRvPlnU8UPD9RDymue+KPoLqp
 X0czdTHKnFhUjubFXWmHmpAqbdkCGJ0dFi1cquAZeRjtIVxLLkwH6Q90vHrc21NVV0Nrudnaycd
 qvgROSJaYUQ==
X-Gm-Gg: ASbGncuSoGJv6u60L0WvBGXoNYRFilg7KpJqRF/GVtdcilXJpRffPZ31AesWyVXFSGI
 vqmv2UXCAS9i/UdljF/GDo5nSnVI9jsd58xcdyUsqcuYbIVinSG1gUeTL04MkbFgdIt2BJKE8Yo
 6D0Q8ANk/CtCCe+I1KIP4TVDFaWABowxZ9X2bOL2+OAkRmAq3n3rYt0hKitRD74/5wRqV1zs6F8
 dNsxCr8KRW3DT4CxnEKXv072mF+p/Bm2KDTADl1Pxb+vVSentF5tV7/W7Ds0jXrz2dNcYxrfJId
 vMvsZzOylRlVHcxX2Ap/nlGt7qCmlX38BPcHj4vcwLpYRg+bZUiMvWr3OtvBum0n9rVX6mc4jn8
 KmzfnAQ3seoQJS35h77YxRCrGCyOI/sd2LGpmjcwKRrtae9gG6f1E3AgH2yjljnf1xmjNb3oTQH
 VN
X-Google-Smtp-Source: AGHT+IFQDf3V4P6gGqrSToczWpT5afYnRraRsWWZi5mJ0XqiSQAHJcgBkRgLrf+Nr1x8WjL/8nhgcw==
X-Received: by 2002:a05:690c:6083:b0:712:cc11:af8 with SMTP id
 00721157ae682-717d5ede770mr68756507b3.27.1752249763504; 
 Fri, 11 Jul 2025 09:02:43 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-717e4590f5dsm1393227b3.90.2025.07.11.09.02.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 09:02:42 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-711a3dda147so25381527b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWRCH3I41wyCWBGLxxc7SZkhtlP03NJuFu8e8D2gd4XNhQBLNUoLglGngdGhXd8sqmHiXdL935guqE=@lists.freedesktop.org
X-Received: by 2002:a05:690c:b91:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-717d5f06565mr68541397b3.32.1752249762154; Fri, 11 Jul 2025
 09:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-6-dc16cfe6fe4e@tomeuvizoso.net>
 <a8c3df16-a460-49bb-ba4e-1a07135d24e5@arm.com>
In-Reply-To: <a8c3df16-a460-49bb-ba4e-1a07135d24e5@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 11 Jul 2025 18:02:29 +0200
X-Gmail-Original-Message-ID: <CAAObsKCinmbFwRqWTOCB3uoH0YLUm3wkvQ7GUhtESzHnAieGxw@mail.gmail.com>
X-Gm-Features: Ac12FXxOOfjV90DXXXBg685kI3y2UMTJtFOhXoVtyQciGpdKZH7V2bdydsxAp7M
Message-ID: <CAAObsKCinmbFwRqWTOCB3uoH0YLUm3wkvQ7GUhtESzHnAieGxw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Tue, Jun 24, 2025 at 3:27=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >    IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > v3:
> > - Split register block in its constituent subblocks, and only require
> >    the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >
> > v4:
> > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowsk=
i)
> > - Remove unneeded items: (Krzysztof Kozlowski)
> > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > - Fix example (Krzysztof Kozlowski)
> >
> > v5:
> > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > - Streamline compatible property (Krzysztof Kozlowski)
> >
> > v6:
> > - Remove mention to NVDLA, as the hardware is only incidentally related
> >    (Kever Yang)
> > - Mark pclk and npu clocks as required by all clocks (Rob Herring)
> >
> > v7:
> > - Remove allOf section, not needed now that all nodes require 4 clocks
> >    (Heiko St=C3=BCbner)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >   .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 118 ++++++++++++=
+++++++++
> >   1 file changed, 118 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0588c085a723a34f4fa30a9=
680ea948d960b092f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks.
> > +
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special because it is able to redistribute =
work to
> > +  the other cores by forwarding register writes and sharing data. This=
 special
> > +  core is called the top core and should have the compatible string th=
at
> > +  corresponds to top cores.
>
> Say a future SoC, for scaling reasons, puts down two or more whole NPUs
> rather than just increasing the number of sub-cores in one? How is a DT
> consumer then going to know which "cores" are associated with which "top
> cores"? I think at the very least they want phandles in one direction or
> the other, but if there is a real functional hierarchy then I'd be
> strongly tempted to have the "core" nodes as children of their "top
> core", particularly since "forwarding register writes" sounds absolutely
> like something which could justify being represented as a "bus" in the
> DT sense.

Actually, I experimented with having the three cores as completely
independent units and things just work with how resources are
referenced in the DT nodes.

So I'm just having a top-level node per core with the same compatible.

Thanks,

Tomeu

> Thanks,
> Robin.
>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-rknn-core-top
> > +      - rockchip,rk3588-rknn-core
> > +
> > +  reg:
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    items:
> > +      - const: pc
> > +      - const: cna
> > +      - const: core
> > +
> > +  clocks:
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  npu-supply: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: srst_a
> > +      - const: srst_h
> > +
> > +  sram-supply: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - iommus
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - npu-supply
> > +  - sram-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/rk3588-power.h>
> > +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> > +
> > +    bus {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      npu@fdab0000 {
> > +        compatible =3D "rockchip,rk3588-rknn-core-top";
> > +        reg =3D <0x0 0xfdab0000 0x0 0x1000>,
> > +              <0x0 0xfdab1000 0x0 0x1000>,
> > +              <0x0 0xfdab3000 0x0 0x1000>;
> > +        reg-names =3D "pc", "cna", "core";
> > +        assigned-clocks =3D <&scmi_clk SCMI_CLK_NPU>;
> > +        assigned-clock-rates =3D <200000000>;
> > +        clocks =3D <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
> > +                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
> > +        clock-names =3D "aclk", "hclk", "npu", "pclk";
> > +        interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus =3D <&rknn_mmu_top>;
> > +        npu-supply =3D <&vdd_npu_s0>;
> > +        power-domains =3D <&power RK3588_PD_NPUTOP>;
> > +        resets =3D <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
> > +        reset-names =3D "srst_a", "srst_h";
> > +        sram-supply =3D <&vdd_npu_mem_s0>;
> > +      };
> > +    };
> > +...
> >
>
