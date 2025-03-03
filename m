Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CE8A4C1BC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C0F10E408;
	Mon,  3 Mar 2025 13:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c/AhB5qE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EBE10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:22:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6940611D8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D693C4CEE9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741008130;
 bh=cyAIDvH42HlK42zH1AZZ7W0u8yvqehARnSYevut+Mvw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c/AhB5qEabaK+aGFMVK/mFIuucVYjGzZAk7HdUEOEz2mZCuWZRzB9TmVLCrERWDN5
 OC3uJ8TorONGnXWfIFQmcnQmo1J+tPz7jKCiWTOrHgzEzM6TjKgawRn5EjTjpfa+Vd
 hQbJAAo8DaI/V4nFvyoBVzOlg2VyPBFMczw0uHOJF4cvkb3FC2jgJWI9k3gCwACoBT
 QyXng99JRn6+4oOBzcoxgc+0yF81Wre66HialtHEmysgApJfX9TYc/pCrPFm0+nEWV
 YlKl7U1UpJaE6vvS5QoHCrEsqQCKCMysMl4JglksrOiXPPCibfyukuN5ukmr78zUnS
 SCd6ppVo7A+6g==
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2fee05829edso3310617a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 05:22:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV3EhsGQvptxkmQ6FyjiXNxov5uuZ7fOUwJ6CE+/0dXmUkTH4GnKZBmaYjEg2qulbLMx0H4AkmY/I0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1oOVu3pppGrNI67roSTBeQ9salNn2EXz+1B1+AC4rtQfejRp4
 lMjKvWvE2110JGa7VD/NpFlsVW0DKdoF5+N6lYCGXb3Yn9QtQPa/v/u/mdohTqCcTfKM32aPhj1
 JXb9LpbsDn6AbTUHS2kktErHlQQ==
X-Google-Smtp-Source: AGHT+IHQLK7la/7RxxVx5xQub2rrCyzIXTBwqCYNHPZA1L5Z+HvrKvHgKF1EVP50ng2pCoNbxnqwqT1ThMWF+DeLMfM=
X-Received: by 2002:a17:90b:1cc6:b0:2fc:3264:3657 with SMTP id
 98e67ed59e1d1-2febaa92594mr25361600a91.0.1741008129875; Mon, 03 Mar 2025
 05:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-1-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-1-6703f3e26831@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 21:22:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8c4xeE=c4MTGopenORaP-PL66exLG+erKSV1fpoGJU+g@mail.gmail.com>
X-Gm-Features: AQ5f1JrckMOh9P4yJQbwlfuWcX_03D8O22eeIcknRD2YAlMiCLxngtVQQLy-TeY
Message-ID: <CAAOTY_8c4xeE=c4MTGopenORaP-PL66exLG+erKSV1fpoGJU+g@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: display: mediatek: dpi: add
 power-domains example
To: amergnat@baylibre.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
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

Hi, Amergnat:

<amergnat@baylibre.com> =E6=96=BC 2025=E5=B9=B41=E6=9C=8810=E6=97=A5 =E9=80=
=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:31=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Fabien Parent <fparent@baylibre.com>
>
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding example.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bin=
dings to yaml")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 2=
 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 0f1e556dc8ef..d5ee52ea479b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -116,11 +116,13 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      dpi: dpi@1401d000 {
>          compatible =3D "mediatek,mt8173-dpi";
>          reg =3D <0x1401d000 0x1000>;
>          interrupts =3D <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks =3D <&mmsys CLK_MM_DPI_PIXEL>,
>               <&mmsys CLK_MM_DPI_ENGINE>,
>               <&apmixedsys CLK_APMIXED_TVDPLL>;
>
> --
> 2.25.1
>
