Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095A4E2D10
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 17:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9B510E385;
	Mon, 21 Mar 2022 16:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CA010E37B;
 Mon, 21 Mar 2022 16:02:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id r64so8829580wmr.4;
 Mon, 21 Mar 2022 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=phSyJ04IKQyqb6lOTPZt51MuA+UF9gOAUc4oGq3gGJs=;
 b=e5OhRrHG7n0dBP1WaBcFUv55M1nkdc1DWwL/+3geI07PF0g2ijliVH5xsJTmjac+tW
 B9t31o7Kzs3dWTvLG0KFc+QseQI3/6V2LxJ2eNShaRU8J1RvRKr8lX5u6eOGajPVCvKA
 eYxGrXySVbbgA7rw2bNkLfPJj4ODrsi8qUVEgWTJckFlr0GGK4/+87t5KaIehdO/tC+a
 cm3HxPu/lsrOwvnlHHO578DZ3fgsab69U2kH2wQY2VwIAgh1a1ARXg77GdgpZaXgrFiI
 zql0PFBJF8ENxwdBSb+EyXROiHZsgFu1EAVVN8joPUQZp+ggzoS92T+WDwJ0PoIgxIZm
 BV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=phSyJ04IKQyqb6lOTPZt51MuA+UF9gOAUc4oGq3gGJs=;
 b=4IrwCuO0lSq4TkxZ6kX8LDQfUNghQA/5oRoFIQODijfl9GM4Q8mvG/BOp+pqOa8F9x
 xNXl+v54wla2JSWymzg+WZ+UJt7ig/blApD4Zt862teU7B5495IGId/l+pmtzGh1Cdfw
 h2pQu7KIAvUcfsMI9Qo9PZRbK8b31QY7vyYI+oF6YpSMduZgEpkU8UlikcLNyqEITvNE
 kJrRlKKwpjSnDS3KS+ESZx3yHbfxZNA+wU0Rledoc+gmZDHyzWD4bXSHtwIIDiaohFF2
 4n3qrOtBCTx8r+6dOWg6DcecRdxVDcx4Q4y13Tpxo5nhDCgPvmXh0JIPb93WOij1feFn
 u2LA==
X-Gm-Message-State: AOAM530prhG0FzKEvpobq+UPh2YxrN7PSykR18qV4ou6LYfmwRpgUJsV
 2h3A1FhY1OPs46S0kB6rNTT96MUDxE+spOhNx++tSf3c
X-Google-Smtp-Source: ABdhPJyD3hcgnNJGgR/1qyQz7N78hwNB1+38prfiLQMVV1vqg2tQR9eRO7k+vgJq+1aEu+ZL/9tY1oCtJ+WB5yZAclY=
X-Received: by 2002:a05:600c:22c4:b0:38c:70f5:25a9 with SMTP id
 4-20020a05600c22c400b0038c70f525a9mr20215731wmg.119.1647878561841; Mon, 21
 Mar 2022 09:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
 <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
 <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
In-Reply-To: <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 21 Mar 2022 09:03:26 -0700
Message-ID: <CAF6AEGu6FabmcWE+NsPgnPU0=MpbA6bmO1KkJ2hrVDBLFY92xA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 2:30 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.03.22 um 16:12 schrieb Rob Clark:
> > On Fri, Mar 18, 2022 at 12:42 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 17.03.22 um 18:31 schrieb Rob Clark:
> >>> On Thu, Mar 17, 2022 at 10:27 AM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> >>>> [SNIP]
> >>>>> (At some point, I'd like to use scheduler for the replay, and actua=
lly
> >>>>> use drm_sched_stop()/etc.. but last time I looked there were still
> >>>>> some sched bugs in that area which prevented me from deleting a bun=
ch
> >>>>> of code ;-))
> >>>> Not sure about your hw, but at least on intel replaying tends to jus=
t
> >>>> result in follow-on fun. And that holds even more so the more comple=
x a
> >>>> workload is. This is why vk just dies immediately and does not try t=
o
> >>>> replay anything, offloading it to the app. Same with arb robusteness=
.
> >>>> Afaik it's really only media and classic gl which insist that the dr=
iver
> >>>> stack somehow recover.
> >>> At least for us, each submit must be self-contained (ie. not rely on
> >>> previous GPU hw state), so in practice replay works out pretty well.
> >>> The worst case is subsequent submits from same process fail as well
> >>> (if they depended on something that crashing submit failed to write
> >>> back to memory.. but in that case they just crash as well and we move
> >>> on to the next one.. the recent gens (a5xx+ at least) are pretty good
> >>> about quickly detecting problems and giving us an error irq.
> >> Well I absolutely agree with Daniel.
> >>
> >> The whole replay thing AMD did in the scheduler is an absolutely mess
> >> and should probably be killed with fire.
> >>
> >> I strongly recommend not to do the same mistake in other drivers.
> >>
> >> If you want to have some replay feature then please make it driver
> >> specific and don't use anything from the infrastructure in the DRM
> >> scheduler.
> > hmm, perhaps I was not clear, but I'm only talking about re-emitting
> > jobs *following* the faulting one (which could be from other contexts,
> > etc).. not trying to restart the faulting job.
> >
> > You *absolutely* need to replay jobs following the faulting one, they
> > could be from unrelated contexts/processes.  You can't just drop them
> > on the floor.
>
> Well you can, it just means that their contexts are lost as well.

Which is rather inconvenient when deqp-egl reset tests, for example,
take down your compositor ;-)

(Which for even more lolz, in CrOS restarts the android container or
vm.. which makes running android-cts deqp kinda funny)

> If you re-submit jobs which were already pushed to the hardware you
> absolutely need to make a couple of things sure:
>
> 1. Don't race with your hardware. E.g. you need a way to stop processing
> in case of a timeout and then double check once more if things haven't
> finished in the meantime.
>
> 2. Make absolutely sure you never re-submit an operation when it's
> dma-fence is already signaled. Otherwise you run into memory corruption.
>
> 3. When you have multiple engines it becomes really tricky because then
> even innocent jobs might have already been started on different queues
> which now hang.

We force power-off/on the GPU to reset it which is a pretty good way
to make sure we aren't racing with the GPU.

It's worked like this since pretty much the beginning, and in the
early days of bringing up mesa support for a new gen we tend to
exercise the gpu hang/recovery path quite a lot.. so it at least seems
pretty robust ;-)

BR,
-R

>
> > Currently it is all driver specific, but I wanted to delete a lot of
> > code and move to using scheduler to handle faults/timeouts (but
> > blocked on that until [1] is resolved)
>
> Please don't.
>
> Especially don't use the pending_list or any of the scheduler
> infrastructure for GPU reset. We need to get rid of that again sooner or
> later.
>
> This is extremely hardware dependent and pushing the amdgpu specific
> handling into the GPU scheduler was a mistake we shouldn't repeat for
> other drivers.
>
> Regards,
> Christian.
>
> >
> > [1] https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F1630457207-13107-2-gi=
t-send-email-Monk.Liu%40amd.com%2F&amp;data=3D04%7C01%7Cchristian.koenig%40=
amd.com%7C1f6ddc253f9341231fa108da08f1afa9%7C3dd8961fe4884e608e11a82d994e18=
3d%7C0%7C0%7C637832131381866493%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3De%2F1tOh=
3nxH3QfzKQKiJKjCU7Z5S6haX07F8rzwZhRVY%3D&amp;reserved=3D0
> >
> > BR,
> > -R
> >
> >> Thanks,
> >> Christian.
> >>
> >>> BR,
> >>> -R
> >>>
> >>>> And recovering from a mess in userspace is a lot simpler than trying=
 to
> >>>> pull of the same magic in the kernel. Plus it also helps with a few =
of the
> >>>> dma_fence rules, which is a nice bonus.
> >>>> -Daniel
> >>>>
>
