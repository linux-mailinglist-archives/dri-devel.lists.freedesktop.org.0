Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918F69EDD1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 05:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342BF10E12C;
	Wed, 22 Feb 2023 04:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7046810E12C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 04:11:30 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id x40so2068358uaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 20:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SVCtOFAQeCdlxuy/+5enfIE1//lIAo1ZANgQnvIFVR8=;
 b=Uk4/+eknl4RG+uywnGzIfuqQmgRvVQ+nJ72nRpvWVpw8DycQ7PGaOKHAAhTCWQrWIk
 PwjsgquqnSsQUM8hoP5yXC0oMtEi8Mo1blXigVQ4Zv+xKW9wHEQKmG/yKjz/N1uIkg5+
 S4V5VONmU8s2dmp/j6W48Hkq+OGx+t5gqRJSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SVCtOFAQeCdlxuy/+5enfIE1//lIAo1ZANgQnvIFVR8=;
 b=mw1nWqJpo0P5yO0krdviW3MFAAg8ictPstxuKlCtGJx/F4O0xhXSsGazdmsoyjaGY7
 hlmMVCZ7yoOoYeHeFORkUCp14iOciyynT4sCHB6xMlZT4i98N2qksaLsD2Z18TxkIQNA
 1Ygf7dEqpMD+WRtPjdJ8WzRDHDYF5Tn4kZuTeAwhT4mK2ijrC/5VRtKKFnjPqLAN4EHy
 RcXuzn0teutlUh28rK6p92WTuWPAWIwfAooQdchSYgNKWzNZeCF0UFHwEcE6q6M/fJmE
 TA3Olwxld4CvbMWaAoMeJyU4jFjyo4Q4e/qoG2uCnmDxZzpydjZ9hQwe9KoR9DFb9fa5
 21Dg==
X-Gm-Message-State: AO0yUKXsTttEXOrNhranwKqm5twxUP+IKRwZfOsOmKTgEDx1Hjx2Bqfq
 7rgzElrGDwKncDM0Ph1mmsDtcJK9fjY7Stqq4CA+gg==
X-Google-Smtp-Source: AK7set/nftjCq1OYuGKOwe46GNxAufRZH/wve/epWZydqSAOCAqd5GxdqmmuSkjxHSKOqAw+INE+gEreuCXBaRsdDs0=
X-Received: by 2002:a1f:208d:0:b0:3e8:66ce:a639 with SMTP id
 g135-20020a1f208d000000b003e866cea639mr1230544vkg.2.1677039089247; Tue, 21
 Feb 2023 20:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 12:11:18 +0800
Message-ID: <CAGXv+5Hc0qceN3Cr89ZF8K9-EwqF7v26qsdRS2mE_FE_nr7OiA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] drm/panfrost: Add the MT8192 GPU ID
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

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
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

> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

FYI MT8195 has a minor revision for Mali-G57. See https://crrev.com/c/2834981
The commit doesn't say what issues were resolved or still linger though.

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
