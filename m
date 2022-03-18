Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE444DDE90
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 17:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7012810E716;
	Fri, 18 Mar 2022 16:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA5810E579;
 Fri, 18 Mar 2022 16:20:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x15so12359480wru.13;
 Fri, 18 Mar 2022 09:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u0HCPymtXblIB+cZc09PIw1aKsO6ejAhOpetsA4QzYg=;
 b=HsS8bf4hFr1h53r1GWW5J7P80c2rigF1ZXd1iqF5XPOsMXq6p4ok6Sn2H3x7cUexPv
 YABq8nJvMpMu/YHEMd143F6Qp5fA4nP7ubMhCEOPXswql4pg7XkYAMKHiv7rl+pDoZWx
 H0bO0FDj3TAj6uKTbqplAHlMjsd1f+IEw2ZN38QxEypKSTFEkQEJ53OjC6bu5nL7r56L
 Q1pPMFjEB8OhRlo6aBuSvQ2ffSBXMm5ZskqqZUxpIbkn/hYc62OjFPO0+xXgPsEu/sf8
 Jbf18oIGb/IAdnQdYoeDEK01G6VXumHILoRrEZuQIhV6NkpZvGur8FIbJwWyBxMxx94s
 MNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u0HCPymtXblIB+cZc09PIw1aKsO6ejAhOpetsA4QzYg=;
 b=cZS9CAxIDmJEDGDjowTEQ/QiBSTc9vSw9p2DVcsRch6a5Sv+ABrWJvpr6Mt0Ynloib
 81mto/b1tR2+rx9Af98P4pP6AMJ5xqAh45aP2lbdVgK/JSnODe06qdYLcIW8YQ4+s3YA
 oky1Ubv1N8FVlLyYp1pmz+8YerJH5Xy9hLmhTp7Q4CkH7xBdWTlFrTgS/RKrJkEYJQes
 ekq9XLa2RfQv7ibpV1tsVc2u0VMpb6AMRPFcdfD9nmgZBMFKkxX2EIBiXrBC9GSx/5cI
 Gr1LDPhDIEA0nIdiS3tu+fYhVayzy+KOqqLauwI4uoVmWNhUit+M59UY2Z5Zb8Nltuzw
 1sYw==
X-Gm-Message-State: AOAM531FfY14WWvnNUTgMLG+HRi3BkM9cnQUSKyK+LLhEzNW8UpXA2n3
 /jxdD9BZdMzAGux73s/RW+dTSyw3fxJ5/7lFJkQ=
X-Google-Smtp-Source: ABdhPJxNnjhQkWgGh3BiZCURGeabRTHOG3URIEu48sVr5c+bgDz9d6ZlaTpPV7k9bDjxcXo9LX1ybNqvt19BuaGSvdU=
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr8615326wrj.297.1647620398559; Fri, 18
 Mar 2022 09:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
 <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
 <3a475e5a-1090-e2f4-779c-6915fc8524b1@amd.com>
 <CAF6AEGtPrSdj=7AP1_puR+OgmL-qro0mWZDNngtaVPxpaCM76A@mail.gmail.com>
 <1c847474-8ee1-cc7e-3d4d-261a4e92fb2d@amd.com>
 <CAF6AEGuw45gi4f+mVs7cVyjCHY9O4N1O8OfuGHv-wAkzP3UpMA@mail.gmail.com>
 <dd7d3f20-8288-3a7c-a368-a08282746ff1@amd.com>
In-Reply-To: <dd7d3f20-8288-3a7c-a368-a08282746ff1@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 18 Mar 2022 09:20:37 -0700
Message-ID: <CAF6AEGvp+f4=EjQ9tWwcEafBEOAy6nCd8bOTqLXopiFhjx_Y_w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "Alexander.Deucher@amd.com" <Alexander.Deucher@amd.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 18, 2022 at 9:04 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
>
> On 2022-03-17 16:35, Rob Clark wrote:
> > On Thu, Mar 17, 2022 at 12:50 PM Andrey Grodzovsky
> > <andrey.grodzovsky@amd.com> wrote:
> >>
> >> On 2022-03-17 14:25, Rob Clark wrote:
> >>> On Thu, Mar 17, 2022 at 11:10 AM Andrey Grodzovsky
> >>> <andrey.grodzovsky@amd.com> wrote:
> >>>> On 2022-03-17 13:35, Rob Clark wrote:
> >>>>> On Thu, Mar 17, 2022 at 9:45 AM Christian K=C3=B6nig
> >>>>> <christian.koenig@amd.com> wrote:
> >>>>>> Am 17.03.22 um 17:18 schrieb Rob Clark:
> >>>>>>> On Thu, Mar 17, 2022 at 9:04 AM Christian K=C3=B6nig
> >>>>>>> <christian.koenig@amd.com> wrote:
> >>>>>>>> Am 17.03.22 um 16:10 schrieb Rob Clark:
> >>>>>>>>> [SNIP]
> >>>>>>>>> userspace frozen !=3D kthread frozen .. that is what this patch=
 is
> >>>>>>>>> trying to address, so we aren't racing between shutting down th=
e hw
> >>>>>>>>> and the scheduler shoveling more jobs at us.
> >>>>>>>> Well exactly that's the problem. The scheduler is supposed to sh=
oveling
> >>>>>>>> more jobs at us until it is empty.
> >>>>>>>>
> >>>>>>>> Thinking more about it we will then keep some dma_fence instance
> >>>>>>>> unsignaled and that is and extremely bad idea since it can lead =
to
> >>>>>>>> deadlocks during suspend.
> >>>>>>> Hmm, perhaps that is true if you need to migrate things out of vr=
am?
> >>>>>>> It is at least not a problem when vram is not involved.
> >>>>>> No, it's much wider than that.
> >>>>>>
> >>>>>> See what can happen is that the memory management shrinkers want t=
o wait
> >>>>>> for a dma_fence during suspend.
> >>>>> we don't wait on fences in shrinker, only purging or evicting thing=
s
> >>>>> that are already ready.  Actually, waiting on fences in shrinker pa=
th
> >>>>> sounds like a pretty bad idea.
> >>>>>
> >>>>>> And if you stop the scheduler they will just wait forever.
> >>>>>>
> >>>>>> What you need to do instead is to drain the scheduler, e.g. call
> >>>>>> drm_sched_entity_flush() with a proper timeout for each entity you=
 have
> >>>>>> created.
> >>>>> yeah, it would work to drain the scheduler.. I guess that might be =
the
> >>>>> more portable approach as far as generic solution for suspend.
> >>>>>
> >>>>> BR,
> >>>>> -R
> >>>> I am not sure how this drains the scheduler ? Suppose we done the
> >>>> waiting in drm_sched_entity_flush,
> >>>> what prevents someone to push right away another job into the same
> >>>> entity's queue  right after that ?
> >>>> Shouldn't we first disable further pushing of jobs into entity befor=
e we
> >>>> wait for  sched->job_scheduled ?
> >>>>
> >>> In the system suspend path, userspace processes will have already bee=
n
> >>> frozen, so there should be no way to push more jobs to the scheduler,
> >>> unless they are pushed from the kernel itself.
> >>> amdgpu_device_suspend
> >>
> >> It was my suspicion but I wasn't sure about it.
> >>
> >>
> >>> We don't do that in
> >>> drm/msm, but maybe you need to to move things btwn vram and system
> >>> memory?
> >>
> >> Exactly, that was my main concern - if we use this method we have to u=
se
> >> it in a point in
> >> suspend sequence when all the in kernel job submissions activity alrea=
dy
> >> suspended
> >>
> >>> But even in that case, if the # of jobs you push is bounded I
> >>> guess that is ok?
> >> Submissions to scheduler entities are using unbounded queue, the bound=
ed
> >> part is when
> >> you extract next job from entity to submit to HW ring and it rejects i=
f
> >> submission limit reached (drm_sched_ready)
> >>
> >> In general - It looks to me at least that what we what we want her is
> >> more of a drain operation then flush (i.e.
> >> we first want to disable any further job submission to entity's queue
> >> and then flush all in flight ones). As example
> >> for this i was looking at  flush_workqueue vs. drain_workqueue
> > Would it be possible for amdgpu to, in the system suspend task,
> >
> > 1) first queue up all the jobs needed to migrate bos out of vram, and
> > whatever other housekeeping jobs are needed
> > 2) then drain gpu scheduler's queues
> > 3) and then finally wait for jobs executing on GPU to complete
>
>
> We already do most of it in amdgpu_device_suspend,
> amdgpu_device_ip_suspend_phase1
> followed by amdgpu_device_evict_resources followed by
> amdgpu_fence_driver_hw_fini is
> exactly steps 1 + 3. What we are missing is step 2). For this step I
> suggest adding a function
> called drm_sched_entity_drain which basically sets entity->stopped =3D
> true and then calls drm_sched_entity_flush.
> This will both reject any new insertions into entity's job queue and
> will flush all pending job submissions to HW from that entity.
> One point is we need to make make drm_sched_entity_push_job return value
> so the caller knows about job enqueue
> rejection.

Hmm, seems like job enqueue that is rejected because we are in the
process of suspending should be more of a WARN_ON() sort of thing?
Not sure if there is something sensible to do for the caller at that
point?

>
> What about runtime suspend ? I guess same issue with scheduler racing
> against HW susppend is relevant there ?

Runtime suspend should be ok, as long as the driver holds a runpm
reference whenever the hw needs to be awake.  The problem with system
suspend (at least if you are using pm_runtime_force_suspend() or doing
something equivalent) is that it bypasses the runpm reference.
(Which, IMO, seems like a bad design..)

> Also, could you point to a particular buggy scenario where the race
> between SW shceduler and suspend is causing a problem ?

I wrote a piglit test[1] to try to trigger this scenario.. it isn't
really that easy to hit

BR,
-R

[1] https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/643

> Andrey
>
>
> >
> > BR,
> > -R
> >
> >> Andrey
> >>
> >>
> >>> BR,
> >>> -R
