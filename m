Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3EBABA0A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 08:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF3710E26B;
	Tue, 30 Sep 2025 06:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XLxhi1Cv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CC210E26B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 06:01:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CFAC84367B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 06:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6362C116B1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 06:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759212113;
 bh=tZFFRFKg0PUHDS6qSpNivs8Es7wMQjxESPTNTDMPml0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XLxhi1CvzOKNDGiOPSiJnKK0WeN6K0SSaPz1FVlANT+wEp0VU5yXdizG65L3VNObk
 8lbHU0vEXEjlJykluoK3Y2eWmxkO3keifks3tg6+iQustVWM2sgySl3y4YnwrEZajz
 KxNNn19DFc/RfVgL9shJsK6MpsDGZLt7KJgJtuRqVObY9d/yIQ4z0BMtdv2Aozi0B1
 2Y8S6HMkqLJXyi8ENAICuobWEUv6TYvLiWtszTCA09VtWNgAX1sgejIjsQ8hKvyYWh
 +Z2+AEq1TTwSyyAnwIoIdepLBVKVLZSLORs8z1vnOBZ1X/6z9bHTUaUo+vq4wlubyx
 PMr+luFX95Wbw==
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-27eed7bdfeeso53227115ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 23:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUfFaSPq1na2flY5tdkTnzO5ijSmOL+3wXLtGBiZfcfCmBWBuG38VGzwa+7MhWu6EC2DfxKVHIeV8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo73wz4Y8VrHoP6ObIDI99DZjaI/asPwaIlLL6uBsSbd8f3brY
 Qg5K6FdiHq4t1kdEoZe3CSDsgFF9eXnnqUsFwuzlRmQUB1EHPgUOh/Py6k4GJSP0Fj/So9gDFu7
 qK9Lx/chBSOLUlv/XiX0TbR25cWILKfo=
X-Google-Smtp-Source: AGHT+IErIwwKQvXadjo8YStieZUDut9jWiBGKRpZXkgYC3IZFhh1kNcaf5JtiD61ISPp+z4nkDRXWDsI/3DHVQYxgZE=
X-Received: by 2002:a17:902:f647:b0:269:aba9:ffd7 with SMTP id
 d9443c01a7336-28d1713873fmr34808755ad.25.1759212113208; Mon, 29 Sep 2025
 23:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com>
 <20250930040348.3702923-2-h.dewangan@samsung.com>
In-Reply-To: <20250930040348.3702923-2-h.dewangan@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 30 Sep 2025 15:01:41 +0900
X-Gmail-Original-Message-ID: <CAJKOXPcpybYa4hvVohkRVv5WaRv3ydK-BY4i3i5WA5fD07osoA@mail.gmail.com>
X-Gm-Features: AS18NWDDL4MOuOFlHqi4tRhQ26U6NLLMNyO6K7Q2H3O7rRfBNx3jEQQzLl1jkIs
Message-ID: <CAJKOXPcpybYa4hvVohkRVv5WaRv3ydK-BY4i3i5WA5fD07osoA@mail.gmail.com>
Subject: Re: [PATCH 01/29] dt-bindings: media: mfc: Add Exynos MFC devicetree
 binding
To: Himanshu Dewangan <h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com, 
 ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Tue, 30 Sept 2025 at 12:55, Himanshu Dewangan <h.dewangan@samsung.com> w=
rote:
>
> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>
> Introduce a new DT binding file for exynos-mfc
>
> Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
> which describes the Exynos Multi=E2=80=91Format Codec (MFC) IP.  The sche=
ma
> covers the core node properties, required fields, and provides an
> example snippet.
>
> Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
> Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
> ---
>  .../bindings/media/samsung,exynos-mfc.yaml    | 77 +++++++++++++++++++
>  MAINTAINERS                                   | 10 +++
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/samsung,exyno=
s-mfc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/samsung,exynos-mfc.y=
aml b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
> new file mode 100644
> index 000000000000..fbed987fb9cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/samsung,exynos-mfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Multi Format Codec (MFC)
> +
> +maintainers:
> +  - Nagaraju Siddineni <nagaraju.s@samsung.com>
> +  - Himanshu Dewangan <h.dewangan@samsung.com>
> +
> +description:
> +  Multi Format Codec (MFC) is the IP present in Samsung SoCs which
> +  supports high resolution decoding and encoding functionalities.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - samsung,exynos-mfc            # Exynos920
> +          - samsung,mfc_core0_mem         # Reserved Memory
> +          - samsung,mfc_core1_mem         # Reserved Memory


NAK

These bindings duplicate existing ones, do not follow any existing
standards (wrong compatible) and are written completely different than
any other binding, which means you probably created big AI slop.

I'm not going to review this, it's quality is just beyond basic
standards. Sending something like this from Samsung means you do not
respect our time. You need to stay from scratch and read existing
documentation and existing bindings

I'll be organizing a mini meeting with Samsung on 13th Oct in Seoul,
feel free to join if you are around. I can explain then more why
wasting our time is making me very grumpy.

Best regards,
Krzysztof
