Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0151DCDE
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 18:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7822310E7B6;
	Fri,  6 May 2022 16:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C75810E792;
 Fri,  6 May 2022 16:04:43 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w194so6721397oie.9;
 Fri, 06 May 2022 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40/a2HKQQMurNLA4xNO+qLKuyGWRwnq4jg7SfIv0kwE=;
 b=AL5j6ArhMileBaHRS5KPVGutmKZfOu6EjnO+4RG6jiKVHROSEQfMtt2YIjNKy5Ucce
 b1c4q5q2v+fcdvSUiekIJFT9Fu1ZdgP/EYzorv9bfnUpb5+KVONU8X8jUWlSjCvx6S9Q
 hk29JpShWmfG/A67hcgFt7ch03WvA45djO8a1Jkf9cZarY1w1X1Qyqach0LuX92EsqeE
 ITkn2zmWptxwtXd7Ta3jX9MBBvQzpJQYQQXVpQfWDs0O4snobmiRjsWDEsC6px6gejbF
 VpLCjkg3JRl6Uty/77xCyB6NFIrbylBCuSxEpZMbElvkOu4iCR856r1xogNdL6fb6D3l
 PKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40/a2HKQQMurNLA4xNO+qLKuyGWRwnq4jg7SfIv0kwE=;
 b=NUiy6bSibnfu/FeI/MCVDm4uYsWVd0JchxVmXQQgf2rR3zSx9jXjprW2O3PhC/qKPa
 Z8yAFEdk2XH69nC0DbO2C73qKhzKpCfo5lCJa+Tt3wpcPxnaiRE3TZSXSkSbrIoFTnEU
 YUrzMXu86wp7Pzo0cAZ1qTYKv1UHEQiO3UqDn1RrlMIvkAgk2bxvSo8gMV3kq00tVdaZ
 j7y9hY+Cz3XCyCGWLIpSAzYD122cQG/K/TkI0bJ+lZwwipktGnPF9Bcr73PSl5JuONJ/
 ANPAG9ko4nytZV4Dl9HDKNNlj6nYWB/XmDth5QYjDlw1HQiENt06e0DMokXRSCjlb4IO
 mzzA==
X-Gm-Message-State: AOAM530bLhlX5do3pPQ+F9gKt1mDy+R9aBova/ydZb/3lU378GSTlS9J
 VXFjOTUG3UHMA+RIXhoAiN9re8KzSny5VzRTLdA=
X-Google-Smtp-Source: ABdhPJxMRgckR14ZfpeblhbJaj3WBUSwn+t9nwYx1gr9EjjV3/q83P7rA7zZwjrM7AtVfVRgVz+kCR+gGz7Z7ueRRT4=
X-Received: by 2002:a05:6808:f8d:b0:325:1e81:ffe5 with SMTP id
 o13-20020a0568080f8d00b003251e81ffe5mr1801284oiw.253.1651853082632; Fri, 06
 May 2022 09:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220505232312.129997-1-yang.lee@linux.alibaba.com>
 <CADnq5_NWmHJHFtnMJfHYdQsBPGOAXcS2XR1vC1XYWjMrHKRGQw@mail.gmail.com>
In-Reply-To: <CADnq5_NWmHJHFtnMJfHYdQsBPGOAXcS2XR1vC1XYWjMrHKRGQw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 May 2022 12:04:31 -0400
Message-ID: <CADnq5_NXGWNtzOL-qWNxWq-uwR6bEo+-BRayti_kZ5-tkw+wGA@mail.gmail.com>
Subject: Re: [PATCH -next 2/2] drm/amdkfd: Return true/false (not 1/0) from
 bool functions
To: Yang Li <yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, Abaci Robot <abaci@linux.alibaba.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, May 6, 2022 at 12:04 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Series is:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> On Thu, May 5, 2022 at 7:28 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
> >
> > Return boolean values ("true" or "false") instead of 1 or 0 from bool
> > functions. This fixes the following warnings from coccicheck:
> >
> > ./drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c:244:9-10: WARNING:
> > return of 0/1 in function 'event_interrupt_isr_v11' with return type
> > bool
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> > ---
> >  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> > index c3919aaa76e6..1431f0961769 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> > @@ -241,14 +241,14 @@ static bool event_interrupt_isr_v11(struct kfd_dev *dev,
> >         if (/*!KFD_IRQ_IS_FENCE(client_id, source_id) &&*/
> >             (vmid < dev->vm_info.first_vmid_kfd ||
> >             vmid > dev->vm_info.last_vmid_kfd))
> > -               return 0;
> > +               return false;
> >
> >         pasid = SOC15_PASID_FROM_IH_ENTRY(ih_ring_entry);
> >         context_id0 = SOC15_CONTEXT_ID0_FROM_IH_ENTRY(ih_ring_entry);
> >
> >         if ((source_id == SOC15_INTSRC_CP_END_OF_PIPE) &&
> >             (context_id0 & AMDGPU_FENCE_MES_QUEUE_FLAG))
> > -               return 0;
> > +               return false;
> >
> >         pr_debug("client id 0x%x, source id %d, vmid %d, pasid 0x%x. raw data:\n",
> >                  client_id, source_id, vmid, pasid);
> > @@ -258,7 +258,7 @@ static bool event_interrupt_isr_v11(struct kfd_dev *dev,
> >
> >         /* If there is no valid PASID, it's likely a bug */
> >         if (WARN_ONCE(pasid == 0, "Bug: No PASID in KFD interrupt"))
> > -               return 0;
> > +               return false;
> >
> >         /* Interrupt types we care about: various signals and faults.
> >          * They will be forwarded to a work queue (see below).
> > --
> > 2.20.1.7.g153144c
> >
