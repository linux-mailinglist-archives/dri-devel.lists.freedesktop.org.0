Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A30DAAFAA0
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 14:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E0D10E8FD;
	Thu,  8 May 2025 12:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dmr1yvaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A779410E8FD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 12:54:46 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-31062172698so10073561fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746708885; x=1747313685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmSnlmxJWeeD10oNDjS6EnBGlRIgti7Si5Ae3x1v+G8=;
 b=dmr1yvaDnLo9SHjnzENlSp8WIukV9KxlSdWlKTmPxWncSKVeJ0htVGfxII+T4q5BW9
 Flki27PfRreFsq/ERL1m0WMYnKZqRUWEwsM4EEFpBFf3uo8bRpoArOQJ+0lbUMT0f0yJ
 blZjePyo10nDB4jcHBfrnyJ0VdwUmqAhIH9zSnbmB6ZlVW4Vlsa2NeAAURjAaIDjhv93
 S8ELGrObCMBb11Kz/xk499GOvrV1Ov73pVJcrYUefA2iN05t8NI3n+Dhrp7z1JkyvxbX
 85N2vpOTVhbVN77sJ02wipqJZFYmMP7GFMR4IaH3P6EybCBSwO/d4Y3wTQItL/h9a7wR
 8jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746708885; x=1747313685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmSnlmxJWeeD10oNDjS6EnBGlRIgti7Si5Ae3x1v+G8=;
 b=GTkNZ4xbWqrapQ+lGlH0jzQBNA83J23BSKK2WOfIZGX88kALQFnYQERWRGoOItJbAN
 VIcM2k4CGm/t6b/QLEwmS2xZJS0hKbPYzXuuTSX5TXX74Rl2YyrhB5F/AgkhLmKfxo8c
 99PaqfIyItKojM3s9zkH2TOkVkHKb4BPOo4ag4q+jzQ6WF86AiVh+WqqtpK43sHVjIHI
 Ldk1T6zEZnurxni7IDtcGZL2Xbk1B8qflmBVtd9GWlHgbGzCtnHrC3MvUCYBOCceGc8T
 xEDIdYpG64NySRNr41j6uWH0BVHcBNyHCT8ekJpP1GmfYBl6WCnLaf5vsbJZPHYPdi0z
 hBkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVscpjci4WGnKjgkaaQ9RGt3eUP0BmrhJGfV50NKe9opO4x3gKWsx09R/0raSVlN3ZSz8T/TJcwM0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRY0Wk4L5prgxrlPn6HHMr4hlXyc0/V1nHmjoFHo81wFYJxcO9
 uvkd/EIjFjZE98Lu7ZSXT3sEQ1m6ClZO/uELTOXTUkuTqZWww1+zq07XQ56MAp1DquHHZlq3NZG
 SiFxVXsMWTjiVOhbAN+8eVyUw9kigQx2OBeXKGg==
X-Gm-Gg: ASbGncusZR4BG53sshw3vq5GvL2B6RPcajMNyhniAf3ygB+pv5CEEAfcspPMAixscHP
 qv9cMLvHFPNp0Gr8WLjqh+XykB5b7Emi3IFYnQhU7OhTlBTPstq/UX2X33zjj4T+JaaPdWFyOMU
 ED4nGd5zrvuyy5lu0sP2FhZw==
X-Google-Smtp-Source: AGHT+IESDSB+M6cQqQKoi1no4CUO3/t7RnhD0N76Oc6h9qf9nOOdCGVN/uzMOa2kSVF2KTBgdhb1HyNQNUQQ07MCqDY=
X-Received: by 2002:a2e:9fc5:0:b0:30c:523a:a84 with SMTP id
 38308e7fff4ca-326b88af180mr10273841fa.32.1746708885003; Thu, 08 May 2025
 05:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
 <20250505-sm8750-display-panel-v1-2-e5b5398482cc@linaro.org>
In-Reply-To: <20250505-sm8750-display-panel-v1-2-e5b5398482cc@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:54:33 +0200
X-Gm-Features: ATxdqUGekggxGo4UYqHnYKuHD3Y3vsGE4-NVmxpuSSBnslo0v5IlSxfK1_TPjro
Message-ID: <CACRpkdZi3ryJ_D6NYaLS1Cmevp-Pmbdq6zTL5+a=cmXNq42N5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add Novatek NT37801 panel driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi Krzysztof,

thanks for your patch!

On Mon, May 5, 2025 at 11:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add driver for the Novatek NT37801 or NT37810 AMOLED DSI 1440x3200
> panel in CMD mode, used on Qualcomm MTP8750 board (SM8750).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(...)
> +static int novatek_nt37801_on(struct novatek_nt37801 *ctx)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +
> +       dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
> +                                    0x55, 0xaa, 0x52, 0x08, 0x01);

The above is obviously some kind of unlocking
sequence to open page 1 of some vendor registers.

We know this because the exact same sequence appear in
panel-innolux-p079zca.c  and panel-sony-tulip-truly-nt35521.c
and the last argument is the page, so there we added
a switch page macro making it clear what is going on.
Could you do the same here?

With this addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
