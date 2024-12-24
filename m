Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4215E9FBCF1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 12:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC3210E0E4;
	Tue, 24 Dec 2024 11:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OiLxFpAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF7F10E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:33:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B33B5C5EC3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF31C4CEE0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735039983;
 bh=RDQAjNOAdC8KLqZh7kvEfTA7Zk449zVSYCNgtWtHXMk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OiLxFpAiR56DYABPtJKsbmozRm+7qCsdT+CsY94qwJ/LPZoK7rAcobBkuwSUPyENn
 eWPaliTjS9rjywxLZR/Ksss7Jb7IRyk9SmdRirifHnI5O72xs/OVJhaZWsCMEsYSdP
 5m3gcB3iFkLHR7v9yUxwArzoiYSUhIaDCjXlS9fTPPpIY3oFY3uJo9LgWbI/E00Vo3
 rBLKoXmVo92L5C0eyJUL2WF6Vmsx4eoS9cjY9ktCdXSVvWXPiewtCca60GT1Bnr7Y0
 k0CRRbLive4FS26PtlGoODE8I+FsHwrlAaXekMSlFTTZHpwHZ90vVBw+XXYwcdYu5m
 sf9St7Bk1ZXVw==
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2f441791e40so4442026a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 03:33:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWvIj3kk2SL1kuHOCWAGbg1ijigYn0rsa+OPEOND3faMubcZb8rm+I2k+Yi9/99+utvKc+WiCjPpPw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQsCToSlmMzfFJZAPrlDK1PuAvZxLMXj1UZhi+qQn5QzSiyabv
 fH3P0kisDyN72R/SQPNdPkzI827iFdo8bWVRnPFGVRSVp/poTo+H3LXQ/cGd7tIEryWfrMoUkuB
 Rpsn0LC75Zm0PYKkbPxT1GAi/CA==
X-Google-Smtp-Source: AGHT+IGjk5EjNkRdP4/egK3HpkP0kg9EvE0XRDFf66/0s82KLvsrvKxQ79Fnquu0pdesdRpeuQ8UYTFz1+bWSm5jFBI=
X-Received: by 2002:a17:90a:d64e:b0:2ee:a4f2:b311 with SMTP id
 98e67ed59e1d1-2f452dfae72mr26965676a91.8.1735039983380; Tue, 24 Dec 2024
 03:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
 <20241219181531.4282-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20241219181531.4282-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 24 Dec 2024 19:33:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9dApKQ2C_rYBQ8eH7b17dmZntvAND+BYfgkRms1gEbmw@mail.gmail.com>
Message-ID: <CAAOTY_9dApKQ2C_rYBQ8eH7b17dmZntvAND+BYfgkRms1gEbmw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: mediatek: ovl: Modify rules
 for MT8195/MT8188
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
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

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=88=
20=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=882:15=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
>
> Modify rules for both MT8195 and MT8188.
> Hardware capabilities include color formats and AFBC are
> changed since MT8195, stop using the settings of MT8183.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,ovl.yaml          | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index 33542211507f..4f110635afb6 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt8173-disp-ovl
>            - mediatek,mt8183-disp-ovl
>            - mediatek,mt8192-disp-ovl
> +          - mediatek,mt8195-disp-ovl
>            - mediatek,mt8195-mdp3-ovl
>        - items:
>            - enum:
> @@ -36,16 +37,14 @@ properties:
>            - enum:
>                - mediatek,mt6795-disp-ovl
>            - const: mediatek,mt8173-disp-ovl
> -      - items:
> -          - enum:
> -              - mediatek,mt8188-disp-ovl
> -              - mediatek,mt8195-disp-ovl
> -          - const: mediatek,mt8183-disp-ovl
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ovl
>                - mediatek,mt8365-disp-ovl
>            - const: mediatek,mt8192-disp-ovl
> +      - items:
> +          - const: mediatek,mt8188-disp-ovl
> +          - const: mediatek,mt8195-disp-ovl
>        - items:
>            - const: mediatek,mt8188-mdp3-ovl
>            - const: mediatek,mt8195-mdp3-ovl
> --
> 2.43.0
>
