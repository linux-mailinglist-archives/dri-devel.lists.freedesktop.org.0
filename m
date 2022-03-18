Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 226964DDFC5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AAA10E121;
	Fri, 18 Mar 2022 17:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81A810E09B;
 Fri, 18 Mar 2022 17:22:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j18so2982615wrd.6;
 Fri, 18 Mar 2022 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OsgMHHYk1Mg3ehLBa46jJiNlAAMsZ+ygXkxFtlRNjN8=;
 b=gi4qp1nlcVQ+ZKV8YJdtJr/GdsyKaKrysjlOp5Zq/q4Mb2GSNL6kzh5Mh11lysyJc+
 lnNL6aX7CStVzBmYI7UAhbBauLgLzJWOxU6AT8Hq6HECfB8Izrc3hDdAaLs0kVGoYFES
 c9t2klB0ooyfRkpEB7J2AVZFpSR+s55XgsSjX71WZ1GDwwpCxQS2Tt/nb/R5WsvOSHDN
 cXk/1ytIlIpaxvsLh+WVAwiBTGpV/Bs60YNV1u5bOQe/hELXQnNtZgUQMqltHQAq7ODM
 8VG/nyYPAThue4TaiHZXWM1Qif+JGfZtNUircJbskBwInBxt/SRcR83qfUok0rSYwMjz
 hxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OsgMHHYk1Mg3ehLBa46jJiNlAAMsZ+ygXkxFtlRNjN8=;
 b=hgVgBvcZi+NmqV6twIgUAXRcqyLiImLpMjR60FikQLbLAQRP6tS+/TpFMN9o71fiLW
 YitSQPpUxadu4BoYDlpaeGVWUeTeAd4FhiTuFM/u7u8ejMExp+8JRYQkbb19lD8AMh9l
 uIEVfEz15NaL+iyPiMxAluqz6AaVlYj0jSi2eFrxvCLtcakLcklPo3kWYix2Vd3ZaSrA
 5hjYSP6iYXeM88ccV5dT+NJw58Fd81CyoIrU1ZXHOYpeq3XvqQ+Rj2PpyCq9LqshBYyc
 crvFNkgMEAWsV6i6SroG+MD2SxdTVFYxp49rYBvwD76/7bQNTZylKnB4wssoBJ2yEmgF
 2YEA==
X-Gm-Message-State: AOAM532PeodnPRcaY4h++zi5qKx5kuXxfRKchtORp/ZCxstD5eabVuTd
 8tbEp9rHp9jIPyZgwaBrocM118zV/IgUxcf/qTA=
X-Google-Smtp-Source: ABdhPJxL0BJjipSRuIKXINR0A8L2jZRfj9IukqObOa2Z7KFikFlF9UeQLYbFI7K9vgwCj+38KKtIRgzFWbUyEVaD4HM=
X-Received: by 2002:adf:dd4d:0:b0:203:f178:b78b with SMTP id
 u13-20020adfdd4d000000b00203f178b78bmr5448329wrm.93.1647624126346; Fri, 18
 Mar 2022 10:22:06 -0700 (PDT)
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
 <CAF6AEGvp+f4=EjQ9tWwcEafBEOAy6nCd8bOTqLXopiFhjx_Y_w@mail.gmail.com>
 <0e572944-66a0-f5a7-4517-3c437e668584@amd.com>
In-Reply-To: <0e572944-66a0-f5a7-4517-3c437e668584@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 18 Mar 2022 10:22:47 -0700
Message-ID: <CAF6AEGvun2UrGvXbGSBnhagWQFpm1Qt4T=TscQSkw3ikZm2r5g@mail.gmail.com>
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

On Fri, Mar 18, 2022 at 9:27 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
>
> On 2022-03-18 12:20, Rob Clark wrote:
> > On Fri, Mar 18, 2022 at 9:04 AM Andrey Grodzovsky
> > <andrey.grodzovsky@amd.com> wrote:
> >>
> >> On 2022-03-17 16:35, Rob Clark wrote:
> >>> On Thu, Mar 17, 2022 at 12:50 PM Andrey Grodzovsky
> >>> <andrey.grodzovsky@amd.com> wrote:
> >>>> On 2022-03-17 14:25, Rob Clark wrote:
> >>>>> On Thu, Mar 17, 2022 at 11:10 AM Andrey Grodzovsky
> >>>>> <andrey.grodzovsky@amd.com> wrote:
> >>>>>> On 2022-03-17 13:35, Rob Clark wrote:
> >>>>>>> On Thu, Mar 17, 2022 at 9:45 AM Christian K=C3=B6nig
> >>>>>>> <christian.koenig@amd.com> wrote:
> >>>>>>>> Am 17.03.22 um 17:18 schrieb Rob Clark:
> >>>>>>>>> On Thu, Mar 17, 2022 at 9:04 AM Christian K=C3=B6nig
> >>>>>>>>> <christian.koenig@amd.com> wrote:
> >>>>>>>>>> Am 17.03.22 um 16:10 schrieb Rob Clark:
> >>>>>>>>>>> [SNIP]
> >>>>>>>>>>> userspace frozen !=3D kthread frozen .. that is what this pat=
ch is
> >>>>>>>>>>> trying to address, so we aren't racing between shutting down =
the hw
> >>>>>>>>>>> and the scheduler shoveling more jobs at us.
> >>>>>>>>>> Well exactly that's the problem. The scheduler is supposed to =
shoveling
> >>>>>>>>>> more jobs at us until it is empty.
> >>>>>>>>>>
> >>>>>>>>>> Thinking more about it we will then keep some dma_fence instan=
ce
> >>>>>>>>>> unsignaled and that is and extremely bad idea since it can lea=
d to
> >>>>>>>>>> deadlocks during suspend.
> >>>>>>>>> Hmm, perhaps that is true if you need to migrate things out of =
vram?
> >>>>>>>>> It is at least not a problem when vram is not involved.
> >>>>>>>> No, it's much wider than that.
> >>>>>>>>
> >>>>>>>> See what can happen is that the memory management shrinkers want=
 to wait
> >>>>>>>> for a dma_fence during suspend.
> >>>>>>> we don't wait on fences in shrinker, only purging or evicting thi=
ngs
> >>>>>>> that are already ready.  Actually, waiting on fences in shrinker =
path
> >>>>>>> sounds like a pretty bad idea.
> >>>>>>>
> >>>>>>>> And if you stop the scheduler they will just wait forever.
> >>>>>>>>
> >>>>>>>> What you need to do instead is to drain the scheduler, e.g. call
> >>>>>>>> drm_sched_entity_flush() with a proper timeout for each entity y=
ou have
> >>>>>>>> created.
> >>>>>>> yeah, it would work to drain the scheduler.. I guess that might b=
e the
> >>>>>>> more portable approach as far as generic solution for suspend.
> >>>>>>>
> >>>>>>> BR,
> >>>>>>> -R
> >>>>>> I am not sure how this drains the scheduler ? Suppose we done the
> >>>>>> waiting in drm_sched_entity_flush,
> >>>>>> what prevents someone to push right away another job into the same
> >>>>>> entity's queue  right after that ?
> >>>>>> Shouldn't we first disable further pushing of jobs into entity bef=
ore we
> >>>>>> wait for  sched->job_scheduled ?
> >>>>>>
> >>>>> In the system suspend path, userspace processes will have already b=
een
> >>>>> frozen, so there should be no way to push more jobs to the schedule=
r,
> >>>>> unless they are pushed from the kernel itself.
> >>>>> amdgpu_device_suspend
> >>>> It was my suspicion but I wasn't sure about it.
> >>>>
> >>>>
> >>>>> We don't do that in
> >>>>> drm/msm, but maybe you need to to move things btwn vram and system
> >>>>> memory?
> >>>> Exactly, that was my main concern - if we use this method we have to=
 use
> >>>> it in a point in
> >>>> suspend sequence when all the in kernel job submissions activity alr=
eady
> >>>> suspended
> >>>>
> >>>>> But even in that case, if the # of jobs you push is bounded I
> >>>>> guess that is ok?
> >>>> Submissions to scheduler entities are using unbounded queue, the bou=
nded
> >>>> part is when
> >>>> you extract next job from entity to submit to HW ring and it rejects=
 if
> >>>> submission limit reached (drm_sched_ready)
> >>>>
> >>>> In general - It looks to me at least that what we what we want her i=
s
> >>>> more of a drain operation then flush (i.e.
> >>>> we first want to disable any further job submission to entity's queu=
e
> >>>> and then flush all in flight ones). As example
> >>>> for this i was looking at  flush_workqueue vs. drain_workqueue
> >>> Would it be possible for amdgpu to, in the system suspend task,
> >>>
> >>> 1) first queue up all the jobs needed to migrate bos out of vram, and
> >>> whatever other housekeeping jobs are needed
> >>> 2) then drain gpu scheduler's queues
> >>> 3) and then finally wait for jobs executing on GPU to complete
> >>
> >> We already do most of it in amdgpu_device_suspend,
> >> amdgpu_device_ip_suspend_phase1
> >> followed by amdgpu_device_evict_resources followed by
> >> amdgpu_fence_driver_hw_fini is
> >> exactly steps 1 + 3. What we are missing is step 2). For this step I
> >> suggest adding a function
> >> called drm_sched_entity_drain which basically sets entity->stopped =3D
> >> true and then calls drm_sched_entity_flush.
> >> This will both reject any new insertions into entity's job queue and
> >> will flush all pending job submissions to HW from that entity.
> >> One point is we need to make make drm_sched_entity_push_job return val=
ue
> >> so the caller knows about job enqueue
> >> rejection.
> > Hmm, seems like job enqueue that is rejected because we are in the
> > process of suspending should be more of a WARN_ON() sort of thing?
> > Not sure if there is something sensible to do for the caller at that
> > point?
>
>
> What about the job's fence the caller is waiting on ? If we rejected
> job submission the caller must know about it to not get stuck waiting
> on that fence.
>

Hmm, perhaps I'm not being imaginative enough, but this sort of
scenario seems like it should only arise from a bug in the driver's
suspend path, Ie. not doing all the job submission before shutting
down the scheduler.  I don't think anything good is going to result
either way, which is why I was thinking you'd want a WARN_ON() to help
debug/fix that case.

>
> >
> >> What about runtime suspend ? I guess same issue with scheduler racing
> >> against HW susppend is relevant there ?
> > Runtime suspend should be ok, as long as the driver holds a runpm
> > reference whenever the hw needs to be awake.  The problem with system
> > suspend (at least if you are using pm_runtime_force_suspend() or doing
> > something equivalent) is that it bypasses the runpm reference.
> > (Which, IMO, seems like a bad design..)
>
>
> I am not totally clear  yet - can you expand a bit why one case is ok
> but the other
> problematic ?
>

Sure, normally pm_runtime_get/put increment a reference count, as long
as there have been more get's than puts, the device won't runtime
suspend.  So, for ex, msm's run_job fxn does a pm_runtime_get_sync().
And retire_submit() which runs after job completes on GPU does a
pm_runtime_put_autosuspend().

System suspend, OTOH, bypasses this reference counting.  Which is why
extra care is needed.

BR,
-R


> Andrey
>
>
> >
> >> Also, could you point to a particular buggy scenario where the race
> >> between SW shceduler and suspend is causing a problem ?
> > I wrote a piglit test[1] to try to trigger this scenario.. it isn't
> > really that easy to hit
> >
> > BR,
> > -R
> >
> > [1] https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgitlab.freedesktop.org%2Fmesa%2Fpiglit%2F-%2Fmerge_requests%2F643&amp;data=
=3D04%7C01%7Candrey.grodzovsky%40amd.com%7C502ac8db4fb94b3b0e9d08da08fb270e=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637832172051790527%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C3000&amp;sdata=3Du2Fqq%2BZpmjFHQFK77xwxEA5092O3Nc%2FdCMllfejgnvU%3D=
&amp;reserved=3D0
> >
> >> Andrey
> >>
> >>
> >>> BR,
> >>> -R
> >>>
> >>>> Andrey
> >>>>
> >>>>
> >>>>> BR,
> >>>>> -R
