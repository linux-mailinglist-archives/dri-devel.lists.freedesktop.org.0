Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA8874DC76
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 19:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E5D10E2B2;
	Mon, 10 Jul 2023 17:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D1610E2B2;
 Mon, 10 Jul 2023 17:28:50 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5661e8f4c45so3699013eaf.1; 
 Mon, 10 Jul 2023 10:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689010129; x=1691602129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ul2VBha0pA5JbrKTfyVeWSobOhwcf7C0x71pvrwyrgQ=;
 b=o6mVXqDTJmoHlgZBvx002DCMmHK4ChjFvLlY6gU+ePOdej0BSjQFyLY8olhCtj6mu2
 wZDy9aP75QBVXpumDWx2MtwtuMIIxxxVJroOi4cAtqcIqzCudfXUZvzccob7nUYqsiJu
 PkYuHINFZaecU/9Sa50Uqp7GpIEgq8GZY4qH9jg743AJlaItRqXN5y8W+xZryx2ztouF
 wPofLGnW5VmLI2i1Xhvr8gLvDIqkW+uBqlwGK9X0vCT7bPizpyT+Qmqg93VDYj+B4ovZ
 ZSwRJ3e4pufvumMwOC+j3Pdo40J+zN9LTZEaCTtXpgkwsNOs0dRS2qhYBCdVqx0EJImD
 nxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689010129; x=1691602129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ul2VBha0pA5JbrKTfyVeWSobOhwcf7C0x71pvrwyrgQ=;
 b=HjDiSQcixXXpNiaa3Rn4ks9n0qdnfjhZpEax1kmuYFaB9GEc8k6sLv+OGag26398FH
 kd1hjp12r349X/BUtyGNkrJ0NYaBEnIwlBYH2otOT/WUj8RYzzOct1FqMTqCzmws3mpA
 7Q8YSzfhiWzeC7uul9hR7xUghNyYIzj1iiTlnKQdR/4FCTUeSI7DWpAztqabtmAr+8IF
 +5N8ncDmCmID3DB58qoEqWkPNR4Qnfmy8DeCNZip3r2gJi2UTbW6yotepOLeYPQySLnV
 zRqng8FHEHGdzjCrC8K3XgfSWodUJbD4nV5mk9ufkNIs8Lt9URBuaZZTUWtgikAahuJX
 d8bA==
X-Gm-Message-State: ABy/qLbymf0aYkJ5x3fs13Db1HwSp5zE+3BmX/AuGm6BvAmthzLh4Tb+
 kX1ZWQYCW3ugJqu1eSlx1C0EfIJq2cVZCSFgLiY=
X-Google-Smtp-Source: APBJJlFBwe80s58hgF1p9KknrluN6s31yo6PZL7GCWDUtGNihirysQsJpLLHIFLcfpxDoBlymOQh450Xi90ohXdtI94=
X-Received: by 2002:a4a:4f0a:0:b0:565:97f9:d2fb with SMTP id
 c10-20020a4a4f0a000000b0056597f9d2fbmr10945664oob.3.1689010129387; Mon, 10
 Jul 2023 10:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230710090421.61623-1-xujianghui@cdjrlc.com>
 <77876ef2908eda36cb7f843145ec8cec@208suo.com>
In-Reply-To: <77876ef2908eda36cb7f843145ec8cec@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Jul 2023 13:28:38 -0400
Message-ID: <CADnq5_PzKrkt7_=8VGMbAeXw+HD3Wch1VXaTTbeds3jHO2j+vg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: ERROR: that open brace { should be on the
 previous line
To: sunran001@208suo.com
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 10, 2023 at 5:06=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix eleven occurrences of the checkpatch.pl error:
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/rv770.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/rv770.c
> b/drivers/gpu/drm/radeon/rv770.c
> index a5ce59d4a485..9ce12fa3c356 100644
> --- a/drivers/gpu/drm/radeon/rv770.c
> +++ b/drivers/gpu/drm/radeon/rv770.c
> @@ -136,7 +136,7 @@ int rv770_set_uvd_clocks(struct radeon_device *rdev,
> u32 vclk, u32 dclk)
>       return 0;
>   }
>
> -static const u32 r7xx_golden_registers[] =3D{
> +static const u32 r7xx_golden_registers[] =3D {
>       0x8d00, 0xffffffff, 0x0e0e0074,
>       0x8d04, 0xffffffff, 0x013a2b34,
>       0x9508, 0xffffffff, 0x00000002,
> @@ -151,7 +151,7 @@ static const u32 r7xx_golden_registers[] =3D{
>       0x7300, 0xffffffff, 0x001000f0
>   };
>
> -static const u32 r7xx_golden_dyn_gpr_registers[] =3D{
> +static const u32 r7xx_golden_dyn_gpr_registers[] =3D {
>       0x8db0, 0xffffffff, 0x98989898,
>       0x8db4, 0xffffffff, 0x98989898,
>       0x8db8, 0xffffffff, 0x98989898,
> @@ -163,7 +163,7 @@ static const u32 r7xx_golden_dyn_gpr_registers[] =3D{
>       0x88c4, 0xffffffff, 0x00000082
>   };
>
> -static const u32 rv770_golden_registers[] =3D{
> +static const u32 rv770_golden_registers[] =3D {
>       0x562c, 0xffffffff, 0,
>       0x3f90, 0xffffffff, 0,
>       0x9148, 0xffffffff, 0,
> @@ -172,7 +172,7 @@ static const u32 rv770_golden_registers[] =3D{
>       0x9698, 0x18000000, 0x18000000
>   };
>
> -static const u32 rv770ce_golden_registers[] =3D{
> +static const u32 rv770ce_golden_registers[] =3D {
>       0x562c, 0xffffffff, 0,
>       0x3f90, 0xffffffff, 0x00cc0000,
>       0x9148, 0xffffffff, 0x00cc0000,
> @@ -183,7 +183,7 @@ static const u32 rv770ce_golden_registers[] =3D{
>       0x9698, 0x18000000, 0x18000000
>   };
>
> -static const u32 rv770_mgcg_init[] =3D{
> +static const u32 rv770_mgcg_init[] =3D {
>       0x8bcc, 0xffffffff, 0x130300f9,
>       0x5448, 0xffffffff, 0x100,
>       0x55e4, 0xffffffff, 0x100,
> @@ -340,7 +340,7 @@ static const u32 rv770_mgcg_init[] =3D{
>       0x92a4, 0xffffffff, 0x00080007
>   };
>
> -static const u32 rv710_golden_registers[] =3D{
> +static const u32 rv710_golden_registers[] =3D {
>       0x3f90, 0x00ff0000, 0x00fc0000,
>       0x9148, 0x00ff0000, 0x00fc0000,
>       0x3f94, 0x00ff0000, 0x00fc0000,
> @@ -349,7 +349,7 @@ static const u32 rv710_golden_registers[] =3D{
>       0xa180, 0xffffffff, 0x00003f3f
>   };
>
> -static const u32 rv710_mgcg_init[] =3D{
> +static const u32 rv710_mgcg_init[] =3D {
>       0x8bcc, 0xffffffff, 0x13030040,
>       0x5448, 0xffffffff, 0x100,
>       0x55e4, 0xffffffff, 0x100,
> @@ -407,7 +407,7 @@ static const u32 rv710_mgcg_init[] =3D{
>       0x9150, 0xffffffff, 0x4d940000
>   };
>
> -static const u32 rv730_golden_registers[] =3D{
> +static const u32 rv730_golden_registers[] =3D {
>       0x3f90, 0x00ff0000, 0x00f00000,
>       0x9148, 0x00ff0000, 0x00f00000,
>       0x3f94, 0x00ff0000, 0x00f00000,
> @@ -417,7 +417,7 @@ static const u32 rv730_golden_registers[] =3D{
>       0xa180, 0xffffffff, 0x00003f3f
>   };
>
> -static const u32 rv730_mgcg_init[] =3D{
> +static const u32 rv730_mgcg_init[] =3D {
>       0x8bcc, 0xffffffff, 0x130300f9,
>       0x5448, 0xffffffff, 0x100,
>       0x55e4, 0xffffffff, 0x100,
> @@ -538,7 +538,7 @@ static const u32 rv730_mgcg_init[] =3D{
>       0x92a4, 0xffffffff, 0x00000005
>   };
>
> -static const u32 rv740_golden_registers[] =3D{
> +static const u32 rv740_golden_registers[] =3D {
>       0x88c4, 0xffffffff, 0x00000082,
>       0x28a50, 0xfffffffc, 0x00000004,
>       0x2650, 0x00040000, 0,
> @@ -574,7 +574,7 @@ static const u32 rv740_golden_registers[] =3D{
>       0x9698, 0x18000000, 0x18000000
>   };
>
> -static const u32 rv740_mgcg_init[] =3D{
> +static const u32 rv740_mgcg_init[] =3D {
>       0x8bcc, 0xffffffff, 0x13030100,
>       0x5448, 0xffffffff, 0x100,
>       0x55e4, 0xffffffff, 0x100,
