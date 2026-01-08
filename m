Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC86D055EC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 19:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EEA10E387;
	Thu,  8 Jan 2026 18:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DPqSFWpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748AF10E387
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 18:08:24 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-11dd21d402cso139878c88.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 10:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767895704; x=1768500504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DXUS0sW8xDHB4c+xLKoLwXG7WUF7jqTtXhEgI5LQ8k4=;
 b=DPqSFWpZEspCoM8jVvoJFfZ4JTbF5Zm0xerIDf6DjXZGcM/mIDMQsOhPRmScRtHC39
 cVriBw6k2woP8te1CNHniOy4YdBgUNPL4BMVXN+7FrX82WTaqBtaXKF3n1LBFvrDuYYG
 5lbcPZzhHLiBNypHxda9dUG1vEi2eEEsySy+tLDwt/PVJoQE7iQkj01pVI/UcmANlyJt
 kWEKSB8TEEBT9Dtd2EX2rwteoF/dJtiKvcv4kovMw9h2qHzkUeq9AptTLwAD8wNhQHGI
 58FGH6PaD59+M8ACDDoasYfDj8gGWu/v6chUkhVmK7C2zdmAkan010OoctGRcQt9csHm
 FZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767895704; x=1768500504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DXUS0sW8xDHB4c+xLKoLwXG7WUF7jqTtXhEgI5LQ8k4=;
 b=Lb5aLTyX+x1DCjtnwSFgsRukTQfFi1CwzJeOcTnp9bWZ18PXkxs5IdFnNSfg5oLV5n
 6v6HEBH3/DgWFU86b7gpIifwc3qKh4lTNPh8ce9iKa8hlkf25su2s1W/n55mhrdXzvyX
 NKqR0/DrJZYb0KEdeabXEArSOmCGruGOBlmbE09ed3CR2GmfIa1rtImxnbBCtSuy8GDj
 Jocw9LKFMw18r89I6ppV5/FLI2dYhb9cT5g7eO/3DBNUNweubcwCPQo3ROAbcp3M3l9H
 bCxgDmAHHq007C2Qep47RD0GtKPuV3GbsjTh3mrQ20Wi8neqZzK5B2vNZkkLZluJJ5dW
 xO3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Vx2TywipJTLYfwVbYoWpCuQ5eckJie1SKgcOcAFSSMVS5my2qcK8u1ohj6E2oOxRc88GYr1XXDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf8h4gOZZnf5NQM+rXM7EklPA2Z3tuEjZuIi+vV+Sjut6juIdo
 qRD3gdJL3gGnfXyHTl9FnVsJDk2frvTxJ9J8nAa4Mg1Nf0VnD3rn1i8CNC/utHy/YY9eRTKzd96
 uHynoy9HbyNJnR2/fVP+kEqt7G0oXImc=
X-Gm-Gg: AY/fxX5S2u2rvi+7KIwpY0fRQJOfPU7klMYOpy5U4w0oYfGm8PICCe/6FROcu+zkQbZ
 E4xwhfzVoUW2FUHut0eqS7vI6vVf5uMZ7hNpe6mbOX/yHZWVc7jYpgCuvmsE1Mhpti6q/eEQgi4
 valKaW1UR8G/tQzMK9vEKznOL2URQjTkpu41DsoDUKg+pou2UTpS0eqZk3SZoVQsZt7pvdT9Qvo
 0/62ve6HC/KtcoEIrNFtljn7GgvV46heNoFxYnbSowrepXe/pmyLfuspkNjA5R0JTRLlj1a
X-Google-Smtp-Source: AGHT+IEMxYW5olsKhaFfSHEchb/xPWvGCY1hA4pzxMkgokTlS6YbyEil5FB2/wbNWl91n/7QB6Jp9tN/G6GmQ66/ivs=
X-Received: by 2002:a05:7022:6723:b0:11a:2020:ac85 with SMTP id
 a92af1059eb24-121f8b7d702mr3293866c88.4.1767895703446; Thu, 08 Jan 2026
 10:08:23 -0800 (PST)
MIME-Version: 1.0
References: <66adb62e93993ac0a70fdbe174908c36a560b98d.1766330018.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <66adb62e93993ac0a70fdbe174908c36a560b98d.1766330018.git.christophe.jaillet@wanadoo.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Jan 2026 13:08:12 -0500
X-Gm-Features: AQt7F2qpeJJDtMGtlgzzhVlKAJGrFRpZjPdprLstNhcJ3aZVDrytkh8Vd6C19_4
Message-ID: <CADnq5_N3JiRShWTa7N+C+b_-cBxOiyAo_XiDSn0W-J3LaUfqgA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Slightly simplify base_addr_show()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
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

On Sun, Dec 21, 2025 at 10:31=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> sysfs_emit_at() never returns a negative error code. It returns 0 or the
> number of characters written in the buffer.
>
> Remove the useless tests. This simplifies the logic and saves a few lines
> of code.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index 20d05a3e4516..b44f0710b00e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -888,22 +888,19 @@ static ssize_t num_base_addresses_show(struct ip_hw=
_instance *ip_hw_instance, ch
>
>  static ssize_t base_addr_show(struct ip_hw_instance *ip_hw_instance, cha=
r *buf)
>  {
> -       ssize_t res, at;
> +       ssize_t at;
>         int ii;
>
> -       for (res =3D at =3D ii =3D 0; ii < ip_hw_instance->num_base_addre=
sses; ii++) {
> +       for (at =3D ii =3D 0; ii < ip_hw_instance->num_base_addresses; ii=
++) {
>                 /* Here we satisfy the condition that, at + size <=3D PAG=
E_SIZE.
>                  */
>                 if (at + 12 > PAGE_SIZE)
>                         break;
> -               res =3D sysfs_emit_at(buf, at, "0x%08X\n",
> +               at +=3D sysfs_emit_at(buf, at, "0x%08X\n",
>                                     ip_hw_instance->base_addr[ii]);
> -               if (res <=3D 0)
> -                       break;
> -               at +=3D res;
>         }
>
> -       return res < 0 ? res : at;
> +       return at;
>  }
>
>  static struct ip_hw_instance_attr ip_hw_attr[] =3D {
> --
> 2.52.0
>
