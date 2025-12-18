Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF3CCDE28
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474CC10EBEB;
	Thu, 18 Dec 2025 22:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O3JDlRQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2644D10EBEB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 22:54:48 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-78d6a3c3b77so23096377b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766098487; x=1766703287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/D/6JfwbnVSddaeB08zDv0oQfpqp53mixflAVzOcl8=;
 b=O3JDlRQ1N6ioh2l6/Tjw27iTXwaRVXTv45htB1I5pll+uwJl26PiUhEpQwl+GJxYyI
 cTQc8M82OkncgToNYbDGCUuhCUBuOiUOEj6vTrTllSl2wPDlXCf/hVQ0rHEtBdi7DqwP
 Um1EMRmNdQGhBHk2843GxICBuCHjsZSFfhVgDQjHbPCi6v21oU20ABNTH4bTXGXfu8OS
 WPn6XmQ345vdp17s/lX4XcRS+aCcToAnzRL8RNEqGLNKV0Wz+MAJNQOI9C4LlcA6m3HG
 t9fm6rsN0kmdx5175Uh1SWV1BywOjkW2ytcZ/1qEdCWjkEkxoydMmTVFi0ob34QD0KKI
 t3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766098487; x=1766703287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X/D/6JfwbnVSddaeB08zDv0oQfpqp53mixflAVzOcl8=;
 b=B8jicfr61EeUw99/WOc9m2boOlV9vtLZrdz8Ha3wggumPh5ceuYjYgAiQcSkvv15s2
 ldrD+BSoJWwoRtqCd9vf5oOeRyMtotu+FGKW8rDb/e1hSI+XE3U2QiHP5YNAlnKY9k26
 /EclaIMJKqzGrPInOZHt0Szzmoj4nhKdkLFg0x75DEZeXH7MUe0JvNnSMfelXmc/N0aJ
 hp4MscSc/r0bAY+G0KV4BkD7W1GHQtlCsoPAPQJxpLfOo78IPtU+n3yoFGQ+i5GHJ/xW
 Z79gQkggGRIbgX8zZf5UdukyUMItRdJqxf307wTPf4fs9sadtRbnIGZXjvE3KpgVaaF9
 KCcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtt1EuCn1vaLZ3T0vUn90mczB6d7Li5n0kWC03YUduubgdOC8HDLLeazR9LXuugDqABiVbiOlHEP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYnp8CQQFv3GKj97mCacW02r+Obz5NZkKjQ74o2klYM5Wa80dq
 Qyn8D3+muooD8v17cwjTh0Uo12sT11WVf/okOZNMug6eTm7n/dOdMtiU/V4Fnw8FWEvb2ptKLxl
 fD6zKfuYvHewV7ov5GccDT3mZbWCnG2A=
X-Gm-Gg: AY/fxX47eePBeqV0vau8iHrB8hwyE3FHPxDrzAWDLGBaV/aZmtp3lFXVOLCNakH7lea
 twt9fYtJJVSLT9aYXZXhhPcksyueLmRPxuvs0U17rxdUGAL57fyaYMwB47XB/BfiB6oan39yirn
 u/FPFtN/9RMPQtJHo4mxw4nMXzxHrj35QVl37/VG/rk8a7+z3lrIWZdjuy17HXzqHKRLGp2Szjb
 16SPz/uzUx73it5bWAXns33VPFFil5phsbWRXw4eQatEdefosyNuQ20Hh8m/UHSxPAjc0KNmBl1
 s7jWFemCTwE6HclN//XohUEsj6ln
X-Google-Smtp-Source: AGHT+IEgEVuRJdLKaU9PZy1DUFym14/fI6o71ZEe9N4CfPGF82ZSbIMs4E16qFpiJvyfPcUBHEoIZWxMvqfcubSJW5g=
X-Received: by 2002:a05:690e:1448:b0:644:50c7:a50a with SMTP id
 956f58d0204a3-646632c313cmr3659285d50.32.1766098486967; Thu, 18 Dec 2025
 14:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20251218162644.828495-1-ketil.johnsen@arm.com>
 <0939a54e-dc35-434b-9dbc-06837f04e62f@arm.com>
 <20251218185925.2aa246aa@fedora>
In-Reply-To: <20251218185925.2aa246aa@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 18 Dec 2025 14:54:35 -0800
X-Gm-Features: AQt7F2qGhYHvfiUdAEmMY_U04MecFiTNLxmjLB973h8pE7Lu1XVGLSoJoEuMhI8
Message-ID: <CAPaKu7SY+jsUxyoiiBRUgH7_M3C0V1-Fv_ibCak_6X-saEZ+fw@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: Evict groups before VM termination
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Ketil Johnsen <ketil.johnsen@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Dec 18, 2025 at 10:36=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 18 Dec 2025 16:57:28 +0000
> Steven Price <steven.price@arm.com> wrote:
>
> > On 18/12/2025 16:26, Ketil Johnsen wrote:
> > > Ensure all related groups are evicted and suspended before VM
> > > destruction takes place.
> > >
> > > This fixes an issue where panthor_vm_destroy() destroys and unmaps th=
e
> > > heap context while there are still on slot groups using this.
> > > The FW will do a write out to the heap context when a CSG (group) is
> > > suspended, so a premature unmap of the heap context will cause a
> > > GPU page fault.
> > > This page fault is quite harmless, and do not affect the continued
> > > operation of the GPU.
> > >
> > > Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> > > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_mmu.c   |  4 ++++
> > >  drivers/gpu/drm/panthor/panthor_sched.c | 16 ++++++++++++++++
> > >  drivers/gpu/drm/panthor/panthor_sched.h |  1 +
> > >  3 files changed, 21 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/=
panthor/panthor_mmu.c
> > > index 74230f7199121..0e4b301a9c70e 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > @@ -1537,6 +1537,10 @@ static void panthor_vm_destroy(struct panthor_=
vm *vm)
> > >
> > >     vm->destroyed =3D true;
> > >
> > > +   /* Tell scheduler to stop all GPU work related to this VM */
> > > +   if (refcount_read(&vm->as.active_cnt) > 0)
> > > +           panthor_sched_prepare_for_vm_destruction(vm->ptdev);
> > > +
> > >     mutex_lock(&vm->heaps.lock);
> > >     panthor_heap_pool_destroy(vm->heaps.pool);
> > >     vm->heaps.pool =3D NULL;
Is it better to remove the panthor_heap_pool_destroy call here instead
and let panthor_vm_free take care of it?

> > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/dr=
m/panthor/panthor_sched.c
> > > index f680edcd40aad..fbbaab9b25efb 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > @@ -2930,6 +2930,22 @@ void panthor_sched_report_mmu_fault(struct pan=
thor_device *ptdev)
> > >             sched_queue_delayed_work(ptdev->scheduler, tick, 0);
> > >  }
> > >
> > > +void panthor_sched_prepare_for_vm_destruction(struct panthor_device =
*ptdev)
> > > +{
> > > +   /* FW can write out internal state, like the heap context, during=
 CSG
> > > +    * suspend. It is therefore important that the scheduler has full=
y
> > > +    * evicted any pending and related groups before VM destruction c=
an
> > > +    * safely continue. Failure to do so can lead to GPU page faults.
> > > +    * A controlled termination of a Panthor instance involves destro=
ying
> > > +    * the group(s) before the VM. This means any relevant group evic=
tion
> > > +    * has already been initiated by this point, and we just need to
> > > +    * ensure that any pending tick_work() has been completed.
> > > +    */
> > > +   if (ptdev->scheduler) {
> > > +           flush_work(&ptdev->scheduler->tick_work.work);
> > > +   }
> >
> > NIT: braces not needed.
> >
> > But I'm also struggling to understand in what situation ptdev->schedule=
r
> > would be NULL?
>
> I thought it could happen if the FW initialization fails in the middle,
> and the FW VM is destroyed before the scheduler had a chance to
> initialize, but it turns out the FW logic never calls
> panthor_vm_destroy().
>
> >
> > Thanks,
> > Steve
> >
> > > +}
> > > +
> > >  void panthor_sched_resume(struct panthor_device *ptdev)
> > >  {
> > >     /* Force a tick to re-evaluate after a resume. */
> > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/dr=
m/panthor/panthor_sched.h
> > > index f4a475aa34c0a..9a8692de8aded 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_sched.h
> > > +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> > > @@ -50,6 +50,7 @@ void panthor_sched_suspend(struct panthor_device *p=
tdev);
> > >  void panthor_sched_resume(struct panthor_device *ptdev);
> > >
> > >  void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
> > > +void panthor_sched_prepare_for_vm_destruction(struct panthor_device =
*ptdev);
> > >  void panthor_sched_report_fw_events(struct panthor_device *ptdev, u3=
2 events);
> > >
> > >  void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)=
;
> >
>
