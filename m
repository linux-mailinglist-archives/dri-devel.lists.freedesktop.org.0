Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB54CE122
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 00:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3E210EDE1;
	Fri,  4 Mar 2022 23:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F078E10EDE1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 23:45:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E5A161F32
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 23:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6E4C340F8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 23:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646437515;
 bh=NeRBwotyA+2T4DJi4XwW8R9F5009UEd0x0u94q4HzSU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F4kIJg1JBz7deNxMyZ/NWRHbYHAWiOoPzls/nqlVNxWR4XRC0AXHq9Bu8c/tdM0nt
 F/b68J2MS2rmnOFIhnh3J31DgEZgxe6h6VKEUKH1UDGlmAD+ruRiX51NkXcPnYxO53
 P38M7Rdo1D/zecUw92XgmrDTpmYDJ+bWeiZ3I4USeCvAvrNblBNMVo/bJXvvNV2M2T
 Rkn7GhSGMcgQIa76sgpyGpdKgmNMvNibCCGlw7lwJ+Y9MxIyNGSgJ/IkZbyn7j/rPd
 xopIiph9c6NMqICzJUO0XL7G8oJm+nO7ps0zP/z3AktHuIn+CoDwm9JGjBzUMey3eK
 +5qbQBJ5uWYrA==
Received: by mail-ej1-f45.google.com with SMTP id qx21so20461665ejb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 15:45:15 -0800 (PST)
X-Gm-Message-State: AOAM532Lo2OtFhjIwaBeGPh47fx9FfhywtYrVqDIiZGZjmJzCL5Ze/PL
 7MPbrFNRlYcnXffZxHNbxthbOXyOh8LN3iiP/g==
X-Google-Smtp-Source: ABdhPJxYS0br7Fg3mai1Y52kvgn22FUhmJLrfoIufPjrILVKI7waYv7yh1S/8ojIS55W4FhA8IZFUbN9+nd9WWD+qnA=
X-Received: by 2002:a17:906:b348:b0:6cf:5b66:2f80 with SMTP id
 cd8-20020a170906b34800b006cf5b662f80mr903212ejb.638.1646437513692; Fri, 04
 Mar 2022 15:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 5 Mar 2022 07:45:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9m06C63xXQqDSZeV2ZojEqE_Hb+V8stPc1x4oUdD5OGA@mail.gmail.com>
Message-ID: <CAAOTY_9m06C63xXQqDSZeV2ZojEqE_Hb+V8stPc1x4oUdD5OGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: mediatek,ovl: Fix 'iommu'
 required property typo
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 krzysztof.kozlowski@canonical.com, David Airlie <airlied@linux.ie>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B43=E6=9C=884=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:55=
=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The property is called 'iommus' and not 'iommu'. Fix this typo.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each bl=
ock to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index 93d5c68a2dbd..fc691d00c60e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -75,7 +75,7 @@ required:
>    - interrupts
>    - power-domains
>    - clocks
> -  - iommu
> +  - iommus
>
>  additionalProperties: false
>
> --
> 2.35.1
>
