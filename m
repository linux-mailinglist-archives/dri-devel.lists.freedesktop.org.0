Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F5B10579
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A460D10E902;
	Thu, 24 Jul 2025 09:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="czFyHOFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C766410E902
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:16:34 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-55a25635385so843989e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753348593; x=1753953393;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1EGUBO7UhvbornJQ/pvHFRfx3IzKAnj1mgdzrBixYxY=;
 b=czFyHOFKs6qiX/+G/TzqTc0r15QP/o3YPVUUpsj2dvPqar0lyApGCSEEQ8E6bwWo3L
 kz/paWLVECUSv49tAQYf9YXjxCLvXF15EmzQhqsD75lA3AEdvmFBTp1bhoJOhlbdvleV
 ROy1dftCPwm8VAjD18bpKvGxT+ro/e1hjMmbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753348593; x=1753953393;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1EGUBO7UhvbornJQ/pvHFRfx3IzKAnj1mgdzrBixYxY=;
 b=l+OTTv+K+n9WDtGwzoXmTAwK2Mkm72dE8rYiU1REVQPzrU7vcb36J/7R84HzwsA1+e
 uC1xAgG/GdKTFQIbchY75cNNj0cAtp1IkoYrFAtCBDJ/u5BLU/PiBgHwHi5hs8ZOekpd
 BSxpOs77mwOUIRtNf8UogVuIgqLJfc8SEParSYF79a7teDp5d60ks631hKOFRcnLzMJ+
 JhU9a5+A6Rp/SH8hM9otS60rG2G7FVwKoy/3zuuDdYB6S5ULcNigRD+lmqlf9OvJRPcN
 5E7h5MycSnlAvcjeZrLdvVmGrzGM+NsgbqGOcPMnN4AOuv8bT6Yt2+2/FZ6rRY8Akxz+
 hHBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+6H2zzPf/qWhEjAJNZ6C07nr4w/kUve7UXu6X6v2VAuNVtB179RjslgXs5NnpFFx87LbYECgvr68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbvaFB19XLI+tZOBW8RiychfBPjjACti0wq5ZJcCJ8guYmr1ea
 PnDIg7bz6z8Xn4DdrI+gUdQTz3fBnbul3Q6mxS/3fTfK1kSCr6jrFqTEKK/cf9WYY6/8Q87U3xO
 lNKM127kp3bQse3M01R9C8fpgyXimRpfamPaoGGJB
X-Gm-Gg: ASbGncvU+eIEv0y6atHnjJrMT0ZuR+++V8ZgOeAl7capmfCXE5ifweBpEpDnX0+53nU
 12vDrzx74zNNYLnDJdXqf38TB4Y3AcCRLX2MOW/Q9uNvgmbwZkQ4hLyErYUusysqiy3uRblbvx0
 vM98X4BH81bWNURh9UmnJ6awM1gqWy2d+SbWZl9jw+eHB5p5lNLEoJ+KrZXBiq7WcJUKEN3wLNG
 2FJ5w5p85/qI62TcmsTC7z3ubc2R75fbq4=
X-Google-Smtp-Source: AGHT+IFazo0IJsf/W4w5gkkS9NANKkfwPsnIOoIE7mqPwq0TufYlLOotKobMGK5+6Hu6w3hpGvP3VOsw43jDOtB0xs8=
X-Received: by 2002:a05:6512:3ba6:b0:553:6583:8e6 with SMTP id
 2adb3069b0e04-55a5136bd25mr1849929e87.15.1753348592903; Thu, 24 Jul 2025
 02:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:16:21 +0800
X-Gm-Features: Ac12FXzsHRsmJR2EJuPhkIesX-COS28ovNftNstiUszbMRhNBb7-HPz6xQpMdw4
Message-ID: <CAGXv+5HTdK8aiUYdtNVhWAvsSNfMPgK6iCqe-Jsb-OBqQBWsBg@mail.gmail.com>
Subject: Re: [PATCH 01/38] dt-bindings: display: mediatek: dpi: Allow
 specifying resets
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
 ck.hu@mediatek.com, houlong.wei@mediatek.com, 
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
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

On Thu, Jul 24, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Even though the DPI IP has a reset bit on all MediaTek SoCs, it
> is optional, and has always been unused until MT8195; specifically:
> on older SoCs, like MT8173, the reset bit is located in MMSYS, and
> on newer SoCs, like MT8195, it is located in VDOSYS.
>
> For this reason, allow specifying the resets and reset-names on
> all MediaTek SoCs.
>
> Those properties are optional because there are multiple ways to
> reset this IP and the reset lines in MM/VDO are used only if the
> IP cannot perform warm-reset.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index b659d79393a8..eb4f276e8dc4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -102,6 +102,13 @@ properties:
>        - port@0
>        - port@1
>
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: dpi
> +

Do we really need the name if there is only one though?

>  required:
>    - compatible
>    - reg
> --
> 2.50.1
>
