Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E04ABC129
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 16:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0749010E15D;
	Mon, 19 May 2025 14:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XNGy+vJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE60910E157;
 Mon, 19 May 2025 14:44:12 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b16c64b8cbcso603367a12.3; 
 Mon, 19 May 2025 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747665852; x=1748270652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCqMeKHOMAtnfDIPCe7BXpThv/s+vCl0odXQ30UB9EY=;
 b=XNGy+vJohGzfijFKeQGSUsnWaMqJglzljyQX2SgSb2K0Kzv/27cQcaLn25IVIr9Jvq
 9NaTEeXYB84rfhnvP461fRiUXGqWBlBI+iF6dZgAkoJdN8oszawoVs6XAXG957R5PpKN
 CY8yLBChWNnnRwBmASQIKLW/rNme5OaPI9cv6IRYz8nA1MjjyLOTD8oxuhuezSXEWul/
 3rVKylmwHquQAVW1qBDcT5QUlPFXMKkbXwRIujWB5VM1yDFUgB9uwhlKB4ZsgHQ0766D
 zoQrLsuFG3MQ2ThLXjdKr1XggLGzGNmBQ4gNgk3CR5G2e/0kCf+hD9I9CBaUjEIWklOu
 5xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747665852; x=1748270652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCqMeKHOMAtnfDIPCe7BXpThv/s+vCl0odXQ30UB9EY=;
 b=p9qG8i5Mx37zJzYQvWFcQP/E3nsSmc4sqiDuDFAp4u8v4Pr99WSrCHDrfAw7MEhDlz
 hkKlwOlU5qis4a+A2b6k2swWw7pQmaR8WTt6jBZ9qGQSHBOyLFTfbxjQCO/NcfBu+BQK
 9MSO3v7S9vMBgS1MYsfG17GaPA3guGDP3jKuI4iXUgSxK8PlB9l/HR45nX7Cy+hMAMDt
 n+4D2mgFuGa/2hStDuhUajyUCmw+WL44ocEDdTejE9uSmR72mNgPNZ/d17RKjBEUcqP1
 6gCFgLt5hzR3D4koUBvwDilVBWDilAh79n2aTYD2kBHsjPNxcY2R9FToiMW4BTjs0DVq
 NNVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8VtsxbTwp/fpAVpoHY82m7YvrdK9JCzar0Ku3V9fbeuDQDI3gmN5vW4OV6wZB0Hw24TREz+4X@lists.freedesktop.org,
 AJvYcCXX32QHFiLPZvZOPtPFxaLQmAgF8dJ2RF3kK7+UXZe4F5F3pzZXERnSvjBZHoPFaGsjBW6fbTDi0Vi4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcSADZEihhoKqi9Qo17bfb9dJitPUACcrBuH0vb0gE5N+uNhiF
 687YevlsF78vBQO2hR1wLxMhUkeEFmEjJQ2WQcxaYW36+dKPCMg2SWMJRd9TGYs+D3V24VZOrPh
 bAaKir53YE5153+TisMhWtVldet02/fM=
X-Gm-Gg: ASbGncv2lKLFovVZ/MnjsILuTdXj3F+CeSFy/6rwBaD5rmsZs/+i0l9HqpLlNnunWfR
 +k1qdJsNz4/0jq+haM6kyE3y7K5T7XGitqTfsiNWXx8XvqN9aVyH35uKQF7cfVbKVXaUrKenZs8
 qyKovo6OOiTgbm3xbVkmkx3p7UtUvsQLwf99UiKR+2PZlA
X-Google-Smtp-Source: AGHT+IEoGD06eXPC3mI0x6wckhJutnsCRf1XfCN3i7qBPevarw+54MzpQkTsstRTfss5NUBUSloJQlhPpAdMFaISWMk=
X-Received: by 2002:a17:902:fc48:b0:224:88c:9255 with SMTP id
 d9443c01a7336-231d438c7f1mr73492035ad.3.1747665852312; Mon, 19 May 2025
 07:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250517142114.140016-1-leonardodasigomes@gmail.com>
 <20250517142114.140016-2-leonardodasigomes@gmail.com>
In-Reply-To: <20250517142114.140016-2-leonardodasigomes@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 May 2025 10:44:00 -0400
X-Gm-Features: AX0GCFs71Pyhya-zTnBD60uUCrzjlDIv0-_kjXJ8Oj5Bs-AAi_MVrKUJijziTBY
Message-ID: <CADnq5_ORUTzZZSwOKjswFZaSepUSxkBSnmJXPZ7z=jP7CUL59A@mail.gmail.com>
Subject: Re: [PATCH 2/2 RESEND] drm/amd/display: Adjust set_value function
 with prefix to help in ftrace
To: Leonardo Gomes <leonardodasigomes@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 derick.william.moraes@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Applied the series.  Thanks!

Alex

On Sat, May 17, 2025 at 10:28=E2=80=AFAM Leonardo Gomes
<leonardodasigomes@gmail.com> wrote:
>
> Adjust set_value function in hw_hpd.c file to have
> prefix to help in ftrace, the name change from
> 'set_value' to 'dal_hw_hpd_set_value'
>
> Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
> Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
> Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gpu/d=
rm/amd/display/dc/gpio/hw_hpd.c
> index 886dd05b012f..01ec451004f7 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> @@ -85,7 +85,7 @@ static enum gpio_result dal_hw_hpd_get_value(
>         return dal_hw_gpio_get_value(ptr, value);
>  }
>
> -static enum gpio_result set_config(
> +static enum gpio_result dal_hw_hpd_set_config(
>         struct hw_gpio_pin *ptr,
>         const struct gpio_config_data *config_data)
>  {
> @@ -106,7 +106,7 @@ static const struct hw_gpio_pin_funcs funcs =3D {
>         .open =3D dal_hw_gpio_open,
>         .get_value =3D dal_hw_hpd_get_value,
>         .set_value =3D dal_hw_gpio_set_value,
> -       .set_config =3D set_config,
> +       .set_config =3D dal_hw_hpd_set_config,
>         .change_mode =3D dal_hw_gpio_change_mode,
>         .close =3D dal_hw_gpio_close,
>  };
> --
> 2.43.0
>
