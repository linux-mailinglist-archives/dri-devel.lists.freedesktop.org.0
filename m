Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D17518C20
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 20:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2BC10E1FA;
	Tue,  3 May 2022 18:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5394610E1FA;
 Tue,  3 May 2022 18:19:22 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k23so35028856ejd.3;
 Tue, 03 May 2022 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XSx6NpBH8cInAqFE8X5356I+UKRxZpBCvdc1b/xk2hY=;
 b=qr9JrgkQaC9A5O5K8QzYUMJFMRAxCNIJ52eDMQ/k6a0GgLts8W43JIxCkOstTZA9p/
 JXlgRx5tJv0f8A5eKJ9lvmtJRFhJuBFMvuqO/tWW2cJMR4aZ1hhhUk3t6Hg0l5aqNEC4
 LvTHGCe119PA672ox/mQlNx398utrvC23jBCsa4xvZmWqcFqOEV+HfUOo4W+6BCTgPsi
 Ub5R63VuFduY78oh+m60gjHNMTFMiDgJUapoZlxuqqXkeA8R+652D3VCB0Zo6W5tzChu
 It+QZSuGei4zat9uvmpn3MVRNnLyPolNSdTbgnbq5skFn3uzliyYaN1Y7WWa5geiQ0l2
 nUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XSx6NpBH8cInAqFE8X5356I+UKRxZpBCvdc1b/xk2hY=;
 b=He2beh7jCLQ2ha1jD2KcXP8tUi2JSbWWX7maO9ObW1ehI2omW2HHgeNN4dASmvii96
 miLy9ayBlK7U5i6vI1U0hD9rY/ZwHzQl90Bf49KAdsPeaMDIKNBkJixiAVHIqH+Js5n2
 pBEo8JkuHY5V72T2pb8QUQ7h0VYRLmjLJQ6xENqoP7LDKW6oRKjfI/rmAhjonPaVj3sv
 XY0PiSDHTslJ8ckynbvaXHF/CeLMLN0jMi0v7UZG4TWk56IoEtfPeyR7GXOiVFe05Sr3
 9qxvViss+t8dFh7/dKjeAhXXfiQTolJWI66V2KLwPV3wXuBrQ6tTisUNiwtDEXdJDcO0
 pwkA==
X-Gm-Message-State: AOAM532LR58iP6XP7zbD2tRbb1rEV07lDaBkpbJj/GUKZJkgPWM0Nokl
 SvOHndMF5e6hauMQ2ECAYrq0I+8x26wO1ty3ivo=
X-Google-Smtp-Source: ABdhPJzr/0lmmw8Ey6l+z3+j5yG8sFsp2sM/2Ae5DB2LVlrpqWgmS9e3Y4vyyXIFnwg0iZw1gkl8yObHqZMqUbcyaag=
X-Received: by 2002:a17:906:478b:b0:6db:8b6e:d5de with SMTP id
 cw11-20020a170906478b00b006db8b6ed5demr17253446ejc.161.1651601960726; Tue, 03
 May 2022 11:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220503063613.46925-1-christian.koenig@amd.com>
 <CADnq5_PX91474D=DRxB0VQ3uHY1sGCS_40w9AjCvXSCHgm9Ozg@mail.gmail.com>
In-Reply-To: <CADnq5_PX91474D=DRxB0VQ3uHY1sGCS_40w9AjCvXSCHgm9Ozg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 May 2022 04:19:09 +1000
Message-ID: <CAPM=9txqSfaXKSdgdJJbhc41jhRKQVq7taLdZBdXgxuBa6XSdA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix drm-next merge fallout
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 May 2022 at 23:03, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, May 3, 2022 at 2:36 AM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > That hunk somehow got missing while solving the conflict between the TT=
M
> > and AMDGPU changes for drm-next.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>

I'll pick this directly into drm-next.

Dave.

> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_vm_pt.c
> > index 7761a3ea172e..88de9f0d4728 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> > @@ -631,9 +631,13 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_=
base *entry)
> >         if (!entry->bo)
> >                 return;
> >         shadow =3D amdgpu_bo_shadowed(entry->bo);
> > +       if (shadow) {
> > +               ttm_bo_set_bulk_move(&shadow->tbo, NULL);
> > +               amdgpu_bo_unref(&shadow);
> > +       }
> > +       ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
> >         entry->bo->vm_bo =3D NULL;
> >         list_del(&entry->vm_status);
> > -       amdgpu_bo_unref(&shadow);
> >         amdgpu_bo_unref(&entry->bo);
> >  }
> >
> > --
> > 2.25.1
> >
