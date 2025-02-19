Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249A9A3C073
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D687410E7F9;
	Wed, 19 Feb 2025 13:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IFIwFIYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F029410E7F9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:49:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3798A5C597D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAE0C4CEEA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739972947;
 bh=A1jQdtZvRbIjirpi/QpXD1jZ8tpStZUExtEIfK1U5Cc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IFIwFIYx0ARMx+0zY1HAfpnbVgkm//Wuvx46GSLkxcqt8pyR8cUWXdqQX9Ej8EiXY
 lOcuGfIVJCls3eng4yKpq6pAOUAIFyjgJeOMXv/uc14jU0fNAWka+TYNrkG31Zby4A
 q5VS+9iwtZOHE40aGcTDcdLU23EEaiFCpiIqVrn1HUceDqzWSED6ATPKac07FqWy18
 xGWm3cfbewXnj16OJw5uP5S/dxWwk8fUQBiuNCzCP4YyUOTi2SA4nzyCv46RrN8pxN
 geAc5o/X9/8YtXZmLfPdQPqnu0SC7k0Hm5aYQkVlcEXfFH68vkhwsmQAihN3TDx49u
 +73uOfTOqinSg==
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fc33aef343so9715091a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIKzIIbx032IanoWsQvBaajyeAEIpQsYFjipcn2i4Z3pnH5mjCuFaWnIDrQetOzJlZfDmFEQq5wFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbArp40D/wfUFGo0EUvMAeDqh5bif0IqObOp2FIFbnF6T5W4Y6
 YEA2P9Df7zjozM9YfkvbLFqK9mSnwWZ9/T29dWhWfWbY1j0cpQ1R8iRJ5hlrqkEleDqEw67cuet
 z3MWAzjSfSqJld9vOF+LkyoRHqw==
X-Google-Smtp-Source: AGHT+IHzQqtYsvHwADMmf9VWFRyvbp1G6Xfgzoq4kaeRwD/sC1OC2iDXSHRlVSxq3fcQCkZrXfrGdEMDnJjaCDjhs5g=
X-Received: by 2002:a17:90b:17c4:b0:2ef:2f49:7d7f with SMTP id
 98e67ed59e1d1-2fcb5a39f93mr6272302a91.18.1739972947332; Wed, 19 Feb 2025
 05:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 21:49:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9J4TE=qo+00N7T6-daMET+eTt8psp+eV1DXdgrz+avEQ@mail.gmail.com>
X-Gm-Features: AWEUYZkyNYkPz9DDQbj1WmcsisPQynG6ha2xkIpk0KuCjDPQnw0UB2_LYJk3Qtw
Message-ID: <CAAOTY_9J4TE=qo+00N7T6-daMET+eTt8psp+eV1DXdgrz+avEQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mchehab@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, sebastian.fricke@collabora.com, 
 macpaul.lin@mediatek.com
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B412=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:=
53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add compatible strings for the AAL, COLOR, MERGE and PADDING
> hardware components found in MediaTek's MT8188 SoC.
>
> This hardware is compatible with MT8195.

Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../bindings/display/mediatek/mediatek,aal.yaml        |  4 ++++
>  .../bindings/display/mediatek/mediatek,color.yaml      |  4 ++++
>  .../bindings/display/mediatek/mediatek,merge.yaml      |  4 ++++
>  .../bindings/display/mediatek/mediatek,padding.yaml    | 10 +++++++---
>  4 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index cf24434854ff..1479035da409 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -25,6 +25,10 @@ properties:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
>            - mediatek,mt8195-mdp3-aal
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-mdp3-aal
> +          - const: mediatek,mt8195-mdp3-aal
>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index 7df786bbad20..799c0b8fc1f9 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -27,6 +27,10 @@ properties:
>            - mediatek,mt8167-disp-color
>            - mediatek,mt8173-disp-color
>            - mediatek,mt8195-mdp3-color
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-mdp3-color
> +          - const: mediatek,mt8195-mdp3-color
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> index dae839279950..415a25bc18fa 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -25,6 +25,10 @@ properties:
>            - mediatek,mt8173-disp-merge
>            - mediatek,mt8195-disp-merge
>            - mediatek,mt8195-mdp3-merge
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-mdp3-merge
> +          - const: mediatek,mt8195-mdp3-merge
>        - items:
>            - const: mediatek,mt6795-disp-merge
>            - const: mediatek,mt8173-disp-merge
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
padding.yaml
> index be07bbdc54e3..86787866ced0 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding=
.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding=
.yaml
> @@ -20,9 +20,13 @@ description:
>
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt8188-disp-padding
> -      - mediatek,mt8195-mdp3-padding
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8188-disp-padding
> +          - mediatek,mt8195-mdp3-padding
> +      - items:
> +          - const: mediatek,mt8188-mdp3-padding
> +          - const: mediatek,mt8195-mdp3-padding
>
>    reg:
>      maxItems: 1
> --
> 2.46.1
>
