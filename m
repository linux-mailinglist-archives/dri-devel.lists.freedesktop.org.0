Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB4A58F4E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A34610E3BE;
	Mon, 10 Mar 2025 09:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g0B6XOks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399A310E3BE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:20:23 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5fe944b3fa0so1855502eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741598422; x=1742203222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8hUQaBWntrhNATBo5/FEWJXi4nQQHSzEudgTZIuU8Y=;
 b=g0B6XOksPy6iFTuezVRMC8hOvLbqpkwNh5XTbVPFjdt4k2HhSOK4dtM2rR3vHnUy7t
 mnuGCi3Yjb1v25wSKYW2lka41nzUAbtePpIBguDkX8aY33yiJx1UIBkuK/STUmmfpwgL
 RTAWZLClSG3Tl3aLwkKm4jgG2lW7amTuomzGLE8VlJ85mhblFIkGcD6665C2vphkpo8s
 rymtP3KjlkR6ksCBNostp1trkhuk0zDGMBFd02eb60FVEjnvxkpEtpupfAzqAXfV4CSu
 XRZWL1ujVMNNLFxiu2tiVP1zMaPmhjKRdzqWg1nmboL92nI+ntghCiNLBmGrOAdoo4nF
 91eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741598422; x=1742203222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8hUQaBWntrhNATBo5/FEWJXi4nQQHSzEudgTZIuU8Y=;
 b=WPXZ0wCHQ0c7pT+eHQpIhnTT1SjxNKyQ7hdFr9+ftlUmsq3KvL0+TqTCjtpEyRk6ng
 yv9OUD+rKgZjMIYLbVCoDwG5sODbLk54IiA/Dpr2czCGnYmL88gg53HUG424G4L/jtSz
 /KMy8rZhq/KK+Uoh2XdPMGLFvtzb7F7alXwWMVhycrE7G543p++wg2Ub2YuJN7hXvwif
 gc2LyQRbc/ABFg8sY7Wa8biOVjAjysY+8rqKdoif4hCr+tBYhnQbP6q1HE8elcVUP6Ev
 EcDgiUH7dnCGD1zLPlwya/z/vPAbPJ1hHbX7BnT+RWWQNqA/5FCk9Y9Acs+Jt+UhTfVt
 7TiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUttHGD++TC4H/+QmndQ8rA88PLM3SYnZQz/mw9Suspt5yBP4+2mU6sKZ8U2OJx58F6xDB15nZwynE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8aORxBqTRsnDo3frsq964jmuE1pajX/CyAkop39XxA72auaUX
 iOt94IilcHZlgui7pmbUDAg3BUoW4gwKuDm2Cip6+qfaciohmpEEJ30xuPoC9FrwTzhpxduLZMC
 cbM+C1gn2p3jZydgoBbvshU0KVe4=
X-Gm-Gg: ASbGncu0iC5eU0r9dkeEZzXzmOUw4fZGgVZ5d4krCE+lmlcvSqyewArctf9GScN3xth
 1S99WBRdgEia17zio/gqgPNJ7ivm/D2EX0HpemWt+1PztkVMRmUhkivW9yCeghz6FtMPpdf/7qt
 VFbyf/Xb51iFRn2c+iA2uLwkoq
X-Google-Smtp-Source: AGHT+IHlKpNfQ17CORnW4feh4HgPSN5pa0orUf1ds4fgLmew9uDRmnDx96KaSR7W3sZokTY2X/z3FM4DkSrPCJkR7WI=
X-Received: by 2002:a05:6820:992:b0:5fd:50d:49e4 with SMTP id
 006d021491bc7-6004abd3116mr6176682eaf.7.1741598422280; Mon, 10 Mar 2025
 02:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250308234428.255164-1-linux@treblig.org>
In-Reply-To: <20250308234428.255164-1-linux@treblig.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 10 Mar 2025 10:20:11 +0100
X-Gm-Features: AQ5f1JryzndsgFb-pSg_WhcxWTfnaRxcwrsJfnmRRQa8SA2TF1cLJDFDoCtLJEM
Message-ID: <CAMeQTsYGbFZbx7oG5x2R0mLsyFFbEwOGowDrKghjZCopaZsyrw@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove unused psb_mmu_virtual_to_pfn
To: linux@treblig.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sun, Mar 9, 2025 at 12:44=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> psb_mmu_virtual_to_pfn() was added in 2011 by
> commit 8c8f1c958ab5 ("gma500: introduce the GTT and MMU handling logic")
> but hasn't been used.
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied to drm-misc-next
Thanks

> ---
>  drivers/gpu/drm/gma500/mmu.c | 41 ------------------------------------
>  drivers/gpu/drm/gma500/mmu.h |  2 --
>  2 files changed, 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
> index 4d78b33eaa82..e6753282e70e 100644
> --- a/drivers/gpu/drm/gma500/mmu.c
> +++ b/drivers/gpu/drm/gma500/mmu.c
> @@ -730,44 +730,3 @@ int psb_mmu_insert_pages(struct psb_mmu_pd *pd, stru=
ct page **pages,
>
>         return ret;
>  }
> -
> -int psb_mmu_virtual_to_pfn(struct psb_mmu_pd *pd, uint32_t virtual,
> -                          unsigned long *pfn)
> -{
> -       int ret;
> -       struct psb_mmu_pt *pt;
> -       uint32_t tmp;
> -       spinlock_t *lock =3D &pd->driver->lock;
> -
> -       down_read(&pd->driver->sem);
> -       pt =3D psb_mmu_pt_map_lock(pd, virtual);
> -       if (!pt) {
> -               uint32_t *v;
> -
> -               spin_lock(lock);
> -               v =3D kmap_atomic(pd->p);
> -               tmp =3D v[psb_mmu_pd_index(virtual)];
> -               kunmap_atomic(v);
> -               spin_unlock(lock);
> -
> -               if (tmp !=3D pd->invalid_pde || !(tmp & PSB_PTE_VALID) ||
> -                   !(pd->invalid_pte & PSB_PTE_VALID)) {
> -                       ret =3D -EINVAL;
> -                       goto out;
> -               }
> -               ret =3D 0;
> -               *pfn =3D pd->invalid_pte >> PAGE_SHIFT;
> -               goto out;
> -       }
> -       tmp =3D pt->v[psb_mmu_pt_index(virtual)];
> -       if (!(tmp & PSB_PTE_VALID)) {
> -               ret =3D -EINVAL;
> -       } else {
> -               ret =3D 0;
> -               *pfn =3D tmp >> PAGE_SHIFT;
> -       }
> -       psb_mmu_pt_unmap_unlock(pt);
> -out:
> -       up_read(&pd->driver->sem);
> -       return ret;
> -}
> diff --git a/drivers/gpu/drm/gma500/mmu.h b/drivers/gpu/drm/gma500/mmu.h
> index d4b5720ef08e..e6d39703718c 100644
> --- a/drivers/gpu/drm/gma500/mmu.h
> +++ b/drivers/gpu/drm/gma500/mmu.h
> @@ -71,8 +71,6 @@ extern int psb_mmu_insert_pfn_sequence(struct psb_mmu_p=
d *pd,
>                                        uint32_t start_pfn,
>                                        unsigned long address,
>                                        uint32_t num_pages, int type);
> -extern int psb_mmu_virtual_to_pfn(struct psb_mmu_pd *pd, uint32_t virtua=
l,
> -                                 unsigned long *pfn);
>  extern void psb_mmu_set_pd_context(struct psb_mmu_pd *pd, int hw_context=
);
>  extern int psb_mmu_insert_pages(struct psb_mmu_pd *pd, struct page **pag=
es,
>                                 unsigned long address, uint32_t num_pages=
,
> --
> 2.48.1
>
