Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61580B11C7A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 12:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB0910E9C1;
	Fri, 25 Jul 2025 10:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Yyuq5TO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CC710E9C1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 10:34:15 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-52d9a275c27so1318374e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753439654; x=1754044454;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29HDb0CStjqCTbdMTaT8ki881uLabi0viRhzF0Cw5Io=;
 b=Yyuq5TO4quKMcK9yb/bEut0rLMUfnqYWM1IwapCs1JQVcsNXYdSdjcIgKu9kb8GQYq
 NAM72WEG1wB2UIfWkhEFrheTuiXN58II1cv14b8YHxWBzMLeFkTEWsOmrfRdsmq3498U
 QA0HYaYaSTVGWrSonfcd+Ct54BOPoasN4J1T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753439654; x=1754044454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29HDb0CStjqCTbdMTaT8ki881uLabi0viRhzF0Cw5Io=;
 b=RXp75/SWPEnPPUohzbohIzzyCk5Qrz1+rrheg3x4xcm710No8nrRrj2JP8T/LdPpdQ
 RZ6Igw8UGZnbZwUdvQbcMRL3LgyuK33An2YlSnXul0Ry2QGZylfaAQw3LNinkxCw+GNk
 4gpFgeH69MgRGdIceNr7KVt9QlsxaUpK1aM8QWC5K9AaI9BiRtILOfReycczpn48SaWR
 cIuYAKdBfkU0HMZL7O7z1BPzaPhvZwVBFMIKKCoKfVFTx9G/wlH9NnSgZzRKy773Uayg
 pA2+hpNDZDDc3nb8nMYU+UcGQbEZHkYKP/qAqUzefQGc4GcERIi3AKHTVhnX5jzNbAwQ
 gn0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6LwHdEbvf9nLIvhKtFzsu2cdsz3RVNrOLZiStoCgBQIoXMUiwW19oUOa+dB4YkVW8hyYfWD2HTKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM4/u8/pVAt2hBMhJFRK3SL7CIg+KI8Q7e/Q7fxmWCA6TIAB9p
 xx7FP0u6Up8i2oOxt0g2sA0kEv7dJuw3jznFL2mfECbcBLdqxGMxS8fd55h76ViVKNpuJZ1L4WF
 kgptr7Q==
X-Gm-Gg: ASbGncu/YBpgulKjzgmeylV7SzzUTVF7krSypZLl+0MDeZNKvu+Y1wc6y01YiCWOIXL
 qb24xjOMWrTdJRUBBH5MHtG13FX8sqbk6jX1x0Wrgyv4vTAxwLlgOs5mXtM2Kn8Ij07O9TX/Nnn
 15U3u3sAA7dvLhdeonU1pr4T0vsPAGZlNRPbp4leMR4FppEGONzv17LgnU810qcGHMUWPFpIbF1
 4/5Xme/f3ypuchItm3c7F8I2rX7AQhqOYtC5dGeQd6Gise7eyow4KMW2b303J4m1pVTPw+fUbPT
 5B7CtOyICnCDnkhd/tAstzNbiWKAdQh3puDxWEdorg2mmCbEmkOSonNCa76Mh/3g5QgkS2ubUXu
 5J3wcaLYfvfIyEg37NbcTfkVL/SUz/MBGus1Z5l8AILNWxb8FBAqPqInDnQ==
X-Google-Smtp-Source: AGHT+IGKntVK4xiJhfFLyxlx/xeZ5yrXCMECsx8cVU/FImUdlRvluvVNvpP6qnLKY/9fThm5OAma3Q==
X-Received: by 2002:a05:6122:3c91:b0:535:caf8:1198 with SMTP id
 71dfb90a1353d-538db4f3226mr372304e0c.2.1753439653275; 
 Fri, 25 Jul 2025 03:34:13 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-537bf85dfa1sm893437e0c.20.2025.07.25.03.34.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 03:34:12 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-4e9a7b4a412so1363645137.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 03:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUWh04/zl4xAyLEDXmzFmWwbBf28+OwBdlR+8CvaxKoMstdeJEnGPkPK5bjLP9dVd/wqwLErvpCngs=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5799:b0:4e5:ade7:eb7c with SMTP id
 ada2fe7eead31-4fa3fac29femr330925137.12.1753439652105; Fri, 25 Jul 2025
 03:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-35-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-35-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:33:36 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhfg_qD044bO8EOV=MckoNVtJXQ47XBeDFMPwJ9goHg-A@mail.gmail.com>
X-Gm-Features: Ac12FXyYX3cOTb6n6096sUC59Z8DCV1ifB6_qbpW9gH46tmstAs2fiwwoJYhrGs
Message-ID: <CAC=S1nhfg_qD044bO8EOV=MckoNVtJXQ47XBeDFMPwJ9goHg-A@mail.gmail.com>
Subject: Re: [PATCH 34/38] arm64: dts: mediatek: mt8195: Fix ranges for jpeg
 enc/decoder nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
 linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
 herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
 andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
 chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
 p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
 tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
 broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
 matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
 linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
 sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
 andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
 lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
 tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
 linux-media@vger.kernel.org, davem@davemloft.net
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The jpeg decoder main node is under the soc bus but currently has
> no ranges or reg specified, while the children do, and this is
> wrong in multiple aspects.
>
> The very same is also valid for the jpeg encoder node.
>
> Rename the decoder and encoder nodes to "jpeg-decoder@1a040000"
> and to "jpeg-encoder@1a030000" respectively, and change their
> children to use the newly defined ranges.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Despite now jpeg-encoder isn't sorted in order, I guess we all agree
it's much easier to read in this way, so

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 30 +++++++++++++-----------
>  1 file changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index dd065b1bf94a..35b10082bb89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -3014,7 +3014,7 @@ venc: video-codec@1a020000 {
>                         #size-cells =3D <2>;
>                 };
>
> -               jpgdec-master {
> +               jpeg-decoder@1a040000 {
>                         compatible =3D "mediatek,mt8195-jpgdec";
>                         power-domains =3D <&spm MT8195_POWER_DOMAIN_VDEC1=
>;
>                         iommus =3D <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>=
,
> @@ -3025,11 +3025,12 @@ jpgdec-master {
>                                  <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFF=
SET0>;
>                         #address-cells =3D <2>;
>                         #size-cells =3D <2>;
> -                       ranges;
> +                       ranges =3D <0 0 0 0x1a040000 0 0x20000>,
> +                                <1 0 0 0x1b040000 0 0x10000>;
>
> -                       jpgdec@1a040000 {
> +                       jpgdec@0,0 {
>                                 compatible =3D "mediatek,mt8195-jpgdec-hw=
";
> -                               reg =3D <0 0x1a040000 0 0x10000>;/* JPGDE=
C_C0 */
> +                               reg =3D <0 0 0 0x10000>;/* JPGDEC_C0 */
>                                 iommus =3D <&iommu_vdo M4U_PORT_L19_JPGDE=
C_WDMA0>,
>                                          <&iommu_vdo M4U_PORT_L19_JPGDEC_=
BSDMA0>,
>                                          <&iommu_vdo M4U_PORT_L19_JPGDEC_=
WDMA1>,
> @@ -3042,9 +3043,9 @@ jpgdec@1a040000 {
>                                 power-domains =3D <&spm MT8195_POWER_DOMA=
IN_VDEC0>;
>                         };
>
> -                       jpgdec@1a050000 {
> +                       jpgdec@0,10000 {
>                                 compatible =3D "mediatek,mt8195-jpgdec-hw=
";
> -                               reg =3D <0 0x1a050000 0 0x10000>;/* JPGDE=
C_C1 */
> +                               reg =3D <0 0 0x10000 0x10000>;/* JPGDEC_C=
1 */
>                                 iommus =3D <&iommu_vdo M4U_PORT_L19_JPGDE=
C_WDMA0>,
>                                          <&iommu_vdo M4U_PORT_L19_JPGDEC_=
BSDMA0>,
>                                          <&iommu_vdo M4U_PORT_L19_JPGDEC_=
WDMA1>,
> @@ -3057,9 +3058,9 @@ jpgdec@1a050000 {
>                                 power-domains =3D <&spm MT8195_POWER_DOMA=
IN_VDEC1>;
>                         };
>
> -                       jpgdec@1b040000 {
> +                       jpgdec@1,0 {
>                                 compatible =3D "mediatek,mt8195-jpgdec-hw=
";
> -                               reg =3D <0 0x1b040000 0 0x10000>;/* JPGDE=
C_C2 */
> +                               reg =3D <1 0 0 0x10000>;/* JPGDEC_C2 */
>                                 iommus =3D <&iommu_vpp M4U_PORT_L20_JPGDE=
C_WDMA0>,
>                                          <&iommu_vpp M4U_PORT_L20_JPGDEC_=
BSDMA0>,
>                                          <&iommu_vpp M4U_PORT_L20_JPGDEC_=
WDMA1>,
> @@ -3088,7 +3089,7 @@ vdosys0: syscon@1c01a000 {
>                 };
>
>
> -               jpgenc-master {
> +               jpeg-encoder@1a030000 {
>                         compatible =3D "mediatek,mt8195-jpgenc";
>                         power-domains =3D <&spm MT8195_POWER_DOMAIN_VENC_=
CORE1>;
>                         iommus =3D <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA=
>,
> @@ -3097,11 +3098,12 @@ jpgenc-master {
>                                         <&iommu_vpp M4U_PORT_L20_JPGENC_B=
SDMA>;
>                         #address-cells =3D <2>;
>                         #size-cells =3D <2>;
> -                       ranges;
> +                       ranges =3D <0 0 0 0x1a030000 0 0x10000>,
> +                                <1 0 0 0x1b030000 0 0x10000>;
>
> -                       jpgenc@1a030000 {
> +                       jpgenc@0,0 {
>                                 compatible =3D "mediatek,mt8195-jpgenc-hw=
";
> -                               reg =3D <0 0x1a030000 0 0x10000>;
> +                               reg =3D <0 0 0 0x10000>;
>                                 iommus =3D <&iommu_vdo M4U_PORT_L19_JPGEN=
C_Y_RDMA>,
>                                                 <&iommu_vdo M4U_PORT_L19_=
JPGENC_C_RDMA>,
>                                                 <&iommu_vdo M4U_PORT_L19_=
JPGENC_Q_TABLE>,
> @@ -3112,9 +3114,9 @@ jpgenc@1a030000 {
>                                 power-domains =3D <&spm MT8195_POWER_DOMA=
IN_VENC>;
>                         };
>
> -                       jpgenc@1b030000 {
> +                       jpgenc@1,0 {
>                                 compatible =3D "mediatek,mt8195-jpgenc-hw=
";
> -                               reg =3D <0 0x1b030000 0 0x10000>;
> +                               reg =3D <1 0 0 0x10000>;
>                                 iommus =3D <&iommu_vpp M4U_PORT_L20_JPGEN=
C_Y_RDMA>,
>                                                 <&iommu_vpp M4U_PORT_L20_=
JPGENC_C_RDMA>,
>                                                 <&iommu_vpp M4U_PORT_L20_=
JPGENC_Q_TABLE>,
> --
> 2.50.1
>
>
