Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3E0CF8E29
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 15:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50A110E50D;
	Tue,  6 Jan 2026 14:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mRO6RtTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECF110E10E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 14:52:56 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-121a15dacd1so25352c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 06:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767711175; x=1768315975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nU2jY68+v3uM5onmzMUso4lL4Grtw+z6Y73ewZcXAjY=;
 b=mRO6RtTvkANXHuG2TJe9N7sktvgZtbweXGNRK04B8CaJTbr1PIWP0TPfAZYFN5GnWD
 q8fMFwym/MZY86GvZmc/T/xnpsEsgbnPOk0r/K/6BKpI60z/dopviK7+t6R3hi+8GqLy
 0AooRf9RLuPWejTEomFcTfvFxmxHlqHbsyPaxab+zBmqrce2MnmOQS5mi3ydAYx0s4HN
 VfC3ALlcj6SbgzdREesbOsm68wSzjz0SwpRQ+bY2VH1tS+1YqY6vL0Hgju/1bm+HhXic
 62RK7QFp0HskDISToQ574H1WaRg36X64teF91zKqvZEUD/aRUKT7kLiC+PrNuSJm3x2M
 4epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767711176; x=1768315976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nU2jY68+v3uM5onmzMUso4lL4Grtw+z6Y73ewZcXAjY=;
 b=DwJh/Xz2up+QIJRwIHQ4/mILPWjiygg42Xaln+Fa3wsR0IFOG5Kined/gGN7FPLDg2
 IVV6e1Rs5lZLtZFKRVbgqynE2jAjzuvVOCWgowB49t1MION/Fvv91cOB/tQLBcs3kdeW
 XweRJD8MP1TuIhrUJIDIwDi+CZXpXqOcQXyT6RlLcXgCMJlMXkoH6RBarwoCjSQzkNQQ
 Lh78eff5O/OLUl6ztoZgR53/povQh3SbG5ghWXdOIfllxVOD6dEFzRi4d9LfcrpKxGN9
 pNFB1KpyeMLqBFm50iD4Tdpi3dgDT8HNXFOUjdAFDks+XLGwzH6S4B7h1OryXBDiPPRw
 3AWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2KOd4fXd2bTHoiYKbAWZ5baw6yoUvc6zYJCYMZPfeWHdtCgR4n+6kn1p9B3LYS6HwvazOGgi/XQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+bxiZcKV0pG8/nRSHvG+sMvL0qo923UReEho48ZY98FjmA9FH
 Uh93qHzqom0gqAJfgpLzMDPipT2QyMOVhbxl6FrMj6n0gA82CdjAWR32trQEnnU+gKrPrA4Aug7
 8K5/IFalJW/o/j+qq0cYy5Y/OXZb8ooI=
X-Gm-Gg: AY/fxX40Bwan6G8gLZJtT8A3fFa1Et50qOrlRhtwtEsCDarnGM4IYYMKUBSwRTJVwId
 hhdVrYdJF9nFLoe2XfMXpvoJjbhZ6hiLEMasXQsQ6tbKOs+3G6kvae5CglqIvFiL4RUFeJpNoDY
 S6Xh5R5CXAmH2kSm2QYpiJGGaU+JRmVO7p7RKhYNw2P+kZDry4TRd9Eo43W3cLZkbF+QrpppQEx
 w0qUQ6No3AwlNdTTmPq+l8F5dtpPzQaTO8BRBleTGmjjdKvZhXZja2ysQ/RA8NZ7h2sZmQh0AWi
 729yy0g=
X-Google-Smtp-Source: AGHT+IGbexNqbpHfKfJA6IJneXNFlcW/Iwy+nKKHp8Rqze9NIPnkdBJAsrBQL5TxQQJea9Ml7i5WE1j+Ybe2rAEiIj0=
X-Received: by 2002:a05:7022:4a4:b0:119:e56b:46ba with SMTP id
 a92af1059eb24-121f18e5ad8mr1533764c88.4.1767711175450; Tue, 06 Jan 2026
 06:52:55 -0800 (PST)
MIME-Version: 1.0
References: <20260102141629.617921-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20260102141629.617921-1-ben.dooks@codethink.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Jan 2026 09:52:43 -0500
X-Gm-Features: AQt7F2oNtp0sRjFqbYLl8nt4XXpZ18Y12YF3gVJn4WQ0RJxeCTvYgZDAcNZYqXg
Message-ID: <CADnq5_PZxhjk8xsqzoF_nmrOyYgUjLVNMUDRUEODym7sQ7MEuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix signed v unsigned print formats
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com, 
 christian.koenig@amd.com, alexander.deucher@amd.com
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

Alex

On Fri, Jan 2, 2026 at 7:36=E2=80=AFPM Ben Dooks <ben.dooks@codethink.co.uk=
> wrote:
>
> Fix several places where %ld or %d has been used in place of
> %lu or %u.
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/gpu/drm/radeon/radeon_gem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon=
/radeon_gem.c
> index f86773f3db20..891ef929cfa8 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -110,7 +110,7 @@ int radeon_gem_object_create(struct radeon_device *rd=
ev, unsigned long size,
>          */
>         max_size =3D rdev->mc.gtt_size - rdev->gart_pin_size;
>         if (size > max_size) {
> -               DRM_DEBUG("Allocation size %ldMb bigger than %ldMb limit\=
n",
> +               DRM_DEBUG("Allocation size %luMb bigger than %luMb limit\=
n",
>                           size >> 20, max_size >> 20);
>                 return -ENOMEM;
>         }
> @@ -560,7 +560,7 @@ int radeon_gem_set_tiling_ioctl(struct drm_device *de=
v, void *data,
>         struct radeon_bo *robj;
>         int r =3D 0;
>
> -       DRM_DEBUG("%d \n", args->handle);
> +       DRM_DEBUG("%u \n", args->handle);
>         gobj =3D drm_gem_object_lookup(filp, args->handle);
>         if (gobj =3D=3D NULL)
>                 return -ENOENT;
> @@ -886,7 +886,7 @@ static int radeon_debugfs_gem_info_show(struct seq_fi=
le *m, void *unused)
>                         placement =3D " CPU";
>                         break;
>                 }
> -               seq_printf(m, "bo[0x%08x] %8ldkB %8ldMB %s pid %8ld\n",
> +               seq_printf(m, "bo[0x%08x] %8lukB %8luMB %s pid %8lu\n",
>                            i, radeon_bo_size(rbo) >> 10, radeon_bo_size(r=
bo) >> 20,
>                            placement, (unsigned long)rbo->pid);
>                 i++;
> --
> 2.37.2.352.g3c44437643
>
