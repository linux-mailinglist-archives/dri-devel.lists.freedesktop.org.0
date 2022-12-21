Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B9E6533B7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7A310E466;
	Wed, 21 Dec 2022 15:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FDB10E463
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 15:55:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id co23so15387274wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQXcJi4lFuVdvkG8GJesKSBdUdWpqlLbj1CN8vNjEno=;
 b=xfEM6Olr+SSxQlNGMyL7DxFJiD1u2w2+VOdh4noyVdYb68wZqV9HSTVJGjR0vSjtTH
 aB8iPYrLxgffTwrxswYsMgcgsqi6i6uwRMwzn47dYSF/ghl/y0bdnSzgmC326itmR9LA
 7rmpzLoWYwztVnu4hqvgCt7SktGAMu2G61t/iShj5y1KdWD9bMEARY8SxJT7L6O0rhWL
 bRVA6GoKKycRLRzVDPCEhTCywBtyJ35DPzP1bsKpq6VZdBTg8hCo0r+ESmYdvy6vdbrK
 QTsozswPdjzE88zvyRXSqcASxhHXTtoQypclxo8ATdlk2w3IuPNaUVP6ucEsaNf5NA7S
 zX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQXcJi4lFuVdvkG8GJesKSBdUdWpqlLbj1CN8vNjEno=;
 b=YuUSHiuln0PdlfdSOZ4VWQGDUMzFT71i8sg03SkyaYtMf/aBNuYDA9LV/c21PVPAx3
 9xz544KPIG4hHfTSyeyJO9uJ0qy/9vLY0M33mh4cytYZvzd1EDcYlzrrP0Niwbo4waDI
 KiRAXyyGpgQt2RFo9BoN4Rc5Q1hw+iV9tbW5mn8m13cdJmd4QWvXN4951gyyT+sLslEC
 J2UjFOFET9EM1/FNmP2zjmgHN3L5OFY7zow8+3fb2FHh2ktIofp8Lm3TC1XWvVuWYluM
 lZtzwdDBhfoEbcThxYvBUImxvpdKAgORtJ6NgrLX8dz1BRRg/ObmzHAnMuMOxQlih3me
 uy4g==
X-Gm-Message-State: AFqh2kpfx+04juTpSWdZQP/sG+LqiFszgQ+ou8heMgL6SaMOtVhMGFK+
 p41A6R0bQDx5p0ONTa6EDN+ArNpzCh6UqrrShIYEYT+YZPbxzWzo
X-Google-Smtp-Source: AMrXdXsZCwpxMPUYq3UAJVMpHlh7ffGSdZNV21H3A6yjEe0cJkVy+HtTsHPpPIGtjwyf7jDEtF6nRPmJEezy+aUaWjY=
X-Received: by 2002:a5d:500d:0:b0:242:49b:5bb1 with SMTP id
 e13-20020a5d500d000000b00242049b5bb1mr112540wrt.337.1671638131854; Wed, 21
 Dec 2022 07:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-11-christian.koenig@amd.com>
 <CAHbf0-GPVQ4tRgtOLUkP8TW4T9+XGuQQQ70h-DoW9GhspWCa=w@mail.gmail.com>
 <2ce4ce81-d345-4e6d-edf4-d3133aece267@amd.com>
In-Reply-To: <2ce4ce81-d345-4e6d-edf4-d3133aece267@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 21 Dec 2022 15:55:20 +0000
Message-ID: <CAHbf0-HD1odtG0tW2RseWxzoAPFec0fRmtv+JKRgdUj8Vm4Pqg@mail.gmail.com>
Subject: Re: [PATCH 10/13] drm/amdgpu: use scheduler depenencies for CS
To: Luben Tuikov <luben.tuikov@amd.com>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Dec 2022 at 15:52, Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> On 2022-12-21 10:34, Mike Lothian wrote:
> > On Fri, 14 Oct 2022 at 09:47, Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >>
> >> Entirely remove the sync obj in the job.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++++++-----------
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h  |  2 ++
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  9 +--------
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  1 -
> >>  4 files changed, 13 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_cs.c
> >> index d45b86bcf7fa..0528c2b1db6e 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >> @@ -426,7 +426,7 @@ static int amdgpu_cs_p2_dependencies(struct amdgpu=
_cs_parser *p,
> >>                         dma_fence_put(old);
> >>                 }
> >>
> >> -               r =3D amdgpu_sync_fence(&p->gang_leader->sync, fence);
> >> +               r =3D amdgpu_sync_fence(&p->sync, fence);
> >>                 dma_fence_put(fence);
> >>                 if (r)
> >>                         return r;
> >> @@ -448,7 +448,7 @@ static int amdgpu_syncobj_lookup_and_add(struct am=
dgpu_cs_parser *p,
> >>                 return r;
> >>         }
> >>
> >> -       r =3D amdgpu_sync_fence(&p->gang_leader->sync, fence);
> >> +       r =3D amdgpu_sync_fence(&p->sync, fence);
> >>         if (r)
> >>                 goto error;
> >>
> >> @@ -1108,7 +1108,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_c=
s_parser *p)
> >>         if (r)
> >>                 return r;
> >>
> >> -       r =3D amdgpu_sync_fence(&job->sync, fpriv->prt_va->last_pt_upd=
ate);
> >> +       r =3D amdgpu_sync_fence(&p->sync, fpriv->prt_va->last_pt_updat=
e);
> >>         if (r)
> >>                 return r;
> >>
> >> @@ -1119,7 +1119,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_c=
s_parser *p)
> >>                 if (r)
> >>                         return r;
> >>
> >> -               r =3D amdgpu_sync_fence(&job->sync, bo_va->last_pt_upd=
ate);
> >> +               r =3D amdgpu_sync_fence(&p->sync, bo_va->last_pt_updat=
e);
> >>                 if (r)
> >>                         return r;
> >>         }
> >> @@ -1138,7 +1138,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_c=
s_parser *p)
> >>                 if (r)
> >>                         return r;
> >>
> >> -               r =3D amdgpu_sync_fence(&job->sync, bo_va->last_pt_upd=
ate);
> >> +               r =3D amdgpu_sync_fence(&p->sync, bo_va->last_pt_updat=
e);
> >>                 if (r)
> >>                         return r;
> >>         }
> >> @@ -1151,7 +1151,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_c=
s_parser *p)
> >>         if (r)
> >>                 return r;
> >>
> >> -       r =3D amdgpu_sync_fence(&job->sync, vm->last_update);
> >> +       r =3D amdgpu_sync_fence(&p->sync, vm->last_update);
> >>         if (r)
> >>                 return r;
> >>
> >> @@ -1183,7 +1183,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_c=
s_parser *p)
> >>  static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
> >>  {
> >>         struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
> >> -       struct amdgpu_job *leader =3D p->gang_leader;
> >>         struct amdgpu_bo_list_entry *e;
> >>         unsigned int i;
> >>         int r;
> >> @@ -1195,14 +1194,14 @@ static int amdgpu_cs_sync_rings(struct amdgpu_=
cs_parser *p)
> >>
> >>                 sync_mode =3D amdgpu_bo_explicit_sync(bo) ?
> >>                         AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
> >> -               r =3D amdgpu_sync_resv(p->adev, &leader->sync, resv, s=
ync_mode,
> >> +               r =3D amdgpu_sync_resv(p->adev, &p->sync, resv, sync_m=
ode,
> >>                                      &fpriv->vm);
> >>                 if (r)
> >>                         return r;
> >>         }
> >>
> >> -       for (i =3D 0; i < p->gang_size - 1; ++i) {
> >> -               r =3D amdgpu_sync_clone(&leader->sync, &p->jobs[i]->sy=
nc);
> >> +       for (i =3D 0; i < p->gang_size; ++i) {
> >> +               r =3D amdgpu_sync_push_to_job(&p->sync, p->jobs[i]);
> >>                 if (r)
> >>                         return r;
> >>         }
> >> @@ -1248,7 +1247,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_par=
ser *p,
> >>                 struct dma_fence *fence;
> >>
> >>                 fence =3D &p->jobs[i]->base.s_fence->scheduled;
> >> -               r =3D amdgpu_sync_fence(&leader->sync, fence);
> >> +               r =3D drm_sched_job_add_dependency(&leader->base, fenc=
e);
> >>                 if (r)
> >>                         goto error_cleanup;
> >>         }
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_cs.h
> >> index cbaa19b2b8a3..207e801c24ed 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> >> @@ -75,6 +75,8 @@ struct amdgpu_cs_parser {
> >>
> >>         unsigned                        num_post_deps;
> >>         struct amdgpu_cs_post_dep       *post_deps;
> >> +
> >> +       struct amdgpu_sync              sync;
> >>  };
> >>
> >>  int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_job.c
> >> index ba98d65835b4..b8494c3b3b8a 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> @@ -106,7 +106,6 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, s=
truct amdgpu_vm *vm,
> >>         (*job)->base.sched =3D &adev->rings[0]->sched;
> >>         (*job)->vm =3D vm;
> >>
> >> -       amdgpu_sync_create(&(*job)->sync);
> >>         amdgpu_sync_create(&(*job)->explicit_sync);
> >>         (*job)->vram_lost_counter =3D atomic_read(&adev->vram_lost_cou=
nter);
> >>         (*job)->vm_pd_addr =3D AMDGPU_BO_INVALID_OFFSET;
> >> @@ -174,9 +173,7 @@ static void amdgpu_job_free_cb(struct drm_sched_jo=
b *s_job)
> >>
> >>         drm_sched_job_cleanup(s_job);
> >>
> >> -       amdgpu_sync_free(&job->sync);
> >>         amdgpu_sync_free(&job->explicit_sync);
> >> -
> >>         dma_fence_put(&job->hw_fence);
> >>  }
> >>
> >> @@ -202,7 +199,6 @@ void amdgpu_job_free(struct amdgpu_job *job)
> >>                 drm_sched_job_cleanup(&job->base);
> >>
> >>         amdgpu_job_free_resources(job);
> >> -       amdgpu_sync_free(&job->sync);
> >>         amdgpu_sync_free(&job->explicit_sync);
> >>         if (job->gang_submit !=3D &job->base.s_fence->scheduled)
> >>                 dma_fence_put(job->gang_submit);
> >> @@ -246,10 +242,9 @@ amdgpu_job_dependency(struct drm_sched_job *sched=
_job,
> >>  {
> >>         struct amdgpu_ring *ring =3D to_amdgpu_ring(s_entity->rq->sche=
d);
> >>         struct amdgpu_job *job =3D to_amdgpu_job(sched_job);
> >> -       struct dma_fence *fence;
> >> +       struct dma_fence *fence =3D NULL;
> >>         int r;
> >>
> >> -       fence =3D amdgpu_sync_get_fence(&job->sync);
> >>         while (fence =3D=3D NULL && job->vm && !job->vmid) {
> >>                 r =3D amdgpu_vmid_grab(job->vm, ring, job, &fence);
> >>                 if (r)
> >> @@ -273,8 +268,6 @@ static struct dma_fence *amdgpu_job_run(struct drm=
_sched_job *sched_job)
> >>         job =3D to_amdgpu_job(sched_job);
> >>         finished =3D &job->base.s_fence->finished;
> >>
> >> -       BUG_ON(amdgpu_sync_peek_fence(&job->sync, NULL));
> >> -
> >>         trace_amdgpu_sched_run_job(job);
> >>
> >>         /* Skip job if VRAM is lost and never resubmit gangs */
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_job.h
> >> index 9c10b9bd0084..6558839fda03 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> >> @@ -47,7 +47,6 @@ enum amdgpu_ib_pool_type;
> >>  struct amdgpu_job {
> >>         struct drm_sched_job    base;
> >>         struct amdgpu_vm        *vm;
> >> -       struct amdgpu_sync      sync;
> >>         struct amdgpu_sync      explicit_sync;
> >>         struct dma_fence        hw_fence;
> >>         struct dma_fence        *gang_submit;
> >> --
> >> 2.25.1
> >>
> >
> > Hi, I've been testing the Mesh shader benchmark in GravityMark and
> > I've bisected my laptop freezing up and rebooting, to this commit
> >
> > 1728baa7e4e60054bf13dd9b1212d133cbd53b3f is the first bad commit
> > commit 1728baa7e4e60054bf13dd9b1212d133cbd53b3f
> > Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Date:   Thu Sep 29 14:04:01 2022 +0200
> >
> >    drm/amdgpu: use scheduler dependencies for CS
> >
> >    Entirely remove the sync obj in the job.
> >
> >    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >    Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> >    Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fpatchwork.freedesktop.org%2Fpatch%2Fmsgid%2F20221014084641.128280-11-=
christian.koenig%40amd.com&data=3D05%7C01%7Cluben.tuikov%40amd.com%7C89490e=
3fad4843fd789308dae368e10a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638=
072336848708258%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DyinQfgx3pcqZjCzafxT=
ysYlhb4RUwJN8t8cb2VjOOes%3D&reserved=3D0
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++++++-----------
> > drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h  |  2 ++
> > drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  9 +--------
> > drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  1 -
> > 4 files changed, 13 insertions(+), 20 deletions(-)
> >
> > This is on a prime system 6800M with the latest mesa
> >
> > I tried reverting this patch however it didn't revert cleanly, and my
> > attempt doesn't work and only partially freezes up the system
> >
> > Would you like me to open a bug for this on
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
lab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues&data=3D05%7C01%7Cluben.tuikov%=
40amd.com%7C89490e3fad4843fd789308dae368e10a%7C3dd8961fe4884e608e11a82d994e=
183d%7C0%7C0%7C638072336848708258%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DM=
8d6vBXgByuQCRm9844a9jYtIDfuDy7efv3NM03Bmho%3D&reserved=3D0 ?
> >
>
> Hi Mike,
>
> Could you try this patch:
>
> https://lore.kernel.org/all/20221219104718.21677-1-christian.koenig@amd.c=
om/
>
> Regards,
> Luben
>
>

I still see the same issue with this patch
