Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F939ACCA2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFB310E7F7;
	Wed, 23 Oct 2024 14:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZnYAi8xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388E410E7F7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:35:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 203935C4131
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B739C4CEE9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729694138;
 bh=azQJ3eGowkkRjf7a7p4DUvh4rfik/bDhwyFQa/WiKhg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZnYAi8xhKVOwyN23dtadpHuhJyihl2MDeOhcQoE63BUztJTDrQrBBwrL0rvXULRRk
 /EFa+6zg5Ddujjug7EamJ/cDRT+F0n5FadFPs185ur2IGAhnK07Kmcr8OjBt76bQ89
 xdKfco3k3sJZQ9GLwbol3zWK6QVhvu+w4FRlxVHZXIFRI2mwDg7qL2wQ+HR6rKvF8G
 kUo/FrbFc4h6odrkyoxm7pftbyFcU+pO7+Bz6hiRg52IOGIvtWkFV3jNHNRyyPyj+a
 iXHCBRPQD5/Viy+XTVHPQU2zx7IYfNY9fpUDzARmP5MmPnJpLyUW0Gxe88IYv5BtAg
 YvuzrVYk9TYRg==
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-71e61b47c6cso5301192b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:35:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWa/i6+b5KfHb/kEG4941v5fts1dMv42s4RnRhJSVmVDAW53+IBZusxYD9ShbSOFl8rpXRFKLhbVSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyV+RRkIvlWOAlkvsQ8XXnpQuj2t0ryqYI3fkR5SZJizdO/p0B
 Xcqhhdk35p6cjFvMbK9pg2W5+ZSk/GEfzkQVcFa9ZboahHxJRr746P9Bh3rfgWgWALvqG36UyJw
 54VUXef808P2KX6trmnesZfwfrQ==
X-Google-Smtp-Source: AGHT+IGotfPUjuCyXnHej963WsiwtwAVlBk0onYdkHZONBPgcS/jZacTHxq70ShX22L6ObDnMI+HTy8A/5j0aUTa/2E=
X-Received: by 2002:a05:6a00:3d15:b0:70b:176e:b3bc with SMTP id
 d2e1a72fcca58-72030bdca55mr4263603b3a.28.1729694137938; Wed, 23 Oct 2024
 07:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241003030919.17980-1-macpaul.lin@mediatek.com>
 <20241003030919.17980-4-macpaul.lin@mediatek.com>
In-Reply-To: <20241003030919.17980-4-macpaul.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:35:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-6tHK7xq3JUWSX--2mZqHQE-bzfaCwzuYHY5crFtYNxQ@mail.gmail.com>
Message-ID: <CAAOTY_-6tHK7xq3JUWSX--2mZqHQE-bzfaCwzuYHY5crFtYNxQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] dt-bindings: display: mediatek: dpi: correct
 power-domains property
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rohit Agarwal <rohiagar@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
 Sen Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, 
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>
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

Hi, Macpaul:

Macpaul Lin <macpaul.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=883=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8811:09=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The MediaTek DPI module is typically associated with one of the
> following multimedia power domains:
>  - POWER_DOMAIN_DISPLAY
>  - POWER_DOMAIN_VDOSYS
>  - POWER_DOMAIN_MM
> The specific power domain used varies depending on the SoC design.
>
> These power domains are shared by multiple devices within the SoC.
> In most cases, these power domains are enabled by other devices.
> As a result, the DPI module of legacy SoCs often functions correctly
> even without explicit configuration.
>
> It is recommended to explicitly add the appropriate power domain
> property to the DPI node in the device tree. Hence drop the
> compatible checking for specific SoCs.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power doma=
ins")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 24 ++++++++-----------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>
> Changes for v2:
>  - Because of the corresponding dts fix has been reviewed with a Reviewed=
-by: tag.
>    [1] https://lore.kernel.org/all/20240925080515.16377-1-macpaul.lin@med=
iatek.com/
>    We still need this change to fix the 2 dtbs_check errors.
>    So keeps no change here.
>
> Changes for v3:
>  - The origin patch is [2]
>    https://lore.kernel.org/all/20240926111449.9245-2-macpaul.lin@mediatek=
.com/
>  - Thanks for Conor's reminding, after MediaTek's internal discussion,
>    This patch v3 is the replacement of [2] v2.
>    Because the DPI module should has a explicit configuration with power =
domain.
>  - Drop Acked-by: tag since v3 is nearly a new patch for different approa=
ch.
>
> Changes for v4:
>  - No change. Please help to review it again.
>
> Changes for v5:
>  - Add missing Reviewed-by Tag from Krzysztof. Thanks.
>
> Changes for v6:
>  - No change.
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 3a82aec9021c..497c0eb4ed0b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -63,6 +63,16 @@ properties:
>        - const: sleep
>
>    power-domains:
> +    description: |
> +      The MediaTek DPI module is typically associated with one of the
> +      following multimedia power domains:
> +        POWER_DOMAIN_DISPLAY
> +        POWER_DOMAIN_VDOSYS
> +        POWER_DOMAIN_MM
> +      The specific power domain used varies depending on the SoC design.
> +
> +      It is recommended to explicitly add the appropriate power domain
> +      property to the DPI node in the device tree.
>      maxItems: 1
>
>    port:
> @@ -79,20 +89,6 @@ required:
>    - clock-names
>    - port
>
> -allOf:
> -  - if:
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              enum:
> -                - mediatek,mt6795-dpi
> -                - mediatek,mt8173-dpi
> -                - mediatek,mt8186-dpi
> -    then:
> -      properties:
> -        power-domains: false
> -
>  additionalProperties: false
>
>  examples:
> --
> 2.45.2
>
