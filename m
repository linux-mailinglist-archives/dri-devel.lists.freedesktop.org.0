Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF0BB11DE2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 13:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B948825B;
	Fri, 25 Jul 2025 11:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dPgjVdj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623F410E1BF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 11:48:30 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7e623a12701so305629585a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753444109; x=1754048909;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
 b=dPgjVdj3Ier2vP1FdmpDx1vsmZ2tZWuoZdS30TfDTybqJVSAJ3xNAPe8SnAaHN4U7a
 Yl42lvEY0tP67r3EsWkkdbCVh7fQEGKagpMpJMXHsseNFP1KXPBOv5PnYgDirNW9hOvB
 DKAs8dAobeMFMX/Lh9erd6jlBl2uUqVSReeW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753444109; x=1754048909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
 b=KHm7VSTUeyVCGeNEjYiPpJaE8xHw0XdLKdjEMllMUO4AnNI5RMv2Bh3LRxC90J65+2
 SFHIc/pHeqwLwca8XUEBXdXgfJPDway5xYHHLK5MobglhG9fKHRSgF9H6xphm3L0wlDp
 +WmDtM7KfJUucwLF7g0wb3KNT1esEJFGFK9Xx2a8kKo8QQLT7jMBdkE6bahDPdhCvmLd
 FLoBSJZWEFI44T+3gTNS9BVrg+VBuixDlIKu3s3IqHmjjvsV4nJ8+jQ93VTvSs7UlW2y
 LEEFHFj7lWleJSKipRwwc+9YJGXKSNSVB29TbEKZEZW6tECgdGxUeCGtLlHk72lFFfca
 V8ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBWC7HRY5eL5DDngQ+gFD3GwKkKno/ax+jRuFkMFyU86GmwMR12q7B9mXpx3YNNc9QLg82HEqSm3Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSGyIWJPwy+USzhSTniGlch+VQZgArLrZ3qGq7tZGwj8iV9sRs
 ijgKO1oo+xBeUIDZF9PyoxMRK8a8Y6eETXCJbwhkdzRUpxedz1jppyBAIc5lrD7SpM7EewR2aq5
 zYAIepA==
X-Gm-Gg: ASbGncs/ab6MNVXmiVVf5Pau7zXV61b/ERECHToMGzKmboxFe1th+fg72J2IbjYclDD
 2vWJRtlD5rsoVIrTr60xbH+MxhRfCoUn32bco2neguZTD0+o5JQc7aXtz8AJhpquJZKpdkU8tvY
 nSp/bemNOFyh/A2MmFV5YgfXzuVUCD+sHcoI+/+eXJPcSCj5CqY1rmfiTr9KvdXO3dbkpy08n80
 JxWVwc83YjSTUZbPoSw+O+fAe7K4cUrjnXQfKYigBjJxhSJ6x31wRSO5H5pJ4avgsrkNpzBuC2F
 aVXNVEhyZsiYMR7K5pf0rAwjgwEslPRj34yljr2A9SF3OuyMxnua1UQqOd6l2wjYt3a8nwujVkR
 EIIVnSNBM/xyk8///SK4md33Q6s7+k10UCaGiGwYIYKOR9MPk+YEKqIeqKw==
X-Google-Smtp-Source: AGHT+IHzmka4ITcYh0kbazBFKS2URTnI0qAbor210yEdRTKze3pFdHkTX9akM+lbS5cNmqi8r3VP/w==
X-Received: by 2002:a05:620a:c52:b0:7e1:31ca:954d with SMTP id
 af79cd13be357-7e63bf53d01mr161192885a.13.1753444108844; 
 Fri, 25 Jul 2025 04:48:28 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
 [209.85.219.46]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e632e3881csm241775485a.75.2025.07.25.04.48.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 04:48:28 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-7072628404dso1984846d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 04:48:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVw8wOPp2vdQu+3M3oOgRiruouEqbNYWo/uX7wS0DaHNwddiraVRedWrWtvoHpXrZd4FuXCmhKkc/k=@lists.freedesktop.org
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr308667137.17.1753440019738; Fri, 25 Jul 2025
 03:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:39:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
X-Gm-Features: Ac12FXzAeqGgOrEJjRR1J4ryO0U3L8RJWv4_H_TyT4RYPsIpmGY3ViSbTr41uno
Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
Subject: Re: [PATCH 37/38] arm64: dts: mediatek: mt8395-kontron-i1200: Fix
 MT6360 regulator nodes
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
> All of the MT6360 regulator nodes were wrong and would not probe
> because the regulator names are supposed to be lower case, but
> they are upper case in this devicetree.
>
> Change all nodes to be lower case to get working regulators.
>
> Fixes: 94aaf79a6af5 ("arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dt=
s b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> index 4985b65925a9..d16f545cbbb2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> @@ -352,7 +352,7 @@ regulator {
>                         LDO_VIN2-supply =3D <&vsys>;
>                         LDO_VIN3-supply =3D <&vsys>;
>
> -                       mt6360_buck1: BUCK1 {
> +                       mt6360_buck1: buck1 {
>                                 regulator-name =3D "emi_vdd2";
>                                 regulator-min-microvolt =3D <600000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -362,7 +362,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_buck2: BUCK2 {
> +                       mt6360_buck2: buck2 {
>                                 regulator-name =3D "emi_vddq";
>                                 regulator-min-microvolt =3D <300000>;
>                                 regulator-max-microvolt =3D <1300000>;
> @@ -372,7 +372,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_ldo1: LDO1 {
> +                       mt6360_ldo1: ldo1 {
>                                 regulator-name =3D "mt6360_ldo1"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <1200000>;
>                                 regulator-max-microvolt =3D <3600000>;
> @@ -380,7 +380,7 @@ mt6360_ldo1: LDO1 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo2: LDO2 {
> +                       mt6360_ldo2: ldo2 {
>                                 regulator-name =3D "panel1_p1v8";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -388,7 +388,7 @@ mt6360_ldo2: LDO2 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo3: LDO3 {
> +                       mt6360_ldo3: ldo3 {
>                                 regulator-name =3D "vmc_pmu";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -396,7 +396,7 @@ mt6360_ldo3: LDO3 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo5: LDO5 {
> +                       mt6360_ldo5: ldo5 {
>                                 regulator-name =3D "vmch_pmu";
>                                 regulator-min-microvolt =3D <3300000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -404,7 +404,7 @@ mt6360_ldo5: LDO5 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo6: LDO6 {
> +                       mt6360_ldo6: ldo6 {
>                                 regulator-name =3D "mt6360_ldo6"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <500000>;
>                                 regulator-max-microvolt =3D <2100000>;
> @@ -412,7 +412,7 @@ mt6360_ldo6: LDO6 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo7: LDO7 {
> +                       mt6360_ldo7: ldo7 {
>                                 regulator-name =3D "emi_vmddr_en";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> --
> 2.50.1
>
>
