Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7D89B65C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 05:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8904310EC2E;
	Mon,  8 Apr 2024 03:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gC5l7Dxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA6A10EC2E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 03:20:42 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-516d1ecaf25so3827956e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 20:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712546440; x=1713151240;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98HjqpVnhziiB+tCaWwhwMYDm4sqJVU4VjSmJrU5jEA=;
 b=gC5l7DxhL1ycSl2uRz+O72l49AA05bAQWgcGQLHumuotdRgNxD4wO8JbGPiIZyPyB4
 DTby1sQPzMcKqCrG/E1os3cTHtpF0eFsQ95BMxHax7/HhIFdMK1LyAWpIMNE56I8LYCR
 +9IwPFP5dhaUUgom44Evil4qV1TNdTyaSRYdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712546441; x=1713151241;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=98HjqpVnhziiB+tCaWwhwMYDm4sqJVU4VjSmJrU5jEA=;
 b=Fo0NfkGDiQMOCgPvoI5FdmYBJNhTYM7tvEPtS890msE4XOJG2emLOVxyZg8+sPBw9H
 XgwIeDGD5OQ8UnLuvA14Rd7lAQ9qxTY9YN35+7UwYmaAWiaP5JcwCtZcZntFKlXrnAfE
 h16c/uJ/fBmQ1EOkzjHqjLfMKiG8izl1DGLNbhVYU0dNFEhf19YSFQ3Xf6cFVKGCzI0E
 YUv4gsh9URpO5zVc7/uwy4dsfrUg+k3Ii2VpLckAhqTVTGyKUDpTd8zT2zlgl4ACoICU
 KZ7AKfkGFXVhwQcxCv9e6qTlIvCDYqWEvUn5jGtbOVIh6jb4zSdiXXs3F1CMGYey2iie
 Vlmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsQsj9vmLflIbTNv04Vph6dLRwV7R/WqSAP4UPmQzr6fqYhn2tMUpY64P+D1/ST0SyILbK1LKNKNhd75dpdPKe73wLQozjPywWk0wMa2w9
X-Gm-Message-State: AOJu0Yx2ESu6JPbtx3y18POBvX46RBTWK7UUdP3cchpu9MUF5rkmZJCG
 QQFffyJRbAJbahIOQ/IrZWnqXzEs2rGsL1F8eLFBbC6fU2PmtvdVdWaImqP5Sd+ADAUpJn+Po8w
 WDRETVcGhiq6G1b4QdNfMJb/WeTbjt1Dlzbq5
X-Google-Smtp-Source: AGHT+IHuBtoFanL6B/nTcj9Kemw5PgQtwvNM2fnCIIxrkvDK6Jp2siBTaJuK5OcN28aTlKvZ82j9f5EXF+Ms0ZDwh3M=
X-Received: by 2002:ac2:4c13:0:b0:513:d71e:eeab with SMTP id
 t19-20020ac24c13000000b00513d71eeeabmr5343840lfq.45.1712546440562; Sun, 07
 Apr 2024 20:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240404081635.91412-1-angelogioacchino.delregno@collabora.com>
 <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 8 Apr 2024 11:20:29 +0800
Message-ID: <CAGXv+5F9rfTVDExKSCF7fBKwR+HijNzFYE6+4aHKw3ZP81DG9w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
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

On Thu, Apr 4, 2024 at 4:16=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> per HW instance (so potentially up to six displays for multi-vdo SoCs).
>
> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> so it only supports an output port with multiple endpoints - where each
> endpoint defines the starting point for one of the (currently three)
> possible hardware paths.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsy=
s.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b3c6888c1457..90758bb5bcb1 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -93,6 +93,29 @@ properties:
>    '#reset-cells':
>      const: 1
>
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Output port node. This port connects the MMSYS/VDOSYS output to
> +      the first component of one display pipeline, for example one of
> +      the available OVL or RDMA blocks.
> +      Some MediaTek SoCs support up to three display outputs per MMSYS.
> +    properties:
> +      endpoint@0:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the primary display pipeline
> +
> +      endpoint@1:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the secondary display pipeline
> +
> +      endpoint@2:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the tertiary display pipeline
> +
> +      required:
> +        - endpoint@0
> +

Technically the mmsys device serves as an glue layer for the display
pipeline, providing things like clock control and signal routing; the
device itself is not part of the pipeline, and probably shouldn't be
part of the graph?

ChenYu

>  required:
>    - compatible
>    - reg
> --
> 2.44.0
>
