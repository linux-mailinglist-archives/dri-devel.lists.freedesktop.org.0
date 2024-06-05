Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0596C8FC2A4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 06:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B4310E48F;
	Wed,  5 Jun 2024 04:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WHCwlJKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD8B10E48F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 04:25:45 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52b950aa47bso2475104e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 21:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717561544; x=1718166344;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waT0AcrUOg+uWZ0+qjh1ei9vxb3C0YTsDDg3ERd1AtM=;
 b=WHCwlJKVxOps294bylSydfMUfhZEbv9acPrL7Uz4fBRCsTkjhJ4HT7hG1AfUYVUL6K
 R+22fjsYW+eP57mAfONnoj2mcKW76CneOa0oVIFGLVXSkFiBtuPvmepVrQsCh6BT8/sx
 e5usSJyKdNHb0fyyJtMAODXBFWZMpTX6NfUnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717561544; x=1718166344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=waT0AcrUOg+uWZ0+qjh1ei9vxb3C0YTsDDg3ERd1AtM=;
 b=erP+thze900Qn6UJMN+xgW7YqqzO48546x+vcAyeLoNBwMVpoqj/asdtf1jaHTul9w
 hoq0uJ4GFxs7KpAu/GGvn7jP+ZeMAKq/h3om3i4lp59wYTiG06KSobOOuDm93NZzd2A4
 Oj+Hb/t4K7aGvKSlXuPuGfy1h1yaKPx16n9WLDaUJCwQmmUxc3qS4x/f8E7QRhC8T5Ix
 LPWFqNa5q6Zsn7qO0vwu6VzEUOU7aX2aRgPe8HB8W8hXmzkrOJhpov5ZLAvv/f8xwW+B
 LIWXKoSbwVSOC9GwyK0a3SoDfu/IxpoTMCu8dg/f0qZOAGeFpdc8m7uxKidIP1NSrOj5
 saFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPHF+ZVTwU940ZWz7ErhYGI50EhT0B0jv3WgPH91e8eY2VfvioXf5XHvDsIx/n2AYBseaLB/zvVoMBtunArsE9u+hdZNmbKohw9S6SHf7u
X-Gm-Message-State: AOJu0YzRHUQSkJkQUuEP6dcOqAgwXdl9r0yAWcoFFU8ebQfrjdqtDMf8
 Nqlyidv4Z9tIpiHK4oACQt3ceyl6iwXjlPQY5QU4tSHpVSMzspuFtdRKvF+Ugg+9fDH4pFnZISU
 0LOjDE7wda86vMjSdcMEeXtHNELKJAPsIZvp6
X-Google-Smtp-Source: AGHT+IFVvcQWi5hirg6VyE5D099E/X3a3I1qA1m27sAUZLgof8ZGt7kAYof4SoSo6C5SbiaD1MLWTK9P2pF1kHV7ZcU=
X-Received: by 2002:a19:520b:0:b0:52b:874a:a44 with SMTP id
 2adb3069b0e04-52bab4dd1c0mr658131e87.25.1717561543571; Tue, 04 Jun 2024
 21:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
 <20240604123922.331469-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240604123922.331469-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Jun 2024 12:25:32 +0800
Message-ID: <CAGXv+5GXphBp-YMDtkNh1Q-FNQq4cmELR0tB6M==5tKptr8bZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panfrost: Add support for Mali on the MT8188
 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 steven.price@arm.com, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Tue, Jun 4, 2024 at 8:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek MT8188 has a Mali-G57 MC3 (Valhall-JM): add a new
> compatible and platform data using the same supplies and the
> same power domain lists as MT8183 (one regulator, three power
> domains).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index ef9f6c0716d5..4e2d9f671a0d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -777,6 +777,14 @@ static const struct panfrost_compatible mediatek_mt8=
186_data =3D {
>         .pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>
> +static const struct panfrost_compatible mediatek_mt8188_data =3D {
> +       .num_supplies =3D ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> +       .supply_names =3D mediatek_mt8183_b_supplies,
> +       .num_pm_domains =3D ARRAY_SIZE(mediatek_mt8183_pm_domains),
> +       .pm_domain_names =3D mediatek_mt8183_pm_domains,
> +       .pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +};
> +
>  static const char * const mediatek_mt8192_supplies[] =3D { "mali", NULL =
};
>  static const char * const mediatek_mt8192_pm_domains[] =3D { "core0", "c=
ore1", "core2",
>                                                            "core3", "core=
4" };
> @@ -808,6 +816,7 @@ static const struct of_device_id dt_match[] =3D {
>         { .compatible =3D "mediatek,mt8183-mali", .data =3D &mediatek_mt8=
183_data },
>         { .compatible =3D "mediatek,mt8183b-mali", .data =3D &mediatek_mt=
8183_b_data },
>         { .compatible =3D "mediatek,mt8186-mali", .data =3D &mediatek_mt8=
186_data },
> +       { .compatible =3D "mediatek,mt8188-mali", .data =3D &mediatek_mt8=
188_data },
>         { .compatible =3D "mediatek,mt8192-mali", .data =3D &mediatek_mt8=
192_data },
>         {}
>  };
> --
> 2.45.1
>
>
