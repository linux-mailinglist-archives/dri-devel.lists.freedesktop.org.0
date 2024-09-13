Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1E0978AB0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 23:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7497D10EDB6;
	Fri, 13 Sep 2024 21:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WmHtDYoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417A710EDB6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:37:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 92325A416FF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75B3C4CEC7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726263447;
 bh=manW/XLXA8gVmKWJwstgFB2hSWZWCj5W3+3ArJJtYCg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WmHtDYoRSLlStBr4+JqA3TLmkSnIto885ESxtd3uz4a9nOn2Dj0z+8Hof6ptOTjI7
 9m8nWQryaXnu6DnH/3uWVEnx30IdftMZNPr1tiJ42oUowZtob63ACpkc9yO6EFqMOS
 +BllsiEAgEnvh3ABvMuyTVjLF7h0btiqfOeTAW10y1VPe1ac4j9BzOg83TwR84yEES
 C+eZikkDPtBRpZd35Onmbhw3WBqUa6faarQAoksnG2KlTDMX+CYORgLuw6C0iJYIOv
 apvuyhjH0XIg8qEY7hdnGE6vcoiX2izuA+JyiC5uyN3w+JRHZLMUPMNh3YmaoAkJFF
 l5j37iToF4qJQ==
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5356ab89665so3089929e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:37:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU1v9qnq5yaV9fypi00KVYIHCS0a9BT9ucDQsdOe9lwkYEeNKdqZxZiEtccv7aOUX2RyNJvApPLgFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybj6KE9pspO91gyiyjjAyQ47LhBlSgQDZdKy7fq+Tym5AzqWwP
 yDoZk0ieVECiHmvLz9yEAdhNBq9f9tv5bXdp6SwiwaAU0p6iSTmkvip5t+Wz3NOUCHlKzo51nPC
 P0DLVkHeM4pCv8DV4o2LZERB1rA==
X-Google-Smtp-Source: AGHT+IF3i2ra1hDCoZJWXdELHFse3nu1BoApDVkgvdYBd1QEEsCBiERlIo516YbDjDMsGqLm6EgWpki4O1VGoMBcV4M=
X-Received: by 2002:a05:6512:b96:b0:52c:e133:7b2e with SMTP id
 2adb3069b0e04-53678fc9930mr5368033e87.35.1726263446242; Fri, 13 Sep 2024
 14:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240912144430.3161717-1-treapking@chromium.org>
 <20240912144430.3161717-3-treapking@chromium.org>
In-Reply-To: <20240912144430.3161717-3-treapking@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 13 Sep 2024 16:37:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJngFLbNtT3m--xi5nNt9o7M=se8Qkhf20TxRCj-G=6dA@mail.gmail.com>
Message-ID: <CAL_JsqJngFLbNtT3m--xi5nNt9o7M=se8Qkhf20TxRCj-G=6dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add port node to dpi node
To: Pin-yen Lin <treapking@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
 Jitao shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>
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

On Thu, Sep 12, 2024 at 9:44=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Add the port node to fix the binding schema check.

The dsi node has the same issue.

> Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409110843.Hm5W9upr-lkp@i=
ntel.com/
>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8183.dtsi
> index 266441e999f2..0a6578aacf82 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1845,6 +1845,10 @@ dpi0: dpi@14015000 {
>                                  <&mmsys CLK_MM_DPI_MM>,
>                                  <&apmixedsys CLK_APMIXED_TVDPLL>;
>                         clock-names =3D "pixel", "engine", "pll";
> +
> +                       port {
> +                               dpi_out: endpoint { };
> +                       };
>                 };
>
>                 mutex: mutex@14016000 {
> --
> 2.46.0.662.g92d0881bb0-goog
>
