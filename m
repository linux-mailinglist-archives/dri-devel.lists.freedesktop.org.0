Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5B475C133
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 10:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC15710E628;
	Fri, 21 Jul 2023 08:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403FB10E19F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 21:16:26 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a1d9b64837so892115b6e.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 14:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1689887785; x=1690492585;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qG+ThjVmfgJOgCEH3FGED5B6h6SrS5o6Axcjc3bwSOI=;
 b=PlsOhuAwUTnsUHdCrAacS252UIxiMGOunaN7sjGqk6IdEDvWSfDkeAaUkUyPQ8TsWM
 dSwDx1M0yS6cP18SL/J1e1PXgjFT+K9g6o5oDfjX5KtL6NSbkgGERWclg4dqpb5RXbRk
 mgSxD4tswhi0vnWZ7QVrXYqDP0D8ob9/9QUQ6YAxjdxcpwGDgQkVMpn2oIljVP+8n250
 Cvgx17BBdzoeGzK2qImORkfKCzx9ew4k1bBToLGVABe29MENH0fq/kJj3qouvSeuyZdO
 /Z1VN2fJikHf9jRa4qnEkTjqz53WsvY8WrwXfru0TXBwVShYekLaJiGmdg8c8HjFud4b
 s4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689887785; x=1690492585;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qG+ThjVmfgJOgCEH3FGED5B6h6SrS5o6Axcjc3bwSOI=;
 b=OvB3IMWVKMWsv9rijBSJewjdLJAr6LiaDyVbk8JcnSG84A/1YIOO3wqGwnYCZ6uF/p
 rbJRsALoA4U5KDh6afmtpGVIUyJyDh6nIYW2gxgsfT7TvSgULmwd4rGYz9ItrIV9GmtS
 wpx3xZgiS0IJ4faFfTg0GUQYqih22JUv7h+xY8nghMVkTolIdis8wf91qnpqI1PSsWOY
 20cCVR4mx17/JYR2lY5rnJs4gizDgKxROKKMS/z8KQfnsRd5IxcwSCaruGYAFxWKgJc9
 GZ/+SJSovD+lfMQEXzfRw6FQHSI50fWgbSsIqKcjIZyd28+WCzoDeZS/sDcgX0oPH1Lr
 vMLg==
X-Gm-Message-State: ABy/qLZtmgVRBQUMmyR66yK4gjHwY1DSUE+Zvu0Evs7IorpU8jkPUH5Y
 7LJjOwhbVWvrGWM0PhOpq7p1toD/8iNN4J9PfzWe
X-Google-Smtp-Source: APBJJlEhgxTXc1qyzkAvHpHuXwIG3OtHxUZ6QwrqTdkR8L2OyhsuJu/aP2P2r4S2KF4Tr6uErZhsPZjFCuLra+hXwe4=
X-Received: by 2002:aca:1218:0:b0:3a4:8e9b:e5cb with SMTP id
 24-20020aca1218000000b003a48e9be5cbmr84720ois.1.1689887785358; Thu, 20 Jul
 2023 14:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075127.47736-1-wangkefeng.wang@huawei.com>
 <20230719075127.47736-4-wangkefeng.wang@huawei.com>
 <CAJ2a_DfGvPeDuN38UBXD4f2928n9GZpHFgdiPo9MoSAY7YXeOg@mail.gmail.com>
 <dc8223db-b4ac-7bee-6f89-63475a7dcaf8@huawei.com>
 <CAHC9VhQzJ3J0kEymDUn3i+dnP_34GMNRjaCHXc4oddUCFb0Ygw@mail.gmail.com>
 <1e839238-c78d-71e0-28ae-7efff0e04953@huawei.com>
In-Reply-To: <1e839238-c78d-71e0-28ae-7efff0e04953@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 20 Jul 2023 17:16:14 -0400
Message-ID: <CAHC9VhRBxQmxegjLQ73J7zMOTpsOOBTj9PwZ6BptV=6ToC+1BA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] selinux: use vma_is_initial_stack() and
 vma_is_initial_heap()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:18:14 +0000
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
 Eric Paris <eparis@parisplace.org>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 4:28=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huawei=
.com> wrote:
> On 2023/7/19 23:25, Paul Moore wrote:
> > On Wed, Jul 19, 2023 at 6:23=E2=80=AFAM Kefeng Wang <wangkefeng.wang@hu=
awei.com> wrote:
> >> On 2023/7/19 17:02, Christian G=C3=B6ttsche wrote:
> >>> On Wed, 19 Jul 2023 at 09:40, Kefeng Wang <wangkefeng.wang@huawei.com=
> wrote:
> >>>>
> >>>> Use the helpers to simplify code.
> >>>>
> >>>> Cc: Paul Moore <paul@paul-moore.com>
> >>>> Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> >>>> Cc: Eric Paris <eparis@parisplace.org>
> >>>> Acked-by: Paul Moore <paul@paul-moore.com>
> >>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> >>>> ---
> >>>>    security/selinux/hooks.c | 7 ++-----
> >>>>    1 file changed, 2 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> >>>> index d06e350fedee..ee8575540a8e 100644
> >>>> --- a/security/selinux/hooks.c
> >>>> +++ b/security/selinux/hooks.c
> >>>> @@ -3762,13 +3762,10 @@ static int selinux_file_mprotect(struct vm_a=
rea_struct *vma,
> >>>>           if (default_noexec &&
> >>>>               (prot & PROT_EXEC) && !(vma->vm_flags & VM_EXEC)) {
> >>>>                   int rc =3D 0;
> >>>> -               if (vma->vm_start >=3D vma->vm_mm->start_brk &&
> >>>> -                   vma->vm_end <=3D vma->vm_mm->brk) {
> >>>> +               if (vma_is_initial_heap(vma)) {
> >>>
> >>> This seems to change the condition from
> >>>
> >>>       vma->vm_start >=3D vma->vm_mm->start_brk && vma->vm_end <=3D vm=
a->vm_mm->brk
> >>>
> >>> to
> >>>
> >>>       vma->vm_start <=3D vma->vm_mm->brk && vma->vm_end >=3D vma->vm_=
mm->start_brk
> >>>
> >>> (or AND arguments swapped)
> >>>
> >>>       vma->vm_end >=3D vma->vm_mm->start_brk && vma->vm_start <=3D vm=
a->vm_mm->brk
> >>>
> >>> Is this intended?
> >>
> >> The new condition is to check whether there is intersection between
> >> [startbrk,brk] and [vm_start,vm_end], it contains orignal check, so
> >> I think it is ok, but for selinux check, I am not sure if there is
> >> some other problem.
> >
> > This particular SELinux vma check is see if the vma falls within the
> > heap; can you confirm that this change preserves this?
>
> Yes, within is one case of new vma scope check.

Thanks for the confirmation.

--=20
paul-moore.com
