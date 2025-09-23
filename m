Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC5B9610E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 15:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2D310E084;
	Tue, 23 Sep 2025 13:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HdApr4kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCE910E60F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 13:47:42 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3308f6093beso259626a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758635262; x=1759240062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+po0DuJ8bRdPzzhrYcH1IZFck7dYEJX09rufKPUvgM=;
 b=HdApr4kkjOGtrmYmuzKJ/GPV+qeubVMzrwh9MlyHzsoeCCX6S4aY7tvitcoot26tAD
 swjO9lw/5Os9F8xEty6hOzgwdZLjrhaA12Db1A1qqEbNwZtgbl9CFG91nNdfftT7t0QY
 5vbH51TDo+CN56LM4RD6UWwQPfyincSZOm+1yDHCFtyKGC1iXaBvrSpLxukSmI4GYDFl
 OUszwvpKxf1MxBysh/d7hHlY+lt9pvvARgqRmIjdM1DR9MuRidgWrhFghwdI/86Dt7C2
 1owe4/gVwe5LXsoqa36BRW3Yb+0ZD9syKeeZCi2ENXfQn1Hju1znOOeHnUL0sFxJoO+8
 O5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758635262; x=1759240062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+po0DuJ8bRdPzzhrYcH1IZFck7dYEJX09rufKPUvgM=;
 b=lYOwpdptNzPAUnpjQ66Ch6VkmNj9C5wDQR4y7HHC02Ck+cs2k3tJxA2TnbL2V2aphy
 TqwqPZ18tEAkKbBH9CbO3rggrWRgg01rGobi3rt390OWCeskaPumYiCtwDrPUvTPrzrE
 mmmRjx8W8oNaQ6P74VwTK40f7aEcKqIw6ybqw5YzqfYDHBaIthmIcBvbcVsx9tKXyVSD
 6IO8dWbxd+OqCcf91PGroLFVNXNFtluH1X7tj2CdhqPJJe7+6UZjMvd4zhzn+eyba/6w
 FXqOqyWKKYd4WBDSJdMDbeNMNR54rXLPfSJHLe+r/FBwBgVr8uFLK1rpITcCVDWsgPCX
 9gIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5QJC4uY5x8TDDPVktJZRH9PG4gHAUThhj6aiIG3cmnvNu5hV4oOXkVQxFE1oSF+EfW2jm066iCJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWNdXJwQXPhJ2Sya0SjSmkvhqT3WSS6unNY+aSHtlq/6qa/pmx
 cbQCv/+AmaPy2VtLUesV2GzZgmSCFOJjv7JA/LNjPgQajFwrj5rxbTpHPpv6ENsPr8vMaef0VW8
 Y8L0evv/s+vbwgCyQTcxA+8sEf520dcQ=
X-Gm-Gg: ASbGncuu3TQMNY1y10iG2AfbDPdDBKsSk6/2kyBJzg5AMr50n2jv+Bn19dtGDYLrBST
 7T8u/ywAgM7kMwjh7E/gxch+eWjkC2u1S8XQdXtBdY+XdWHQMNGSXgvnw+fRnK0qLpKY4WXLgVC
 r0cbOsqrtvVbQWirmsv0W3RnpcNfnntY1sKtW/1sjMVZeXNptTzcQSebmML9X+DrlBPAhAo2nor
 oHCCLg=
X-Google-Smtp-Source: AGHT+IE/H1/LM/bDZyCRJ1SbbgyS89k2lbuqITBp5GxChyBOLUjXoVdvHa8Vm07RnfxnHIveQ+ckEYOUfRTxnACyGUg=
X-Received: by 2002:a17:90a:e707:b0:333:abc4:379a with SMTP id
 98e67ed59e1d1-333abc439ebmr456440a91.4.1758635262421; Tue, 23 Sep 2025
 06:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250922185635.50828-1-smokthar925@gmail.com>
In-Reply-To: <20250922185635.50828-1-smokthar925@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Sep 2025 09:47:30 -0400
X-Gm-Features: AS18NWAhbcwLf_A_aG2ayW-fXVW1NiLJzl9s_xqIndnigSUTJI1g12Ie2ZqAKe8
Message-ID: <CADnq5_PnEJYpw2Zu9hPVoKk24YBmZfcSNst=Enqd899eLvpWOg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: use kmalloc_array instead of kmalloc
To: Moktar SELLAMI <smokthar925@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, Hawking.Zhang@amd.com, tao.zhou1@amd.com, lijo.lazar@amd.com, 
 ganglxie@amd.com, victor.skvortsov@amd.com, candice.li@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
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

On Mon, Sep 22, 2025 at 4:14=E2=80=AFPM Moktar SELLAMI <smokthar925@gmail.c=
om> wrote:
>
> Replace kmalloc -> kmalloc_array in drm/amd/amdgpu/amdgpu_ras.c .
>
> As per said in the Documentation/process/deprecated.rst, dynamic size
> calculation should not be performed in memory allocator function
> arguments due to the risk of overflow.
>
> Signed-off-by: Moktar SELLAMI <smokthar925@gmail.com>

Thanks for the patch.  Some already supplied a similar patch which was appl=
ied.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
> index 540817e296da..8dbb9e349a8e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -2566,7 +2566,7 @@ static int amdgpu_ras_badpages_read(struct amdgpu_d=
evice *adev,
>                 goto out;
>         }
>
> -       *bps =3D kmalloc(sizeof(struct ras_badpage) * data->count, GFP_KE=
RNEL);
> +       *bps =3D kmalloc_array(data->count, sizeof(struct ras_badpage), G=
FP_KERNEL);
>         if (!*bps) {
>                 ret =3D -ENOMEM;
>                 goto out;
> --
> 2.34.1
>
