Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24D1B9853
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B063789F85;
	Mon, 27 Apr 2020 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B563889B03
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 19:37:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g12so17925617wmh.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gynnlawwP2L58lK7U6nOs2p5nD3J7jQ46S/46O9Sglk=;
 b=N9KWcFUX8Mo/Kasy1wW9DyZlzZceVD/CE6XLQh316tO+ezDNx6lxerDWRM/EUjewsb
 4J6UUjQVwoQZoMogoMySyTkErWUdm6SGsSbkDApKXQgCp2pamxe0toej7Q9ucGa5Gnm+
 eyeiVusmZD1eHS0aHgb+8Vd//q3bCIKayqqkJfAniMmlEtfl8hi8vOsomkq+Z51LPgD6
 42K5gO6TEH+vJnmiIm9m1+lLbqOQOEigtxE9AsFksajKLQtUPtFpwqYx2WEqqcMq2ps5
 ugdFvLiH4WejoukGnW7oEvK94R4t7p3Mv082cGW82m+xC2av6Qby6gQLO/lQbETB7Iy4
 VC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gynnlawwP2L58lK7U6nOs2p5nD3J7jQ46S/46O9Sglk=;
 b=Iw6yOnUCfO7WQkn77zbaa4rY5v8NtgJ4WHIfdEewqp7mdNoHEwVGU6b6Qe2Ry6M5jD
 zG3+mjrniwX9oAf+hDIrD4E6pqea6GHhMt+HhIK80iMEsz9hnctt/hS5bRjPV/dXml89
 CT2RChxxncDVaclv5oC4FOd/T4QKU9OF68PVq3obNOpi1wOl7kgLD/uYc5Ibp36TB5jH
 Kn+lvqiEqYSuxIEpMgX6CY/Mdm0lpD7V0cz/7VY5cbIJEQxSYwqXw9MEU/G9tUjjuaBC
 EQx9w2sBZ1MTnKGqUlP/eCIE7L2qB219ZvmOAzvEX0bCCMqjsuSep5RBvLFSJ+8k6Xq1
 RlGg==
X-Gm-Message-State: AGi0PuaGBkiN28hUTvSH8vkWJNvuKPYS8y1j+ulv+0hkt6O+b+Zl/96d
 WK1aUwbV8NfjEGIKgHM321Y=
X-Google-Smtp-Source: APiQypJ4XTrddxqN2RyHulQ7/hn1xjaKln3zjHBlhZG5Q7i33l263UZT1BbEIAIIf8Ni9zos7CKCXg==
X-Received: by 2002:a1c:6241:: with SMTP id w62mr21919075wmb.27.1587929840265; 
 Sun, 26 Apr 2020 12:37:20 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:10d8:ba05:5002:2dff?
 ([2a02:810d:340:2e50:10d8:ba05:5002:2dff])
 by smtp.gmail.com with ESMTPSA id y10sm12138259wma.5.2020.04.26.12.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Apr 2020 12:37:19 -0700 (PDT)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img, pvrsgx.yaml for Imagination
 GPUs
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <cover.1587760454.git.hns@goldelico.com>
 <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
From: Philipp Rossak <embed3d@gmail.com>
Message-ID: <9d9998cc-33bf-7d8f-658b-8d6218338135@gmail.com>
Date: Sun, 26 Apr 2020 21:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
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
Cc: devicetree@vger.kernel.org, letux-kernel@openphoenux.org,
 Jonathan Bakker <xc-racer2@live.ca>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

On 24.04.20 22:34, H. Nikolaus Schaller wrote:
> The Imagination PVR/SGX GPU is part of several SoC from
> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> Allwinner A83 and others.
> 
> With this binding, we describe how the SGX processor is
> interfaced to the SoC (registers and interrupt).
> 
> The interface also consists of clocks, reset, power but
> information from data sheets is vague and some SoC integrators
> (TI) deciced to use a PRCM wrapper (ti,sysc) which does
> all clock, reset and power-management through registers
> outside of the sgx register block.
> 
> Therefore all these properties are optional.
> 
> Tested by make dt_binding_check
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150 ++++++++++++++++++
>   1 file changed, 150 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> new file mode 100644
> index 000000000000..33a9c4c6e784
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination PVR/SGX GPU
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |+
> +  This binding describes the Imagination SGX5 series of 3D accelerators which
> +  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
> +  Allwinner A83, and Intel Poulsbo and CedarView and more.
> +
> +  For an extensive list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
> +
> +  The SGX node is usually a child node of some DT node belonging to the SoC
> +  which handles clocks, reset and general address space mapping of the SGX
> +  register area. If not, an optional clock can be specified here.
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +  compatible:
> +    oneOf:
> +      - description: SGX530-121 based SoC
> +        items:
> +          - enum:
> +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora 600MHz and similar
> +          - const: img,sgx530-121
> +          - const: img,sgx530
> +
> +      - description: SGX530-125 based SoC
> +        items:
> +          - enum:
> +            - ti,am3352-sgx530-125 # BeagleBone Black
> +            - ti,am3517-sgx530-125
> +            - ti,am4-sgx530-125
> +            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04, OpenPandora 1GHz and similar
> +            - ti,ti81xx-sgx530-125
> +          - const: ti,omap3-sgx530-125
> +          - const: img,sgx530-125
> +          - const: img,sgx530
> +
> +      - description: SGX535-116 based SoC
> +        items:
> +          - const: intel,poulsbo-gma500-sgx535 # Atom Z5xx
> +          - const: img,sgx535-116
> +          - const: img,sgx535
> +
> +      - description: SGX540-116 based SoC
> +        items:
> +          - const: intel,medfield-gma-sgx540 # Atom Z24xx
> +          - const: img,sgx540-116
> +          - const: img,sgx540
> +
> +      - description: SGX540-120 based SoC
> +        items:
> +          - enum:
> +            - samsung,s5pv210-sgx540-120
> +            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and similar
> +          - const: img,sgx540-120
> +          - const: img,sgx540
> +
> +      - description: SGX540-130 based SoC
> +        items:
> +          - enum:
> +            - ingenic,jz4780-sgx540-130 # CI20
> +          - const: img,sgx540-130
> +          - const: img,sgx540
> +
> +      - description: SGX544-112 based SoC
> +        items:
> +          - const: ti,omap4470-sgx544-112
> +          - const: img,sgx544-112
> +          - const: img,sgx544
> +
> +      - description: SGX544-115 based SoC
> +        items:
> +          - enum:
> +            - allwinner,sun8i-a31-sgx544-115
> +            - allwinner,sun8i-a31s-sgx544-115
those two bindings are wrong.
It should be allwinner,sun6i-a31-sgx544-115 and 
allwinner,sun6i-a31s-sgx544-115. I did a copy paste error in the patches 
that I provided for this series.


Cheers,
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
