Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD9758E45
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABF710E188;
	Wed, 19 Jul 2023 07:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6F510E02C;
 Tue, 18 Jul 2023 15:10:27 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5633b7e5f90so3887079eaf.1; 
 Tue, 18 Jul 2023 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1689693026; x=1692285026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JNQ6/gc5vfGP1wHAlH0r+RXd8q2VGkAv8eOnlipw9dY=;
 b=CV3ZKEqZWXlKDj1uZ5AVabNJrLd2Eg+AK05DTeuCA+f5zQEMBxYFca0FBmwFTkHcK7
 3MlmM5lZTYfktW0UF6SbvxyLoTf1TuBv6ZgILXcv8VOuLPDPduWcM5h/tDvlr0ypg5/q
 smpype/Nr37YgegIwLWzCYWecOynGyznMId0h5Yu07QY99zOYbeNAPhOMiBJCFwdHIg1
 os2djPgcqhMTtJsBcOr448wqDatFIAol+X13i+uIjse3EoWbTEh8eawvWBB+t+x4nBHX
 AwOdbRVZlXT+Nd0dKShzXbdAGtZ+nCvMDk4XVNYGLQfeaKo9QT1PyMpwDQCP/QPpHn7V
 zClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689693026; x=1692285026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JNQ6/gc5vfGP1wHAlH0r+RXd8q2VGkAv8eOnlipw9dY=;
 b=i5EEvBpUd/QEkMRsLU4YPSGrAFJvWYZj0POpamfBylm0mXpaOgDKQ8t8bFyWnVoKKv
 PlRHmVtHsL3wJt8GCQJDp21FbTKJOTuH2iSbFJnoo2s9PLoQg19E+6pL/XAnHsX/hKc4
 9Y2n5KTyxh1BAu8+g7wtSlmK/wXLML2+pUiVocDMzwSpK2ZubGO/Yjv7GSsTe+wGXi4E
 91K+dKhkKTOcYcr9pNZVOFvH/ahNzB4VLg4Mdx6K8bx8WAf7E25jjb+d5Wo26mC5z9At
 jLLUrJEIBhyCYelev9x/O/xhpi0YAsfuv/eEWMQwEP72jlYe7CnxHWbvZ7hCeTZjft28
 Ilwg==
X-Gm-Message-State: ABy/qLZ+3L1VtMdm6qjHTmJsFl8Ick1gGE0mrtUI+o49RqO3rmcYgfQt
 D40muqcAW70ZYk9u6N+OVRQ2Eqq+0MJecHvkY/M=
X-Google-Smtp-Source: APBJJlHDVXGokvOwlHVsvWNoqkFMjjyNFTxOWLqeqnl954tIVvHpuyY0R8psa6PK/CXU+eZaGshpae8nJo4WqnvYlBA=
X-Received: by 2002:a05:6358:7f0d:b0:134:c37f:4b60 with SMTP id
 p13-20020a0563587f0d00b00134c37f4b60mr11494410rwn.32.1689693025766; Tue, 18
 Jul 2023 08:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230712143831.120701-1-wangkefeng.wang@huawei.com>
 <20230712143831.120701-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20230712143831.120701-2-wangkefeng.wang@huawei.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Tue, 18 Jul 2023 17:10:14 +0200
Message-ID: <CAJ2a_Dd+CUggq0gtaeuPSP+iCrqUH08cCwU95AYGXxv5TBWSuA@mail.gmail.com>
Subject: Re: [PATCH 1/5] mm: introduce vma_is_stack() and vma_is_heap()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 19 Jul 2023 07:01:14 +0000
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
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 at 16:25, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Introduce the two helpers for general use.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  include/linux/mm.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 1462cf15badf..0bbeb31ac750 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -926,6 +926,18 @@ static inline bool vma_is_anonymous(struct vm_area_struct *vma)
>         return !vma->vm_ops;
>  }
>
> +static inline bool vma_is_heap(struct vm_area_struct *vma)

What about declaring the parameters const to document in code these
functions do not modify any state, and allow callers to pass pointers
to const?

> +{
> +       return vma->vm_start <= vma->vm_mm->brk &&
> +               vma->vm_end >= vma->vm_mm->start_brk;
> +}
> +
> +static inline bool vma_is_stack(struct vm_area_struct *vma)
> +{
> +       return vma->vm_start <= vma->vm_mm->start_stack &&
> +              vma->vm_end >= vma->vm_mm->start_stack;
> +}
> +
>  static inline bool vma_is_temporary_stack(struct vm_area_struct *vma)
>  {
>         int maybe_stack = vma->vm_flags & (VM_GROWSDOWN | VM_GROWSUP);
> --
> 2.41.0
>
