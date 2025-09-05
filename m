Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB8B459CB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7487810EBAD;
	Fri,  5 Sep 2025 13:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bn8Pcc1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561B310EBAD;
 Fri,  5 Sep 2025 13:56:37 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-24c95f20117so4672065ad.3; 
 Fri, 05 Sep 2025 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757080597; x=1757685397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGnaeu/cP/UXodcMji+4vLk+3A0VAW3i5eSwd8SsyXQ=;
 b=bn8Pcc1nMvlpraJbf0DtURU7wvjdV7FXHc2qn3ssIrpEfmnVlnSljpnIYyiC0rguQu
 pk6HeZfjSsrDwXazn9BrYrJmCDRWlCJCmR2OIunKhNaoE1VeHjcwWYkQygwLRQpZz5Pr
 j+giBZUyVk4NgK94wuHQ4l4OdoHNFV3SB++uxBNM6qwppdkAVuyLNIw7OvqYMDs8OxfH
 sUc/9Lztc/v5j/aIsQeHvmLOuy5SiZ7YBudUSfeJolqy2qBMFKNVvNb1khi3o2A0t7th
 QbrOkglcOi4CUAot2cAAwVxf0eMfeUSSjiD6kvtyTCskr/iESoHMXZEyZdzE1abhKPNu
 AzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757080597; x=1757685397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGnaeu/cP/UXodcMji+4vLk+3A0VAW3i5eSwd8SsyXQ=;
 b=QEXBN9UJe454lFfsHQUESXwrk1ZBdYekagXzqo7QqqaFhz1C/n+IwPei2M5d7iLKYp
 JvhsG6N7vQ7AhblEcYHK5HREcNCaPD6uPNu46TDNGsY22grRl+HVd1XtK8P+aFiVzF1a
 kTezgAeo9687jITKl5xg1UloKh3BPVTO7uCE3GMivJ29SR5ZZwo1+0/Q2EZTmbNhLgjI
 CaRWlWXsVABjoxlFPrP0bK+G8rYfB4FCm78crsTRddgb5s6hd+LzocXIesE1biejJx+H
 S3cLY7aOQGCHricMt3fVdof32O7cRjomSLywcQthbon81fwuy+mVQtyGt2Ikxd3P/Chf
 wMQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1yEglMceZ3x+/MkCc70o73pFe8AKXJZRg3L4NBUa1fmUHWUxcdacr0Z5hehT7BfQZpX8Y2GW82H45@lists.freedesktop.org,
 AJvYcCW5YlAMIx0TPlGFVR9H5b4M6LCmjsHM1oPSr4DH+OsANnxRrQjygzB3Zg2t/yg14/gKLXerwsQo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgzUHhd/XTKt+XO26QBGkcRQWN3jaTs+3Ak2Pl3KFnQcBd5jDa
 4mFrok88q/FAbd3KyJs5sWtqIVWevJRCIBY4pL/xCKuN1hsLHbXlyb9o8zCXuPMRRDU0emi2Y/s
 TYakJlfakgiXW0MTFLDbZUZaSypeHfh8=
X-Gm-Gg: ASbGncunoUDE0Ps3vEkCgnqJ172XryW9psQw4DTCGVhfU/dmcmkv31S5NMaCoVdSCnY
 rgGT5OpP8sWOyeue+rlHuG/FubYqotlAwLMP+S2qDYkD13nodn1LzpvLsgf+RR4BeRHy5PQPnkt
 bmE7e9fQoW8A0nxv7Ymsd/pzjQnJgJy9XQhDVZwwJG2vXXrfP80Nr8aPrpWYCDGvxK/K3098foZ
 y3fRIY=
X-Google-Smtp-Source: AGHT+IFcUgtHn38A9MmTtlHXLaDHz29J5EnIOqSxCPcUl8S3cozWt1ExCnTMJDYkH56Uy3MwKleQ4qFrkKRqe5R1LCs=
X-Received: by 2002:a17:903:22c1:b0:24d:f198:7d7a with SMTP id
 d9443c01a7336-24df19880a2mr14157585ad.11.1757080596677; Fri, 05 Sep 2025
 06:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250902165332.2388864-1-alexander.deucher@amd.com>
 <20250905101422.GAaLq3_kDePySD36Ma@fat_crate.local>
In-Reply-To: <20250905101422.GAaLq3_kDePySD36Ma@fat_crate.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Sep 2025 09:56:25 -0400
X-Gm-Features: Ac12FXzQL9W887aCNpyvGtm5a9px92QvBxCT98Spkr9bCd8Wg7WsUXk1LHhlldk
Message-ID: <CADnq5_OZ585tA6nf95jU2RD0odLi8jt+qzLbnDCh9289Cy_hAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: use dev_warn_once() in CS parsers
To: Borislav Petkov <bp@alien8.de>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
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

On Fri, Sep 5, 2025 at 6:54=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Tue, Sep 02, 2025 at 12:53:32PM -0400, Alex Deucher wrote:
> > Older GPUs did not support memory protection, so the kernel
> > driver would validate the command submissions (CS) from userspace
> > to avoid the GPU accessing any memory it shouldn't.
> >
> > Change any error messages in that validatio to dev_warn_once() to
> > avoid spamming the kernel log in the event of a bad CS.  If users
> > see any of these messages they should report them to the user space
> > component, which in most cases is mesa
> > (https://gitlab.freedesktop.org/mesa/mesa/-/issues).
> >
> > Cc: Borislav Petkov (AMD) <bp@alien8.de>
> > Link: https://lore.kernel.org/r/20250829171655.GBaLHgh3VOvuM1UfJg@fat_c=
rate.local
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/radeon/evergreen_cs.c | 520 +++++++++++++-------------
> >  drivers/gpu/drm/radeon/r100.c         | 215 +++++------
> >  drivers/gpu/drm/radeon/r200.c         |  34 +-
> >  drivers/gpu/drm/radeon/r300.c         |  66 ++--
> >  drivers/gpu/drm/radeon/r600_cs.c      | 445 +++++++++++-----------
> >  drivers/gpu/drm/radeon/radeon_cs.c    |   2 +-
> >  6 files changed, 648 insertions(+), 634 deletions(-)
>
> Btw, now that I had to reboot the workstation, I thought I'll apply yours=
 to
> test it. You've missed one spot, see below. :-)
>

Whoops.  thanks.  I've squashed this into the original patch.

> With that additional debug added, I see now:
>
> [   25.877593] radeon 0000:1d:00.0: vbo resource seems too big (524289) f=
or the bo (524288)
>
> which looks like some buffer limits mis-counting. The bo is obviously of =
1^19
> buffer size while one of those "size" and "offset" things are off by one.
>
> If anyone wants to debug, the program which causes this is conky version:
> 1.11.6-2 in debian. It starts spewing the warnings when I start it and si=
nce
> it.

The size and offset come from userspace, so it's likely a mesa issue.
I've reported it here:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/13838

Alex

>
> Thx.
>
> ---
> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/rade=
on/evergreen_cs.c
> index d49e59626e39..1162cb5d75ed 100644
> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
> @@ -2418,7 +2418,8 @@ static int evergreen_packet3_check(struct radeon_cs=
_parser *p,
>                                 size =3D radeon_get_ib_value(p, idx+1+(i*=
8)+1);
>                                 if (p->rdev && (size + offset) > radeon_b=
o_size(reloc->robj)) {
>                                         /* force size to size of the buff=
er */
> -                                       dev_warn_ratelimited(p->dev, "vbo=
 resource seems too big for the bo\n");
> +                                       dev_warn_once(p->dev, "vbo resour=
ce seems too big (%d) for the bo (%ld)\n",
> +                                                     size + offset, rade=
on_bo_size(reloc->robj));
>                                         ib[idx+1+(i*8)+1] =3D radeon_bo_s=
ize(reloc->robj) - offset;
>                                 }
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
