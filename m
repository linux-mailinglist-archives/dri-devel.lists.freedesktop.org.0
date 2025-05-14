Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4883AB716B
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 18:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B5510E686;
	Wed, 14 May 2025 16:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="sMWfqQ7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64B310E686
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 16:32:10 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3d96d16b369so63052735ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 09:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747240330;
 x=1747845130; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJ0AzCyNbBw7LmTlYnlYRUZRvc6BiWujoVO60kyzOiU=;
 b=sMWfqQ7uQygwi6ObYV7ls2Ea8qUzwgoVZb7D4osjIFhkPRrX26DCR6gbnn8yTde+Xe
 /a7sBd6grt7mGi/SNiFtJAisjum5+gqfIVwkl6kZW7Fk4ALw1iglx9ybWVjhyUys5ehG
 Omx+17h46GxNCeDuz1E0gS+TVPTKAXZ011nts/0aFDgOkZE/ia9RnbHt7rQB0729JBA0
 WrLDd5sKx7jtumeTFjtdVzGFfSuj+cuI0tEpzuQcWUv4NrTLDJbaC4sHfBwxukUTcyeO
 JSU1CV1/KNQEEzAkJZTaYxnZD0/WjtA/svBdATgz79ZsKgn4xrJXEbQvdhUz3IuBbBA6
 5Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747240330; x=1747845130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJ0AzCyNbBw7LmTlYnlYRUZRvc6BiWujoVO60kyzOiU=;
 b=HYRQ6a6T4kffmHmb3p8AE+n08ZUxXWduOjFtGbQyJt/oD2sLsdOrnsXzMlSR63A4Yr
 mXE7z5cLbm9Psqb48jCsxAf6qYozqWqK0SYIrbBvOQrALQH17IdeUtHp+bh4l3hiKAOy
 52By1CIjBOrkxWaucWh9nhTQeXotKBUy10YjG34XLcy4Ihj0HkIsYWKZxBtCHmja1mmG
 UH9MQ1WOV3KVb80XJpBU2vxjgm/7VMSqKOk2ITx5lJAon3eK7g5R4Xwbr366tm6X6QGS
 uxO9hePWGFDEl/CRBgMFCHgEn6BDp1Wj3KRubakwruSqlDeRulpD3tHtw/CSY/Y4Epn8
 9SGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+f8GVq0O2h70jFHCZ0AF+it7cub5uixv/rOAeGqPaFpSyIl0uk8W028hWm8wS4SA28FMF0XRHqP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbewPwoTZTjiDoi2mXhQPPQcBT96asIJqq9kEpqLlX53B7bFWX
 rlGQBRsrwh8vrlqOlBw2dM4ms5vR6hQY5lY6eL8GIdKi3x6esT2Cs6phESGcMRkUXDOMsPt8ppM
 4SZyAVg==
X-Gm-Gg: ASbGnctBfpcDWuJ+AB0iCFeSWar+n38QdWSRKi7CVe1nATEHgegEGepUBc4k+IQyx4i
 k5arn7qFBOgdJ/bWqTfluYsCViig5OqyxF19xrNYvGNueN9slBblrcyLyR8VcGGdsfSWG25r7HV
 zRTXc1sPQWwRb6iIXdkVO9yMZR8o3utXnqKUxe3A4shGm4ZmNS5RLzc+y/4w6NHQs1rjjVXSX/b
 9tf3JF4CEOKrN+bdzOOGTDoCFSN2jee3Ytp/pXYGy1oXivgu+j6gtvH4tDVsRyGtDniPM/vcHdM
 SAssJ4kfcBkrmGW2iXuslLPSAwIOUEiRQlvNgG4kVo2/Oz1KB4tEbVFKyimq9dG8yHoNuaORYu7
 IsXLYEUAHzB4HaHzB9MyccqaZ2/xobw==
X-Google-Smtp-Source: AGHT+IFFMCC8ePEfRdwptakX9QmAzevgC3UId5s64iyrAOJg68VAh8J+653dnos+OHSQ6ZZZybFZLQ==
X-Received: by 2002:a05:6e02:1fc6:b0:3d9:39f3:f250 with SMTP id
 e9e14a558f8ab-3db6f794c00mr48907795ab.3.1747240328229; 
 Wed, 14 May 2025 09:32:08 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3da7e1595ddsm35423575ab.48.2025.05.14.09.32.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 09:32:08 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3d96d16b369so63052565ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 09:32:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVinT7Paj8cMYDsqPNvc+OIa33na4O5tSjoAuGJ0rrgnbaU/o18pwr3qcfESrZ0Rh8eH4SxpGHy+Dg=@lists.freedesktop.org
X-Received: by 2002:a05:6902:1202:b0:e6d:f160:bbdf with SMTP id
 3f1490d57ef6-e7b3d59ae2fmr4832866276.36.1747240009056; Wed, 14 May 2025
 09:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>
 <20250225160248.GA2563229-robh@kernel.org>
In-Reply-To: <20250225160248.GA2563229-robh@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 May 2025 18:26:38 +0200
X-Gmail-Original-Message-ID: <CAAObsKD01rdYf0E6Vev6oFRZEf1f006oi+ghgVUn+h=aRx-hmQ@mail.gmail.com>
X-Gm-Features: AX0GCFvDEBwxCoW2ZGLJEEIKb_2H5q_lCEI2NWi7ZFVAMNUkSoshPa20AanOMV0
Message-ID: <CAAObsKD01rdYf0E6Vev6oFRZEf1f006oi+ghgVUn+h=aRx-hmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

Hi Rob,

On Tue, Feb 25, 2025 at 5:02=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Feb 25, 2025 at 08:55:47AM +0100, Tomeu Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++=
++++++++
> >  1 file changed, 152 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.y=
aml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a=
9f4aa7c1901362a3f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks, based on =
NVIDIA's
> > +  open source NVDLA IP.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu-core@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core-top
> > +          - const: rockchip,rknn-core-top
>
> Drop the fallbacks unless you have some evidence that the IP is the
> same across a lot of SoCs. If you don't, then
> rockchip,rk3588-rknn-core-top can be the fallback whenever there are
> more compatible SoCs.
>
> Or if there's version/feature registers that otherwise make it
> discoverable, then a common compatible is fine.
>
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core
> > +          - const: rockchip,rknn-core
>
> I don't understand the difference between core and core-top. That needs
> to be explained in the top-level description.
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +    minItems: 2
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
>
> Group supply properties together
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - iommus
> > +  - npu-supply
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - sram-supply
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core-top
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +
> > +        clock-names:
> > +          minItems: 4
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          maxItems: 2
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
> > +      rknn_core_top: npu-core@fdab0000 {
>
> npu@...

Can you extend on why you would prefer to have npu@? As each node
corresponds to a core inside the NPU, I went with npu-core@.

Thanks,

Tomeu

> > +        compatible =3D "rockchip,rk3588-rknn-core-top", "rockchip,rknn=
-core-top";
> > +        reg =3D <0x0 0xfdab0000 0x0 0x9000>;
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
> > +
> > +      rknn_core_1: npu-core@fdac0000 {
> > +        compatible =3D "rockchip,rk3588-rknn-core", "rockchip,rknn-cor=
e";
> > +        reg =3D <0x0 0xfdac0000 0x0 0x9000>;
> > +        clocks =3D <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
> > +        clock-names =3D "aclk", "hclk";
> > +        interrupts =3D <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus =3D <&rknn_mmu_1>;
> > +        npu-supply =3D <&vdd_npu_s0>;
> > +        power-domains =3D <&power RK3588_PD_NPU1>;
> > +        resets =3D <&cru SRST_A_RKNN1>, <&cru SRST_H_RKNN1>;
> > +        reset-names =3D "srst_a", "srst_h";
> > +        sram-supply =3D <&vdd_npu_mem_s0>;
> > +      };
> > +    };
> > +...
> >
> > --
> > 2.48.1
> >
