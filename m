Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8147CDDB5B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 12:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849EC11B63E;
	Thu, 25 Dec 2025 11:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C+0lAvyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B24711B63E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 11:17:19 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-2a137692691so75460655ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 03:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766661439; x=1767266239; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NR9ewMLjXFiPPdUADJ8UIVWJfNnUqlBWb4FQrwaT2qY=;
 b=C+0lAvyJgfd4rYMDKwf6vyN4DP25qTZFbEZdeJhD7Pl34zYiZl0qxYOkCn8wVRtlpO
 aPIBlh+HRTQFq6xVHTckpf6gplI+YuNhlJnLIMrt1p7KWeuekksY6ZLfIJt9EaEMXkTl
 3wOrLVJTU2YsovpLL+xLUpwSyAkRy6S/IUxLpX7N8Ft3tAGQmfiRZClstBwpJ+1bXmcZ
 slVbojBTiTkId+xTwhRZr/Z8xsk1Ml1Cyd/d+TlKhzgQL5NAGuwutTaJhQPpn7SDasG1
 tPGjXrYnnaJ2YXKMyU81TfJYdrSOu+SBsEJG5DrUJm97q05pZaR5YMfo7gB7vG38EHlv
 tevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766661439; x=1767266239;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NR9ewMLjXFiPPdUADJ8UIVWJfNnUqlBWb4FQrwaT2qY=;
 b=Z9HUvU/pZWj23hxLoGVh3FSqKYaOY62VfgDb5tVX7sKpJDteQsrrw0qroIIDLpLlPj
 vbvUg7bc5HC4Z7z6BaF6MHT/IiYPem+jZAdNonvJuOtyjx/yHtyfZ48kKKWiuuFOPVgq
 VCGvfg46RrAeGgsPAVf2XpVClkgzLgC/3RIOBf1jjSI7aONfoKzEtsaiMFf5Wmrd/1sE
 vmnXCyzuWHFz1mcThKxlqrY5aA2KRBepNb01sBt3l9rSMbZ8QeAmz39v/oBDA9wvWW5c
 rEHOiW/QewednR0CMybPCQjYaFHi0OHWDq1G/Z++3+X6KmpodRkqiWrs60YIM3K39iZz
 eLIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8IHEc/f6r5L5IG/IRZxVPBemi1PS1J6J0Co93bLKYareqWWLU7FkKxYDF8XrL/PRQOkIFyk6Nuck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeLuCxZ4PR8twh+/oVsvqTmnMVqhTzzVTol4iCt4o99pQ/sckE
 XT0uEEwse/05tvkng38uQcAVOfVTkEylakjNMoJGYPOaaZBwpiguURo7/2ksIiAZQ0AqD311
X-Gm-Gg: AY/fxX7Tj7aKQ1Fut2WO6yNkWjdauH89R9ih4iYmK9sh7jRFPRwfq10d06Dwkje2orx
 0OoEkduwLcMfCDGO8b+2gph2Kxj4DMuXRhaWOwhDhcMFYaKzvxEWIKOVsgaIWZdJjfRyDBGdxvh
 AfiGNwaLxQ/kpc+R4ZMcaT5ZQvXFLu+xqYhsr790dh9ORYPNhQYhcSyxepz/xhCKQK/9JHQ5QJ7
 jzo080Sw1K9bgFogqwonpmtoC4upuzcQ0eo3MdkvT3KMKZk3iEJNniWWlu828mzSCu2LrHLsnYu
 0KEkKnwMkFWUhH85dbbnbMWk7OcvuN0A6EiM8thAAmemGce2MR4KdJK1858PozAXu2mu97aqxpP
 UqCYpbiunoNEqvGYkNubTwi5FM/Ij5pXkBn0Fka5d9mupRqrd6Je0IgtB++wG23sREO+LuhwDLK
 h4Kd06eqF6d986jxKidldJBtaw5kakOuDgd5U3X21qeBcIkXjGMe+s/2Nj1CON34aCloyhgYT74
 1Tg8oCXz1TZQQhVfQ==
X-Google-Smtp-Source: AGHT+IG2M8a8qGctLFSHsXVBGxXFam1e3c0AO/WF6f8CTG9U4DPalhsEV923XI9BxX9JmKKZ65n0vg==
X-Received: by 2002:a05:6a20:12cb:b0:34f:a16f:15ad with SMTP id
 adf61e73a8af0-376aa7f0de4mr19263347637.53.1766655352891; 
 Thu, 25 Dec 2025 01:35:52 -0800 (PST)
Received: from smtpclient.apple (125x103x213x40.ap125.ftth.ucom.ne.jp.
 [125.103.213.40]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e76de1e41sm10145504a91.2.2025.12.25.01.35.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Dec 2025 01:35:52 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
Date: Thu, 25 Dec 2025 17:35:34 +0800
Cc: "Han Gao (Revy)" <rabenda.cn@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FBE5FD78-D7E8-4961-BF13-9BDA0F840548@gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
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



> On Dec 25, 2025, at 00:11, Icenowy Zheng <zhengxingda@iscas.ac.cn> =
wrote:
>=20
> From: Icenowy Zheng <uwu@icenowy.me>
>=20
> Verisilicon has a series of display controllers prefixed with DC and
> with self-identification facility like their GC series GPUs.
>=20
> Add a device tree binding for it.
>=20
> Depends on the specific DC model, it can have either one or two =
display
> outputs, and each display output could be set to DPI signal or "DP"
> signal (which seems to be some plain parallel bus to HDMI =
controllers).
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v4:
> - Added a comment for "verisilicon,dc" that says the ID/revision is
>  discoverable via registers.
> - Removed clock minItems constraint w/o specific compatible strings.
>=20
> Changes in v3:
> - Added SoC-specific compatible string, and arm the binding with clock =
/
>  port checking for the specific SoC (with a 2-output DC).
>=20
> Changes in v2:
> - Fixed misspelt "versilicon" in title.
> - Moved minItems in clock properties to be earlier than items.
> - Re-aligned multi-line clocks and resets in example.
>=20
> .../bindings/display/verisilicon,dc.yaml      | 144 ++++++++++++++++++
> 1 file changed, 144 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>=20
> diff --git =
a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml =
b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> new file mode 100644
> index 0000000000000..fe64cc1466690
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Verisilicon DC-series display controllers
> +
> +maintainers:
> +  - Icenowy Zheng <uwu@icenowy.me>
> +
> +properties:
> +  $nodename:
> +    pattern: "^display@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - thead,th1520-dc8200
> +      - const: verisilicon,dc # DC IPs have discoverable ID/revision =
registers
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DC Core clock
> +      - description: DMA AXI bus clock
> +      - description: Configuration AHB bus clock
> +      - description: Pixel clock of output 0
> +      - description: Pixel clock of output 1
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: axi
> +      - const: ahb
> +      - const: pix0
> +      - const: pix1
> +
> +  resets:
> +    items:
> +      - description: DC Core reset
> +      - description: DMA AXI bus reset
> +      - description: Configuration AHB bus reset
> +
> +  reset-names:
> +    items:
> +      - const: core
> +      - const: axi
> +      - const: ahb
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The first output channel , endpoint 0 should be
> +          used for DPI format output and endpoint 1 should be used
> +          for DP format output.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The second output channel if the DC variant
> +          supports. Follow the same endpoint addressing rule with
> +          the first port.
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-dc8200
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +        ports:
> +          required:
> +            - port@0
> +            - port@1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> +    #include <dt-bindings/reset/thead,th1520-reset.h>
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      display@ffef600000 {
> +        compatible =3D "thead,th1520-dc8200", "verisilicon,dc";
> +        reg =3D <0xff 0xef600000 0x0 0x100000>;
> +        interrupts =3D <93 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clk_vo CLK_DPU_CCLK>,
> +                 <&clk_vo CLK_DPU_ACLK>,
> +                 <&clk_vo CLK_DPU_HCLK>,
> +                 <&clk_vo CLK_DPU_PIXELCLK0>,
> +                 <&clk_vo CLK_DPU_PIXELCLK1>;
> +        clock-names =3D "core", "axi", "ahb", "pix0", "pix1";
> +        resets =3D <&rst TH1520_RESET_ID_DPU_CORE>,
> +                 <&rst TH1520_RESET_ID_DPU_AXI>,
> +                 <&rst TH1520_RESET_ID_DPU_AHB>;
> +        reset-names =3D "core", "axi", "ahb";
> +
> +        ports {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          port@0 {
> +            reg =3D <0>;
> +          };
> +
> +          port@1 {
> +            reg =3D <1>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            dpu_out_dp1: endpoint@1 {
> +              reg =3D <1>;
> +              remote-endpoint =3D <&hdmi_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> --=20
> 2.52.0
>=20
Tested-by: Han Gao <gaohan@iscas.ac.cn <mailto:gaohan@iscas.ac.cn>>

