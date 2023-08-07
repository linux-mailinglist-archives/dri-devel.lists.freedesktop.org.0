Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC6E772D02
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C668D10E357;
	Mon,  7 Aug 2023 17:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DFF10E36A;
 Mon,  7 Aug 2023 17:31:17 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a5ad21a1f9so3305965b6e.2; 
 Mon, 07 Aug 2023 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429476; x=1692034276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qod5ilU5NMCuYABqWl1EUZiybqxTkFSupdOBDiWIwRU=;
 b=SJn3HAsXO6yEmMDIkJ9yWQkrqPEc2KzFkVJ0ShZWnldFsvftJf3ECrJ/2hzhMub6mr
 8YmbyZpHha8GChHbn7ehrbt7dnLnU/A497c+Hn4dHP5jmCK5R5G5PEXHWtkV784oi3jp
 RHnf/6gvtyiT1XkeOS9nutjVdnJfaaiUpT3wFsDG0NplfuNSPGs/6BA+vuvVxLILj1e2
 N7KxAR5gRTzaIVGy2AVIScoWRRpYcC9oIuZtgvdDnFPTVneh6C6dsthhecoCg2+B8qgC
 /Kc9MRuHNEPKA+vjUWZHlxltfBEx6TAzrz/Tts9iptrE0Juj/eiHW/aawoQzDno79A7r
 7bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429476; x=1692034276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qod5ilU5NMCuYABqWl1EUZiybqxTkFSupdOBDiWIwRU=;
 b=K3XZ13Q/5dwwcArolew8brkGySXQfi0bg8ew+O9lLkm63DxfdxHHTcYAu5TrUV0os4
 pNrecUdooYH/7eYABCZfKsq9afOxzc+qn0Q/+IVKi2fRXBAXKnnOiH+KaY9wzsg/9cVa
 XyFuhswWMkHVfd3lAoI0bKd2OxzeWSGNkuBNOtTG69zhRswX9ZIDqIcmmoRUzbawY372
 MXaRcjmH/0+8WLIbvzCJzMQ9fKqpmZ14XUzGVDrxGZTg749XLaEJDoeKWCx2OfQi856X
 yJDIf0wGMT1iYX8fM9tVzmcUBJ9GQpo+DGAv9h1IiEIIRk4LRIrTafI9EMaQ4ntOXlRv
 1lNw==
X-Gm-Message-State: AOJu0YyoV3oObznf+8iH3O/Tl/+h4CXUZcQ1g3+abIQN8V26r3xU9UiK
 fdo8MTqFTEizJmHeLWvScqKII/uRzk+8MTU30p0wAgk7
X-Google-Smtp-Source: AGHT+IEVIihYiKP4M3IF6i2MpyJEiOQILtmqR+qZI3b4Mjg1G5d9WRQ99MTXk+RHgQTWwKTJ9yAY2ZpiY3BQUo/RqHo=
X-Received: by 2002:a4a:2750:0:b0:56c:cefc:55d with SMTP id
 w16-20020a4a2750000000b0056ccefc055dmr9289982oow.4.1691429476124; Mon, 07 Aug
 2023 10:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230802073715.13598-1-sunran001@208suo.com>
In-Reply-To: <20230802073715.13598-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:31:05 -0400
Message-ID: <CADnq5_NqdXju2Wf2PgiFX_83idVdy0E7AT0vMZ6JCn+inn6P5w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in uvd_v3_1.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 3:37=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/=
amdgpu/uvd_v3_1.c
> index 0fef925b6602..5534c769b655 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> @@ -815,8 +815,7 @@ static const struct amd_ip_funcs uvd_v3_1_ip_funcs =
=3D {
>         .set_powergating_state =3D uvd_v3_1_set_powergating_state,
>  };
>
> -const struct amdgpu_ip_block_version uvd_v3_1_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version uvd_v3_1_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_UVD,
>         .major =3D 3,
>         .minor =3D 1,
> --
> 2.17.1
>
