Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E37CEA1AA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 16:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A0410E0F0;
	Tue, 30 Dec 2025 15:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uud/8zHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A58810E0F0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:50:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 098406000A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5589C116C6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767109826;
 bh=buNYBa+G8qfLlUvBCR4ZFcvapW46f5DYot+jLhw9HoQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uud/8zHKAy9vAmWpvkX9rbSTgMdpfHBrh6WLiprE9pI8hXsuIlJvKVSvybs77Fn8Y
 sUNNKqabH1O3AAdbTpPpjTZKBZ6V0IebRTaOqL2zluNQBKVnI/KyICHqazM4+tq8Al
 e7KrJX5C2v4quZN/1/fXqONBGLQD9e5pGrZWWuL4E2yUMn9tgr24TnxY0pGE54iQk3
 FNmaJE5Xh1NVQAEmCs/Ertn7U8sVHeyHuLWOeql2YdFDe2u0OwNx/yZ5U0KPz8j379
 t4oJxM3x8CAObxRNyV5UERTf1i+gfTxIHvgPsa8R+JAxSfQDAsS9oaFzAQxP4vVDon
 lgi7CNLA0cyfA==
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7fbbb84f034so6781904b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXnJ9Bh86P+MuxtRRweiIE3YQUTHjXIakvWSSEo0YwcGlHmVB3rrwgSZjXW80CALGYtc+xHQhQ8XD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr1SfIcjOgUD6/RsbI0PoSg+IHeiAl8YtEWgGBM2F2cMH2Noh0
 4wxXBkn8F1jPfjl1v2k0pU4sQ99GIlThwIEIkHPPueF2IAkqxlxEEmQ5f7QWOXa44N2g7M77N/4
 8rxPg8T4P/PPjSm1AguI6rgqLKa5zAA==
X-Google-Smtp-Source: AGHT+IEZjuJ741PMreIHh9uiPP3hb59AwPjPkgs6EZmokmEJmwSPfCMKsbUmse1x0DIpIk+dUrk59qVP/n9gj5/yiuc=
X-Received: by 2002:a05:7022:b906:b0:11b:d4a8:d244 with SMTP id
 a92af1059eb24-121722ab1e3mr21838218c88.16.1767109826287; Tue, 30 Dec 2025
 07:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20251125-drm-mediatek-hdmi-v2-wifpts-v1-1-a6c7582cf69a@kernel.org>
In-Reply-To: <20251125-drm-mediatek-hdmi-v2-wifpts-v1-1-a6c7582cf69a@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 15:50:13 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-hGe-yWK-iSXDefEPJN9bc8A_r=kNirBAyHgCPhqoAvw@mail.gmail.com>
X-Gm-Features: AQt7F2ole3Zhplk3q7hyGThFScP9pdJnuSD325W6WxvbLpbbWXRXwbGOdauOQ4Q
Message-ID: <CAAOTY_-hGe-yWK-iSXDefEPJN9bc8A_r=kNirBAyHgCPhqoAvw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_v2: Fix return type of
 mtk_hdmi_v2_tmds_char_rate_valid()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, linux-kernel@vger.kernel.org
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

Hi, Nathan:

Nathan Chancellor <nathan@kernel.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=8825=
=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:14=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> When building with -Wincompatible-function-pointer-types-strict, a
> warning designed to catch kernel control flow integrity (kCFI) issues at
> build time, there is an instance in the new HDMI v2 drm/mediatek code:
>
>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:1331:31: error: incompatible fun=
ction pointer types initializing 'enum drm_mode_status (*)(const struct drm=
_bridge *, const struct drm_display_mode *, unsigned long long)' with an ex=
pression of type 'int (const struct drm_bridge *, const struct drm_display_=
mode *, unsigned long long)' [-Werror,-Wincompatible-function-pointer-types=
-strict]
>    1331 |         .hdmi_tmds_char_rate_valid =3D mtk_hdmi_v2_hdmi_tmds_ch=
ar_rate_valid,
>         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>
> While 'int' and 'enum drm_mode_status' are ABI compatible, hence no
> regular warning from -Wincompatible-function-pointer-types, the mismatch
> will trigger a kCFI violation when mtk_hdmi_v2_tmds_char_rate_valid() is
> called indirectly.
>
> Update the return type of mtk_hdmi_v2_tmds_char_rate_valid() to be 'enum
> drm_mode_status' to clear up the warning and kCFI violation.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/med=
iatek/mtk_hdmi_v2.c
> index c272e1e74b7d..454b8b93b834 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> @@ -1120,9 +1120,10 @@ static void mtk_hdmi_v2_hpd_disable(struct drm_bri=
dge *bridge)
>         mtk_hdmi_v2_disable(hdmi);
>  }
>
> -static int mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge=
 *bridge,
> -                                                const struct drm_display=
_mode *mode,
> -                                                unsigned long long tmds_=
rate)
> +static enum drm_mode_status
> +mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> +                                     const struct drm_display_mode *mode=
,
> +                                     unsigned long long tmds_rate)
>  {
>         if (mode->clock < MTK_HDMI_V2_CLOCK_MIN)
>                 return MODE_CLOCK_LOW;
>
> ---
> base-commit: a846505a193d7492ad3531e33cacfca31e4bcdd1
> change-id: 20251125-drm-mediatek-hdmi-v2-wifpts-d67b55175609
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
