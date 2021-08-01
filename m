Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8845B3DC924
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 02:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EE06E951;
	Sun,  1 Aug 2021 00:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2EB6E951
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 00:37:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4F6461059
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 00:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627778226;
 bh=3JavNvosscnPl0cKpKchPRZKHTqWBRvdfJhDj49Ch9I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mGqrD+PcCAJ1zGEBOw+Sw41cTTUqJY9sdcjy3hA6W1IOrlv7KFp4nkUgj/TFi0uQO
 dY76R3R5/v/6YloJBbFnJLV64cCTJWT/2HimfHtfV4W+4ZGqgtEAcsvgg6Gy9orJx7
 l7MS8sw+9ODs5bMUy4OfwwGZ/jqGqn1rf1Eq1mS9b7cUOF+sAdXG8wXL+BHSleS2tj
 zojEsDwU++BLlZzygd1gwdMM9iMbYYbnUreA+VmxrzQZxDTiWpjDZ34fRIdNEbvsxl
 62ziqL/svpYbpcfEAw5ppNtOKeKS9D32H/aPwsOKty2uk0dzmNN5/6q+EiEgXhgL2L
 JL8fFoOvj6hzg==
Received: by mail-ed1-f48.google.com with SMTP id d6so11561166edt.7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 17:37:06 -0700 (PDT)
X-Gm-Message-State: AOAM532ulkRpZO8u/L1RUTJh+yVE1Jaitj0P00lwoNCTBRXLDId/JuJI
 /1spL84hQHl5qQYRu1m9A14ln9mqcaGU0f8XCQ==
X-Google-Smtp-Source: ABdhPJwGejZmn+ir4WLj0iJxidWR2q1q2GQkCkoU8d81JhftGj7k3aKFDFGlAWds7B1EA+JK8Gd2VPe/dvPyFj2Eddw=
X-Received: by 2002:a50:d71e:: with SMTP id t30mr11285964edi.72.1627778225214; 
 Sat, 31 Jul 2021 17:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
 <20210729170737.21424-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210729170737.21424-2-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 1 Aug 2021 08:36:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9sasTb=W3Kkhx-UZ-ATSe_ge8A14pmOHFCOQjag89r0Q@mail.gmail.com>
Message-ID: <CAAOTY_9sasTb=W3Kkhx-UZ-ATSe_ge8A14pmOHFCOQjag89r0Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] arm64: dts: mt8195: add display node for vdosys0
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 singo.chang@mediatek.com, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
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

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=883=
0=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:07=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add display node for vdosys0.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch is based on [1][2][3][4]
>
> [1]arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makef=
ile
> - https://patchwork.kernel.org/project/linux-mediatek/patch/2021060107535=
0.31515-2-seiya.wang@mediatek.com/
> [2]arm64: dts: mt8195: add IOMMU and smi nodes
> - https://patchwork.kernel.org/project/linux-mediatek/patch/2021061517323=
3.26682-15-tinghan.shen@mediatek.com/
> [3]arm64: dts: mt8195: add gce node
> - https://patchwork.kernel.org/project/linux-mediatek/patch/2021070505342=
9.4380-4-jason-jh.lin@mediatek.com/
> [4]add mt8195 SoC DRM binding
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5195=
97
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 112 +++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index 04d3e95175fa..4fa47cb2bede 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1155,9 +1155,121 @@
>                         #clock-cells =3D <1>;
>                 };
>

[snip]

> +
> +               merge0: disp_vpp_merge0@1c014000 {
> +                       compatible =3D "mediatek,mt8195-disp-merge";
> +                       reg =3D <0 0x1c014000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSY=
S0>;
> +                       clocks =3D <&vdosys0 CLK_VDO0_VPP_MERGE0>;

Why this merge has no async clock?

Regards,
Chun-Kuang.

> +                       mediatek,gce-client-reg =3D
> +                                <&gce1 SUBSYS_1c01XXXX 0x4000 0x1000>;
> +               };
> +
