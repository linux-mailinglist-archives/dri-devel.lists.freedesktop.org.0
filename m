Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282538CFCEA
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A101E10EBCB;
	Mon, 27 May 2024 09:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Zi1vIitP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B7510EBCB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:31:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5295a66e775so3323844e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716802287; x=1717407087;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nsle90kquxqyGATVLGaUwfEqMygpQJmcBP3wYD4Xyos=;
 b=Zi1vIitPkUlrxRgAl4HYbDuvuZgKKfybQvfSoAq5u+dJUuGStcIenZpDp1i5PVs11u
 USJnxqZO+MYc4IzQkihCh7S1e8gGuh0G2s9U8GQBuFuG2WtE7VMy2PDZL+xzSJM7KdIt
 wwivQrCcHKoOyFosU1GvBmhjAV9r0lmSNybEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716802287; x=1717407087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nsle90kquxqyGATVLGaUwfEqMygpQJmcBP3wYD4Xyos=;
 b=LMnlyqQmZuq3quEP05IGOXRmO02YCI9wSpboaDLBXgk0tIN/BTkwA/oE5YMQTIBJ3M
 tJ5P6pix79ft3xJw9jS2wMjppAESw8jijwH3mtoTEZIfmAr246uTmZzpjB5hECDDKBxi
 OgmAjfD+sQXh7gXP/eB8LdDb4m0ES9IobFnYByNWE68G7PJOBRSEqyAtSjL2oIEDguoY
 d9zmVh2c5CZgbowD/YS0FgQb4HoLrX6yGibQO2uElLMsxkdelO/38r5ghrhBulG4Kpmq
 6f5DXAXoJPKTNHYcwh/hJ7dtHrVVCzxxUD0W0Unjwwt/ZyF21izznZd5TYWIVnYz4rCu
 AyYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyuE6hM3NilLXqD+w1xsx7zhZto9Y9V58lbSMfDP5xC1HXLYvT4RAvQMF+Rhbb0rIPSVjoLuepDdqVMyzQ/7hhIzGcVg+YDOy0Ax8KPC4+
X-Gm-Message-State: AOJu0YwYWY9UDYYHxKzr7jq+4qXRiaagw9qqSdWkX69h0+cY/HKpLim1
 JmSi5sXUEW1SXhQ0hnyCco74YfaxHURr70yRFUm5vcKoR5vjX9w7/WsLx4EBwbC2SCPjBEP18aE
 XsuhmcjnUCCufBVN/66ZgEYyKyALTfx3IXvG5
X-Google-Smtp-Source: AGHT+IEkCNM2qY1QxwWMjQ5Y6VGnSYpnCwe9tanGjyyeQWcnQ9MczhIoPwNeqRZhqbClYjaT+d8vnb65A/W5+FPMd1k=
X-Received: by 2002:ac2:4d91:0:b0:51f:53e0:1bc8 with SMTP id
 2adb3069b0e04-5296556f885mr7749628e87.25.1716802286862; Mon, 27 May 2024
 02:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
 <20240527092513.91385-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240527092513.91385-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 May 2024 17:31:15 +0800
Message-ID: <CAGXv+5G_n1B0yaoOBx0k8syRPma=7NnuRcSL4M0N0BJONa5fCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8188 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 steven.price@arm.com, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Mon, May 27, 2024 at 5:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a compatible for the MediaTek MT8188 SoC, with an integrated
> ARM Mali G57 MC3 (Valhall-JM) GPU.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml =
b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index e796a1ff8c82..4cf676190ae8 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -34,6 +34,7 @@ properties:
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision=
 is fully discoverable
>        - items:
>            - enum:
> +              - mediatek,mt8188-mali
>                - mediatek,mt8192-mali
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision=
 is fully discoverable

I believe you also need to edit one of the conditionals below so that the
number and names of the power domains are properly constrained?

ChenYu
