Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869086A1987
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD0510E890;
	Fri, 24 Feb 2023 10:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD6910E889
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:06:27 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id o6so21039578vsq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ds+e0Ih6UL/cn2qDTbsziNvDdZY4duRrpUzCZIYiaLU=;
 b=afCawh6DuktGjlOudCjHqoYpmBUiUP5Ue7N5HIcodXbWKYh46tetr3moqM2V46f0PX
 k1kLAoF9UNzrw7ZwGSQok0opvqeYx5eiPfdra365llKKcEmrJH4+S7HeMFY5qIO653f0
 0UUg86COEMbN7GEPS/1KbEO7+MlWMZ4Poe1nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ds+e0Ih6UL/cn2qDTbsziNvDdZY4duRrpUzCZIYiaLU=;
 b=HKr6nHav2ZHYM+0heUa1jHfY0jGKrn960rZSSNbV9vbBbDua+1CbNumOX28YZRlg8j
 uXMEXdJZJpxy82wN3W6GCV+6LeMW4cUSPHj4Kfkpl6opyNzw7w5df6ztMv78UNufdgYB
 vXqV54KZkfFmncpIMXKMPZ0t93pVVya2v9Xr1lsAsNOmkn0BJSR0L1yORTJf8nreEewo
 4bSTI86Xjhgz1LH7jpL0Cgk9qQeBecrFOSsinN8zUiSFcWdOWpIbLRgbaSTAlqHh7uvT
 SkTWsQAltwv9hrQV9xWAvGR8czGZXon32u7bmvreLv0z74rIWh6OOW36tjkb/xmiHXMh
 cSMw==
X-Gm-Message-State: AO0yUKWoH3P2t/MbHzT/rid3WXR3S0i5wuRUV1ArVLpBR2s3kF6gPxNB
 sURbIS08yPr5mItDLe+6+iKp73adudD2x4ejpBat+A==
X-Google-Smtp-Source: AK7set/tL0nx+dCLvdLFPGL6MZqwGOMrTaZ11JDqKi1o+dz+K1NCp5pT/0RlUA0xvnbRGHDGRyh3fqWz6RCt7wSFp7Q=
X-Received: by 2002:a67:f650:0:b0:415:2063:e403 with SMTP id
 u16-20020a67f650000000b004152063e403mr2102294vso.3.1677233186030; Fri, 24 Feb
 2023 02:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:06:15 +0800
Message-ID: <CAGXv+5Hzin_5aTqMRRztWbDR64z6_oFOx2hUVnpJBvk9xDzrfw@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] drm/panfrost: Add the MT8192 GPU ID
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
> but treat it as otherwise identical to a standard Mali-G57.
>
> We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
> special GPU ID, in case we find functional differences between
> MediaTek's implementation and the standard Mali-G57 down the line.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

As previously mentioned, MT8195 Mali G57 has minor revision number 1.
Do we need to handle that?

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 6452e4e900dd..d28b99732dde 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -204,6 +204,14 @@ static const struct panfrost_model gpu_models[] = {
>
>         GPU_MODEL(g57, 0x9001,
>                 GPU_REV(g57, 0, 0)),
> +
> +       /* MediaTek MT8192 has a Mali-G57 with a different GPU ID from the
> +        * standard. Arm's driver does not appear to handle this model.
> +        * ChromeOS has a hack downstream for it. Treat it as equivalent to
> +        * standard Mali-G57 for now.
> +        */
> +       GPU_MODEL(g57, 0x9003,
> +               GPU_REV(g57, 0, 0)),
>  };
>
>  static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
> --
> 2.39.2
>
