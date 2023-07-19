Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A675ABD5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A6010E58A;
	Thu, 20 Jul 2023 10:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EEA10E4D1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:25:24 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5701810884aso69982547b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1689780323; x=1692372323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9cCLj0zM8JjUOyomZEKsWMrdNLR9qOvsZrkfrcN/wI=;
 b=OEkJOsaDK/Sdhd+3KExw0lzHKRrWqkDKbK3EdKZwnico2hN66bMte46sznr3D2q8Ij
 kbEqswBd4Nce8EcmHj//I9ODApZC3L90+sXmFcS3ViqD/041bQU+p1oZEBIpbGHxQdRW
 Bkx5xcshP6g0XlBXSCaQ//9PGUg4t0Ev53G19Jn7Bfe4HXMoys0m8SzehU1V6F7QP7eC
 8lD4s/Cq7UyYFbJ2XhyBKI9zR6lTkAPuQK2Be95WCrVId1mNkjbCaiY+OoJI9U3Jthni
 rSjU8rQv78mbNQMwp1Pir4wiHsocaFkhglAJQrREt1ieUgUGlrDPdPr85ltO3yU7F7at
 iaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689780323; x=1692372323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E9cCLj0zM8JjUOyomZEKsWMrdNLR9qOvsZrkfrcN/wI=;
 b=FuOFI8z8qEKwBZl1SFEhPR2tcID+PP/rUUdZGFbabol4POsqYZMuGlsW8ccexs/A97
 +1pMiYh5y+4s1+h9bFr944Hq/C+FpyGQBkYADEPQW/u/vYZzqX9w12VmwPUSDdHvGWLq
 4cNJJGTAZzg0/rvR5RGxAQ3xWpY9xtDEbCkwDPFZ0tiFtE2WMpzoHf6Vm7X5jLZbicyb
 bVqaa9RJusLFtI8I0xNwLa/KmQspLxEP3isKyoqaKbCLK1ErKOC9rqU7QhhZj82OckKi
 zrK0tnwMNQaxlcWXe0Eh058DWSqonAyRsLBDXfTJF4Y9rl/3zZ3ANOHmGn5+UIYcgfP8
 7a+w==
X-Gm-Message-State: ABy/qLaimC8ZpKrzQyb3dDb1wonq8bMHgmk0uXrlxTlb14hjX5r4yS8b
 olTRHBttCKEzhPLKU14UcuygJFvvpksbJ35S9Zlp
X-Google-Smtp-Source: APBJJlEKuWkfr0ZOUpBDkgDJSGU1WICL7JKLe65DOhMheQvB+Dy8YyA22pUEoTNZB9gyg+Sk1cUZ7AumngsAXFfSIUo=
X-Received: by 2002:a0d:cb10:0:b0:57a:8de9:29e7 with SMTP id
 n16-20020a0dcb10000000b0057a8de929e7mr18181677ywd.28.1689780323608; Wed, 19
 Jul 2023 08:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075127.47736-1-wangkefeng.wang@huawei.com>
 <20230719075127.47736-4-wangkefeng.wang@huawei.com>
 <CAJ2a_DfGvPeDuN38UBXD4f2928n9GZpHFgdiPo9MoSAY7YXeOg@mail.gmail.com>
 <dc8223db-b4ac-7bee-6f89-63475a7dcaf8@huawei.com>
In-Reply-To: <dc8223db-b4ac-7bee-6f89-63475a7dcaf8@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 19 Jul 2023 11:25:12 -0400
Message-ID: <CAHC9VhQzJ3J0kEymDUn3i+dnP_34GMNRjaCHXc4oddUCFb0Ygw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] selinux: use vma_is_initial_stack() and
 vma_is_initial_heap()
To: Kefeng Wang <wangkefeng.wang@huawei.com>, 
 =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 20 Jul 2023 10:23:05 +0000
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
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-perf-users@vger.kernel.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Eric Paris <eparis@parisplace.org>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 6:23=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huawei=
.com> wrote:
> On 2023/7/19 17:02, Christian G=C3=B6ttsche wrote:
> > On Wed, 19 Jul 2023 at 09:40, Kefeng Wang <wangkefeng.wang@huawei.com> =
wrote:
> >>
> >> Use the helpers to simplify code.
> >>
> >> Cc: Paul Moore <paul@paul-moore.com>
> >> Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> >> Cc: Eric Paris <eparis@parisplace.org>
> >> Acked-by: Paul Moore <paul@paul-moore.com>
> >> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> >> ---
> >>   security/selinux/hooks.c | 7 ++-----
> >>   1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> >> index d06e350fedee..ee8575540a8e 100644
> >> --- a/security/selinux/hooks.c
> >> +++ b/security/selinux/hooks.c
> >> @@ -3762,13 +3762,10 @@ static int selinux_file_mprotect(struct vm_are=
a_struct *vma,
> >>          if (default_noexec &&
> >>              (prot & PROT_EXEC) && !(vma->vm_flags & VM_EXEC)) {
> >>                  int rc =3D 0;
> >> -               if (vma->vm_start >=3D vma->vm_mm->start_brk &&
> >> -                   vma->vm_end <=3D vma->vm_mm->brk) {
> >> +               if (vma_is_initial_heap(vma)) {
> >
> > This seems to change the condition from
> >
> >      vma->vm_start >=3D vma->vm_mm->start_brk && vma->vm_end <=3D vma->=
vm_mm->brk
> >
> > to
> >
> >      vma->vm_start <=3D vma->vm_mm->brk && vma->vm_end >=3D vma->vm_mm-=
>start_brk
> >
> > (or AND arguments swapped)
> >
> >      vma->vm_end >=3D vma->vm_mm->start_brk && vma->vm_start <=3D vma->=
vm_mm->brk
> >
> > Is this intended?
>
> The new condition is to check whether there is intersection between
> [startbrk,brk] and [vm_start,vm_end], it contains orignal check, so
> I think it is ok, but for selinux check, I am not sure if there is
> some other problem.

This particular SELinux vma check is see if the vma falls within the
heap; can you confirm that this change preserves this?

--=20
paul-moore.com
