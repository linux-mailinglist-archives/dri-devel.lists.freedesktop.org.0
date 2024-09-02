Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A35D968CF5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 19:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E8F10E391;
	Mon,  2 Sep 2024 17:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e5Icd0St";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B522510E38E;
 Mon,  2 Sep 2024 17:49:47 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7cd80d28743so497658a12.3; 
 Mon, 02 Sep 2024 10:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725299387; x=1725904187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9TS7jw6n3RoymRmhl3aVty2+uITWBB11ESJlaPjabM=;
 b=e5Icd0StzQuVrCpJgF/Z5CaEqDdqgefLtOwOR7NZk68JQVA9hqKVkNuXz561sla0qt
 lxBBVXwzjAHGAnyFbTg9EQjDJeMJdOvLLcPZQCk2YzsuF5vEELPubCyZn4EwHwXfQEKL
 TjsaivNlo4DZ+pdZIBi9suFaWpj1A5CkwBruBujIqw7r9uwmH4OoYfCCiqTtFPdVqG1D
 cUMdXKD66xknJJ7/ZewxSDNgxa/E1N2uR1jtC5XkfZnxhEuT7btMvs8vW/DuYhFknMGi
 U2G+0tajb2obR3+1yqRvB5GC/mvlkDGwusjAyzFEBi1TC3uwkD5Y4VQEfpsqingK2DXZ
 VBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725299387; x=1725904187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t9TS7jw6n3RoymRmhl3aVty2+uITWBB11ESJlaPjabM=;
 b=SAzoVVxxaLmHEEjYYrcCC74SS4rxDOKjSYKBT2FQ8Chdd9GbaphIfKb9RAudnTF87v
 YtTUIeHmY1aCAJW67VKfvVtDDJzTIF0aznBnH60Kt99CygdsO/V+ZI7vgGxxsNSciOTp
 WJPJ3H67nh9MAoGS1QMhv/BOsDEc+w5ErFviLh/+t+EHGcQQhZflhm9RLb2JKLKnKQfA
 qqM5PUK3aX9A9rS8Xwhw5dhkX5Aa7j88iZqjoJV6XOLPd1rTjuDha/OCMivR69MfIUE+
 7vPMysGNhZ28I/UkEmLgflfO87Xukoq9ueTlZ+hWbLE3iVqgpbq/rW0oZPM6BH/L460q
 U0cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5Mmao6VWjWbpa6o0a5FzYoC8ICgoBoevkqbl9EGcGm48kSpzTcl+pdJklaOx6SzjNqYwvMAA+@lists.freedesktop.org,
 AJvYcCWPs66Fxn9xuvPxbUF+C12Lu0vJi2KzusqQRM5ILJ42r/3xG8VFr4W3xoi18WmU326JxJ6sFTYPlA==@lists.freedesktop.org,
 AJvYcCWggHSHMWn1b4Fio0PeaaNfqJUZrPhjP3NnTlc/724p8c2U412YNqmOaPVIfkQld4MBlGXighxoYPQi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy31BXpwWfuBo3dpnzgROmocz4VEPkdbVJ8SLdkK7KBAztQ0Y1j
 /ujS2JM8UfWzXptH6yAnSfO1Cus3kKZNN94ayklGaJB8rvHN8xR79a7LLTagEPzKpzCz2NXoC4T
 sB+sgKwT7BTdVkg20hl70l9lyNSHETQ==
X-Google-Smtp-Source: AGHT+IHoEKHi2KEbBv7k1Q8Ul30OvldZS9WmLuy/6dO9Q0hdux6sVxhrIgHwB0DEHkfgzEwgqcGyA/eEIa/jhJa33ks=
X-Received: by 2002:a17:903:2346:b0:205:938b:f387 with SMTP id
 d9443c01a7336-205938bf846mr10610275ad.8.1725299386902; Mon, 02 Sep 2024
 10:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240830012216.603623-1-lizetao1@huawei.com>
 <20240830012216.603623-3-lizetao1@huawei.com>
 <64f6b72e-dd00-47e1-bd06-0cd3ef972f8b@amd.com>
In-Reply-To: <64f6b72e-dd00-47e1-bd06-0cd3ef972f8b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Sep 2024 13:49:35 -0400
Message-ID: <CADnq5_PB2nrhoRy=sEWAjEhM2niFi4T3MVLHsq90Q8VSS5F7aQ@mail.gmail.com>
Subject: Re: [PATCH -next 2/3] drm/amdgpu: use clamp() in
 amdgpu_vm_adjust_size()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Li Zetao <lizetao1@huawei.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, kherbst@redhat.com, lyude@redhat.com, 
 dakr@redhat.com, felix.kuehling@amd.com, zhenguo.yin@amd.com, 
 srinivasan.shanmugam@amd.com, shashank.sharma@amd.com, Jesse.Zhang@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
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

Applied amdgpu patches.  Thanks!

On Fri, Aug 30, 2024 at 10:19=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 30.08.24 um 03:22 schrieb Li Zetao:
> > When it needs to get a value within a certain interval, using clamp()
> > makes the code easier to understand than min(max()).
> >
> > Signed-off-by: Li Zetao <lizetao1@huawei.com>
>
> This patch and #1 is a nice cleanup and Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>
>
> But as Alex also pointed out patch #3 is for Nouveau and not amdgpu.
>
> Regards,
> Christian.
>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index e20d19ae01b2..40f9a5d4f3c0 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -2224,7 +2224,7 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *=
adev, uint32_t min_vm_size,
> >               phys_ram_gb =3D ((uint64_t)si.totalram * si.mem_unit +
> >                              (1 << 30) - 1) >> 30;
> >               vm_size =3D roundup_pow_of_two(
> > -                     min(max(phys_ram_gb * 3, min_vm_size), max_size))=
;
> > +                     clamp(phys_ram_gb * 3, min_vm_size, max_size));
> >       }
> >
> >       adev->vm_manager.max_pfn =3D (uint64_t)vm_size << 18;
>
