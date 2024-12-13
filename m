Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0F9F0960
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ED210EF9B;
	Fri, 13 Dec 2024 10:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="f2JpcbJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641BF10EF9B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:26:35 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-71e16519031so802588a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734085594; x=1734690394;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKqDqgeGFaNiglPykk1ZWFq+KoOVfgPfTAi6q8lDcbU=;
 b=f2JpcbJ7/MUZ6jue3CL9cetRFGfLMqh6D1C8G5PUjlhjABkYxV+EwqDE/c4YR3uzz3
 ARgTfS1JbjYRHFFINr2bfxLO5KfhwcSU/WYuLk6kY7gWVafNFN0OesHc5y2tbwKWrzGr
 CBVn/SAFlOsj9ojHmV4WnCKjSSvNVtOXmjG4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734085594; x=1734690394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gKqDqgeGFaNiglPykk1ZWFq+KoOVfgPfTAi6q8lDcbU=;
 b=bBjzaE2CsoPi7SJgG05hX3vOKzI+1mQbwRJvSwtyTDJY1DehdprNO2TEvRp+ZSI3uO
 nfyoAwL9M5MIWxQVVXBX8F/cMibAPBzrilM/g3Ec9cZC6eNRScmHgOwvbQCsaFijgglS
 fUNx+DvS29cj+V+r2+ijyi5OLhqn8+QTtUY6pVgJ0yo9bhvzFnxDG39LxjhLkNk9STS2
 /U2pf4VORubrXtN+tFflRD+gujYOJG7InyB2El4QqJsADv7N6h3ex5RQCGrKJb0ZnrOR
 O+TjPw1+xLqjYhmZEyS7QFjhMZQVUXERkhrYoqdngev33nuaL5+yQB5hhi1IXw1HL94E
 SLVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMfV6UhRnamCUivToVJW0ryL+Vl+hMaLU0yYjehpOOw9E9l45CyJbkEv59SWwgDFCMHe6MIO77Fwo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwWM6Vphuu/xfxu4lO4OSfjcdEzrSE8wSfR12Gfm1lVXBAgPtI
 Vji2hAv6n+xDXwaHsVcyYl5USXMM7iDUlLU+kaL3evSSy+YROfw+7q/bHg7VIfOn/x8ZlAssfKc
 jZEwfHeRE4rh9l2CRRk4iAEp0MGr6gnvXrUFq
X-Gm-Gg: ASbGncvjFTkAEwGef4TLYP4XK0IL8UX71GQeecwsWlz+jbZDc2RDnqhdC+/tM0Srufj
 HkPm04gOlyDdyg6Xawe2dQb+es53c4cJSROK2wTxhlq2dhCQ/T1G6dtgqJeyzvY/Q
X-Google-Smtp-Source: AGHT+IENCMH98mpXyF3VrVAuDfFFYvkYege6xGr7xJlAm+RCTMb9aQXAq9gG3Wn85+C8PlkKAH60Qe9TT1gWu6utMaQ=
X-Received: by 2002:a05:6830:448a:b0:71e:30e:e022 with SMTP id
 46e09a7af769-71e3be44e5bmr1104651a34.10.1734085594573; Fri, 13 Dec 2024
 02:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com>
 <20241213095044.23757-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20241213095044.23757-3-jason-jh.lin@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 13 Dec 2024 18:26:23 +0800
Message-ID: <CAEXTbpcp31oWOCh2c41QbWOc5F_gpD1Bia0NiZeVyDbqKo98Lw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dts: arm64: mediatek: mt8188: Update OVL
 compatible from MT8183 to MT8195
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
 Fei Shao <fshao@chromium.org>
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

Hi Jason,

On Fri, Dec 13, 2024 at 5:50=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> The OVL hardware capabilities have changed starting from MT8195,
> making the MT8183 compatible no longer applicable.
> Therefore, it is necessary to update the OVL compatible from MT8183 to
> MT8195.

This probably doesn't need an (immediate) respin, but this patch needs:

Fixes: 7075b21d1a8e ("arm64: dts: mediatek: mt8188: Add display nodes
for vdosys0")
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index faccc7f16259..23ec3ff6cad9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -2488,7 +2488,7 @@ jpeg_decoder: jpeg-decoder@1a040000 {
>                 };
>
>                 ovl0: ovl@1c000000 {
> -                       compatible =3D "mediatek,mt8188-disp-ovl", "media=
tek,mt8183-disp-ovl";
> +                       compatible =3D "mediatek,mt8188-disp-ovl", "media=
tek,mt8195-disp-ovl";
>                         reg =3D <0 0x1c000000 0 0x1000>;
>                         clocks =3D <&vdosys0 CLK_VDO0_DISP_OVL0>;
>                         interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0=
>;
> --
> 2.43.0
>

Regards,
Pin-yen
