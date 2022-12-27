Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916A9656C31
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 15:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDBC10E030;
	Tue, 27 Dec 2022 14:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E6210E030
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 14:48:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74DF4B8108E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 14:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322F8C433F1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672152500;
 bh=jqL3XyDgY3Ey7DTK7sHa3MuIBkD0jIuOEQLQVq/Hrlw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IBbete1yh0BD/uhMYUy7eUj+fev+CAFzDVwsUKwqUiVxSqsM49QiqGUfhKbUPHM7f
 r/fzOXEa+CAZSH17WU6bR3QOMItLvVzOU0GNtXJsi4EaNUlVlC6HGgR13PpIyA53Tv
 dixYoEhRouZtPO564urRIaHqV08Uf0/2gce1FrtZ96pZInO0m1n+f91CbCevoE3mZp
 48zUIWr3/zp3WHpvSl9a+5m/PeLMSajTai5SUJMJAUP3UP56ceFym+SQkFZMkRaAhl
 bv/ocMAn54bjpDSASmmPftVT0B1TUr+BsByd92r4AHw+5MXoClz8EGQsdAgX1nlvt3
 qXC1OrKzsrlTA==
Received: by mail-oi1-f172.google.com with SMTP id e205so12567471oif.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 06:48:20 -0800 (PST)
X-Gm-Message-State: AFqh2kqs8//Qoj/bWhz3QT3L+Dd8TqWk5RCtVVMSo3TMiPR0mudyedOL
 fZwjkOoVDN/q5JX4UX/dMc1RTZManCq1jHkVUw==
X-Google-Smtp-Source: AMrXdXt8qrPi/XGI5OMJ7zrbkLbCdS61CLMOhnibsjHheE2V80tcdVo2fHqCXJ9wAk2cjt/Qi8NeMBkbqziuHyv+VrM=
X-Received: by 2002:a05:6808:130f:b0:35a:eee1:6710 with SMTP id
 y15-20020a056808130f00b0035aeee16710mr976417oiv.69.1672152499282; Tue, 27 Dec
 2022 06:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
 <20221206020046.11333-2-nathan.lu@mediatek.com>
In-Reply-To: <20221206020046.11333-2-nathan.lu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 27 Dec 2022 22:48:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-aW4xHvSF-yTZdwO1yiN7tVdq=9Fyfu2uWJ=xDfCg0nA@mail.gmail.com>
Message-ID: <CAAOTY_-aW4xHvSF-yTZdwO1yiN7tVdq=9Fyfu2uWJ=xDfCg0nA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: mediatek: modify VDOSYS0 display
 device tree Documentations for MT8188
To: "nathan.lu" <nathan.lu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 Moudy Ho <moudy.ho@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nathan:

nathan.lu <nathan.lu@mediatek.com> =E6=96=BC 2022=E5=B9=B412=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> From: Nathan Lu <nathan.lu@mediatek.com>
>
> modify VDOSYS0 display device tree Documentations for MT8188.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 1 +
>  .../bindings/display/mediatek/mediatek,postmask.yaml          | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
>  8 files changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index d4d585485e7b..92741486c24d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -31,6 +31,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-aal
> +              - mediatek,mt8188-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
>            - const: mediatek,mt8183-disp-aal
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index 63fb02014a56..fe444beff558 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -27,6 +27,7 @@ properties:
>            - const: mediatek,mt8192-disp-ccorr
>        - items:
>            - enum:
> +              - mediatek,mt8188-disp-ccorr
>                - mediatek,mt8195-disp-ccorr
>            - const: mediatek,mt8192-disp-ccorr
>        - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index d2f89ee7996f..62306c88f485 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -37,6 +37,7 @@ properties:
>            - enum:
>                - mediatek,mt8183-disp-color
>                - mediatek,mt8186-disp-color
> +              - mediatek,mt8188-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
>            - const: mediatek,mt8173-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,d=
ither.yaml
> index 8ad8187c02d1..5c7445c174e5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-dither
> +              - mediatek,mt8188-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
>            - const: mediatek,mt8183-disp-dither
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ga=
mma.yaml
> index a89ea0ea7542..a5c6a91fac71 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> @@ -28,6 +28,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-gamma
> +              - mediatek,mt8188-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
>            - const: mediatek,mt8183-disp-gamma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index a2a27d0ca038..065e526f950e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -36,6 +36,7 @@ properties:
>            - const: mediatek,mt2701-disp-ovl
>        - items:
>            - enum:
> +              - mediatek,mt8188-disp-ovl
>                - mediatek,mt8195-disp-ovl
>            - const: mediatek,mt8183-disp-ovl
>        - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,postmask.yaml
> index 654080bfbdfb..27de64495401 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-postmask
> +              - mediatek,mt8188-disp-postmask
>            - const: mediatek,mt8192-disp-postmask
>
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdm=
a.yaml
> index 0882ae86e6c4..3ade2ece3fed 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> @@ -31,6 +31,10 @@ properties:
>            - const: mediatek,mt8183-disp-rdma
>        - items:
>            - const: mediatek,mt8195-disp-rdma
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-disp-rdma
> +          - const: mediatek,mt8195-disp-rdma
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-rdma
> --
> 2.18.0
>
