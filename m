Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5261AC6ACB
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C447810E5EE;
	Wed, 28 May 2025 13:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GNsjXw9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B097710E5EE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:42:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C7CCF450E7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B456C4CEF8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748439725;
 bh=V9S/2REy6SRPwlWHL+UjOecCAm58nBM9YBmNFi5Tywo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GNsjXw9M9L1DpZv3jViNj4XkRdb+mXI+2m/G47jUDBV7WxLPvUEubGj+1ixOIJqRZ
 e717/UmjcPxGcIwM1BREjJHjlHf7DQ6xXKLJDrFl1tj04VPf1Nl1KOdgCgSbhZFqe1
 fB4uuTK4326ar1JEQv1u6vI97cf23A7RHdJvMGc4fpP8miZY3I2LE258OtWM74XvuF
 uyjjxH7Jkv2eBczrYAMXiiQ4xzeMUCcmt8tKkGRjgdQl+plEZu+sAUbi3CzKXza/g/
 qkqGVbbTWmfb3tPdTBHScCSnX5dqhvmCdvqDtXY9/jBXm1ah6dywidLzlVPvpGBgkS
 H/v7sUXokTZ5Q==
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ad89333d603so309400366b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 06:42:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWX0Es6iDjqrE+P3BfrYjrnuPd6byK5l2x8YMKDOdi91fPv+kTsY00fJqpkRfrfIZ1iJN0fxXkgChg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3ZF66jT4oJw8R0A7Yp2IbN3tSmUGjmd/mqpvKorMcAhd9OfAU
 bwkCNKEKePsVYQa7P0laHO9UKa7mDa3eFdLRgqaoEEiAams+Ozia0PM4cZAfYwa6kkteDpEHZXh
 udOQRoLBmCqWdJ+AJUPx/T/5iUSosPw==
X-Google-Smtp-Source: AGHT+IF33pDJOIkUnFeeemo7C8vEsrRKhSwUSbgBJjMPDXVeNtNZPzFqXBOHGol2WTjwYaKgOgXZo2D8V9wI8E6hrhc=
X-Received: by 2002:a17:907:7f09:b0:ad5:23e3:48b6 with SMTP id
 a640c23a62f3a-ad85b2b586fmr1522153166b.45.1748439724013; Wed, 28 May 2025
 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
From: Rob Herring <robh@kernel.org>
Date: Wed, 28 May 2025 08:41:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
X-Gm-Features: AX0GCFtEoojAQ2L7InqgVIis2qLVvXMe-zX4FDkooFBAAdsDZZRxWtAdT4YSjTY
Message-ID: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
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

On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net=
> wrote:
>
> Add the bindings for the Neural Processing Unit IP from Rockchip.
>
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
>
> v3:
> - Split register block in its constituent subblocks, and only require
>   the ones that the kernel would ever use (Nicolas Frattaroli)
> - Group supplies (Rob Herring)
> - Explain the way in which the top core is special (Rob Herring)
>
> v4:
> - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
> - Remove unneeded items: (Krzysztof Kozlowski)
> - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> - Add reg-names to list of required properties (Krzysztof Kozlowski)
> - Fix example (Krzysztof Kozlowski)
>
> v5:
> - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> - Streamline compatible property (Krzysztof Kozlowski)
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++++++=
++++++
>  1 file changed, 147 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d43c4=
b8250cdd1b9ee86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yam=
l
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Neural Processing Unit IP from Rockchip
> +
> +maintainers:
> +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +
> +description:
> +  Rockchip IP for accelerating inference of neural networks, based on NV=
IDIA's
> +  open source NVDLA IP.
> +
> +  There is to be a node per each core in the NPU. In Rockchip's design t=
here
> +  will be one core that is special and needs to be powered on before any=
 of the
> +  other cores can be used. This special core is called the top core and =
should
> +  have the compatible string that corresponds to top cores.

Is this really a distinction in the h/w? If you change which core is
the top one in the DT, does it still work?

> +
> +properties:
> +  $nodename:
> +    pattern: '^npu@[a-f0-9]+$'
> +
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-rknn-core-top
> +      - rockchip,rk3588-rknn-core
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: pc
> +      - const: cna
> +      - const: core
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: npu
> +      - const: pclk
> +    minItems: 2

It is odd that the non-top cores only have bus clocks and no module
clock. But based on the clock names, I'm guessing the aclk/hclk are
not shared, but the npu and pclk are shared. Since you make the top
core probe first, then it will enable the shared clocks and the
non-top cores don't have to worry about them. If so, that is wrong as
it is letting the software design define the bindings.

Rob
