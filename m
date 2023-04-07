Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6816DB250
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 20:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC1D10E2EF;
	Fri,  7 Apr 2023 18:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755F10E2EF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 18:01:32 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5131c8656a6so149082a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680890491; x=1683482491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q77ZcgCYnodZClKQX1HhPOSoqs2rfxGtOfBwRswul/4=;
 b=b8gKd+6rbeWwg8r+DFOMum1BwImUQSQAJBPrje68ohZORJXaU6x2Xjwzkhvjx0zkBd
 5h5bRrw74dAx8oRlL3w74Jr9fcAfAvcocqj/1iJERl3gENUbwc4NGQ55i5HQ+b+0ZP09
 0rez9y9Qa5huxDLtpYeke3L8uF9vTMjRiL+vSbvl9/TsWbbjtrZCUB3oXEknJi7Yhk47
 JXF9nbuPR2gdw5dq4TaBv2MF+VCKznTZ3GqXyMZ37PRQS5m96O2D+EIpIAaQFlYoGbdz
 WsWo06NQmP1P4MIKU9TIsU4519oxYzv7nhhKpZgz+FnI+GxMuVQaX78O9G7tHEuj/+r8
 t6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680890491; x=1683482491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q77ZcgCYnodZClKQX1HhPOSoqs2rfxGtOfBwRswul/4=;
 b=kfPow7a0cgpn6e2w3A2qn2ApyJP6w7SD7Ht7f4Va8ubmhtTXf+X1sg7QAEEFkatjEl
 r5tEjvghMW12DaQ/RE0bva30k7reB4b/uOBRrGXWLLk8gI8yks4LdZQGivl1AUDAGlI3
 rwIGs6NOOQuMzigkc3bP/mEyVztXKM9O6RpoU5pmKexZOvi52K6ZDpexGcjLc+ecdd3g
 D/P+E5OLXbwla8qy3wHC0Re0h+tKSNZwl5OXhQeqYMjeR2AeBM3zVPAGmFmDkBb1yc33
 uuZTdXoEMdEtn3dvzI4A64KeQiR7aJZKYroOHZF+Nw8433no4nkBcoWeNYWJm9jH9k39
 CIiA==
X-Gm-Message-State: AAQBX9f3mRCS6tOQqvkAAfS3MK2IPxbxYsDGKeACSVMh67SndY9OmptX
 9MbmxcURf85i+cBCgi2ouMlSPjow4p8bAUFsjpbtrA==
X-Google-Smtp-Source: AKy350ZHpTLUkU+XPnuqC13BzSbCyuTyl9RXM3G4Em3Qru7EkrOtM+34INuQ/mLJt+FyJN0GtVAS94TF68VaGc2rObc=
X-Received: by 2002:a05:6a00:2e28:b0:625:c55f:bc66 with SMTP id
 fc40-20020a056a002e2800b00625c55fbc66mr1615956pfb.4.1680890490979; Fri, 07
 Apr 2023 11:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230329231407.1816570-1-trix@redhat.com>
In-Reply-To: <20230329231407.1816570-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:01:19 -0700
Message-ID: <CAKwvOdnQCVZ+gqOWzsRvkSKbYFJdh5yAJEN-TT+7MC4e8tdu8A@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/svm: remove unused ret variable
To: Tom Rix <trix@redhat.com>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 4:14=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/nouveau/nouveau_svm.c:929:6: error: variable
>   'ret' set but not used [-Werror,-Wunused-but-set-variable]
>         int ret;
>             ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouv=
eau/nouveau_svm.c
> index a74ba8d84ba7..e072d610f2f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -926,15 +926,14 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct =
mm_struct *mm,
>                  unsigned long addr, u64 *pfns, unsigned long npages)
>  {
>         struct nouveau_pfnmap_args *args =3D nouveau_pfns_to_args(pfns);
> -       int ret;
>
>         args->p.addr =3D addr;
>         args->p.size =3D npages << PAGE_SHIFT;
>
>         mutex_lock(&svmm->mutex);
>
> -       ret =3D nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> -                               struct_size(args, p.phys, npages), NULL);
> +       nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> +                         struct_size(args, p.phys, npages), NULL);

nvif_object_ioctl() may return -ENOSYS.  Seeing other call sites have
comments like:
114     /*XXX: warn? */
134     /*XXX: warn? */

or other places where the return code isn't checked makes me think
that a better approach would be to
1. plumb error codes back up through nouveau_pfns_map() (and other
call sites of nvif_object_ioctl)
2. consider making nvif_object_ioctl __must_check

>
>         mutex_unlock(&svmm->mutex);
>  }
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
