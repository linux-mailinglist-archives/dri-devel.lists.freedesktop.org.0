Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE4FA4B0EE
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 11:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3484410E116;
	Sun,  2 Mar 2025 10:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="blNeppaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E8610E116
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 10:33:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72E4C5C555F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 10:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF78C4CEEC
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740911626;
 bh=5igBtm41WVG9TfJJgntVRppVAiT8ZGfFHmRjD2xk044=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=blNeppaTMVaj6wEh0CVmk9YH0lmIp4rBf4CQNZ90ZosIELmjV1e1J3bnxznAfZgbJ
 pQlXiPsr9lm2INxgTcGMTQEmmJ11Z9hWK+BJ73phJz82KO1NNI55b5O85hlI0SLSH0
 TgQ5hAbpl2WABdwnWKgfSJegPcYfJtK9doju1Do3HWtXAgiYjyshLa2P0qBxubB81k
 poR31rtN4Td9H4puP2Q5D3t/j/T2i2regN1sLYRuq1imnIpusGnsda1Cm3p5z8uOz8
 Emr8TQntVC7lx7JG3muKVmz2NoqTSOtETb5Iw9cRKQeYrTpLQXxLj9P3bALvIanZba
 tAv0P68bcDFPQ==
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2fe98d173daso5609118a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 02:33:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWq5Y+CdFnnzo7xlm9V2omuL+rWEpCWVySeSQdfQ4BvR9yoyqgQkFC50PQ0+oJ/RkxyZv2rKst3jjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD6PIZjWj05OygZR/uvVp87SnhF+1vTS+NMVjH9KZiHucXVtPz
 hWf3TkVnrW5v9xIbfLmYzh0IdJslAFTAf+Om11Gd7fFUWngIkOa1z7/dZNqOa+HNnLWmii7MRGS
 OxPQgjoyOoFXzkRxj6N0gn5RYnA==
X-Google-Smtp-Source: AGHT+IE4yOAy4wKEhTzGzHrtS4sGrkbKCLya/s6+oGg2/VOrOdOUVnYPATsFzlyBtOl0Sgc3vtSnbz58G2fw2hekZNg=
X-Received: by 2002:a17:90b:3890:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-2febabf19a6mr14172100a91.28.1740911625947; Sun, 02 Mar 2025
 02:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 18:34:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9GJ9FRLZVu3EguCKHipK7SfwtVKJtm2cjTSZPTMzz7MA@mail.gmail.com>
X-Gm-Features: AQ5f1JrYwE5Hn_kv29jSXXxzOoJp6L1YscuJYu18bGgxJ2qo6QWbanRGU55J3Ts
Message-ID: <CAAOTY_9GJ9FRLZVu3EguCKHipK7SfwtVKJtm2cjTSZPTMzz7MA@mail.gmail.com>
Subject: Re: [PATCH v7 01/43] dt-bindings: display: mediatek: dpi: Add MT8195
 and MT8188 compat
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
 jason-jh.lin@mediatek.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add compatibles for the Digital Parallel Interface (DPI) block
> found in the MT8195 and MT8188 SoCs: inside of the chip, this one
> is directly connected to the HDMI block.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 0f1e556dc8ef..5670715efa5c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -27,6 +27,7 @@ properties:
>            - mediatek,mt8188-dp-intf
>            - mediatek,mt8192-dpi
>            - mediatek,mt8195-dp-intf
> +          - mediatek,mt8195-dpi
>        - items:
>            - enum:
>                - mediatek,mt6795-dpi
> @@ -35,6 +36,10 @@ properties:
>            - enum:
>                - mediatek,mt8365-dpi
>            - const: mediatek,mt8192-dpi
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-dpi
> +          - const: mediatek,mt8195-dpi
>
>    reg:
>      maxItems: 1
> --
> 2.48.1
>
