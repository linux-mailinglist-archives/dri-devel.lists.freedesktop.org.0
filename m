Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BE7B11CCE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 12:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F6F10E9D5;
	Fri, 25 Jul 2025 10:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CP7FT5L6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F1B10E9D9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 10:50:37 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-73e88bc3891so1125490a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 03:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753440636; x=1754045436;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
 b=CP7FT5L6kg8QoN3fNIQTi9VInVruZgpSh3eRPF2Rd2mg4QuwWUyWIR6+DiSUr4s89R
 1cBXdbt1UAGdTMZPMMfZRv0illNFXEP5B/vEBqPfU68za+UtHMVfmy5xKGZjBIDQGwdl
 YjO/IQ8C8IW5hFbWz++qayI+6YQN1rJVGAZ8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753440636; x=1754045436;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
 b=w7gg9CXeXhkRZIyQP1R+upnwkoYjU4/uvd6yPdyKPmgTtxwYruczHUID8Nxm774pQg
 cHvJU4M5SKTGGi1zdZyt+MYd7Go8F4I8DcDphD07SpsF7gjL9FZHiMak619QUXgZbdrd
 9OfEQK1Fd6y63JC416L651E/2IM3r2VOr3rtvvKJqLOMVnAQ/qkDkfiHjCZBXqjLuV8L
 0XgNJezjy3V0yiJgBHX4wlzQhxBOI2Q4xl4lfyJA6HghPQwQO/juOvPDN8HreaS613mc
 J6qkLyEBbhTXCtydHanpjnwuvR5OhQ7cMC/NmBPsDDZ8l10R29pSuP/nVKygd37ubiFu
 ZPLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8CTm++6MrYr5ZL6ZHdj7t/P6w1St1iSqWyoRDidO+bvsH82vhnBDMSajr13Dem0ogCmJTPIjQ/dM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJkvBD+n0kie1js8YAhfBh7CL76dfqUKTNXmMn45Lb8chySgOJ
 iGzGTH4wcGmmW+MjGwctEhy9+1opxlWuPIG989uZoPWu49RuvmrgI//RlKxjhZh8uyBfsQk/hr1
 AZPNO2A==
X-Gm-Gg: ASbGncsCO5F233h4jb81DagWjUMtu23e0cVPL3hufanPtAH5M73cdKw/tAIAVutoWGr
 iJtYelWG7JtSjFSRkUXKmUlJzcKQKFO5hmVNkNUC3sSeA6K3B157aea0O6LnGhqExeRQN2WxY4G
 rUJgoHhTDWI2ajo1IOJeqgdW1mdI2sv2dJjeCKpcQLkyF5ps8r+N78g4OcEP0CV6QIs8J3uikZJ
 tLgcEBbeP3hZkZJLnO8GzdPTETkR2/au0DGtinQcriNIPy4KsKSdL2JmDpIl5/HDFiTmiqNWDFC
 Yd9+WFPkEF/Vigdel+QHOgieJUOTGTqW8vuXxfaPuwNuqvfoKsryulMWIDOPXdOuCEtPND1i+xL
 ucRus4aYNp015We2mXw12hGrpAH1n1SR6eMXGs0G8bW9PjglXsmQwuCEmEQ==
X-Google-Smtp-Source: AGHT+IE0U3ClNYyUhdFLSBgUddVurUaRqdfRi4lg69yQQYQ7cR+dHwERpJ+pIsZG00nGY0mRPRIbXQ==
X-Received: by 2002:a05:6830:448f:b0:73c:ee05:a51d with SMTP id
 46e09a7af769-7413dc6613cmr570034a34.11.1753440636395; 
 Fri, 25 Jul 2025 03:50:36 -0700 (PDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com.
 [209.85.160.53]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7412d15770csm649173a34.15.2025.07.25.03.50.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 03:50:36 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-2ffa8e58654so1098859fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 03:50:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVORVaXLrrFi9Dxy6JDqRZEFvqkid8OpM97FXiugxPnDtfrqmEil8iOT8T8/pwbyJmeN1WaIf+5AV4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3713:b0:4e9:b7e3:bdcd with SMTP id
 ada2fe7eead31-4fa3fad468amr285963137.12.1753440273293; Fri, 25 Jul 2025
 03:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:43:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
X-Gm-Features: Ac12FXyc7RkTIKa4HnSlf_SM-GYdwIREUn6AcAkOBKhNuekdCdvFzy29o7Ufs68
Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
Subject: Re: [PATCH 23/38] arm64: dts: mediatek: mt7986a: Fix PCI-Express
 T-PHY node address
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The PCIe TPHY is under the soc bus, which provides MMIO, and all
> nodes under that must use the bus, otherwise those would clearly
> be out of place.
>
> Add ranges to the PCIe tphy and assign the address to the main
> node to silence a dtbs_check warning, and fix the children to
> use the MMIO range of t-phy.
>
> Fixes: 963c3b0c47ec ("arm64: dts: mediatek: fix t-phy unit name")
> Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/=
dts/mediatek/mt7986a.dtsi
> index 559990dcd1d1..3211905b6f86 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -428,16 +428,16 @@ pcie_intc: interrupt-controller {
>                         };
>                 };
>
> -               pcie_phy: t-phy {
> +               pcie_phy: t-phy@11c00000 {
>                         compatible =3D "mediatek,mt7986-tphy",
>                                      "mediatek,generic-tphy-v2";
> -                       ranges;
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       ranges =3D <0 0 0x11c00000 0x20000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
>                         status =3D "disabled";
>
> -                       pcie_port: pcie-phy@11c00000 {
> -                               reg =3D <0 0x11c00000 0 0x20000>;
> +                       pcie_port: pcie-phy@0 {
> +                               reg =3D <0 0x20000>;
>                                 clocks =3D <&clk40m>;
>                                 clock-names =3D "ref";
>                                 #phy-cells =3D <1>;
> --
> 2.50.1
>
>
