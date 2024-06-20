Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4405C9107FA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8027810E98B;
	Thu, 20 Jun 2024 14:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hjKmnhmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B2910E98B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:20:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB7DC621BB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03F8C4AF0B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718893201;
 bh=/JAmiiZWB1tRsr19XCxymVqTazffJcs1aVIaFgEx5Lg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hjKmnhmMuRYAIox5aFwp23aYhNQo09aZc6unr5JtyYrq13JS3cOL7wduKrXlEjmoR
 OvPs2i8PelIqInD8a3IzgdJT5/vP6aofnkeG0bPqFv5gnYSL1vpYQuPrP378KYiwAj
 GuWHxSaEn+1Aqww3Z5Z+vUcBlPE9Hwbc4ujvNKOnVzx6SPU9dAF8AkfkMfaggP/IYY
 INuXmfGEBg51aKfr9/f5J1XF4I2bE+DnoVPpIR75l0itopeyE+/qCGDVR2MLdOBiNq
 sjeiFGs/468ioohTStQ5WpaaBL7IA7m/RjoW7eGeED9y6cioBVEVDmvCEzejfMSeyp
 cLtw2q7j17Pgg==
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1f9885d5c04so8488945ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 07:20:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUDjKHEd6pl7fQ492ew8kzqUHZNov4w3KGjwktU2fRUa7hFhpcarVone18g62P9BYA4aq9eMbYhnn/ov+qGFBkPLTjE5HdwcOJ3/nnBGun8
X-Gm-Message-State: AOJu0YwFwQIXxNmq3C3jZ3Pa8/bjX72x5MCOVCSTu2FAiw75Wv8e9N6V
 B1KK2EjSOGKtmySc1vV55TXsG1onmpn++U6eZ49ewutWvvgfi+8MT4LCuZzNK9DN9N1ZxmvnEJN
 2lluL5Q+4yOUN41M7fGaAQUv84w==
X-Google-Smtp-Source: AGHT+IFdX5LFhKH0jgJGzuBnyaSdfplQkl7Br4G/jei37asmuDLLgaokqkFn5thWy43rneZsfwc0lfFXrdK0roAHWok=
X-Received: by 2002:a17:902:f54d:b0:1f9:b7ea:c320 with SMTP id
 d9443c01a7336-1f9b7eac674mr34658135ad.41.1718893201169; Thu, 20 Jun 2024
 07:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240620054708.2230665-1-wenst@chromium.org>
In-Reply-To: <20240620054708.2230665-1-wenst@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Jun 2024 22:20:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tLUAcw+C5D78SNwrV6kHds7JhtAoFYFmxxfAH9vtkDQ@mail.gmail.com>
Message-ID: <CAAOTY_9tLUAcw+C5D78SNwrV6kHds7JhtAoFYFmxxfAH9vtkDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if
 DRM_FBDEV_EMULATION=y
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Hi, Chen-Yu:

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2024=E5=B9=B46=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:47=E5=AF=AB=E9=81=93=EF=BC=9A
>
> With the recent switch from fbdev-generic to fbdev-dma, the driver now
> requires the DRM GEM DMA helpers. This dependency is missing, and will
> cause a link failure if fbdev emulation is enabled.
>
> Add the missing dependency.

Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>

>
> Fixes: 0992284b4fe4 ("drm/mediatek: Use fbdev-dma")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> The commit this patch fixes is in drm-misc-next. Ideally this patch
> should be applied on top of it directly.
>
> CK, could you give your ack for it?
>
>  drivers/gpu/drm/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 96cbe020f493..d6449ebae838 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -7,6 +7,7 @@ config DRM_MEDIATEK
>         depends on HAVE_ARM_SMCCC
>         depends on OF
>         depends on MTK_MMSYS
> +       select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> --
> 2.45.2.741.gdbec12cfda-goog
>
