Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67715772CBD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CDE10E351;
	Mon,  7 Aug 2023 17:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4961510E34E;
 Mon,  7 Aug 2023 17:23:08 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1bff2d2c141so603842fac.1; 
 Mon, 07 Aug 2023 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428987; x=1692033787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHe5wFpuck9FxbQdSwbkpcG9X/3F59XkMZTvwR3jHW0=;
 b=I35OvquxuMieROZKO1UAIz0eH/wAeTrZ3CxA4JRMN5XbO7l53ynGb9/JtssTBXZzgn
 f29cMN7MaxRjgIn6qBbioCXVTOn/ShqRulmra84eVLmomuvK0neQsnkl47G5L8AClxIs
 2avL8zHT22UO48nkML1ckjGEwcnnr6uhDhi9YcNgTisHgGVWhTO06zjPTSLfbRZcLZ6r
 siujggA/TAUy8n1DYLoSoR1Ybc5ugx4Izuu6SYIoHFRkFLEaFMLFjfh8Nu5w5xctP3K1
 AT24QRmhw6qajS+7kbjLerMtI7K2dyBjMaz2iu4jXef/oAsZkli0Bh115phTRsDpHUuk
 MHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428987; x=1692033787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHe5wFpuck9FxbQdSwbkpcG9X/3F59XkMZTvwR3jHW0=;
 b=EsHkKj+0Ct/UyZ1rLQyr283ZCaB/SUFuEIfvPNqBikWNnhqBVtTkRxsEZm3xyWoQDM
 EzpGYy6U+ZbohKlzPqiuokbxIgQodyAr20gnjdD2U2ai8ZmzFckW1tt+HIYCRFJ2s1NP
 NVM1A3kskrfq9yqam3HQ+aH9TG4l6BSAvi3IhdOrS741pmNHimKViW6QmfPFsjzPgulf
 A+c1hq2e1nQ/tjmVH7L1cmkeQpmYxr60pcmmcEvlB5QSw2g/ziTMtPYuwvRT1UHIwA3h
 4Qi8NKwMQD/7lB5eK6Awv/Mgm92jfVCx3DKGVaYq2C8d4wbXyCPFM92KsTnV6MI+pP3f
 +9FA==
X-Gm-Message-State: AOJu0YxUbEfmF9umX/s+pLIisqKvqqVM2An4NusafsOnX81X+KFYOeIK
 HdTMsBQR4L7Jbe6J1IcXQ5ehE+b2rrYeiXg0ucQ=
X-Google-Smtp-Source: AGHT+IEqpYfiuoRzZYazqnVHJZFegWBzehLFDJ25obToxUn4mP6Lf0P1qd3skeEa9rUa1TjeH5uUc29E25kfbyZ34qs=
X-Received: by 2002:a05:6870:65ab:b0:1bf:597b:2343 with SMTP id
 fp43-20020a05687065ab00b001bf597b2343mr9676547oab.30.1691428987442; Mon, 07
 Aug 2023 10:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230802065958.12449-1-sunran001@208suo.com>
In-Reply-To: <20230802065958.12449-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:22:56 -0400
Message-ID: <CADnq5_MiXEV7xLWbjsQOiuLn_Xn5z11jDP_xFS+4s+deWnt5rw@mail.gmail.com>
Subject: Re: [PATCH] drm/jpeg: Clean up errors in jpeg_v2_0.c
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

On Wed, Aug 2, 2023 at 3:00=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd=
/amdgpu/jpeg_v2_0.c
> index c25d4a07350b..1c8116d75f63 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
> @@ -807,8 +807,7 @@ static void jpeg_v2_0_set_irq_funcs(struct amdgpu_dev=
ice *adev)
>         adev->jpeg.inst->irq.funcs =3D &jpeg_v2_0_irq_funcs;
>  }
>
> -const struct amdgpu_ip_block_version jpeg_v2_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version jpeg_v2_0_ip_block =3D {
>                 .type =3D AMD_IP_BLOCK_TYPE_JPEG,
>                 .major =3D 2,
>                 .minor =3D 0,
> --
> 2.17.1
>
