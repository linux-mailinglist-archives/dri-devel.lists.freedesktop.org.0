Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39456E7393
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 09:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC88A10E176;
	Wed, 19 Apr 2023 07:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23B310E176;
 Wed, 19 Apr 2023 07:00:30 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-3ef27f314b5so4743601cf.1; 
 Wed, 19 Apr 2023 00:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681887628; x=1684479628;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FpYtyHU8PJs307uUjU40oyjopOkGxr76O4zQ0gpxIY=;
 b=WS0+2OnpQJgoj4qOvAh7DxGIwzl/PRw7tPUEs0hzD99f7Fj7O97Dm1b2KAVecn4SoR
 IG/Mee81r+lXszFcJLsNrEh3/pMRueKdoh080sgm/xFk8xTeu4XvOSm1NSMpLCejsJ4D
 uw9FMxXNqiUO5KzU44/gsV3FhgRkVeJh85MR/JXdFHjj7Ltn5eu0JT9yLWfVdkTE9pGz
 gKcSs+zn2jBzUDPtJ/4Yi6kIwiykeoa3Xa0Iffqq/KFDgwKJeTLOUfopLByR65yl4YS+
 bK6aZpUDWvDbpOs63nxXEd/NFr5DcaKlynCbSwVya9y/LdTZ/Q6lG+81zOeztEmVP1S7
 ApkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681887628; x=1684479628;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+FpYtyHU8PJs307uUjU40oyjopOkGxr76O4zQ0gpxIY=;
 b=ddPypcVCD0FWl812KVmmm+glpgJhoeGTgYnsXBByU3iRxvdinRJ6LYPl8y6bSFibvP
 2MEmerkplFQzd5YfhBGgR4XXZgHzJ7cqcQnZIH2nb5zxmmdGCYkabJ0Gdl4TtF52FKt/
 JvVTseevDMWOqW9X8jKYAnRUETOyRRBOUlNVFaSk/EfB4Y+f6OBVhMRKPa1YgpO+C5Ki
 Me/fnBhgLGKPzYddsMKnUQEKn9pCr6agUy4dHkzrJ/3sC1MKwe23dRVbr9Duznzc0FT4
 wTY59YU0iFHr9YK5qV8V/8W1YU2lJKU8CS9QosO9lA3ReCx9JwVGF6EynKOz7o/vJyWz
 EP8A==
X-Gm-Message-State: AAQBX9duIhue7w2zqTE+3eFmS+KNJXqx9tsjKxBDq9jIpSxFZPA6SUeY
 k4S/LQTGpMOBMJS8TqyBl8hbZLn/RpP29qvTgWo=
X-Google-Smtp-Source: AKy350aUz2W0/K/smKaFigfFEMbNyowxs+jU7zgLJv01FW5RFfxk78FbmM8mq6Lbwt81NFq7sdeXATcSe8OLxepAm4M=
X-Received: by 2002:a05:6214:5185:b0:532:141d:3750 with SMTP id
 kl5-20020a056214518500b00532141d3750mr25292442qvb.2.1681887628425; Wed, 19
 Apr 2023 00:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
 <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
In-Reply-To: <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 19 Apr 2023 12:00:17 +0500
Message-ID: <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
Subject: Re: BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290
 [gpu_sched]
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <Christian.Koenig@amd.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Christian?

=E2=9D=AF /usr/src/kernels/6.3.0-0.rc7.56.fc39.x86_64/scripts/faddr2line
/lib/debug/lib/modules/6.3.0-0.rc7.56.fc39.x86_64/kernel/drivers/gpu/drm/sc=
heduler/gpu-sched.ko.debug
drm_sched_job_cleanup+0x9a
drm_sched_job_cleanup+0x9a/0x130:
drm_sched_job_cleanup at
/usr/src/debug/kernel-6.3-rc7/linux-6.3.0-0.rc7.56.fc39.x86_64/drivers/gpu/=
drm/scheduler/sched_main.c:808
(discriminator 3)

=E2=9D=AF cat -s -n /usr/src/debug/kernel-6.3-rc7/linux-6.3.0-0.rc7.56.fc39=
.x86_64/drivers/gpu/drm/scheduler/sched_main.c
| head -818 | tail -20
   799 /* drm_sched_job_arm() has been called */
   800 dma_fence_put(&job->s_fence->finished);
   801 } else {
   802 /* aborted job before committing to run it */
   803 drm_sched_fence_free(job->s_fence);
   804 }
   805
   806 job->s_fence =3D NULL;
   807
   808 xa_for_each(&job->dependencies, index, fence) {
   809 dma_fence_put(fence);
   810 }
   811 xa_destroy(&job->dependencies);
   812
   813 }
   814 EXPORT_SYMBOL(drm_sched_job_cleanup);
   815
   816 /**
   817 * drm_sched_ready - is the scheduler ready
   818 *

> git blame drivers/gpu/drm/scheduler/sched_main.c -L 800,819
dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-17 10:49:16 +0200 800)
dma_fence_put(&job->s_fence->finished);
dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-17 10:49:16 +0200 801)     } else {
dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-17 10:49:16 +0200 802)             /* aborted job
before committing to run it */
d4c16733e7960 drivers/gpu/drm/scheduler/sched_main.c        (Boris
Brezillon 2021-09-03 14:05:54 +0200 803)
drm_sched_fence_free(job->s_fence);
dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-17 10:49:16 +0200 804)     }
dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-17 10:49:16 +0200 805)
26efecf955889 drivers/gpu/drm/scheduler/sched_main.c        (Sharat
Masetty  2018-10-29 15:02:28 +0530 806)     job->s_fence =3D NULL;
ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-05 12:46:49 +0200 807)
ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-05 12:46:49 +0200 808)
xa_for_each(&job->dependencies, index, fence) {
ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-05 12:46:49 +0200 809)
dma_fence_put(fence);
ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-05 12:46:49 +0200 810)     }
ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-05 12:46:49 +0200 811)
xa_destroy(&job->dependencies);
ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
Vetter   2021-08-05 12:46:49 +0200 812)
26efecf955889 drivers/gpu/drm/scheduler/sched_main.c        (Sharat
Masetty  2018-10-29 15:02:28 +0530 813) }
26efecf955889 drivers/gpu/drm/scheduler/sched_main.c        (Sharat
Masetty  2018-10-29 15:02:28 +0530 814)
EXPORT_SYMBOL(drm_sched_job_cleanup);
26efecf955889 drivers/gpu/drm/scheduler/sched_main.c        (Sharat
Masetty  2018-10-29 15:02:28 +0530 815)
e688b728228b9 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c (Christian
K=C3=B6nig 2015-08-20 17:01:01 +0200 816) /**
2d33948e4e00b drivers/gpu/drm/scheduler/gpu_scheduler.c     (Nayan
Deshmukh  2018-05-29 11:23:07 +0530 817)  * drm_sched_ready - is the
scheduler ready
2d33948e4e00b drivers/gpu/drm/scheduler/gpu_scheduler.c     (Nayan
Deshmukh  2018-05-29 11:23:07 +0530 818)  *
2d33948e4e00b drivers/gpu/drm/scheduler/gpu_scheduler.c     (Nayan
Deshmukh  2018-05-29 11:23:07 +0530 819)  * @sched: scheduler instance

Daniel, because Christian, looks a little busy. Can you help? The git
blame says that you are the author of code which KASAN mentions in its
report.
The issue is reproducible on all available AMD hardware: 6800M, 6900XT, 790=
0XTX.

--=20
Best Regards,
Mike Gavrilov.
