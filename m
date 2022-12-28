Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A06583D9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1541010E1BF;
	Wed, 28 Dec 2022 16:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE3C10E1BF;
 Wed, 28 Dec 2022 16:52:28 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 l8-20020a056830054800b006705fd35eceso10133277otb.12; 
 Wed, 28 Dec 2022 08:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcJgDms0q5Mau7rSrXM4H9/ZdrlCbuV2AGO7FUdmI/s=;
 b=RpcOYZwN2T1cO2HJHO5uySGSfcM5qyB6fNRAhCm5aOlBSUH00l70mjCSYXTmCoJWpq
 hUPjw2rbcqpiVI8FONDMjObsKuMB3yiItExMj6zHCor2GpllnOruQpY0RsPROqP5hije
 Cd2AbJK48uh3JBHv/L5KHQS98RwoHSqOzEMoCLRK1CP0NJ8AtxFZco+kc1bis7/WqiwU
 gdNTBTh7tZ3IMCjVO6B/JkFP9+1500KyixHjSviLlkjg8FildhsTQIGSNb3PM4cZBH/9
 PmXsUsFXkH35PowtmPIt3qDzbZjUKJXA+SXHJyGU3P+zuRAerG6T4SQCNfw5x7QlpnQa
 AtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcJgDms0q5Mau7rSrXM4H9/ZdrlCbuV2AGO7FUdmI/s=;
 b=wqp2wL9G9KiPTm4cUFpj97I5E/IWGKo6d8Dyfy5Ft/uiamgAT+3dA4MuH5sIFES6ds
 j/cIXtDlBEOrs3injPSceJiNwf/fPqVWYWf3Da2MTLbTgaYQ74ILfkVOZICNVUHFAhZo
 bYpwPF/N52iwXYiYf35v8aHXi3WG7JWidiglMje76kQzVplP+dJUyBucV/HOB50nw7wN
 4sxudmcDIP4N25qeJul70Q2+HpQ35wsnksLQPLzljfFZIEK6vVe47vVSWznEutlHU1Sg
 ThhN5I0cqc0DvfV61Du/E4o8KC59Zm9cK4v1qBz1mX/0AI23a6Gh6mD29Mq4XoVQYZfL
 epfQ==
X-Gm-Message-State: AFqh2kpAh6YWWzAmN9CdUVmpRiA1fRJDL9JNe7mEU5kZpqIY1jVRSrb0
 9/jdZWwTGd0KZgaxDB++yhSHhEMEPc18n6gw3z4=
X-Google-Smtp-Source: AMrXdXs6ftjwNiEZ583NZ2hb+q4ufv8ybKdnCpcJZbmHS5rOXLIsZU0ue7YE4NFGn5sVhTsegXJQYdL9fiQeL1vBB3Q=
X-Received: by 2002:a9d:7310:0:b0:678:272b:41e1 with SMTP id
 e16-20020a9d7310000000b00678272b41e1mr1337722otk.328.1672246343957; Wed, 28
 Dec 2022 08:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
 <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
 <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
 <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
 <ef732036-895b-0f5c-d06b-d7e4a739541a@gmail.com>
 <74d74689-9c8e-1691-a232-c18271974f37@collabora.com>
 <126a8c1e-69ec-5068-1aad-30f5e7c3ef21@collabora.com>
 <4f5766ab-d31f-d0c8-6b1e-0c7e0fbabfed@amd.com>
 <50308598-324f-f628-a4f1-55da3935a2f5@collabora.com>
 <067ffcf2-5d46-fd37-3df8-0de1714573e4@amd.com>
 <647e876a-9710-c6bd-9cf3-a513d879c36a@collabora.com>
 <CAF6AEGtKsN=KX3Y7bBCrKBD_GsTnXMG67CxoS8jbM6pqgmY9CA@mail.gmail.com>
In-Reply-To: <CAF6AEGtKsN=KX3Y7bBCrKBD_GsTnXMG67CxoS8jbM6pqgmY9CA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Dec 2022 08:52:13 -0800
Message-ID: <CAF6AEGv=GJm5Hyea7a0oDgWDYXw72HwTB4sreeppYVEKCsw0Ew@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Jonathan <jonathan@marek.ca>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 28, 2022 at 8:27 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Nov 17, 2022 at 7:12 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
> >
> > On 11/17/22 18:09, Christian K=C3=B6nig wrote:
> > > Am 17.11.22 um 15:41 schrieb Dmitry Osipenko:
> > >> [SNIP]
> > >>> drm_sched_entity_flush() should be called from the flush callback f=
rom
> > >>> the file_operations structure of panfrost. See amdgpu_flush() and
> > >>> amdgpu_ctx_mgr_entity_flush(). This makes sure that we wait for all
> > >>> entities of the process/file descriptor to be flushed out.
> > >>>
> > >>> drm_sched_entity_fini() must be called before you free the memory t=
he
> > >>> entity structure or otherwise we would run into an use after free.
> > >> Right, drm_sched_entity_destroy() invokes these two functions and
> > >> Panfrost uses drm_sched_entity_destroy().
> > >
> > > Than I have no idea what's going wrong here.
> > >
> > > The scheduler should trivially finish with the entity and call
> > > complete(&entity->entity_idle) in it's main loop. No idea why this
> > > doesn't happen. Can you investigate?
> >
> > I'll take a closer look. Hoped you may have a quick idea of what's wron=
g :)
> >
>
> As Jonathan mentioned, the same thing is happening on msm.  I can
> reproduce this by adding an assert in mesa (in this case, triggered
> after 100 draws) and running an app under gdb.  After the assert is
> hit, if I try to exit mesa, it hangs.
>
> The problem is that we somehow call drm_sched_entity_kill() twice.
> The first time completes, but now the entity_idle completion is no
> longer done, so the second call hangs forever.

Maybe we should:

------
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
b/drivers/gpu/drm/scheduler/sched_entity.c
index fe09e5be79bd..3d7c671d05e3 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -222,7 +226,6 @@ static void drm_sched_entity_kill(struct
drm_sched_entity *entity)
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 {
        struct drm_gpu_scheduler *sched;
-       struct task_struct *last_user;
        long ret =3D timeout;

        if (!entity->rq)
@@ -244,12 +247,6 @@ long drm_sched_entity_flush(struct
drm_sched_entity *entity, long timeout)
                                    drm_sched_entity_is_idle(entity));
        }

-       /* For killed process disable any more IBs enqueue right now */
-       last_user =3D cmpxchg(&entity->last_user, current->group_leader, NU=
LL);
-       if ((!last_user || last_user =3D=3D current->group_leader) &&
-           (current->flags & PF_EXITING) && (current->exit_code =3D=3D SIG=
KILL))
-               drm_sched_entity_kill(entity);
-
        return ret;
 }
 EXPORT_SYMBOL(drm_sched_entity_flush);
----

Maybe there is a better fix, but special handling for SIGKILL seems
dubious to me (vs just relying on the drm device fd close path).  I
wonder if that code path was tested at all?

BR,
-R
