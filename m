Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4424A598F9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFFD10E2AC;
	Mon, 10 Mar 2025 15:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XDSy68MI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C3610E29B;
 Mon, 10 Mar 2025 15:03:29 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2fd02536660so1205065a91.2; 
 Mon, 10 Mar 2025 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741619009; x=1742223809; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJOdMi7TuJtokqVht55QzyLtEZiNv+1M/RG0LMYucBg=;
 b=XDSy68MIx1raCOkS7uim6wKGIA5xdMTNmOQH2F4KTbY3mwSx79cQ6mEVclnh0ogF6Q
 1y59Ez0ifjXluoLhWLGR61gTVmMpWWxublYIIQg3SnK+5YTBXJo6s2owu/xryXeM6FS+
 FaaVxoc5eakal0z8rPiKm7ybckExaSha9qvNXyDhB1IN7bmlD3uf6vkegHTsAaRx4vlN
 M9O3UAXCN11SNudKf2D0+S23LFxxV0DgBLfCTSKEUYfQUyMBTDI4LklMi4X/2x3BE8rP
 icRybu/Hopg5aH9roXrEoDac6+gLYkkSIjA14oO/KOJtJDAUfOxVKM3VrK1DdSRJm4S8
 MMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741619009; x=1742223809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJOdMi7TuJtokqVht55QzyLtEZiNv+1M/RG0LMYucBg=;
 b=JsAnfWDeKcjF4TfBPNrmWY7uHbEdEtEB+oVeL+FFXj8TuW7FKwiSe6xCSq5g5yAIBM
 E0Z+4ukE2oliFEut8wPkBDTiI/lOi5eRssFK+WPf15Y9XXzkQ0VhGALNA1Yi0dI9ZB4J
 dUDKBH/YRdRe2Ip49h6bAlnMPHdOjJ2QmsVO20qhcn/imaQbL2QV98ITG2v1v1YnBoTB
 zUBf/FBkkijkCdq4nW6LapUTZtLtIRD9JB+5/HmL5ZxYWLNewNBEFJjT34eZieve1jPl
 B1KgDNmCrggyVQnU1Ju5nlKb8nNjDI9a6oMDaijNDvjIJoOHYspkVERa2QgLX70g+vPy
 XLgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2F5xa5aHONauwmF6ILsZKtsFoVXmJGa5dxwpwPCmJTAg729jPylnUgSeJPLMApx8icKR4EB2Q@lists.freedesktop.org,
 AJvYcCX+Aj9d62xbEkHDETHpkYOQO1vS6o8sqOoHmhxMDoKTVMGlXUHWAECCaCFB91JI0FGr9ui2xPnEmn6C@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwusW/B4p2Vddgn5IlXT3oIfBtugfNse86mtzXmphKHEG3HOgmw
 LoSsUtC04AwoshUKw6cRtqa6H1+K3qERUQDtxvFM3SxRFVh5dXkK+OqVuj/oDh9s72Hpx7uWmfv
 Y/vl3WntKS73YSMMVwnNIC4eCEvA=
X-Gm-Gg: ASbGncuK4ZTZXX2lY6j/CGxb+za65Fl35jg8Gzpq0Agtg7HmU7VOMrlswGwTs7uNxFi
 Il7K+/+06234w/GUt1AuEAhjXn7YuOoUAkRXq5I1O/JXul89ampLDvz+axHZ3gEU6S/mY+ft4Gl
 DrZNuDo0O+w2xuXKYjWW8IN/niAIdO/SmtTkS7
X-Google-Smtp-Source: AGHT+IHDWjvbsImoIvEZ8NiG696nfaDNI6yarD9NR7psbuORnZuZ4bAHU5Szn7yUD4MzuaZiF/MYlkPQ025P9W9WkVQ=
X-Received: by 2002:a17:90b:4c51:b0:2ff:5540:bb48 with SMTP id
 98e67ed59e1d1-300ff94c15dmr50225a91.8.1741619008631; Mon, 10 Mar 2025
 08:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <ece8324f-0d58-4c83-adca-7187f730c56f@stanley.mountain>
In-Reply-To: <ece8324f-0d58-4c83-adca-7187f730c56f@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Mar 2025 11:03:17 -0400
X-Gm-Features: AQ5f1Jp6LUX-uLM6Bz9IEwc8fZsKBb7jSG1dspE9kwAMpt4MWUT1TRhw3ipvpKg
Message-ID: <CADnq5_Mn0Mqr4vbiLCGAgUa-rxa_YfM1=vSCtQsByquwN8oMFA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: delete stray tab in
 kfd_dbg_set_mes_debug_mode()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

Applied.  thanks!

On Mon, Mar 10, 2025 at 6:48=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> These lines are indented one tab more than they should be.  Delete
> the stray tabs.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_debug.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_debug.c
> index 12456c61ffa5..ba99e0f258ae 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -357,12 +357,12 @@ int kfd_dbg_set_mes_debug_mode(struct kfd_process_d=
evice *pdd, bool sq_trap_en)
>                 return 0;
>
>         if (!pdd->proc_ctx_cpu_ptr) {
> -                       r =3D amdgpu_amdkfd_alloc_gtt_mem(adev,
> -                               AMDGPU_MES_PROC_CTX_SIZE,
> -                               &pdd->proc_ctx_bo,
> -                               &pdd->proc_ctx_gpu_addr,
> -                               &pdd->proc_ctx_cpu_ptr,
> -                               false);
> +               r =3D amdgpu_amdkfd_alloc_gtt_mem(adev,
> +                       AMDGPU_MES_PROC_CTX_SIZE,
> +                       &pdd->proc_ctx_bo,
> +                       &pdd->proc_ctx_gpu_addr,
> +                       &pdd->proc_ctx_cpu_ptr,
> +                       false);
>                 if (r) {
>                         dev_err(adev->dev,
>                         "failed to allocate process context bo\n");
> --
> 2.47.2
>
