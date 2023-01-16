Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F22E66D10A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D367B10E4DF;
	Mon, 16 Jan 2023 21:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B0710E4DD;
 Mon, 16 Jan 2023 21:41:29 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id d188so13291896oia.3;
 Mon, 16 Jan 2023 13:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MWUxRgg6mzt7MZcpAdkG0jAJTC6xEk0ZHUNCPT2wa5s=;
 b=NgPHN8Ifrqk7S/vWUhjE4yFAflvtB5C0DNPgrItiqMcECZjoP6P+5KV0HemQ0IxY3m
 VKlju372OLxkapZVKNKxcwlmt1m7ySYpICGcCzxY4yT2x9isJIO9untt/S8pnPbnhL5N
 QWyFp1QQ1RfYKDX6q5qdRVsAExybGEk6ObFAaxkhTXBVXb6ezMiGfrQ92//QwEmEPmiZ
 AGf3zNiQl1sx7bX5FFJJwDTKzti+lG2Bl4yriNVi9+kdD4yXQQqAK6Lhw5z1viRTHJy9
 z5Kt1EDNI83Vz7ozFz/3v4tzlUPRck382dC+xHQ5p9KmKztJoyy2YpF3U9pxfup4x9fn
 nQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MWUxRgg6mzt7MZcpAdkG0jAJTC6xEk0ZHUNCPT2wa5s=;
 b=fL0nqC03uZfHrmFog3gbQIUcZ95sjJ0Ye82NsnG3m+3AoullYLtQHngmYF9AM9z0l9
 1jUw1apzBsSlEBrvjWiSmrVjik2gsi8ERYVpkd8SUpciO2ZRtdjbYGTziNWSStwhnSlG
 4PXaD/WgpFM1B8LfHepOYY5+DpF8J7OnLhNiYel8DM1NSEUq4ESvOzkzNCWli35f3Ph8
 n+r4Ck34wdWO0u916Jh39o8m/4UsOYusUXnXu07mN0b0oqyLbsTd3SwK8aF87+txnynk
 uTva776Fa6A8ghIsC6dFMFlKjORncIoQQZQlC64QoPFerQYhJgGpbbOLtNlLPZoCQFhs
 sdaw==
X-Gm-Message-State: AFqh2kr8t73R8qQSxjp05t4IDzTYdwJ3Y9wNffsSeKZgq3veG6bHNeHU
 AmnQ5+7M83ZDh8TcttFWr8nB7Ot/w6s0xo+9VT8=
X-Google-Smtp-Source: AMrXdXv6RlYYDYSHxY8m/i9T9SJqqosOy+f49bKw6UKFmhUhnvyNnQwkIue7RCocB/tJt+N7KiV6p7gPeCiOC5Xxj6k=
X-Received: by 2002:aca:2807:0:b0:35b:f5f7:3ed0 with SMTP id
 7-20020aca2807000000b0035bf5f73ed0mr50984oix.46.1673905289159; Mon, 16 Jan
 2023 13:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20230116212004.860968-1-gpiccoli@igalia.com>
In-Reply-To: <20230116212004.860968-1-gpiccoli@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 16:41:17 -0500
Message-ID: <CADnq5_MCUPYR2ei_NFeWmfuobJQw+JJ3bm=cNKuXG1e7HVrZpw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu/vcn: Adjust firmware names indentation
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: Lazar Lijo <Lijo.Lazar@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Sonny Jiang <sonny.jiang@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 4:20 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> This is an incredibly trivial fix, just for the sake of
> "aesthetical" organization of the defines. Some were space based,
> most were tab based and there was a lack of "alignment", now it's
> all the same and aligned.
>
> Cc: James Zhu <James.Zhu@amd.com>
> Cc: Lazar Lijo <Lijo.Lazar@amd.com>
> Cc: Leo Liu <leo.liu@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 38 ++++++++++++-------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index f8397d993f23..1b1a3c9e1863 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -36,26 +36,26 @@
>  #include "soc15d.h"
>
>  /* Firmware Names */
> -#define FIRMWARE_RAVEN         "amdgpu/raven_vcn.bin"
> -#define FIRMWARE_PICASSO       "amdgpu/picasso_vcn.bin"
> -#define FIRMWARE_RAVEN2                "amdgpu/raven2_vcn.bin"
> -#define FIRMWARE_ARCTURUS      "amdgpu/arcturus_vcn.bin"
> -#define FIRMWARE_RENOIR                "amdgpu/renoir_vcn.bin"
> -#define FIRMWARE_GREEN_SARDINE "amdgpu/green_sardine_vcn.bin"
> -#define FIRMWARE_NAVI10                "amdgpu/navi10_vcn.bin"
> -#define FIRMWARE_NAVI14                "amdgpu/navi14_vcn.bin"
> -#define FIRMWARE_NAVI12                "amdgpu/navi12_vcn.bin"
> -#define FIRMWARE_SIENNA_CICHLID        "amdgpu/sienna_cichlid_vcn.bin"
> -#define FIRMWARE_NAVY_FLOUNDER "amdgpu/navy_flounder_vcn.bin"
> -#define FIRMWARE_VANGOGH       "amdgpu/vangogh_vcn.bin"
> +#define FIRMWARE_RAVEN                 "amdgpu/raven_vcn.bin"
> +#define FIRMWARE_PICASSO               "amdgpu/picasso_vcn.bin"
> +#define FIRMWARE_RAVEN2                        "amdgpu/raven2_vcn.bin"
> +#define FIRMWARE_ARCTURUS              "amdgpu/arcturus_vcn.bin"
> +#define FIRMWARE_RENOIR                        "amdgpu/renoir_vcn.bin"
> +#define FIRMWARE_GREEN_SARDINE         "amdgpu/green_sardine_vcn.bin"
> +#define FIRMWARE_NAVI10                        "amdgpu/navi10_vcn.bin"
> +#define FIRMWARE_NAVI14                        "amdgpu/navi14_vcn.bin"
> +#define FIRMWARE_NAVI12                        "amdgpu/navi12_vcn.bin"
> +#define FIRMWARE_SIENNA_CICHLID                "amdgpu/sienna_cichlid_vcn.bin"
> +#define FIRMWARE_NAVY_FLOUNDER         "amdgpu/navy_flounder_vcn.bin"
> +#define FIRMWARE_VANGOGH               "amdgpu/vangogh_vcn.bin"
>  #define FIRMWARE_DIMGREY_CAVEFISH      "amdgpu/dimgrey_cavefish_vcn.bin"
> -#define FIRMWARE_ALDEBARAN     "amdgpu/aldebaran_vcn.bin"
> -#define FIRMWARE_BEIGE_GOBY    "amdgpu/beige_goby_vcn.bin"
> -#define FIRMWARE_YELLOW_CARP   "amdgpu/yellow_carp_vcn.bin"
> -#define FIRMWARE_VCN_3_1_2     "amdgpu/vcn_3_1_2.bin"
> -#define FIRMWARE_VCN4_0_0      "amdgpu/vcn_4_0_0.bin"
> -#define FIRMWARE_VCN4_0_2      "amdgpu/vcn_4_0_2.bin"
> -#define FIRMWARE_VCN4_0_4      "amdgpu/vcn_4_0_4.bin"
> +#define FIRMWARE_ALDEBARAN             "amdgpu/aldebaran_vcn.bin"
> +#define FIRMWARE_BEIGE_GOBY            "amdgpu/beige_goby_vcn.bin"
> +#define FIRMWARE_YELLOW_CARP           "amdgpu/yellow_carp_vcn.bin"
> +#define FIRMWARE_VCN_3_1_2             "amdgpu/vcn_3_1_2.bin"
> +#define FIRMWARE_VCN4_0_0              "amdgpu/vcn_4_0_0.bin"
> +#define FIRMWARE_VCN4_0_2              "amdgpu/vcn_4_0_2.bin"
> +#define FIRMWARE_VCN4_0_4              "amdgpu/vcn_4_0_4.bin"
>
>  MODULE_FIRMWARE(FIRMWARE_RAVEN);
>  MODULE_FIRMWARE(FIRMWARE_PICASSO);
> --
> 2.39.0
>
