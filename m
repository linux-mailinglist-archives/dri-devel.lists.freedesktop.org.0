Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418A64F334A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF9610E617;
	Tue,  5 Apr 2022 13:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5198310E617;
 Tue,  5 Apr 2022 13:15:07 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso9329414otj.7; 
 Tue, 05 Apr 2022 06:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j+u9l1hFOb+F6NIjO1asGqQYJJ9ridmMMsrteD+DArU=;
 b=o2iCPdweGHKt8sqrwJAU4uLdLnglJzQ2+RXjCoCbxhlP7u2/iMmxsuIMR086Re8ulW
 Msb8qVUlHmI8DXPcKObQPJuTM1Dysv45iDoWAj9+Z68n6YdZtfZzawVVbCNdkwSNP7ca
 NHufExGaX9FwpgPPCFZxuiP9ME7JIySF65g9x3/YJHm1TjjlZhfzuG/RToTI8Jrmv3FC
 xUpn0+SxrEuTXlqge/m5l32VcjAiaerW4bwGN/vuXwL554G4fAEi6Csg/Ghz/onAJsGC
 SVPQ+pMyKpgKoFbKYnJuBgzVCX7WIJDJv+vgBc5iKnRN77L30e+pmSjoler9lBSBheVZ
 mL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j+u9l1hFOb+F6NIjO1asGqQYJJ9ridmMMsrteD+DArU=;
 b=HBrp+APYpYtkJjGCEhaT7oeaTnbaMfeJpz/bGJz5XmFXoZhBuN6Xo8E/usR+tvAHBN
 Z3rB/7HE1p+41v+eKlULKHrt4McBghZfUQleZjo/SQMKoilEh+Z9AKlanK7BHWu21qey
 M3X8ZsKeQrtSxwtfdgntqLtzExZN+IL3OrRWhwAYv7ZqT+IbnDdTt7yJNxP9kWX0ra8b
 /J+W/vN8MaF7M7o/o0LcK8SDcsePXbzgb8aYwRVEVCTPsTUyRN4uWaxfkBjQ0UUb2TJV
 5S3D5AUjIgzqSi0/8lErtd9oWDq7Y7aW72fgqYSjTBQJaY7Fu04ATggUi2TuJB7Gi19a
 Pv4w==
X-Gm-Message-State: AOAM533GFN/FFYHjSqs9FSN8TjYUhTvm4Q6ZFEI70jB1fw8Z0vUMAg26
 ZRo4jhmLx4sUL6kT/6zKx0Ngztk28FMOSny5gcxJMulGMyU=
X-Google-Smtp-Source: ABdhPJweaVqn5fj3LpuWzpkbuOf7ysTfZMy2YEcio3zT48dmeMlZswx+nBnRBuAMUmm9R7zs2vIlRlSWz440Cm2iuNw=
X-Received: by 2002:a9d:4702:0:b0:5cd:481a:148a with SMTP id
 a2-20020a9d4702000000b005cd481a148amr1171172otf.200.1649164506306; Tue, 05
 Apr 2022 06:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220404214255.11902-1-Philip.Yang@amd.com>
 <7a0e9d4c-257f-287e-9caf-f4161887ba39@molgen.mpg.de>
 <530f3735-9a82-54af-c090-cc8d5b1510cc@amd.com>
 <226a1c28-2516-7af4-dc19-7236f31128e9@molgen.mpg.de>
In-Reply-To: <226a1c28-2516-7af4-dc19-7236f31128e9@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Apr 2022 09:14:55 -0400
Message-ID: <CADnq5_M2nX_TAth0aQbxRWSLQVnDKMGuBBxzhvrBv6ZA5SZe1w@mail.gmail.com>
Subject: Re: Public patches but non-public development branch (Re: [PATCH 1/1]
 drm/amdkfd: Add missing NULL check in svm_range_map_to_gpu)
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Philip Yang <Philip.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 5, 2022 at 3:02 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Christian,
>
>
> Am 05.04.22 um 08:54 schrieb Christian K=C3=B6nig:
> > Am 05.04.22 um 08:45 schrieb Paul Menzel:
>
> >> Am 04.04.22 um 23:42 schrieb Philip Yang:
> >>> bo_adev is NULL for system memory mapping to GPU.
> >>>
> >>> Fixes: 05fe8eeca92 (drm/amdgpu: fix TLB flushing during eviction)
> >>
> >> Sorry, where can I find that commit?
> >
> > Well that's expected, the development branch is not public.
>
> Well obviously, it was unexpected for me. How should I have known? Where
> is that documented? If the patches are publicly posted to the mailing
> list, why is that development branch not public?
>
> The current situation is really frustrating for non-AMD employees. How
> can the current situation be improved?

Our development branch
(https://gitlab.freedesktop.org/agd5f/linux/-/commits/amd-staging-drm-next)
is available publicly.  There can be a day or so of lag depending on
when it gets mirrored (e.g., over the weekend).

Alex

>
>
> Kind regards,
>
> Paul
>
>
> >> I do not see it in drm-next from agd5f git archive
> >> git@gitlab.freedesktop.org:agd5f/linux.git.
> >>
> >>     $ git log --oneline -1
> >>     e45422695c19 (HEAD, agd5f/drm-next) drm/amdkfd: Create file
> >> descriptor after client is added to smi_clients list
> >>
> >>
> >> Kind regards,
> >>
> >> Paul
> >>
> >>
> >>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> >>> ---
> >>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >>> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >>> index 907b02045824..d3fb2d0b5a25 100644
> >>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >>> @@ -1281,7 +1281,7 @@ svm_range_map_to_gpu(struct kfd_process_device
> >>> *pdd, struct svm_range *prange,
> >>>                          last_start, prange->start + i,
> >>>                          pte_flags,
> >>>                          last_start - prange->start,
> >>> -                       bo_adev->vm_manager.vram_base_offset,
> >>> +                       bo_adev ?
> >>> bo_adev->vm_manager.vram_base_offset : 0,
> >>>                          NULL, dma_addr, &vm->last_update);
> >>>             for (j =3D last_start - prange->start; j <=3D i; j++)
