Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07E8503C4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 10:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7FC10E56C;
	Sat, 10 Feb 2024 09:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CkpFPrvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223D010E56C
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 09:55:12 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so1414598276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 01:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558911; x=1708163711; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BwKRO335TL12T1ugNIYuUs2JClpMBYM/9p0MgS1ZsMw=;
 b=CkpFPrvGQAMq6DU1Xl7BESY2sdN5b0i4Sq9wew1x/iCGA8OZWER4u79DmqWwNu27V6
 ykBm1OUuHXra6EXul/iYLbze/CnBR9it03CN0LqUj01EkpLAvXJvu7h1JJAXR0Mi9gu5
 fRaDeZgDyb/fZYAnzwPxdGqQuTgSuG4W7WjXTheVMMPn+Cx+9Bmm3b2cR3kVG1qTfFeX
 J/65ka383JYxwDRKBqN5PIivWUgUznxjgxwgS/TK4KrauvohtlhuMYmS38ippgMwSS5Q
 rHYX7nQZC2SDvWD9eiaHCAacv7xd8C0DBmqFnpBi4OylPs7u5TQ06d9LsKa2wu6teGeQ
 ouLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558911; x=1708163711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BwKRO335TL12T1ugNIYuUs2JClpMBYM/9p0MgS1ZsMw=;
 b=IcRQBz6QxQnloGkjnoJtDh+tS+A9ej/dljtVt/A+Y6uRN2P8J0kG0ZGCuy+Fdx/eDS
 Qx+VqI+Cv8x161w864uKR2+QxRI3zJWuxwIjnqWqPvlB1zWJZ7duHNfXJSfricaaMoNp
 FhHuYyo4VUoGXXDum4h+8/1fq7k0mdbWdGy+s8/j/VQamux/POxZ1RIYEFUulNQr77Oo
 /zdtWBcQzQAFj450DK8BQzmBj1KTcsrzMFjw0omW6+1PAvj0eGknDufJq5OcxZI8F9LQ
 VIes3FGSqfC0h/76efIggXKXkHMsGPaExD/qNVBfNk+J3PPxzlvFHAZQR3FEHVt06tzM
 UWOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbS2Uwyxh2OqF42NQozO+gAsCQbz0ep997uXxgF59f50OgULz4C/OWODh/SnmuZPm/SpbswQ2Vzh8vee834CBbjZqhwNOe998jnXB4ihih
X-Gm-Message-State: AOJu0YzjuZ5a1tIAJrvvWc+6lhv3I9PtXsr+h5vlMGnb44zMjivxL9Pw
 vEq9tMxLj5AZKo4epEbp8JEqRUnfYxaXJy0RYcrG5iwqlBQqYWbGkUk7TXlOwPhV91rNsf2nrVW
 cHy2Y+2m29Tk/QhJMQCytaAC03J7daDaXl6PkuQ==
X-Google-Smtp-Source: AGHT+IGHSanBc/5P0KYgb1X3eLxidccmytEEnZo/ritl6ETykacuJJJ7mViK1X+VYMRMhGiedJA+mXbN9stbHWSubxk=
X-Received: by 2002:a25:6954:0:b0:dc6:f0ac:6b74 with SMTP id
 e81-20020a256954000000b00dc6f0ac6b74mr2845262ybc.15.1707558911270; Sat, 10
 Feb 2024 01:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-13-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-13-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:55:00 +0200
Message-ID: <CAA8EJppppDiaQdEzX7WnFA8rFJQBTHJUQq4o6kZtfzTm5Y=nnA@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] drm/msm/dp: move parity calculation to dp_utils
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Parity calculation is necessary for VSC SDP implementation. Therefore
> create new files dp_utils.c and dp_utils.h and move the parity
> calculating functions here. This ensures that they are usable by SDP
> programming in both dp_catalog.c and dp_audio.c
>
> Changes in v2:
>         - Create new files dp_utils.c and dp_utils.h
>         - Move the parity calculation to these new files instead of
>           having them in dp_catalog.c and dp_catalog.h
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile      |   3 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c | 101 +++++-------------------------
>  drivers/gpu/drm/msm/dp/dp_utils.c |  71 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h |  22 +++++++
>  4 files changed, 110 insertions(+), 87 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h

[skipped]

> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
> new file mode 100644
> index 0000000000000..c062e29d07898
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DP_UTILS_H_
> +#define _DP_UTILS_H_
> +
> +#define HEADER_BYTE_0_BIT       0
> +#define PARITY_BYTE_0_BIT       8
> +#define HEADER_BYTE_2_BIT       0
> +#define PARITY_BYTE_2_BIT       8
> +#define HEADER_BYTE_1_BIT      16
> +#define PARITY_BYTE_1_BIT      24
> +#define HEADER_BYTE_3_BIT      16
> +#define PARITY_BYTE_3_BIT      24

Nit: it is usually 0-1-2-3 rather than 0-2-1-3.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +
> +u8 dp_utils_get_g0_value(u8 data);
> +u8 dp_utils_get_g1_value(u8 data);
> +u8 dp_utils_calculate_parity(u32 data);
> +
> +#endif /* _DP_UTILS_H_ */
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
