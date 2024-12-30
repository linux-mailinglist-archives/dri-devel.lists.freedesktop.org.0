Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017A59FE736
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 15:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0FE10E4F6;
	Mon, 30 Dec 2024 14:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="af8uBNSp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838CD10E4F6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:45:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 780D95C5BE6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EC1C4CEDC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735569918;
 bh=WI+NkNOipLWPbdl8Ai0uXMv9gV+VvTtRbrScwl1kVbM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=af8uBNSpUmHH2XfQQmtrPRSmD8YCVHTaGGSZQPmubi1IYmiML95dnAIip4oCfyuwz
 DB3GV0u2M487Fc2ziWcydABK0oBCOJojpreJPvk4zV5UlTfI9j/u8strJAL6UybdEh
 SR5h4UxCZJs/UJdYVTnDO9Uzw7KJ1+p90IuN7TiWCozfMLeCfeAyCeqvaQ/1mrQFCq
 AHdhpjZUIRhkGdGnsegSjCFqfjUEi80Bn+WBCTcAPW0RXjzbYxFOjrtzhlBMixjYb3
 yzyPu4Zepa25WoqQWOMARw1ohrk9jO8hAoouAkrD36HmF4hQhbkJp5wQxHQLuT5YOc
 yQyl/IhIt7xjw==
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2ee989553c1so11967589a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 06:45:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXP45DRbVKRPVtccKhdkc8YRQjRpcXZLe9Srg5B1zQQFNlrYjuWR4M8oijFP4MO7g8RypVNv1tI2Xw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt2a9GEc7dzzhJOICbe5v1GmXaDNDnPd4NqYphhRHjI/qu4FvE
 swqaSwRaWJtWJtK+F6BqUobkVO+Dh02BxsK+eXLKZvkqzJWMmpF9niVX2He9qGnBrWZm9euNQuO
 pWfkqBB64PpvK1sfvgqdRTHGIMA==
X-Google-Smtp-Source: AGHT+IGqBjofA/9ZD/GcwInvNoJpn3Bcz2gP5ADkT6kMX87x83YxDQetl+FMgD2Y0zy3a2LSykWpXd7X4STelitYQeM=
X-Received: by 2002:a17:90b:518d:b0:2ee:5958:828 with SMTP id
 98e67ed59e1d1-2f452e214admr54708663a91.9.1735569914855; Mon, 30 Dec 2024
 06:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20241105090207.3892242-1-fshao@chromium.org>
In-Reply-To: <20241105090207.3892242-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 30 Dec 2024 22:45:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tnJbhF2fGzAcjdHb=uMGaHyqeHZvL=Whb9GJZCUupPA@mail.gmail.com>
Message-ID: <CAAOTY_9tnJbhF2fGzAcjdHb=uMGaHyqeHZvL=Whb9GJZCUupPA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: dp: Reference common
 DAI properties
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

Hi, Fei:

Fei Shao <fshao@chromium.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=885=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The MediaTek DP hardware supports audio and exposes a DAI, so the
> '#sound-dai-cells' property is needed for describing the DAI links.
>
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' to be
> used, and filter out non-DP compatibles as MediaTek eDP in the same
> binding doesn't support audio.
>
> This fixes dtbs_check error:
>   '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
> Changes in v2:
> - reference to dai-common.yaml since the hardware exposes DAI
>   and update to `unevaluatedProperties: false`
> - update commit message
>
>  .../display/mediatek/mediatek,dp.yaml         | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya=
ml
> index 2aef1eb32e11..75ce92f4a5fd 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -42,6 +42,9 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  '#sound-dai-cells':
> +    const: 0
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
> @@ -85,7 +88,21 @@ required:
>    - ports
>    - max-linkrate-mhz
>
> -additionalProperties: false
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - mediatek,mt8188-dp-tx
> +                - mediatek,mt8195-dp-tx
> +    then:
> +      properties:
> +        '#sound-dai-cells': false
> +
> +unevaluatedProperties: false
>
>  examples:
>    - |
> --
> 2.47.0.277.g8800431eea-goog
>
