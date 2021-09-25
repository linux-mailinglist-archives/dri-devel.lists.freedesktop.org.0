Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D836417F48
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 04:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4C76E2D7;
	Sat, 25 Sep 2021 02:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383F86E2D7
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 02:17:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0906A6125F
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 02:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632536253;
 bh=D6mVq6Ws5LARrt0i89PJK+aDRPrFBg+LXJD8hpN1g/g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CViJisyPwkv5aUHbjwT60mL3x9qr1cZjSx1lpiNW8fc46hl26wDvn3hwTH0s+KQ9c
 txfOWQkvAjBtURVkGR4ZjryyWIceDcWsucyiUlxMDvl508YHexoHy90OLwRVl8gM8l
 9GPIChPhvYNDHP00usmTuRefu1vYliyayBzpFmFDhEy6ttTGLo8uUd97PheGMy0Vvt
 HGIFndGKjusR3hsiAtKoYJQroKz9GiNUEmbYqynCOb77nOjxEEqsmMJh8avv/DRhaU
 Ja/TMzNE48rwBRoV+oI0+aJdhkQNQlTGgHazEuGxmbUzmgd8kUMzbKCiQmwq0r202s
 FjTkTPIJLKJSA==
Received: by mail-ed1-f47.google.com with SMTP id ee50so43179475edb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 19:17:32 -0700 (PDT)
X-Gm-Message-State: AOAM5339cHWaC/Ig1QMx8QpuToq8mznFS68FCelLDmrbRZ94aF10t4PY
 GhSQud1JGEtVOTjUyUcMn9HBNKksKOSegxTDlw==
X-Google-Smtp-Source: ABdhPJy43x5ohkW8Db2PjWu46qMaTH2NqNO+cakkPZW/c2xsys2gf6YB/Ly9CvD7M2qmWakZbvEMWap8f0ltaHgNkUA=
X-Received: by 2002:aa7:c617:: with SMTP id h23mr8737188edq.357.1632536251531; 
 Fri, 24 Sep 2021 19:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Sep 2021 10:17:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY__VZ4Q5RsA4eiSfgLdwxg3HGV1-YEMa0L2LHHRdE73koQ@mail.gmail.com>
Message-ID: <CAAOTY__VZ4Q5RsA4eiSfgLdwxg3HGV1-YEMa0L2LHHRdE73koQ@mail.gmail.com>
Subject: Re: [PATCH v11 05/16] dt-bindings: display: mediatek: merge: add
 additional prop for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Moudy Ho <moudy.ho@mediatek.com>, roy-cw.yeh@mediatek.com, 
 Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=882=
1=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:52=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> add MERGE additional properties description for mt8195:
> 1. async clock
> 2. fifo setting enable
> 3. reset controller
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,merge.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> index 75beeb207ceb..542dd7137d3b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -38,6 +38,19 @@ properties:
>    clocks:
>      items:
>        - description: MERGE Clock
> +      - description: MERGE Async Clock
> +          Controlling the synchronous process between MERGE and other di=
splay
> +          function blocks cross clock domain.
> +
> +  mediatek,merge-fifo-en:
> +    description:
> +      The setting of merge fifo is mainly provided for the display laten=
cy
> +      buffer to ensure that the back-end panel display data will not be
> +      underrun, a little more data is needed in the fifo.
> +      According to the merge fifo settings, when the water level is dete=
cted
> +      to be insufficient, it will trigger RDMA sending ultra and preulra
> +      command to SMI to speed up the data rate.
> +    type: boolean
>
>    mediatek,gce-client-reg:
>      description:
> @@ -50,6 +63,11 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>
> +  resets:
> +    description: reset controller
> +      See Documentation/devicetree/bindings/reset/reset.txt for details.
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -67,3 +85,16 @@ examples:
>          power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks =3D <&mmsys CLK_MM_DISP_MERGE>;
>      };
> +
> +    merge5: disp_vpp_merge5@1c110000 {
> +        compatible =3D "mediatek,mt8195-disp-merge";
> +        reg =3D <0 0x1c110000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> +                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> +        clock-names =3D "merge","merge_async";

Define clock-names first.

Regards,
Chun-Kuang.

> +        power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +        mediatek,gce-client-reg =3D <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000=
>;
> +        mediatek,merge-fifo-en =3D <1>;
> +        resets =3D <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> +    };
> --
> 2.18.0
>
