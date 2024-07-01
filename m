Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34B91E881
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 21:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3411810E4E7;
	Mon,  1 Jul 2024 19:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jS6eJ55t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82BD10E4DB;
 Mon,  1 Jul 2024 19:22:18 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2c7c61f7ee3so2028757a91.1; 
 Mon, 01 Jul 2024 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719861738; x=1720466538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aymU97a1sGvobGJ+atGeteP+/v1F5zejZr+FSZsxR0=;
 b=jS6eJ55tL77JYMx9Qr8foIrWirzwRVwMBkbsrQXvp7qg/zP2iRwtEP8I8vjd85f/UZ
 vVreCHzIE/AaSWZmYGhHY6RVY1MoPmNN2FersYp/Fxz5M4+jE45nvPCjuN3NqjRyHOYU
 oybv/350YNx/p1YkqT6uMjEvSxeqwhPperwaa4O7ziNSIVtencfqtsuWvOKHh7FebKEa
 YtgQy30tDn9TTvo6dv4WEkQZS2FjkOEwNuemKswKEtYUPbAqJqxCXaBIBnoRLbU4tvso
 /IpIJgobaWyGaVNmRo9U8I2n1nEPE1dR4PMkgOHdrmVBi7iSmTPEWG6UIwq9tI41W7KE
 ab4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719861738; x=1720466538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aymU97a1sGvobGJ+atGeteP+/v1F5zejZr+FSZsxR0=;
 b=l9phbKGXx12XPYNrxm9yfVsIbcHrf32SmFfj+ZD4q0xDmNqU+jsEOj17NXTNzOz7ff
 TEwcl18YuGSo3YZ3ex0jCj2+uaB1tUOS9QpvvQ+yHwdZD3pvo/2u9NFxM4bZEmDnzTpN
 M8qAx7AEXCaVSo3Q0HjKptQylQfii+T+F8Ps5h4mEUPcU5LqGHa3fn2VDDs13D3pHN6E
 vQvp1u8cHpbBLgo3RhYPbQnkCR5bVxSZSB5Tf2VicfX8MqOiVQ/n0y5xSIAEcwSpirPK
 33kX6qHmpm/P5tPgXyPETzUqusz5E3sHLv2rB9TePZAtNpxpAhQj8pSReiGBetm5p/BF
 DKzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2uDJ0tOJyB1AHACTTQ1cghUxLZn/NArg80G6IqQRf9zkbVR4QjcUQB3RFRyyBHPGwVRaB1JZDeap7vssHuC0T3mQTQpV2AtQ+AOmeBwQqZWBLr9VaXxu8PjbNnFp3zoaXv7+oIcXn/Gg0v6IycA==
X-Gm-Message-State: AOJu0Yz/KVv4BhRW3DChgSRysAf/0CTe7Y8z58c+yayzQBDd5f629f7u
 bqrNBwZ4ZbLO2UE6iK+9zSxSRsiHjNqYGr/lAKKfpnLkfC2DBKxF0D4gV5bOlR/AWayqgjumdPh
 ol/QwHQjqDJvd24I4EGS+LNjxEoVEWw==
X-Google-Smtp-Source: AGHT+IGWf9gM/yO+PqY/uzKDCywdTX9GVdifnKlIyO8850AhUVnit1KRSinpn8GzTYvf4biNxr3CAvdFFOwlgJrft6E=
X-Received: by 2002:a17:90a:e617:b0:2c7:5622:bf40 with SMTP id
 98e67ed59e1d1-2c93d6d4a69mr3298695a91.4.1719861738375; Mon, 01 Jul 2024
 12:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240701070454.106083-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240701070454.106083-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Jul 2024 15:22:06 -0400
Message-ID: <CADnq5_P2KH0FioN-uQ0604mbbrprOs2TmgzuGX4S=J-goYTf3Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/amd/display: Fix warning comparing pointer to 0
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

On Mon, Jul 1, 2024 at 3:15=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Avoid pointer type value compared with 0 to make code clear.
>
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_facto=
ry.c:14:12-13: WARNING comparing pointer to 0.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9458
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/d=
ml2_core_factory.c
> index 1a0da8c6df5a..f56abe9ab919 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_f=
actory.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_f=
actory.c
> @@ -11,7 +11,7 @@ bool dml2_core_create(enum dml2_project_id project_id, =
struct dml2_core_instance
>  {
>         bool result =3D false;
>
> -       if (out =3D=3D 0)
> +       if (!out)
>                 return false;
>
>         memset(out, 0, sizeof(struct dml2_core_instance));
> --
> 2.20.1.7.g153144c
>
