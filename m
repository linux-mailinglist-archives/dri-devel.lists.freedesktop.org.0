Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C84CDDB7B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 12:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A704311B9AC;
	Thu, 25 Dec 2025 11:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FJ1W5eOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DE911B9A9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 11:45:34 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id
 46e09a7af769-7c7545310b8so3259689a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 03:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766663133; x=1767267933; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wwHqUKmio0zDYl0J/tmo44sND18w8vdAisUr2wfwgY=;
 b=FJ1W5eOgzeEt4jYdXbczPFnREwwuufLQLKZLH3VfKlN07MQB19BikjlA5g19Kyio72
 KQ39mX5aHDP15SjUwUgEtMOGbQwoF/VavvmN3xa9O53IcNX8kWvCid/HWurKs2VSK3Nk
 n8XZ+vxfiZfOBZjB8MlbfOkwz5OKAMV4NgvNoOrVVRTCcWB1DKyu1MIA2ApU+wzjBy1L
 TyuArpGMVVqIX79jRpkMKJgCRkb7mzmQAoqkqHJw9T9USq/+hTvmEoXM4lWGA4lC2Xfp
 jTXYhPib9SvN5BWnzsDD0BX2sSgY0o2pixbzoXDW3mvs5OzdwVwXW/Csi41CIupSJXtp
 zD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766663133; x=1767267933;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/wwHqUKmio0zDYl0J/tmo44sND18w8vdAisUr2wfwgY=;
 b=I6Ijso9W4zstpCfEScIQDFN/UqCLVcPBzezxrmwW7z25pUnBENjK2I0wnzUKzK3VHo
 AD2ukEtLBNj34WIr48bY4jD27aJ5o4XpQXXX9C5ugIl5fxsaYPMiOci0x2GKop9PP1i4
 G/bmcikPHTRej4mnZ7x8XaalFvyQQU4JBOYPKxKfFw0kH5JYdlxcUI5JEveSp9fj+i7b
 jztCb5ZSOBkTrh03GVHrsYcZSjKPP835sDWXitUH1U4ImWqPfkMxfua48KmI0DivXqyj
 nrerNX4kxmw90QsWw5G46+6DgnH3JRdV9RbN9GPIbYgB5kf/8xnv/2GRSBg42UmfW8JR
 kmOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUypJnV9hxsVoVHFqFuj7G7RB/zBtO+eowb1/5u72hIcyMwEcjMRAgPyHxzpNnZrfQDpzELhevwTec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywlr40WDULL81Jvgfocla5Rpb+FDBNUN5PB548UWkI+eY/Kpi5h
 TFp3Qt5U42K1PLUZwF73Sbmz3mSg3hYG/XADTuqiFnQTEfSbsNa6f1tfDp8xIScm0v452sCu
X-Gm-Gg: AY/fxX6vp4k9DzaZRAGF2CDr5P1fMktW87dfc4sVsWplMFeINlp8l6HB9luueeSAIy4
 ny/4+LS8mkFE4wn9aW3EiUzwfhNo7ltGcfg/uKuVDMDXFuHcViWeL7QW5vv9mNFKnSPQpCvm88C
 MU9FXNz0718ZWeHuPpNRitrtIKEPE8q2ohGlboq/D2KUeDtZ9ij+oGOk2VV1HzPbBrNpce4Hkqk
 oTbydS/OHTqcgAZ9gBMCdCJlFyKmXhneu3NZLQnG0ABxlVC8ghyhZbr1vFBK6ORPIJS1oN7IKTY
 2PzaWzcCz83WCVxIfv7stkaTaSqqG6wr5iGhBWscomSRrfviQBuWUJL/1ocZVniGYGNtxS/v0Mh
 dMm/gc90BlDfdn+USMsrUcTUK2AoZ1m6s59yw/zce/SzVNrnCsmuHy8+vaxatY0uRzsDN7SGnc6
 u7ekBQhb9zdh+1DSKBRqyMZ99LMMseeEmA8iVEKYA76Sydws6aPi7VKixgG35l61SUwsYFQBJSq
 kyadRzQIkoC+4hrdw==
X-Google-Smtp-Source: AGHT+IHBA5f7xs8SbixSTyrADxFgnATVVrMs7xqxZBXC0Al/ChYPojBml/FfU3rBeeFAo/nT5Xmn7A==
X-Received: by 2002:a17:902:e88e:b0:24c:da3b:7376 with SMTP id
 d9443c01a7336-2a2f24270d8mr202538085ad.26.1766655917374; 
 Thu, 25 Dec 2025 01:45:17 -0800 (PST)
Received: from smtpclient.apple (125x103x213x40.ap125.ftth.ucom.ne.jp.
 [125.103.213.40]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c83961sm177814725ad.38.2025.12.25.01.45.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Dec 2025 01:45:17 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
Date: Thu, 25 Dec 2025 17:45:00 +0800
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
Message-Id: <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
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

Tested-by: Han Gao <gaohan@iscas.ac.cn>=
